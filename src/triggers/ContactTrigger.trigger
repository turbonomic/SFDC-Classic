trigger ContactTrigger on Contact (after insert, after update, before insert, before update) {

	Map<id,Contact> contacts = new Map<id,Contact>();
	List<Contact> insertContacts = new List<Contact>();
	List<Contact> updateContacts = new List<Contact>();
	Map<id,Contact> oldContacts = new Map<id,Contact>();
	
	for (Contact c : trigger.new) {
		if (trigger.isInsert) {
			insertContacts.add(c);
		} else if (trigger.isUpdate) {
			updateContacts.add(c);
			contacts.put(c.id,c);
			oldContacts.put(c.id,trigger.oldMap.get(c.id));
		}
	}
	
	
	if (trigger.isBefore) {
		
		if (trigger.isInsert) {
			ContactMethods.setContactLookups(insertContacts);
		} else if (trigger.isUpdate) {
			ContactMethods.setContactLookups(updateContacts);
		}
		
	} else if (trigger.isAfter) {
		
		if (trigger.isInsert) {
			
			
			
		} else if (trigger.isUpdate) {
			ContactMethods.ContactDispositionSlaMet(contacts, oldContacts);
		}
	}
	

    
}