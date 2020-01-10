trigger TriggerCloseOpenLicensesOnInsert on Turbonomic_License__c (after insert) {
/*	
	Map<id,Turbonomic_License__c> allLicenses = new Map<id,Turbonomic_License__c>();
	List<String> emailList = new List<String>();
	
	for (Turbonomic_License__c tl : trigger.new) {
		if (tl.license_type__c == 'Eval' && tl.status__c == 'Open' ) {
			allLicenses.put(tl.id,tl);
			emailList.add(tl.licensee_email__c);
		}
	}
	
	if (allLicenses.size() > 0) {
		
		List<Turbonomic_License__c> updateLicenses = new List<Turbonomic_License__c>();
		Map<id,Turbonomic_License__c> allAssociatedLicenses = new Map<id,Turbonomic_License__c>([select id, licensee_email__c, status__c, license_type__c from Turbonomic_License__c where licensee_email__c in: emailList and license_type__c = 'Eval' and status__c = 'Open' and (NOT(id in: allLicenses.keySet()))]);
		
		if (allAssociatedLicenses.size() > 0) {
			system.debug('### found associated licenses');
			for (Turbonomic_License__c tl : allAssociatedLicenses.values()) {
				tl.status__c = 'Closed';
				updateLicenses.add(tl);
			}
			
			if (updateLicenses.size() > 0) update updateLicenses;
			
		}
		
	}
	
*/	
}