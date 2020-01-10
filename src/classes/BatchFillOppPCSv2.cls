global class BatchFillOppPCSv2 implements Database.Batchable<sObject>{
	
	public String query;
	
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
/*
    	VMTUtils.inBatch = true;

    	//collect all Opps & initialize maps
    	Map<id, Opportunity> allOpps = new Map<id, Opportunity>();
    	// opp id, contact id
		Map<id, id> oppContacts = new Map<id, id>();
		// opp id, campaign id
		Map<id, id> oppPC = new Map<id, id>();
    	
    	system.debug('###Num Opps in this batch: ' + scope.size());

    	List<Opportunity> updateOpps = new List<Opportunity>();
    	
    	for(sObject s : scope){
            Opportunity opp = (Opportunity)s;
            allOpps.put(opp.id, opp);
            system.debug('###Adding Opp to allOpps Map.');
            system.debug('###Opp Name: ' + opp.Name);
            system.debug('###Opp Id: ' + opp.Id);
    	}
    
    	//associate opp ID to contact ID
		List<Task> demos = [select id, whoId, whatId, activityDate from Task where Status = 'Completed' and whatId In :allOpps.keySet() and Type = 'Demo' order by ActivityDate asc];
		for (Task tsk: demos) {
			if (!oppContacts.containsKey(tsk.whatId)) {
				oppContacts.put(tsk.WhatId,tsk.WhoId);
			}
		}
		
		Map<Id,Contact> cons = new Map<Id,Contact>([select id, name, leadSource from Contact where Id IN :oppContacts.values()]);
		
		Map<Id,Campaign> camp = new Map<Id,Campaign>([select id, name from Campaign where name = 'PRO: DiscoverOrg' OR name = 'PRO: RainKing' or name = 'PRO: LinkedIn' or name = 'PRO: Prospecting']);
		Map<Id,Campaign> allCampaigns = new Map<Id,Campaign>([select id, name from Campaign]);


		Campaign DOrg;
		Campaign RainKing;
		Campaign LinkedIn;
		Campaign Prospecting;
		for (Campaign currCamp : camp.values()){
			if(currCamp.Name == 'PRO: DiscoverOrg'){
				DOrg = currCamp;
			} else if (currCamp.Name == 'PRO: RainKing'){
				RainKing = currCamp;
			} else if (currCamp.Name == 'PRO: LinkedIn'){
				LinkedIn = currCamp;
			} else if (currCamp.Name == 'PRO: Prospecting'){
				Prospecting = currCamp;
			}
		}
		
		
		List<CampaignMember> newCM = new List<CampaignMember>();
		List<CampaignMember> existingCM = [select id, campaignId, contactId from CampaignMember where campaignId in :camp.keySet() and contactId in :cons.keySet()];


		for (Contact con: cons.values()){
			
			if (con.LeadSource != null) {
			
				if (con.LeadSource == 'Prospecting - DiscoverOrg') {
					Boolean match = false;
					for (CampaignMember currCM : existingCM) {
						if (con.Id == currCM.ContactId && currCM.campaignId == DOrg.id) {
							match = true;
						}
					}
					
					if (!match) {
						CampaignMember cm1 = new CampaignMember(contactId = con.id, campaignId = DOrg.id);
						newCM.add(cm1);
					}	
				} else if (con.LeadSource == 'Prospecting - RainKing') {
					Boolean match = false;
					for (CampaignMember currCM : existingCM) {
						if (con.Id == currCM.ContactId && currCM.campaignId == RainKing.id) {
							match = true;
						}
					}
					
					if (!match) {
						CampaignMember cm1 = new CampaignMember(contactId = con.id, campaignId = RainKing.id);
						newCM.add(cm1);
					}	
				} else if (con.LeadSource == 'Prospecting - LinkedIn') {
					Boolean match = false;
					for (CampaignMember currCM : existingCM) {
						if (con.Id == currCM.ContactId && currCM.campaignId == LinkedIn.id) {
							match = true;
						}
					}
					
					if (!match) {
						CampaignMember cm1 = new CampaignMember(contactId = con.id, campaignId = LinkedIn.id);
						newCM.add(cm1);
					}						
				} else if (con.LeadSource == 'Prospecting - Other') {
					Boolean match = false;
					for (CampaignMember currCM : existingCM) {
						if (con.Id == currCM.ContactId && currCM.campaignId == Prospecting.id) {
							match = true;
						}
					}
					
					if (!match) {
						CampaignMember cm1 = new CampaignMember(contactId = con.id, campaignId = Prospecting.id);
						newCM.add(cm1);
					}	
				}
				
			}
		}
		
		if (newCM.size() > 0) insert newCM;

		List<CampaignMember> cm = [select id, CampaignId, ContactId from CampaignMember where contactId IN :oppContacts.values() order by CreatedDate asc ];
		

		for(Opportunity opp: allOpps.values()) {
			
			if (oppContacts.containsKey(opp.id)){
				
				Contact con = cons.get(oppContacts.get(opp.id));
				system.debug('*** Contact is ' + con.name);
				
				if (con.LeadSource != null){	
					if (con.LeadSource.contains('TGL:')){
						opp.LeadSource = 'Cold Call List';
					} else {
						opp.LeadSource = con.LeadSource;
					}
					system.debug('$$$ making ' + con.LeadSource + ' the leadsource for ' + opp.Name);
				}
				
				if (con.LeadSource == 'Prospecting - DiscoverOrg'){
					opp.CampaignId = DOrg.id;
				} else if (con.LeadSource == 'Prospecting - RainKing'){
					opp.CampaignId = RainKing.id;
				} else if (con.LeadSource == 'Prospecting - LinkedIn'){
					opp.CampaignId = LinkedIn.id;
				} else {
				
					for (CampaignMember cs : cm){
						if(cs.contactId == con.id && opp.CampaignId == null){
							if (con.LeadSource == 'Prospecting - Other' && allCampaigns.get(cs.CampaignId).Name.contains('PRO:')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Prospecting - Other';
								break;
							} else if ((con.LeadSource == 'Tradeshow' || con.LeadSource.contains('TSE:')) && allCampaigns.get(cs.CampaignId).Name.Contains('TSE:')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Tradeshow';
								system.debug('$$$ adding ' + allCampaigns.get(cs.CampaignId).Name + ' as Campaign for ' + opp.Name);
								break;
							} else if ((con.LeadSource == 'Third Party' || con.LeadSource.contains('TSE:')) && allCampaigns.get(cs.CampaignId).Name.Contains('3PT:')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Third Party';
								break;
							} else if ((con.LeadSource == 'Inbound - Website' || con.LeadSource == 'INB: Website') && allCampaigns.get(cs.CampaignId).Name.equals('INB: Website')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Inbound - Website';
								break;
							} else if ((con.LeadSource == 'Inbound - Webinar' || con.LeadSource.contains('Webinar')) && allCampaigns.get(cs.CampaignId).Name.contains('Webinar')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Inbound - Webinar';
								break;
							} else if ((con.LeadSource == 'Inbound - Other' || con.LeadSource.contains('INB:'))&& allCampaigns.get(cs.CampaignId).Name.contains('INB:')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Inbound - Other';
								break;
							} else if ((con.LeadSource == 'Cold Call List' || con.LeadSource.contains('CCL:') || con.LeadSource.contains('TGL:')) && (allCampaigns.get(cs.CampaignId).Name.contains('CCL:')) || allCampaigns.get(cs.CampaignId).Name.contains('TGL:')){
								opp.CampaignId = cs.CampaignId;
								opp.LeadSource = 'Cold Call List';
								break;
							}
						}
					}
				}
				
					
				updateOpps.add(opp);		
			}
				
		}


/*

		//associate opp ID to campaign ID
		for (CampaignMember currCM : cm){
			for (ID oppId : oppContacts.keySet()) {
				if (!oppPC.containsKey(oppId)){
					if (oppContacts.get(oppId) == currCM.ContactId){
						Contact currCon = cons.get(currCM.ContactId);
						Campaign currCam = camp.get(currCM.CampaignId);
						
						if (currCon != null && currCam != null){
					 		if (currCon.leadSource != null){
			 					if (currCon.leadSource == 'Prospecting - DiscoverOrg' && currCam.name == 'PRO: DiscoverOrg'){
									oppPC.put(oppId,currCM.CampaignId);
									system.debug('### Opp ' + allOpps.get(oppId) + ' is being given campaign of ' + camp.get(currCM.CampaignId).name );
								} else if (currCon.leadSource == 'Prospecting - LinkedIn' && currCam.name == 'PRO: LinkedIn'){
									oppPC.put(oppId,currCM.CampaignId);
									system.debug('### Opp ' + allOpps.get(oppId) + ' is being given campaign of ' + camp.get(currCM.CampaignId).name );								
								} else if (currCon.leadSource == 'Prospecting - RainKing' && currCam.name == 'PRO: RainKing'){
									oppPC.put(oppId,currCM.CampaignId);
									system.debug('### Opp ' + allOpps.get(oppId) + ' is being given campaign of ' + camp.get(currCM.CampaignId).name );
								} else if (currCon.leadSource.startsWithIgnoreCase('PRO') && currCam.name.startsWithIgnoreCase('PRO:')){
									oppPC.put(oppId,currCM.CampaignId);
									system.debug('### Opp ' + allOpps.get(oppId) + ' is being given campaign of ' + camp.get(currCM.CampaignId).name );								
								} else {
									oppPC.put(oppId,currCM.CampaignId);
									system.debug('### Opp ' + allOpps.get(oppId) + ' is being given campaign of ' + camp.get(currCM.CampaignId).name );
									
								}
							}
						}	
					}
				}
			}
		}
		
		for(Opportunity opp : allOpps.values()){
			if (oppPC.containsKey(opp.Id)){
				Campaign c = allCampaigns.get(oppPC.get(opp.Id));
				opp.CampaignId = c.id;
				if (allCampaigns.get(c.id).Name.contains('TSE:')){
					opp.LeadSource = 'Tradeshow';
				} else if (allCampaigns.get(c.id).Name.contains('3PT:')){
					opp.LeadSource = 'Third Party';
				} else if (allCampaigns.get(c.id).Name.equals('INB: Website')){
					opp.LeadSource = 'Inbound - Website';
				} else if (allCampaigns.get(c.id).Name.contains('INB:') && allCampaigns.get(c.id).Name.containsIgnoreCase('webinar')){
					opp.LeadSource = 'Inbound - Webinar';
				} else if (allCampaigns.get(c.id).Name.contains('INB:')){
					opp.LeadSource = 'Inbound - Other';
				} else if (allCampaigns.get(c.id).Name.equals('PRO: DiscoverOrg')){
					opp.LeadSource = 'Prospecting - DiscoverOrg';
				} else if (allCampaigns.get(c.id).Name.equals('PRO: RainKing')){
					opp.LeadSource = 'Prospectig - RainKing';
				} else if (allCampaigns.get(c.id).Name.equals('PRO: LinkedIn')){
					opp.LeadSource = 'Prospecting - LinkedIn';
				} else if (allCampaigns.get(c.id).Name.contains('PRO:')){
					opp.LeadSource = 'Prospecting - Other';
				} else if (allCampaigns.get(c.id).Name.contains('CCL:') || allCampaigns.get(c.id).Name.contains('TGL:')){
					opp.LeadSource = 'Cold Call List';
				}

				updateOpps.add(opp);
			}
		}
		
    	
		if (updateOpps.size() > 0) update updateOpps;
		
		VMTUtils.inBatch = false;
*/    	
    	
    }
    
    global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job  
        // from Database.BatchableContext.  
        // Query the AsyncApexJob object to retrieve the current job's information.  
/*    
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Update Primary Campaign batch: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        
*/        
    }
    
}