trigger AccountTrigger on Account (after delete, after insert, after update, before insert, before update) {
	
	
	Map<id,Account> accts = new Map<id,Account>();
	Map<id,Account> oldAccts = new Map<id,Account>();
	List<Account> insertAccts = new List<Account>();
	Map<id,Account> deletedAccts = new Map<id,Account>();
	
	if (trigger.isDelete) {
		for (Account a: trigger.old) {
			deletedAccts.put(a.id,trigger.OldMap.get(a.id));
		}
	} else {
		for (Account a : trigger.new) {
			if (trigger.isInsert) {
				insertAccts.add(a);
			} else if (trigger.isUpdate) {
				accts.put(a.id,a);
				oldAccts.put(a.id,trigger.oldMap.get(a.id));
			} else if (trigger.isUndelete) {
				accts.put(a.id,a);
			}
		}
	}
		
		if (trigger.isBefore) {
			
			if (trigger.isInsert) {
				AccountMethods.AcctLookupLatLongByZip(accts, oldAccts, insertAccts);
				AccountMethods.AcctLookupMSAByZip(accts, oldAccts, insertAccts);
				//AccountMethods.AccountVeloTeamUpdate(accts, oldAccts, insertAccts);
				
			} else if (trigger.isUpdate) {
				AccountMethods.AcctLookupLatLongByZip(accts,oldAccts, insertAccts);
				AccountMethods.AcctLookupMSAByZip(accts,oldAccts, insertAccts);
				//AccountMethods.AccountVeloTeamUpdate(accts, oldAccts, insertAccts);
				//AccountMethods.AssignTerritoryOwner(accts,oldAccts);
				AccountMethods.AccountFillLastLinkedinFillDate(accts,oldAccts);
				AccountMethods.AccountIndustryUpdate(accts,oldAccts);
			}
			
		} else if (trigger.isAfter) {
			
			if (trigger.isInsert) {
				
				
				
			} else if (trigger.isUpdate) {
				AccountMethods.AccountOwnerUpdate(accts,oldAccts);
				
			} else if (trigger.isDelete) {
				AccountMethods.AccountMergeUpdateOwners(deletedAccts);
				
			}
		}
	
	
	
}