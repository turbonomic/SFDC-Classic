/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: When the Account Industry field changes, call @future method to set "Industry (clean-text)" flield.
	The future method is used so that it runs after workflow rules are complete.
*/
trigger AccountIndustryUpdate on Account (after insert, after update) {
/*	
	Set<Id> acctIds = new Set<Id>();
	for (Account acct: trigger.new) {
		if (acct.Industry_clean_text__c != acct.Industry_clean__c) {
			system.debug('@@@AccountIndustryUpdate.trigger: Industry mismatch!');
			system.debug('@@@AccountIndustryUpdate.trigger: Industry_clean__c = ' + acct.Industry_clean__c);
			system.debug('@@@AccountIndustryUpdate.trigger: Industry_clean_text__c = ' + acct.Industry_clean_text__c);
			acctIds.add(acct.id);
		}
	}
	
	if (acctIds.size() > 0 && VMTUtils.inBatch == false) {
		//call future method that runs after workflow rules are complete
		IndustrySetter.setIndustryOnAcct(acctIds);
	}
*/	
}