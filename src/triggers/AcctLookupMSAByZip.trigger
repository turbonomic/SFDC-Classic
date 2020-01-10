trigger AcctLookupMSAByZip on Account (before insert, before update) {
/*	
	Set<String> zipCodes = new Set<String>();
	Set<Account> accountSet = new Set<Account>();

	for(Account acct: trigger.new) {
		if(trigger.isInsert && acct.BillingPostalCode != '' && acct.BillingPostalCode != null) {
			zipCodes.add(acct.Billing_Zip_Cleaned__c);
			system.debug('Currently adding account ' + acct.name + ' to acct msa set for insert');
            accountSet.add(acct);
			system.debug('MSA Insert trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
		 } else if (trigger.isUpdate && (acct.MSA_Update_Flag__c == true) && (((acct.Metropolitan_Statistical_Area__c == null || acct.MSA_Number__c == null) && acct.BillingPostalCode != null) || (trigger.oldMap.get(acct.id).BillingPostalCode != acct.BillingPostalCode))) {
			zipCodes.add(acct.Billing_Zip_Cleaned__c);
			system.debug('Currently adding account ' + acct.name + ' to acct msa set for update');
            accountSet.add(acct);
			system.debug('MSA Update trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
		} 
	}
    
	if (zipCodes.size() > 0) {
		
		//Problem is here
		List<Account_MSA__c> msaList = [SELECT Zip_Code__c, Metropolitan_Statistical_Area__c, MSA_Number__c FROM Account_MSA__c WHERE Zip_Code__c in: zipCodes];
		System.debug('******************The MSA List size is ' + msaList.size());
		
		
		Map<String, Account_MSA__c> msaMap = new Map<String, Account_MSA__c>();  //map to store MSA record with zip code string
		
		//populate the map
		for (Account_MSA__c msa: msaList) {
			msaMap.put(msa.Zip_Code__c, msa);
		}
		
		system.debug('The account map is of size ' + accountSet.size());
		for (Account acct: accountSet) {
			system.debug('Currently checking account msa for ' + acct.name);
			if(msaMap.containsKey(acct.Billing_Zip_Cleaned__c) && acct.BillingCountry == 'United States') {
				System.debug('Setting account MSA to ' + msaMap.get(acct.Billing_Zip_Cleaned__c).Metropolitan_Statistical_Area__c);
				System.debug('Setting account MSA # to ' + msaMap.get(acct.Billing_Zip_Cleaned__c).MSA_Number__c);
                acct.Metropolitan_Statistical_Area__c = msaMap.get(acct.Billing_Zip_Cleaned__c).Metropolitan_Statistical_Area__c;
                acct.MSA_Number__c = msaMap.get(acct.Billing_Zip_Cleaned__c).MSA_Number__c;
                //acct.Update_MSA__c = false;
            } else {
            	System.debug('Clearing account MSA for ' + acct.name);
            	if (acct.Metropolitan_Statistical_Area__c != null) acct.Metropolitan_Statistical_Area__c = null;
            	if (acct.MSA_Number__c != null) acct.MSA_Number__c = null;
            	//acct.Update_MSA__c = false;
            	
            }
				
		} 
	}

*/
}