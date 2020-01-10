// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Trigger: ContactOwnerUpdate.trigger      
// Description: When an Contact Owner is changed, update Owners (Assignees) on OPEN Tasks & Events owned by previous owner
trigger ContactOwnerUpdate on Contact (after update) {
	Map<Id, Id> contactToNewOwnerMap = new Map<Id, Id>();
	Map<Id, Id> contactToPrevOwnerMap = new Map<Id, Id>();
	Map<Id, Id> contactToNewAcctMap = new Map<Id, Id>();
	for (Contact con : trigger.new){
		if (con.OwnerId != trigger.oldMap.get(con.id).OwnerId) {
			contactToNewOwnerMap.put(con.id, con.OwnerId);
			contactToPrevOwnerMap.put(con.id, trigger.oldMap.get(con.id).OwnerId);
		} else if (con.AccountId != trigger.oldMap.get(con.id).AccountId) {
			contactToNewAcctMap.put(con.id, con.AccountId);
		}
	}
	
	List<Contact> updateContacts = new List<Contact>();
	if (contactToNewAcctMap.keySet().size() > 0) {
		Map<Id, Account> acctMap = new Map<Id, Account>([select id, OwnerId from Account where id in: contactToNewAcctMap.values()]);
		Map<Id, Contact> conMap = new Map<Id, Contact>([select id, OwnerId from Contact where id in: contactToNewAcctMap.keySet()]);
		for (Contact con: conMap.values()) {
			if (con.OwnerId != acctMap.get(contactToNewAcctMap.get(con.id)).OwnerId) {
				con.OwnerId = acctMap.get(contactToNewAcctMap.get(con.id)).OwnerId;
				updateContacts.add(con);
			}
		}
		
		if (updateContacts.size()>0) update updateContacts;	
	}
	
	
	List<Task> updateTasks = new List<Task>();
	//List<Event> updateEvents = new List<Event>();
	if (contactToNewOwnerMap.keySet().size() > 0) {
		
		List<Task> allTasks = [select OwnerId, WhoId from Task where WhoId in: contactToNewOwnerMap.keySet() and IsClosed = false and IsRecurrence = false and (ActivityDate = null or ActivityDate > TODAY)];
		for (Task tsk : allTasks) {
			if (tsk.OwnerId == contactToPrevOwnerMap.get(tsk.WhoId)) {
				tsk.OwnerId = contactToNewOwnerMap.get(tsk.WhoId);
				updateTasks.add(tsk);
			}
		}
		
		//List<Event> allEvents = [select OwnerId, WhoId from Event where WhoId in: contactToNewOwnerMap.keySet() and EndDateTime >: DateTime.now() and IsRecurrence = false];
		//for (Event evt : allEvents) {
		//	if (evt.OwnerId == contactToPrevOwnerMap.get(evt.WhoId)) {
		//		evt.OwnerId = contactToNewOwnerMap.get(evt.WhoId);
		//		updateEvents.add(evt);
		//	}
		//}
		
		if (updateTasks.size()>0) update updateTasks;
		//if (updateEvents.size()>0) update updateEvents;
	}
}