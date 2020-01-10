/**
 *
 * Test Class for the TaskSetFirstDemo.trigger and TaskFutureMethods.cls
 *
 *
 */
@isTest
private class TestSetFirstDemoScheduled {

    static testMethod void myUnitTest() {
    	
    	lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
        
        List<Account> insertAccts = new List<Account>();
        List<Opportunity> insertOpps = new List<Opportunity>();
        
        Account acct1 = new Account(name = 'Test Company');
        //insert acct1;
        
        Opportunity opp1 = new Opportunity(name = 'Test Opp', accountId = acct1.id, amount = 1000.00, closeDate = date.today().addDays(100), type = 'New', stageName = 'Identify');
        //insert opp1;
        
        Account acct2 = new Account(name = 'Test Company');
        //insert acct2;
        
        Opportunity opp2 = new Opportunity(name = 'Test Opp', accountId = acct1.id, amount = 1000.00, closeDate = date.today().addDays(100), type = 'New', stageName = 'Identify');
        //insert opp2;
        
        insertAccts.add(acct1); insertAccts.add(acct2);
        insertOpps.add(opp1); insertOpps.add(opp2);
        
        insert insertAccts;
        insert insertOpps;
        
        Test.startTest();
        
        List<Task> insertTasks = new List<Task>();
        
        Task tsk1 = new Task(activityDate=date.today(), subject = 'Task 1', whatId = opp1.id, type = 'Demo', createdDate = datetime.now().addSeconds(-10));
        //insert tsk1;
        
        //DateTime dt = datetime.now().addSeconds(2);
        
        //while (dt > datetime.now()){}
        
        Task tsk2 = new Task(activityDate=date.today().addDays(-12), subject = 'Task 2', whatId = opp1.id, type = 'Demo', status = 'Completed', createdDate = datetime.now().addSeconds(-8), First_Meeting_Scheduled__c = true);
        //insert tsk2;
        
        //dt = datetime.now().addSeconds(2);
        
        //while (dt > datetime.now()){}	

        
        Task tsk3 = new Task(activityDate=date.today().addDays(-10), subject = 'Task 3', whatId = opp1.id, type = 'Demo', status = 'Completed', first_demo_scheduled__c = true, first_meeting__c = true, createdDate = datetime.now().addSeconds(-6));
        //insert tsk3;
        
        //dt = datetime.now().addSeconds(2);
        
        //while (dt > datetime.now()){}
        
        Task tsk4 = new Task(activityDate=date.today(), subject = 'Task 4', whatId = opp2.id, type = 'Demo', createdDate = datetime.now().addSeconds(-4));
        //insert tsk4;
        
        //dt = datetime.now().addSeconds(2);
        
        //while (dt > datetime.now()){}
        
        Task tsk5 = new Task(activityDate=date.today().addDays(-5), subject = 'Task 5', whatId = opp2.id, type = 'Discovery Call', status = 'Completed', createdDate = datetime.now().addSeconds(-2));
        //insert tsk5;
        
        //dt = datetime.now().addSeconds(2);
        
        //while (dt > datetime.now()){}
        
        Task tsk6 = new Task(activityDate=date.today().addDays(-11), subject = 'Task 6', whatId = opp1.id, type = 'On-Site Meeting', status = 'Completed', createdDate = datetime.now());
        //insert tsk6;
        
        insertTasks.add(tsk1); insertTasks.add(tsk2); insertTasks.add(tsk3); insertTasks.add(tsk4); insertTasks.add(tsk5); insertTasks.add(tsk6);
        
        insert insertTasks;
        
        delete tsk2;
        
        Test.stopTest();
        
        List<Task> afterTskList = new List<Task>([select id, subject, first_demo_scheduled__c, first_demo__c, first_meeting__c, First_Meeting_Scheduled__c from Task where id =: tsk1.id or id =: tsk3.id or id =: tsk4.id or id =: tsk5.id or id =: tsk6.id ]);
        
        
        for (Task tsk: afterTskList) {
        	if (tsk.id == tsk1.id) {
        		system.assertEquals(tsk.first_demo_scheduled__c, true);
        		system.assertEquals(tsk.first_demo__c,false);
        		system.assertEquals(tsk.first_meeting__c,false);
        		system.assertEquals(tsk.First_Meeting_Scheduled__c,true);
        	}
        	if (tsk.id == tsk3.id) {
        		system.assertEquals(tsk.first_demo_scheduled__c, false);
        		system.assertEquals(tsk.first_demo__c, true);
        		system.assertEquals(tsk.first_meeting__c,false);
        		system.assertEquals(tsk.First_Meeting_Scheduled__c,false);
        	}
        	if (tsk.id == tsk4.id) {
        		system.assertEquals(tsk.first_demo_scheduled__c,true);
        		system.assertEquals(tsk.first_demo__c, false);
        		system.assertEquals(tsk.first_meeting__c,false);
        		system.assertEquals(tsk.First_Meeting_Scheduled__c,true);
        	}
        	if (tsk.id == tsk5.id) {
        		system.assertEquals(tsk.first_demo_scheduled__c, false);
        		system.assertEquals(tsk.first_demo__c,false);
        		system.assertEquals(tsk.first_meeting__c,true);
        		system.assertEquals(tsk.First_Meeting_Scheduled__c,false);
        	}
        	if (tsk.id == tsk6.id) {
        		system.assertEquals(tsk.first_demo_scheduled__c, false);
        		system.assertEquals(tsk.first_demo__c,false);
        		system.assertEquals(tsk.first_meeting__c,true);
        		system.assertEquals(tsk.First_Meeting_Scheduled__c,false);
        	}	
        }
    }
}