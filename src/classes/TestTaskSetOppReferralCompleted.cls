/**
 * Test Class for TaskMethods.TaskSetOppReferralCompleted.cls and TaskFutureMethods.setOppReferralMet.cls
 * 
 * Case 1: Insert Referral Task
 * Case 2: Update Referral Task
 */
@isTest
private class TestTaskSetOppReferralCompleted {

    static testMethod void myUnitTest() {
    	List<Account> insertAccts = new List<Account>();
    	Account acct1 = new Account(name = 'acct1');
    	Account acct2 = new Account(name = 'acct2');
    	
    	insertAccts.add(acct1); insertAccts.add(acct2);
    	
    	insert insertAccts;
    	
    	List<Opportunity> insertOpps = new List<Opportunity>();
    	Opportunity opp1 = new Opportunity(name = 'Test Opp1', accountId = acct1.id, amount = 1000, closeDate = date.today().addDays(20), type = 'New', stageName = 'Identify');
    	Opportunity opp2 = new Opportunity(name = 'Test Opp2', accountId = acct1.id, amount = 1000, closeDate = date.today().addDays(20), type = 'New', stageName = 'Identify');
    	
    	insertOpps.add(opp1); insertOpps.add(opp2);
    	
    	insert insertOpps;
    	
    	List<Contact> conInsert = new List<Contact>();
    	
    	Contact con1 = new Contact(firstName = 'Con', lastName = 'One', accountId = acct2.id);
    	Contact con2 = new Contact(firstName = 'Con', lastName = 'Two', accountId = acct2.id);
    	
    	conInsert.add(con1); conInsert.add(con2);
    	
    	insert conInsert;
    	
    	Test.startTest();
    	List<Task> tskInsert = new List<Task>();
    	Task tsk1 = new Task(type = 'Referral', status = 'Completed', ActivityDate = date.today(), WhatId = opp1.id, WhoId = con1.id);
    	Task tsk2 = new Task(type = 'Referral', status = 'Not Started', ActivityDate = date.today(), WhatId = opp2.id, WhoId = con2.id);
    	
    	tskInsert.add(tsk1); tskInsert.add(tsk2);
    	
    	insert tskInsert;
    	
    	Task updatedTsk2 = [SELECT id, status FROM Task WHERE id =: tsk2.id LIMIT 1];
    	updatedTsk2.status = 'Completed';
    	
    	update updatedTsk2;
    	
    	Test.stopTest();
    	
    	List<Opportunity> oppQuery = new List<Opportunity>([SELECT id, Customer_Referral_Completed__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id]);
    	
    	for (Opportunity opp: oppQuery) {
    		if (opp.id == opp1.id) {
    			system.assertEquals(opp.Customer_Referral_Completed__c,true);
    		} else if (opp.id == opp2.id) {
    			system.assertEquals(opp.Customer_Referral_Completed__c,true);
    		}
    		
    	}
        
    }
}