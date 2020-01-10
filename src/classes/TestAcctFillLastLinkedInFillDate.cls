@isTest
private class TestAcctFillLastLinkedInFillDate {
	
	static testMethod void myUnitTest() {
		
		Account acct1 = new Account(name = 'Acct 1', VMware_Hits__c = 2);
		insert acct1;
		
		Account afterAcct1 = [select id, name, Last_LinkedIn_Update_Date_Time__c from Account where id =: acct1.id];
		
		system.debug('Check 1 ' + afterAcct1.Last_LinkedIn_Update_Date_Time__c);
		DateTime originalModDate = afterAcct1.Last_LinkedIn_Update_Date_Time__c;
		
		Account acct2 = new Account(name = 'Acct 2', Last_LinkedIn_Update_Date_Time__c = date.today().addDays(-2));
		insert acct2;
		
		acct2.VMware_Hits__c = 2;
		update acct2;
		
		Account afterAcct2 = [select name, Last_LinkedIn_Update_Date_Time__c from Account where id =: acct2.id];
		
		system.debug('Check 2 ' + afterAcct2.Last_LinkedIn_Update_Date_Time__c);
		system.assert(afterAcct2.Last_LinkedIn_Update_Date_Time__c > date.today().addDays(-2));
		
		afterAcct1.VMware_Hits__c = 5;
		update afterAcct1;
		
		Account afterAcct3 = [select id, name, Last_LinkedIn_Update_Date_Time__c from Account where id =: afterAcct1.id];
		
		system.debug('Check 3 ' + afterAcct3.Last_LinkedIn_Update_Date_Time__c);
		system.assert(afterAcct3.Last_LinkedIn_Update_Date_Time__c >= date.today().addDays(-1));
		DateTime originalModDate2 = afterAcct3.Last_LinkedIn_Update_Date_Time__c;

	}
	
	
}