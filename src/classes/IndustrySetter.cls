/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: Class that holds asynchronous methods that set Industry text field on Account based
*  on formula field that relies on a workflow rule.
*/
public class IndustrySetter {
	
	@future
	public static void setIndustryOnAcct (Set<Id> acctIds) {
		List<Account> acctList = [select id, Industry_clean__c, Industry_clean_text__c from Account where id in: acctIds];
		List<Account> updateList = new List<Account>();
		
		for (Account acct: acctList) {
			if (acct.Industry_clean_text__c != acct.Industry_clean__c) {
				system.debug('@@@IndustrySetter.cls: Industry mismatch!');
				system.debug('@@@IndustrySetter.cls: Industry_clean__c = ' + acct.Industry_clean__c);
				system.debug('@@@IndustrySetter.cls: Industry_clean_text__c = ' + acct.Industry_clean_text__c);
				acct.Industry_clean_text__c = acct.Industry_clean__c;
				updateList.add(acct);
			}
		}
		
		if (updateList.size() > 0) update updateList;	
	}

}