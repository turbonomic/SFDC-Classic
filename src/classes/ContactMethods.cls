global class ContactMethods {
 
 /*	
*	Index	Method Name									Method Description
*	-------------------------------------------------------------------------------------------------------------------------
*	[C1]	ContactDispositionSlaMet					mark open sla met if contact dispositioned within 24 hours
*	[C2]    setContactLookups							Set the Active Contact Lookup to Account for active Contacts
*
*
*
*
*/


 	/*
 	*  [C1]
 	*  ContactDispositionSlaMet method
	*
	*
	*/ 
	public static void ContactDispositionSlaMet(Map<id,Contact> contacts, Map<id,Contact> oldContacts) {
	
		Set<id> closedContacts = new Set<id>(); //Set to hold dispostioned contacts
		Map<id,Integer> conGmtOffsetMap = new Map<id, Integer>(); //Map to hold Time Zone Offset for Contacts
		
		Integer emeaOffset; Integer usOffset;
		Map<String, Time_Zone_Offset__c> gmtOffSetMap = Time_Zone_Offset__c.getall();
		// 0 during winter, 1 during British Summer Time
		if (gmtOffSetMap.containsKey('EMEA')) emeaOffset = (Integer) gmtOffSetMap.get('EMEA').GMT_Offset__c; else emeaOffset = 1;
		//-5 during EST, -4 during EDT
    	if (gmtOffSetMap.containsKey('EMEA')) usOffset = (Integer) gmtOffSetMap.get('NORAM').GMT_Offset__c; else usOffset = -4;
		
		for (Contact con : contacts.values()) {
			//if the Contact is dispositioned within 24 hours of SLA creation mark SLA 1 as met
			if (con.Contact_Status__c == 'Closed' && oldContacts.get(con.id).Contact_Status__c != 'Closed') {
				closedContacts.add(con.id);
				if (con.Inbound_SLA_Core_Market__c == 'NORAM') conGmtOffsetMap.put(con.id,usOffset);
				else conGmtOffsetMap.put(con.id,emeaOffset);
			}
		}
		
		//Query all open SLAs associated with the converted and closed Leads
		if (closedContacts.size() > 0) {
			Map<id, SLA__C> slaMap = new Map<id, SLA__c>([SELECT id, Contact__c, SLA_1_Met__c, CreatedDate FROM SLA__c WHERE SLA_Status__c = 'Open' AND (Contact__c in: closedContacts)]);	
			List<SLA__c> updateSLA = new List<SLA__c>();
			
			DateTime currTime = System.now();
			for (SLA__c s: slaMap.values()) {
				boolean updated = false;
				
				Integer offSet = 0; //default Time Zone offset to zero
				if (conGmtOffsetMap.containsKey(s.Contact__c)) offSet = conGmtOffsetMap.get(s.Contact__c); //If an offset was set during initial loop, grab offset 
				DateTime dateToCompare = SLAMethods.AdjustedSLATime(s.CreatedDate, offSet); //Call method to grab SLA's adjusted create time for comparison
				
				//If the disposition or the conversion is happening within 24 hours of the SLA's adjusted Create time and SLA 1 is not currently checked, mark SLA 1 as met
				if (currTime < dateToCompare.addHours(24)) {
					if (!s.SLA_1_Met__c) {
						s.SLA_1_Met__c = true;
						updated = true;
					}
				}
				
				if (closedContacts.contains(s.Contact__c)) {
					s.SLA_Status__c = 'Closed (Contact Dispositioned)';
					s.Close_Date__c = system.now();
					updated = true;
				}
				
				if (updated) updateSLA.add(s);
			}
			if (updateSLA.size() > 0) update updateSLA;		
		}
		
		
	}
	
	/*
 	*  [C2]
 	*  setContactLookups method
	*
	*
	*/ 
	public static void setContactLookups(List<Contact> contacts) {
		
		for (Contact c: contacts) {
			//Set Do not Call Look up for Contacts with Do not call checkbox is True or Status reason of "Do not call"
			if (c.DoNotCall == true || c.Status_Reason__c == 'Do Not Call') {
				system.debug('DNC Contact is: ' + c.firstName + ' ' + c.LastName);
				if (c.Inactive_Lookup__c != null) c.Inactive_Lookup__c = null; //Clear out inactive look up if not blank
				if (c.Active_Lookup__c != null) c.Active_Lookup__c = null; //Clear out Active look up if not blank
				if (c.Do_Not_Call_Lookup__c == null) c.Do_Not_Call_Lookup__c = c.AccountId;
				else if (c.Do_Not_Call_Lookup__c != c.AccountId) c.Do_Not_Call_Lookup__c = c.AccountId;
			}
			//Set Active Lookups for Active Contacts
			else if (c.IsActive__c) {
				system.debug('Active Contact is: ' + c.firstName + ' ' + c.LastName);
				if (c.Inactive_Lookup__c != null) c.Inactive_Lookup__c = null; //Clear out inactive look up if not blank
				if (c.Do_Not_Call_Lookup__c != null) c.Do_Not_Call_Lookup__c = null; //Clear out Do Not Call look up if not blank
				if (c.Active_Lookup__c == null) c.Active_Lookup__c = c.accountId; //If active look up is blank, fill with current account
				else if (c.Active_Lookup__c != c.accountId) c.Active_Lookup__c = c.accountId; //if Active lookup does not equal current account, update to current account
			}
			//Set Inactive Lookups for Inactive Contacts
			else {
				system.debug('Inctive Contact is: ' + c.firstName + ' ' + c.LastName);
				if (c.Active_Lookup__c != null) c.Active_Lookup__c = null; //Clear out Active look up if not blank
				if (c.Do_Not_Call_Lookup__c != null) c.Do_Not_Call_Lookup__c = null; //Clear out Do Not Call look up if not blank
				if (c.Inactive_Lookup__c == null) c.Inactive_Lookup__c = c.accountId; //if Inactive look up is blank fill with current account
				else if (c.Inactive_Lookup__c != c.accountId) c.Inactive_Lookup__c = c.accountId; // Else, if the inactive look up does not equal the current acocunt, update to current account
			} 
		}
		
	}
	
}