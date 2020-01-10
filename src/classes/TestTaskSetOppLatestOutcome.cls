/**
 * Test Class for TaskSetLatestOutcome on the Task Methods Class
 *		Case 1: Opp with outdated Most recent change
 *		Case 2: Opp with null Most Recent Change
 *		Case 3: Opp with blank Most Recent Change
 *		Case 4: Opp with more recent change than Task
 *		Case 5: Task Updated to Complete
 *		Case 6: Task updated to complete with comments >255 characters
 */
@isTest
private class TestTaskSetOppLatestOutcome {

    static testMethod void myUnitTest() {
        List<Account> acctInsert = new List<Account>();
        
        Account acct1 = new Account(name = 'Acct 1');
        Account acct2 = new Account(name = 'Acct 2'); 
        
        acctInsert.add(acct1); //acctInsert.add(acct2);
        
        insert acctInsert;
        
        List<Opportunity> oppInsert = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity(name = 'Opp1', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id, Most_Recent_Outcome_Change__c = 'This is a test', Most_Recent_Outcome_Change_Modified__c = DateTime.now().addDays(-2));
        Opportunity opp2 = new Opportunity(name = 'Opp2', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id);
        Opportunity opp3 = new Opportunity(name = 'Opp3', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id, Most_Recent_Outcome_Change__c = '', Most_Recent_Outcome_Change_Modified__c = DateTime.now().addDays(-2));
        Opportunity opp4 = new Opportunity(name = 'Opp4', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id, Most_Recent_Outcome_Change__c = 'This is another test', Most_Recent_Outcome_Change_Modified__c = DateTime.now());
        Opportunity opp5 = new Opportunity(name = 'Opp5', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id, Most_Recent_Outcome_Change__c = 'This is a test', Most_Recent_Outcome_Change_Modified__c = DateTime.now().addDays(-10));
        Opportunity opp6 = new Opportunity(name = 'Opp6', StageName = 'Identify', CloseDate = date.today().addDays(30), AccountId = acct1.id, Most_Recent_Outcome_Change__c = 'This is a test', Most_Recent_Outcome_Change_Modified__c = DateTime.now().addDays(-10));
        
        oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5); oppInsert.add(opp6);
        
        insert oppInsert;
        
        List<Contact> conInsert = new List<Contact>();
        
        Contact con1 = new Contact(firstName = 'Con', LastName = 'One', AccountId = acct1.id, leadSource = 'Prospecting - DiscoverOrg');
        Contact con2 = new Contact(firstName = 'Con', LastName = 'Two', AccountId = acct2.id, leadSource = 'Prospecting - DiscoverOrg');
        Contact con3 = new Contact(firstName = 'Con', LastName = 'Three', AccountId = acct1.id, leadSource = 'Prospecting - DiscoverOrg');
        Contact con4 = new Contact(firstName = 'Con', LastName = 'Four', AccountId = acct2.id, leadSource = 'Prospecting - DiscoverOrg');
        
        conInsert.add(con1); //conInsert.add(con2); conInsert.add(con3); conInsert.add(con4);
        
        insert conInsert;
        
        
        List<Task> tskInsert = new List<Task>();
        
        Task tsk1 = new Task(Status = 'Completed', Type = 'Demo', Subject ='Demo', First_Demo__c = true, ActivityDate=Date.Today(), whatId = opp1.id, whoId = con1.id, Description = 'Inserting Task Comments for Opp1');
        Task tsk2 = new Task(Status = 'Completed', Type = 'Call', Call_Disposition__c = 'Connect', Subject = 'Call', ActivityDate = Date.Today().addDays(-1), whatId = opp2.id, whoId = con1.id, Description = 'Inserting Task Comments for Opp2');
        Task tsk3 = new Task(Status = 'Completed', Type = 'Call', Call_Disposition__c = 'Conversation', Subject = 'Call', ActivityDate = Date.Today().addDays(-1), whatId = opp3.id, whoId = con1.id, Description = 'Inserting Task Comments for Opp3');
        Task tsk4 = new Task(Status = 'Completed', Type = 'Call', Subject = 'Call', ActivityDate = Date.Today().addDays(-5), whatId = opp4.id, whoId = con1.id, Description = 'Inserting Task Comments for Opp4');
        Task tsk5 = new Task(Status = 'Not Started', Type = 'Call', Subject = 'Call', ActivityDate = Date.Today().addDays(-5), whatId = opp5.id, whoId = con1.id);
        Task tsk6 = new Task(Status = 'Not Started', Type = 'Call', Subject = 'Call', ActivityDate = Date.Today().addDays(-5), whatId = opp6.id, whoId = con1.id);
        
        tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3); tskInsert.add(tsk4); tskInsert.add(tsk5); tskInsert.add(tsk6);
        
        test.startTest();
        insert tskInsert;
        
        List<Task> tasksToUpdate = new List<Task>([SELECT id, Status, Description FROM Task WHERE id =: tsk5.id or id =: tsk6.id]);
        List<Task> updatedTasks = new List<Task>();
        
        String tsk5Comments;
        String tsk6Comments;
        String abbrTsk6Comments;
        for (Task tsk: tasksToUpdate) {
        	if (tsk.id == tsk5.id) {
        		tsk.Status = 'Completed';
        		tsk5Comments = 'Updating Tasks Comments for Opp5';
        		tsk.Description = tsk5Comments;
        		updatedTasks.add(tsk);
        	}
        	if (tsk.id == tsk6.id) {
        		tsk.Status = 'Completed';
        		tsk6Comments = 'This is a test to update the comments on Task six which will be stamped onto Opportunity six. The comments for Task six are also being used to test the abbreviate String method to ensure that we are only capturing the first 255 characters of the comments so that these comments fit within the confines of the Opportunity Most Recent Outcome Change character limits.';
        		tsk.Description = tsk6Comments;
        		abbrTsk6Comments = tsk6Comments.left(252) + '...';
        		updatedTasks.add(tsk);
        	}
        	
        }
        
        update updatedTasks;
        test.stopTest();
        
        List<Opportunity> oppQuery = new List<Opportunity>([SELECT id, Most_Recent_Outcome_Change__c, Most_Recent_Outcome_Change_Modified__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id ]);
        
        for (Opportunity opp: oppQuery) {
        	if (opp.id == opp1.id) {
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,tsk1.Description);
        		System.assertEquals(opp.Most_Recent_Outcome_Change_Modified__c.date(),date.today());
        	}
        	else if (opp.id == opp2.id) {
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,tsk2.Description);
        	}
        	else if (opp.id == opp3.id) {
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,tsk3.Description);
        	}
        	else if (opp.id == opp4.id) {
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,'This is another test');
        	}
        	else if (opp.id == opp5.id) {
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,tsk5Comments);
        	}
        	else if (opp.id == opp6.id) {
        		System.debug('***********************************Asserts being hit');
        		System.assertEquals(opp.Most_Recent_Outcome_Change__c,abbrTsk6Comments);
        	}
        }
        
    }
}