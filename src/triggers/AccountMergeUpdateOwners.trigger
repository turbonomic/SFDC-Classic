// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Trigger: AccountMergeUpdateOwners.trigger      
// Description: When 2 Accounts are merged, update Lead & Contact Owners to match master Account Owner.
trigger AccountMergeUpdateOwners on Account (after delete) {
/*
	Set<Id> masterIds = new Set<Id>();
	Map<Id, Id> masterIdToNewOwnerMap = new Map<Id, Id>();
	for (Account acct : Trigger.old) {
		if (acct.MasterRecordId != null) {
			masterIds.add(acct.MasterRecordId);
		}
	}
	
	List<Lead> updateLeads = new List<Lead>();
	List<Contact> updateContacts = new List<Contact>();
	if (masterIds.size() > 0) {
		

		
		List<Account> masterAccts = [select Id, OwnerId from Account where id in: masterIds];
		for (Account acct : masterAccts) {
			masterIdToNewOwnerMap.put(acct.Id, acct.OwnerId);
		}
		
		List<Lead> allLeads = [select OwnerId, Account__c from Lead where Account__c in: masterIds and IsConverted = false];
		for (Lead ld : allLeads) {
			if (ld.OwnerId != masterIdToNewOwnerMap.get(ld.Account__c)) {
				ld.OwnerId = masterIdToNewOwnerMap.get(ld.Account__c);
				updateLeads.add(ld);
			}
		}
		
		List<Contact> allContacts = [select OwnerId, AccountId from Contact where AccountId in: masterIds];
		for (Contact con : allContacts) {
			if (con.OwnerId != masterIdToNewOwnerMap.get(con.AccountId)) {
				con.OwnerId = masterIdToNewOwnerMap.get(con.AccountId);
				updateContacts.add(con);
			}
		}
		
		if (updateLeads.size()>0) update updateLeads;
		if (updateContacts.size()>0) update updateContacts;
	}
*/
	
}