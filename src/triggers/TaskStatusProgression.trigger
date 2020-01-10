trigger TaskStatusProgression on Task (after insert, after update) {
	/*
	list<Task> initialList = new List<Task>();
	list<Task> conTaskList = new List<Task>();
	List<Task> leadTaskList = new List<Task>();
	
	for (Task tsk : trigger.new) {
		if (UserInfo.getUserId() != '00557000006761TAAQ') {
			if ((trigger.isInsert && tsk.isClosed && tsk.call_disposition__c != null && tsk.WhoId != null) || (trigger.isUpdate && !trigger.oldMap.get(tsk.id).isClosed && tsk.call_disposition__c != null && tsk.whoId != null && tsk.isClosed)) {
				initialList.add(tsk);
			}
		}
	}
	
	system.debug('### tsk trigger has ' + initialList.size() + ' elements');
	
	if (initialList.size() > 0) {
		Set<Id> conIdSet = new Set<Id>();
		Set<Id> leadIdSet = new Set<Id>();
		
		//divide into contact and lead task lists
		for (Task tsk : initialList) {
			if (tsk.whoId.getSobjectType() == Schema.Contact.sObjectType) {
				conIdSet.add(tsk.WhoId);
				conTaskList.add(tsk);
			}
			if (tsk.whoId.getSobjectType() == Schema.Lead.sObjectType) {
				leadIdSet.add(tsk.WhoId);
				leadTaskList.add(tsk);
			}
		}
		
		Map<id,Contact> contactMap = new Map<id,Contact>([select id, contact_status__c, status_reason__c, owner.UserRole.Name from Contact where id in: conIdSet]);
		Map<id,Lead> leadMap = new Map<id,Lead>([select id, status, CFCR_Status_Reason__c, Owner.UserRole.Name from Lead where id in: leadIdSet]);
		
		system.debug('### contactMap has ' + contactMap.size() + ' Contacts');
		system.debug('### leadMap has ' + leadMap.size() + ' Leads');
		
		List<Contact> conUpdate = new List<Contact>();
		List<Lead> leadUpdate = new List<Lead>();
		
		for (Task tsk : conTaskList) {
			if (tsk.call_disposition__c == 'Connect' || tsk.call_disposition__c == 'Conversation') {
				Contact currCon = contactMap.get(tsk.whoId);
				if (currCon.Contact_Status__c == 'New' || currCon.Contact_Status__c == 'Suspect') {
					currCon.Contact_Status__c = 'Working';
					conUpdate.add(currCon);
				}
			}
		}
		
		for (Task tsk : leadTaskList) {
			if (tsk.call_disposition__c == 'Connect' || tsk.call_disposition__c == 'Conversation') {
				Lead currLead = leadMap.get(tsk.whoId);
				if (currLead.status == 'New' || currLead.status == 'Suspect') {
					currLead.status = 'Working';
					leadUpdate.add(currLead);
				}
			}
		}
		
		if (conUpdate.size() > 0) update conUpdate;
		if (leadUpdate.size() > 0) update leadUpdate;
	}
	*/
}