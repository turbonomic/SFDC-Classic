// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Description: This class tests TaskSetActivityTypeText.trigger
@isTest
private class testSetActivityTypeText {

    static testMethod void myUnitTest() {
    	Lead_Auto_Number__c lan = new Lead_Auto_Number__c(round_robin_number__c = 0);
        insert lan;    	
    	
        //Create Account
        Account acct1 = new Account(Name = 'Innitech');
        insert acct1;
        
        //Create Lead
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Bob', LastName = 'Jones', Company = 'Innitech', LeadSource = 'Unknown');
        insert lead1;
        
        //Create completed Task under Lead
        Task tsk1 = new Task(Status='Completed', Subject ='Call', Type = 'Call', ActivityDate=Date.Today().addDays(-10), WhoId=lead1.id);
        insert tsk1;
        
        //verify text field set
        tsk1 = [select id, Activity_Type_workflow__c from Task where id =: tsk1.id];
        system.assertEquals(tsk1.Activity_Type_workflow__c, 'Call');
    }
}