@istest(seealldata=FALSE) 
public with sharing class Universal_Test_Class {
	
	public static Account theAccount{
		get{
			if(theAccount == null) buildAccount();
			return theAccount; 
		}
		set;	
	}
	
	public static Opportunity theOpp1{
		get{
			if(theOpp1 == null) buildOpp1();
			return theOpp1;
		}
		set;
	}
	
	public static Opportunity theOpp2{
		get{
			if(theOpp2 == null) buildOpp2();
			return theOpp2;
		}
		set;
	}
		
	public static Contact theContact{
		get{
			if(theContact == null) buildContact();
			return theContact;
		}
		set;
	}
	
	public static Task theTask{
		get{
			if(theTask == null) buildTask();
			return theTask;
		}
		set;
	}
	
	public static Task theDemoTask1{
		get{
			if(theDemoTask1 == null) buildDemoTask1();
			return theDemoTask1;
		}
		set;
	}
	
	public static Task theDemoTask2{
		get{
			if(theDemoTask2 == null) buildDemoTask2();
			return theDemoTask2;
		}
		set;
	}
	
	public static Opp_Unqualification_Settings__c theSetting{
		get{
			if(theSetting == null) buildSettings();
			return theSetting;
		}
		set;
	}
	
	private static void buildAccount(){
		lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
		
		theAccount = new Account();
		theAccount.Name = 'Test Account';
		insert theAccount;
	}
	
	private static void buildOpp1(){
		theOpp1 = new Opportunity();
		theOpp1.Name = 'Test Opp 1'; 
		theOpp1.StageName = 'Identify';
		theOpp1.CloseDate = Date.today();
		theOpp1.Stage_Change_Date__c = Date.Today().addDays(-31);
		theOpp1.AccountId = theAccount.Id;
		insert theOpp1; 
	}
	
	private static void buildOpp2() {
		theOpp2 = new Opportunity();
		theOpp2.Name = 'Test Opp 2';
		theOpp2.StageName = 'Identify';
		theOpp2.CloseDate = Date.today();
		theOpp2.Stage_Change_Date__c = Date.Today().addDays(-49);
		theOpp2.Flagged_for_Unqualification__c = true;
		theOpp2.AccountId = theAccount.Id;
		insert theOpp2;
	}
	
	private static void buildContact(){
		theContact = new Contact();
		theContact.LastName = 'Joe';
		theContact.Email = '123@gmail.com';
		theContact.AccountId = theContact.id;
		insert theContact;
	}
	
	private static void buildTask(){
		theTask = new Task();
		theTask.Status = 'Completed';
		theTask.Type = 'Call';
		theTask.Subject = 'Call';
		theTask.ActivityDate = Date.today();
		theTask.WhoId = theContact.id;
		theTask.WhatId = theAccount.id;
		insert theTask;
	}
	
	private static void buildDemoTask1(){
		theDemoTask1 = new Task();
		theDemoTask1.Status = 'Completed';
		theDemoTask1.Type = 'Demo';
		theDemoTask1.Subject = 'Demo';
		theDemoTask1.ActivityDate = Date.today();
		theDemoTask1.WhatId = theOpp1.id;
		insert theDemoTask1;
	}
	
	private static void buildDemoTask2(){
		theDemoTask2 = new Task();
		theDemoTask2.Status = 'Completed';
		theDemoTask2.Type = 'Demo';
		theDemoTask2.Subject = 'Demo';
		theDemoTask2.ActivityDate = Date.today().addDays(-10);
		theDemoTask2.WhatId = theOpp1.id;
		insert theDemoTask2;
	}
	
	private static void buildSettings(){
		theSetting = new Opp_Unqualification_Settings__c();
		theSetting.Name = 'Default';
		theSetting.Set_to_Unqualified_Stage_Duration__c = 48;
		theSetting.Unqualification_Warning_Stage_Duration__c = 30;
		insert theSetting;
	}

/*	
	public static testMethod void testOppSchedClass(){
		Opp_Unqualification_Settings__c s = theSetting;
		Test.startTest();
		Opp_Scheduled_Class testClass1 = new Opp_Scheduled_Class();
		
		String jobId = System.schedule('testClass1', Opp_Scheduled_Class.CRON_EXP, new Opp_Scheduled_Class());

      //Get the information from the CronTrigger API object
		CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered,NextFireTime
         				  FROM CronTrigger WHERE id = :jobId];

      //Verify the expressions are the same
      	System.assertEquals(Opp_Scheduled_Class.CRON_EXP,ct.CronExpression);

      //Verify the job has not run
		System.assertEquals(0, ct.TimesTriggered);

      //Verify the next time the job will run
		System.assertEquals('2022-09-03 00:00:00',String.valueOf(ct.NextFireTime));
		
		Test.stopTest();
	}
	
	public static testMethod void testOppFlagReview(){
		
		Opp_Unqualification_Settings__c s = theSetting;
		Opportunity o = theOpp1;
		Contact c = theContact;
		
		Test.startTest();
		Opp_Flag_For_Review testClass2 = new Opp_Flag_For_Review();
		Database.executeBatch(testClass2);
		Test.stopTest();
	}
	
	public static testMethod void testOppSetUnqual(){
		Opp_Unqualification_Settings__c s = theSetting;
		Opportunity o = theOpp2;
		
		Test.startTest();
		Opp_Set_To_Unqualified testClass3 = new Opp_Set_To_Unqualified();
		Database.executeBatch(testClass3);
		Test.stopTest();
	} 
*/
	
	//This is the test method for the controller extension
	public static testMethod void testTaskDelOverride() {
        //use the PageReference class to instantiate a page
        PageReference pageRef = Page.TaskDeleteOverride;
        Test.setCurrentPage(pageRef);
        
        //add Task id to page parameters
        ApexPages.currentPage().getParameters().put('id', theTask.id);
        
        //instantiate controller
        ApexPages.StandardController controller = new ApexPages.StandardController(theTask);
        TaskDelete_ext tExt = new TaskDelete_ext(controller);
        tExt.checkDelete();
                            
    }
    
    //This is the test method for the BatchSetFirstDemo job
	public static testMethod void testBatchSetFirstDemo() {
		
		VMTUtils.inBatch = true; //prevent TaskSetFirstDemo.trigger from running

		Task tsk1 = theDemoTask1;
		Task tsk2 = theDemoTask2;
		
		Test.startTest();
		BatchSetFirstDemo.runBatchNow();
		Test.stopTest();
		
		tsk1 = [select id, First_Demo__c from Task where id =: tsk1.id];
		system.assertEquals(tsk1.First_Demo__c, false);
		
		tsk2 = [select id, First_Demo__c from Task where id =: tsk2.id];
		system.assertEquals(tsk2.First_Demo__c, true);		
                            
    }
    
    //This is the test method for TaskSetFirstDemo.trigger
	public static testMethod void testTaskSetFirstDemo() {
		
		Test.startTest();
		Task tsk1 = theDemoTask1;
		Task tsk2 = theDemoTask2;
		Test.stopTest();
		
		tsk1 = [select id, First_Demo__c from Task where id =: tsk1.id];
		system.assertEquals(tsk1.First_Demo__c, false);
		
		tsk2 = [select id, First_Demo__c from Task where id =: tsk2.id];
		system.assertEquals(tsk2.First_Demo__c, true);		
                            
    }

}