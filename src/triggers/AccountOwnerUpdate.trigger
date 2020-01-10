// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Trigger: AccountOwnerUpdate.trigger      
// Description: When an Account Owner is changed, update Owners on all Lead & Contact records associated with Account
trigger AccountOwnerUpdate on Account (after update) {
/*
	Map<Id, Id> acctToOwnerMap = new Map<Id, Id>();
	for (Account acct : trigger.new){
		if (acct.OwnerId != trigger.oldMap.get(acct.id).OwnerId && acct.id != '001D000000v5q5N') {
			acctToOwnerMap.put(acct.id, acct.OwnerId);
		}
	}
	
	List<Lead> updateLeads = new List<Lead>();
	List<Contact> updateContacts = new List<Contact>();
	if (acctToOwnerMap.keySet().size() > 0) {
		
		List<Lead> allLeads = [select OwnerId, Account__c from Lead where Account__c in: acctToOwnerMap.keySet() and IsConverted = false];
		for (Lead ld : allLeads) {
			if (ld.OwnerId != acctToOwnerMap.get(ld.Account__c)) {
				ld.OwnerId = acctToOwnerMap.get(ld.Account__c);
				updateLeads.add(ld);
			}
		}
		
		List<Contact> allContacts = [select OwnerId, AccountId from Contact where AccountId in: acctToOwnerMap.keySet()];
		for (Contact con : allContacts) {
			if (con.OwnerId != acctToOwnerMap.get(con.AccountId)) {
				con.OwnerId = acctToOwnerMap.get(con.AccountId);
				updateContacts.add(con);
			}
		}
		
		
		if (updateContacts.size()>0) update updateContacts;
		if (updateLeads.size()>0) update updateLeads;
		
	}
*/
}