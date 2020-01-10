@isTest
private class TestBatchAssignFocusAccounts {

    static testMethod void myUnitTest() {
/*    	
    	lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
        
    	User user1 = [select id, name, location__c from User where full_name__c =: 'Jay Pyburn'];
        
        Integer socketCount = 1000;
        
//        Account acct1 = new Account(Name = 'Acct1', AE_Rep__c = user1.id, socket_count__c = 100000, status_change_date__c = null);
//        insert acct1;
//        Account acct2 = new Account(Name = 'Acct2', AE_Rep__c = user1.id, socket_count__c = 100000, Focus_Account__c = true, Focus_Account_Date_Stamp__c = Date.today(), status_change_date__c = null);
//        insert acct2;
        List<Account> acctList = new List<Account>();
        
        Account nonFocusAcct;
        
		for(Integer i=0; i<30; i++) {

			if (i < 10) {
				Account tempAcct = new Account(name = 'Acct' + i, AE_Rep__c = user1.id, socket_count__c = socketCount, status_change_date__c = null, focus_account__c = true, focus_account_date_stamp__c = date.today().addDays(-5));
				socketCount += 100;
				acctList.add(tempAcct);			
				nonFocusAcct = tempAcct;	
			} else {
				Account tempAcct = new Account(name = 'Acct' + i, AE_Rep__c = user1.id, socket_count__c = socketCount, status_change_date__c = null);
				socketCount += 100;
				acctList.add(tempAcct);			
			}
		}
		system.debug('$$$ acctList has ' + acctList.size() + ' accounts' );
		insert acctList;
		        
        Test.StartTest();
        BatchAssignFocusAccounts n = new BatchAssignFocusAccounts();
      	n.query = 'SELECT id, name, location__c FROM User WHERE id = \'' + user1.id + '\'';
      	ID batchprocessid = Database.executeBatch(n);
      	Test.StopTest();
        
        
		// test code for assigning focus accounts
//		Account getAcct1 = [select id, name, focus_account__c, focus_account_date_stamp__c, status_change_date__c, Include_in_Focus_Accounts__c from Account where id =: acct1.id limit 1];
//      system.debug(getAcct1.status_change_date__c);
//      system.assertEquals(getAcct1.focus_account__c,true);
//      system.assertEquals(getAcct1.focus_account_date_stamp__c,date.today());

		List<Account> acctList2 = [select id, name, focus_account__c, focus_account_date_stamp__c, status_change_date__c from Account where (focus_account__c = true and AE_Rep__c = :user1.id 
					and (Status__c =: 'No Traction' or Status__c =: 'Dial in Last 45 Days' or Status__c =: 'Connect in Last 45 Days' or Status__c =: 'Conversation in Last 45 Days'
					or Status__c =: 'Needs Sourcing' or Status__c =: 'Opportunity Unqualified' or Status__c =: 'Opportunity Lost')) order by VMT_Account_Score__c desc nulls last];
        system.assertEquals(acctList2.size(),15);
        Account nonFocusAcct2 = [select id, name, focus_account__c from Account where id =: nonFocusAcct.id];
        system.assertEquals(nonFocusAcct2.Focus_Account__c,false);
        
*/		
    }
}