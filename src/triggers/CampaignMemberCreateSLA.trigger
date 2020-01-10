/***********************************************************************************************
*	This trigger creates new SLAs for eligible interactions with inbound Leads and Contacts.
*
*	Leads and Contacts are considered eligible for an SLA if they are in one of our Core Markets
*	(US/Canada for NORAM and Western Europe for EMEA). 
*
*
*
***********************************************************************************************/


trigger CampaignMemberCreateSLA on CampaignMember (after insert, after update) {
	
	Map<id,CampaignMember> cmMap = new Map<id,CampaignMember>();
	Map<id,id> ldToCampaignMap = new Map<id,id>();
	Map<id,id> conToCampaignMap = new Map<id,id>();
	Map<id,id> filteredLdToCampaignMap = new Map<id,id>();
	Map<id,id> filteredConToCampaignMap = new Map<id,id>();
	
	for (CampaignMember cm : trigger.new) {
		//Only "Responded" Campaign Members should be SLA Tracked
		if (cm.HasResponded) {
			cmMap.put(cm.id,cm);
			if (cm.contactId != null) {
				conToCampaignMap.put(cm.ContactId,cm.CampaignId);
			} else {
				ldToCampaignMap.put(cm.LeadId,cm.CampaignId);
			}
		}
	}	
	
	//Query for all SLA Eligible Campaigns passed through Trigger
	Map<id,Campaign> eligibleCampaigns = new Map<id,Campaign>([select id, name, type from Campaign where (id in: ldToCampaignMap.values() or id in: conToCampaignMap.values()) and SLA_Eligible__c = true]);
	
	if (eligibleCampaigns.size() > 0) {
		//Loop through all of the leads and filter on leads added to SLA Eligible Campaigns 
		for (Id ld: ldToCampaignMap.keyset()) {
			if (eligibleCampaigns.containsKey(ldToCampaignMap.get(ld))) filteredLdToCampaignMap.put(ld, ldToCampaignMap.get(ld)) ;
		}
		//Loop through all contacts and filter on contacts added to SLA Eligible Campaigns
		for (Id conId: conToCampaignMap.keyset()) {
			if (eligibleCampaigns.containsKey(conToCampaignMap.get(conId))) filteredConToCampaignMap.put(conId, conToCampaignMap.get(conId)) ;
		}
		
		//Still need to further filter the Contacts and leads on Core Market
		Map<id,Lead> eligibleLeads = new Map<id,Lead>([select id, bizible__Medium__r.Name, Latest_Web_Form_Fill__c, name, title, state, country, isConverted, ConvertedContactId, Inbound_SLA_Core_Market__c, Lead_Owner_text2__c, Territory_Owner__c, Territory_Owner_Lead__r.Full_Name__c, Account_Status__c, mkto71_Lead_Score__c from Lead where id in: filteredLdToCampaignMap.keySet() and (Inbound_SLA_Core_Market__c = 'EMEA' or Inbound_SLA_Core_Market__c = 'NORAM')]);
		Map<id,Contact> eligibleCons = new Map<id,Contact>([select id, bizible__Medium__r.Name, Latest_Web_Form_Fill__c, name, title, mailingState, MailingCountry, Inbound_SLA_Core_Market__c, Contact_Owner_text2__c, Territory_Owner__c, Account_Status__c, mkto71_Lead_Score__c from Contact where id in: filteredConToCampaignMap.keySet() and (Inbound_SLA_Core_Market__c = 'EMEA' or Inbound_SLA_Core_Market__c = 'NORAM')]);
		Map<id,SLA__c> allExistingSLAs = new Map<id,SLA__c>([select id, lead__c, contact__c, SLA_Status__c, Close_Date__c from SLA__c where (lead__c in: eligibleLeads.KeySet() or contact__c in: eligibleCons.KeySet()) and SLA_Status__c = 'Open']);
		
		
		List<SLA__c> updateSLAs = new List<SLA__c>();
		
		//Close out all currently open SLAs
		for (SLA__c sla : allExistingSLAs.values()) {
			sla.SLA_Status__c = 'Closed (New SLA Came In)';
			sla.Close_Date__c = system.now();
			updateSLAs.add(sla);
		}
		
		update updateSLAs;
		
		List<SLA__c> insertSLAs = new List<SLA__c>();
		
		Map<String, Time_Zone_Offset__c> gmtOffSetMap = Time_Zone_Offset__c.getall();
    	Integer emeaOffset = (Integer) gmtOffSetMap.get('EMEA').GMT_Offset__c; // 0 during winter, 1 during British Summer Time
    	Integer usOffset = (Integer) gmtOffSetMap.get('NORAM').GMT_Offset__c; //-5 during EST, -4 during EDT
		
		for (CampaignMember cm: cmMap.values()) {
			//check that campaign member is a part of an eligible SLA campaign
			if (eligibleCampaigns.containsKey(cm.CampaignId)) {
				Boolean eligibleToCreate = false;
				SLA__c newSLA = new SLA__c();
				newSLA.SLA_Status__c = 'Open'; 
				newSLA.Campaign__c = cm.CampaignId;
				newSLA.Expiration_Date__c = system.now().addDays(30);
				
				//Integer gmtOffset = 0;
				//Integer gmtOffset = 1; //British Summer Time
				Integer gmtOffset = emeaOffset;
				if (cm.contactId != null) {
					if (eligibleCons.containsKey(cm.contactId)) {
						newSLA.Contact__c = cm.contactId;
						eligibleToCreate = true;
						if (eligibleCons.get(cm.contactId).Latest_Web_Form_Fill__c != null) newSLA.Web_Form_Fill__c = eligibleCons.get(cm.contactId).Latest_Web_Form_Fill__c;
						if (eligibleCons.get(cm.contactId).bizible__Medium__r.Name != null) newSLA.Bizible_Medium__c = eligibleCons.get(cm.contactId).bizible__Medium__r.Name;
						if (eligibleCons.get(cm.contactId).Contact_Owner_text2__c != null) newSLA.Original_Lead_Contact_Owner__c = eligibleCons.get(cm.contactId).Contact_Owner_text2__c;
						if (eligibleCons.get(cm.contactId).Territory_Owner__c != null) newSLA.Original_Lead_Contact_Territory_Owner__c = eligibleCons.get(cm.contactId).Territory_Owner__c;
						if (eligibleCons.get(cm.contactId).Account_Status__c != null) newSLA.Account_Status_Stamped__c = eligibleCons.get(cm.contactId).Account_Status__c;
						if (eligibleCons.get(cm.contactId).mkto71_Lead_Score__c != null) newSLA.Lead_Score_Stamped__c = eligibleCons.get(cm.contactId).mkto71_Lead_Score__c;
					
						//if North American Contact, set gmtOffset to -5 (-4 during Daylight Savings)
						if (eligibleCons.get(cm.contactId).Inbound_SLA_Core_Market__c == 'NORAM') gmtOffset = usOffset;
					}
				}
				else {
					if (eligibleLeads.containsKey(cm.LeadId)) {
						newSLA.Lead__c	= cm.LeadId;
						eligibleToCreate = true;
						if (eligibleLeads.get(cm.LeadId).Latest_Web_Form_Fill__c != null) newSLA.Web_Form_Fill__c = eligibleLeads.get(cm.LeadId).Latest_Web_Form_Fill__c;
						if (eligibleLeads.get(cm.LeadId).bizible__Medium__r.Name != null) newSLA.Bizible_Medium__c = eligibleLeads.get(cm.LeadId).bizible__Medium__r.Name;		
						if (eligibleLeads.get(cm.LeadId).Lead_Owner_text2__c != null) newSLA.Original_Lead_Contact_Owner__c = eligibleLeads.get(cm.LeadId).Lead_Owner_text2__c;
						if (eligibleLeads.get(cm.LeadId).Territory_Owner__c != null) newSLA.Original_Lead_Contact_Territory_Owner__c = eligibleLeads.get(cm.LeadId).Territory_Owner__c;
						else if (eligibleLeads.get(cm.LeadId).Territory_Owner_Lead__r.Full_Name__c != null) newSLA.Original_Lead_Contact_Territory_Owner__c = eligibleLeads.get(cm.LeadId).Territory_Owner_Lead__r.Full_Name__c;
						if (eligibleLeads.get(cm.LeadId).Account_Status__c != null) newSLA.Account_Status_Stamped__c = eligibleLeads.get(cm.LeadId).Account_Status__c;
						if (eligibleLeads.get(cm.LeadId).mkto71_Lead_Score__c != null) newSLA.Lead_Score_Stamped__c = eligibleLeads.get(cm.LeadId).mkto71_Lead_Score__c;
					
					
						//if North American lead, set gmtOffset to -5 (-4 during Daylight Savings)
						if (eligibleLeads.get(cm.LeadId).Inbound_SLA_Core_Market__c == 'NORAM') gmtOffset = usOffset;
					}
				}
				
				//Determine Rapid Response Eligibility (M-F 7am-4:30pm)
				Datetime dt = Datetime.now();
				
				boolean workDay = false; //SLA created during a work day (Mon-Fri)
				boolean workHours = false; //SLA created during rapid response hours
				Integer createdHour = dt.HourGMT(); //SLA created Hour in GMT Standard time
				Integer adjHour; //Time zone adjusted Created Hour
				Integer createdMinute = dt.minuteGMT(); //SLA Created Minute
				
				String dayOfWeek = dt.formatGMT('EEE');
				
				if (dayOfWeek == 'Mon' || dayOfWeek == 'Tue' || dayOfWeek == 'Wed' || dayOfWeek == 'Thu' || dayOfWeek == 'Fri' ) {
					workDay = true;
				}
				
				if (createdHour + gmtOffset < 0) adjHour = 24 - (gmtOffset + createdHour);
				else adjHour = createdHour + gmtOffset;
				
				if ((adjHour > 7 && adjHour < 16) || (adjHour == 16 && createdMinute <= 30)) {
					workhours = true;
				}
				
				if (workDay) {
					if (workHours) {
						newSLA.Rapid_Response_Eligible__c = true;
					}
				}
				
				//Stamp SLA 1 Due Date	
				if (workDay && (workHours || adjHour < 7)) {
					newSLA.SLA_1_Due_Date__c = date.today();
				} else newSLA.SLA_1_Due_Date__c = SLAMethods.AdjustedSLATime(System.now(),gmtOffset).date(); 
				
				if (eligibleToCreate) insertSLAs.add(newSLA);
			}
			
		}
		
		if (insertSLAs.size() > 0) insert insertSLAs;
		
	}	
}