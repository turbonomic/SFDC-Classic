trigger LicenseTrigger on Turbonomic_License__c (after insert, after update, before insert, before update) {
	
	List<Turbonomic_License__c> insertLicenses = new List<Turbonomic_License__c>();
	Map<id,Turbonomic_License__c> licenses = new Map<id,Turbonomic_License__c>();
	Map<id,Turbonomic_License__c> oldLicenses = new Map<id,Turbonomic_License__c>();
	
	for (Turbonomic_License__c tl : trigger.new) {
		
		if (trigger.isInsert) {
			insertLicenses.add(tl);
		} else if (trigger.isUpdate) {
			licenses.put(tl.id,tl);
			oldLicenses.put(tl.id,trigger.oldMap.get(tl.id));
		}
		
	}
	
	
	if (trigger.isBefore) {
		
		if (trigger.isInsert) {
			LicenseMethods.createManualLicenses(insertLicenses);
		} else if (trigger.isUpdate) {
			
		}
		
	} else if (trigger.isAfter) {
		
		if (trigger.isInsert) {
			LicenseMethods.CloseOtherOpenLicenses(insertLicenses);
		} else if (trigger.isUpdate) {
			
		}
		
	}
	
}