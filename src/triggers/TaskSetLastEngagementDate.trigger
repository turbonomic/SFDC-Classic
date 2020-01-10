/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: When a Task is created, updated or deleted, update the Last Engagement Date on the Lead or Contact and the related Account, if appropriate.
*/

trigger TaskSetLastEngagementDate on Task (after delete) {
/*


	//collections to sort data
	Set<Id> conIdSet = new Set<Id>();
	Set<Id> ldIdSet = new Set<Id>();
	Map<Id, Date> conToDate = new Map<Id, Date>();
	Map<Id, Contact> conMap = new Map<Id, Contact>();
	Map<Id, Contact> conUpdateMap = new Map<Id, Contact>();
	Map<Id, Date> ldToDate = new Map<Id, Date>();
	Map<Id, Lead> ldMap = new Map<Id, Lead>();
	Map<Id, Lead> ldUpdateMap = new Map<Id, Lead>();
	Map<Id, Date> acctToDate = new Map<Id, Date>();
	Map<Id, Account> acctMap = new Map<Id, Account>();
	Map<Id, Account> acctUpdateMap = new Map<Id, Account>();
	Set<Id> allAcctIds = new Set<Id>();
	
	String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
	String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
	
	if (trigger.isDelete) { //if delete trigger
		for (Task tsk: trigger.old) {
			
			//collect pertinent records into collections
			if (tsk.Status=='Completed' && tsk.WhoId != null && tsk.Engagement_Activity__c && tsk.ActivityDate != null) {
				if (((String)tsk.WhoId).startsWith(conPrefix)) {
					conIdSet.add(tsk.WhoId);
					system.debug('###Deleted Engagement Activity on Contact!');
				} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					ldIdSet.add(tsk.WhoId);
					system.debug('###Deleted Engagement Activity on Lead!');
				}
			}
		}

	} /*else { //if insert or update trigger
		for (Task tsk: trigger.new) {
			
			//if insert - set collections for contacts & Leads
			if (trigger.isInsert && tsk.Engagement_Activity__c && tsk.Status == 'Completed' && tsk.WhoId != null & tsk.ActivityDate != null) {
				if (((String)tsk.WhoId).startsWith(conPrefix)) {
					system.debug('###New Engagement Activity on Contact!');
					conIdSet.add(tsk.WhoId);
				} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					system.debug('###New Engagement Activity on Lead!');
					ldIdSet.add(tsk.WhoId);
				}
			//if update trigger - set collects for contacts & leads
			} else if (trigger.isUpdate && tsk.Engagement_Activity__c && tsk.WhoId != null && tsk.Status == 'Completed' && tsk.ActivityDate != null && (trigger.oldMap.get(tsk.id).Status != 'Completed' || tsk.ActivityDate != trigger.oldMap.get(tsk.id).ActivityDate || trigger.oldMap.get(tsk.id).Engagement_Activity__c == false)) {
				if (((String)tsk.WhoId).startsWith(conPrefix)) {
					system.debug('###Updated Engagement Activity on Contact!');
					conIdSet.add(tsk.WhoId);
					
				} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					system.debug('###Updated Engagement Activity on Lead!');
					ldIdSet.add(tsk.WhoId);
				}
			}
		}
	} */
	/*
	//use collection to figure out which contacts to update
	if (conIdSet.size() > 0) {
		
		system.debug('###Contacts have new/updated/deleted Engagement Activities');
		
		//query for remaining tasks on Contacts & Contact records themselves
		List<Task> tskConList = new List<Task>();
		tskConList = [SELECT ActivityDate, WhoId, AccountId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND WhoId in :conIdSet AND Engagement_Activity__c = true and ActivityDate != null all rows];
		conMap = new Map<Id, Contact>([select id, AccountId, Last_Engagement_Date__c from Contact where id in: conIdSet and AccountId != null]);
		conToDate = new Map<Id, Date>();
		
		for (Contact c : conMap.values()) {
			allAcctIds.add(c.AccountId);
		}
		
		//set latest date collection for contact
		if (!tskConList.isEmpty()) {
			for (Task tsk : tskConList)  {
				if (conToDate.containsKey(tsk.WhoId)) {
					if (conToDate.get(tsk.WhoId) < tsk.ActivityDate) {
						system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Contact id ' + tsk.WhoId);
						conToDate.put(tsk.WhoId, tsk.ActivityDate);
					}
				} else {
					system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Contact id ' + tsk.WhoId);
					conToDate.put(tsk.WhoId, tsk.ActivityDate);
				}
			}
		}
	
		//set contacts to update
		for (Id cid : conMap.keySet()) {
			
			if (conToDate.containsKey(cid)) {
				if (conMap.get(cid).Last_Engagement_Date__c != conToDate.get(cid)) {
					system.debug('###Updating Contact Last Engagement Date to ' + conToDate.get(cid));
					Contact con = new Contact (id=cid, Last_Engagement_Date__c=conToDate.get(cid));
					conUpdateMap.put(con.id, con);
				}
			} else {
				system.debug('###Setting Contact Last Engagement Date to null');
				Contact con = new Contact(id=cid, Last_Engagement_Date__c=null);
				conUpdateMap.put(con.id, con);
			}
		}
		
		//commit changes to Contacts
		if (conUpdateMap.keySet().size() > 0) {
			update conUpdateMap.values();
		}	
	}
	
	//use collection to figure out which leads to update
	if (ldIdSet.size() > 0) {

		//query for remaining tasks on leads & lead records themselves
		List<Task> tskLdList = new List<Task>();
		tskLdList = [SELECT ActivityDate, WhoId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND WhoId in :ldIdSet AND Engagement_Activity__c = true and ActivityDate != null all rows];
		ldMap = new Map<Id, Lead>([select id, Account__c, Last_Engagement_Date__c from Lead where id in: ldIdSet and Account__c != null]);
		ldToDate = new Map<Id, Date>();
		
		for (Lead l : ldMap.values()) {
			allAcctIds.add(l.Account__c);
		}
		
		//set latest date collection for leads
		if (!tskLdList.isEmpty()) {
			for (Task tsk : tskLdList)  {
				if (ldToDate.containsKey(tsk.WhoId)) {
					if (ldToDate.get(tsk.WhoId) < tsk.ActivityDate) {
						system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Lead id ' + tsk.WhoId);
						ldToDate.put(tsk.WhoId, tsk.ActivityDate);
					}
				} else {
					system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Lead id ' + tsk.WhoId);
					ldToDate.put(tsk.WhoId, tsk.ActivityDate);
				}
			}
		}
		
		//set leads to update
		for (Id lid : ldMap.keySet()) {
			
			if (ldToDate.containsKey(lid)) {
				if (ldMap.get(lid).Last_Engagement_Date__c != ldToDate.get(lid)) {
					system.debug('###Updating Lead Last Engagement Date to ' + ldToDate.get(lid));
					Lead ld = new Lead (id=lid, Last_Engagement_Date__c=ldToDate.get(lid));
					ldUpdateMap.put(ld.id, ld);
				}
			} else {
				system.debug('###Setting Lead Last Engagement Date to null');
				Lead ld = new Lead(id=lid, Last_Engagement_Date__c=null);
				ldUpdateMap.put(ld.id, ld);
			}
		}
		
		//commit changes to Leads
		if (ldUpdateMap.keySet().size() > 0) {
			update ldUpdateMap.values();
		}
	
	}
	
	//use collections to figure out which accounts to update
	if (conMap.keyset().size() > 0 || ldMap.keyset().size() > 0) {
		
		Map<Id, Contact> allConMap = new Map<Id, Contact>([select id, AccountId from Contact where AccountId in: allAcctIds]);
		Map<Id, Lead> allLdMap = new Map<Id, Lead>([select id, Account__c from Lead where Account__c in: allAcctIds]);
	
		//query for remaining tasks on Accounts
		List<Task> tskAcctList = new List<Task>();
		tskAcctList = [SELECT ActivityDate, WhoId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND (WhoId in :allConMap.keySet() or WhoId in :allLdMap.keySet()) AND Engagement_Activity__c = true and ActivityDate != null all rows];

		//set latest date collection for account
		if (!tskAcctList.isEmpty()) {
			for (Task tsk : tskAcctList)  {
				if (((String)tsk.WhoId).startsWith(conPrefix)) {
					if (acctToDate.containsKey(allConMap.get(tsk.WhoId).AccountId)) {
						if (acctToDate.get(allConMap.get(tsk.WhoId).AccountId) < tsk.ActivityDate) {
							system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Account id ' + allConMap.get(tsk.WhoId).AccountId);
							acctToDate.put(allConMap.get(tsk.WhoId).AccountId, tsk.ActivityDate);
						}
					} else {
						system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Account id ' + allConMap.get(tsk.WhoId).AccountId);
						acctToDate.put(allConMap.get(tsk.WhoId).AccountId, tsk.ActivityDate);
					}
				} else {
					if (allLdMap.containsKey(tsk.WhoId)) {
						if (acctToDate.containsKey(allLdMap.get(tsk.WhoId).Account__c)) {
							if (acctToDate.get(allLdMap.get(tsk.WhoId).Account__c) < tsk.ActivityDate) {
								system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Account id ' + allLdMap.get(tsk.WhoId).Account__c);
								acctToDate.put(allLdMap.get(tsk.WhoId).Account__c, tsk.ActivityDate);
							}
						} else {
							system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Account id ' + allLdMap.get(tsk.WhoId).Account__c);
							acctToDate.put(allLdMap.get(tsk.WhoId).Account__c, tsk.ActivityDate);
						}
					}
				}
			}
		}
		
		if (allAcctIds.size() > 0) {
			
			//query account records
			acctMap = new Map<Id, Account>([select id, Last_Engagement_Date__c from Account where id in: allAcctIds]);
	
			//set accounts to update
			for (Id aid : acctMap.keySet()) {
				
				if (acctToDate.containsKey(aid)) {
					if (acctMap.get(aid).Last_Engagement_Date__c != null) {
						if (acctMap.get(aid).Last_Engagement_Date__c != acctToDate.get(aid)) {
							system.debug('###Updating Account Last Engagement Date to ' + acctToDate.get(aid));
							Account acct = new Account (id=aid, Last_Engagement_Date__c=acctToDate.get(aid));
							acctUpdateMap.put(acct.id, acct);
						}
					} else {
						system.debug('###Setting Account Last Engagement Date to ' + acctToDate.get(aid));
						Account acct = new Account (id=aid, Last_Engagement_Date__c=acctToDate.get(aid));
						acctUpdateMap.put(acct.id, acct);
					}
				} else {
					if (acctMap.get(aid).Last_Engagement_Date__c != null) {
						system.debug('###Updating Account Last Engagement Date to null.');
						Account acct = new Account(id = aid, Last_Engagement_Date__c = null);
						acctUpdateMap.put(acct.id, acct);
					}
				}
			}
			
			//commit changes to Accounts
			if (acctUpdateMap.keySet().size() > 0) {
				update acctUpdateMap.values();
			}
		}
		
	}
		*/		
}