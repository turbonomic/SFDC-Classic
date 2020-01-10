// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]      
// Description: When a Contact is created, set owner to Account Owner
trigger ContactInsertSetOwner on Contact (before insert) {
	
	Set<Id> acctIds = new Set<Id>();
	for (Contact con : trigger.new) {
		if (con.AccountId != null) {
			acctIds.add(con.AccountId);
		}
	}
	
	if (acctIds.size() > 0) {
		Map<Id, Account> acctMap = new Map<Id, Account>([select id, OwnerId, Owner.Name from Account where id in: acctIds]);
		
		for (Contact con : trigger.new) {
			if (acctMap.containsKey(con.AccountId)) {
				con.OwnerId = acctMap.get(con.AccountId).OwnerId;
			}
		}
	}

}