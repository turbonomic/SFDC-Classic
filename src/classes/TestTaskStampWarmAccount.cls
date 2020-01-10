/**
 * Test Class for TaskStampWarmAccount Method on the Task Method
 */
@isTest
private class TestTaskStampWarmAccount {

    static testMethod void myUnitTest() {
        List<Account> acctInsert = new List<Account>();
        
        Account acct1 = new Account(name = 'Acct 1', Last_Marketing_Interaction__c  = System.now().addDays(-2)); //warm account
        Account acct2 = new Account(name = 'Acct 2', Last_Marketing_Interaction__c  = System.now().addDays(-120)); //Non-warm account
        
        acctInsert.add(acct1); acctInsert.add(acct2);
        
        List<Account> acctQuery = new List<Account>([SELECT id, Warm_Account__c FROM Account WHERE id =: acct1.id or id =: acct2.id]);
        
        //Assert Account is designated properly with respect to warm account
        for (Account a: acctQuery) {
        	if (a.id == acct1.id) { System.assertEquals(a.Warm_Account__c, true); }
        	else if (a.id == acct2.id) { System.assertEquals(a.Warm_Account__c, false); }
        }
        
        insert acctInsert;
        
        List<Contact> conInsert = new List<Contact>();
        
        Contact con1 = new Contact(firstName = 'Con', LastName = 'One', AccountId = acct1.id, leadSource = 'Prospecting - DiscoverOrg');
        Contact con2 = new Contact(firstName = 'Con', LastName = 'Two', AccountId = acct2.id, leadSource = 'Prospecting - DiscoverOrg');
        
        conInsert.add(con1); conInsert.add(con2);
        
        insert conInsert;
        
        List<Lead> leadInsert = new List<Lead>();
        
        Lead ld1 = new Lead(firstName = 'Lead', LastName = 'One', Account__c = acct1.id, Company = 'Acct 1', leadSource = 'Prospecting - DiscoverOrg');
        Lead ld2 = new Lead(firstName = 'Lead', LastName = 'Two', Account__c = acct2.id, Company = 'Acct 2', leadSource = 'Prospecting - DiscoverOrg');
        
        leadInsert.add(ld1); leadInsert.add(ld2);
        
        insert leadInsert;
        
        List<Task> tskInsert = new List<Task>();
        
        Task tsk1 = new Task(Status = 'Completed', Type = 'Demo', Subject ='Demo', First_Demo__c = true, ActivityDate=Date.Today(), whoId = con1.id);
        Task tsk2 = new Task(Status = 'Completed', Type = 'Call', Call_Disposition__c = 'Connect', Subject = 'Call', ActivityDate = Date.Today(), whoId = con2.id);
        Task tsk3 = new Task(Status = 'Not Started', Type = 'Call', Call_Disposition__c = 'Conversation', Subject = 'Call', ActivityDate = Date.Today(), whoId = ld1.id);
        Task tsk4 = new Task(Status = 'Completed', Type = 'Email', Subject = 'Call', ActivityDate = Date.Today(), whoId = ld2.id);
        
        tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3); tskInsert.add(tsk4);
        
        insert tskInsert;
        
        List<Task> taskQuery = new List<Task>([SELECT id, Warm_Account_Stamp__c FROM Task WHERE id =: tsk1.id or id =: tsk2.id or id =: tsk3.id or id =: tsk4.id]);
        
        for (Task t: TaskQuery) {
        	if (t.id == tsk1.id) {
        		System.assertEquals(t.Warm_Account_Stamp__c,true);
        	}
        	else if (t.id == tsk2.id) {
        		System.assertEquals(t.Warm_Account_Stamp__c,false);
        	}
        	else if (t.id == tsk3.id) {
        		System.assertEquals(t.Warm_Account_Stamp__c,true);
        	}
        	else if (t.id == tsk4.id) {
        		System.assertEquals(t.Warm_Account_Stamp__c,false);
        	}
        }
        
    }
}