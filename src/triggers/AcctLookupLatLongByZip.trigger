/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: When the billing zip code is entered in on an Account, lookup the latitude/longitude value from the 
*  Account Coordinates object. 
*/
trigger AcctLookupLatLongByZip on Account (before insert, before update) {
/*	
	Set<String> zipCodes = new Set<String>();
    Set<Id> acctIds = new Set<Id>();
	
	for(Account acct: trigger.new) {
		if(trigger.isInsert && acct.BillingPostalCode != '' && acct.BillingPostalCode != null) {
			zipCodes.add(acct.Billing_Zip_Cleaned__c);
            acctIds.add(acct.id);
			system.debug('Insert trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
		} else if (trigger.isUpdate && ((acct.Latitude_Longitude__c == null && acct.BillingPostalCode != null) || (trigger.oldMap.get(acct.id).BillingPostalCode != acct.BillingPostalCode))) {
			zipCodes.add(acct.Billing_Zip_Cleaned__c);
            acctIds.add(acct.id);
			system.debug('Update trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
		}
	}
	
	if (zipCodes.size() > 0) {
		
		List<Account_Coordinates__c> coordList = [select id, Latitude_Longitude__c, Zip_Code__c from Account_Coordinates__c where Zip_Code__c in: zipCodes];
		
		Map<String, Account_Coordinates__c> coordMap = new Map<String, Account_Coordinates__c>();  //map to store coordinate record with zip code string
		
		//populate the map
		for (Account_Coordinates__c coord: coordList) {
			coordMap.put(coord.Zip_Code__c, coord);
		}
		
		for(Account acct: trigger.new) {
            if (acctIds.contains(acct.id)){
                if(coordMap.containsKey(acct.Billing_Zip_Cleaned__c)) {
                    acct.Latitude_Longitude__c = coordMap.get(acct.Billing_Zip_Cleaned__c).Latitude_Longitude__c;
                } else {
                    acct.Latitude_Longitude__c = null;
                }
            }
		}
	}
*/
}