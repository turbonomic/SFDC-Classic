/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: tests BatchFillLastEngagementDate.cls and TaskSetLastEngagementDate.trigger
*/
@isTest
private class testLastEngagementDate {

    static testMethod void myUnitTest() {


      
    	//Create Account
        Account acct = new Account(Name = 'Acct1');
        insert acct;
        
        //Create Lead
        Lead ld = new Lead(Account__c = acct.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown');
        insert ld;
        
        //Create Contact
        Contact con = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct.id);
        insert con;
        
        List<Task> insertTasks = new List<Task>();
        
    	//Create Task under Lead
        Task tsk1 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-3), WhoId=ld.id);
        //insert tsk1;
         
        //check Last Engagement Date
        //system.assertEquals([select id, Last_Engagement_Date__c from Account where id =: acct.id].Last_Engagement_Date__c, Date.today().addDays(-3));
        //system.assertEquals([select id, Last_Engagement_Date__c from Lead where id =: ld.id].Last_Engagement_Date__c, Date.today().addDays(-3));
         
        //create Task under Contact
        Task tsk2 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-2), WhoId=con.id);
        //insert tsk2;
         
        //check Last Engagement Date
        //system.assertEquals([select id, Last_Engagement_Date__c from Account where id =: acct.id].Last_Engagement_Date__c, Date.today().addDays(-2));
        //system.assertEquals([select id, Last_Engagement_Date__c from Contact where id =: con.id].Last_Engagement_Date__c, Date.today().addDays(-2));
    
      	//create another Task under Contact
      	Task tsk3 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId=con.id);
        
        //create another Task under Lead
      	Task tsk4 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-2), WhoId=ld.id);
        
        insertTasks.add(tsk1); insertTasks.add(tsk2); insertTasks.add(tsk3); insertTasks.add(tsk4);
        
        insert insertTasks;
         
        //check Last Engagement Date
        system.assertEquals([select id, Last_Engagement_Date__c from Account where id =: acct.id].Last_Engagement_Date__c, Date.today().addDays(-1));
        system.assertEquals([select id, Last_Engagement_Date__c from Contact where id =: con.id].Last_Engagement_Date__c, Date.today().addDays(-1));
    
      	//delete Task
      	List<Task> deleteTasks = new List<Task>();
      	deleteTasks.add(tsk3); deleteTasks.add(tsk4);
      	
      	delete deleteTasks;
      
      	//check Last Engagement Date
        system.assertEquals([select id, Last_Engagement_Date__c from Account where id =: acct.id].Last_Engagement_Date__c, Date.today().addDays(-2));
        system.assertEquals([select id, Last_Engagement_Date__c from Contact where id =: con.id].Last_Engagement_Date__c, Date.today().addDays(-2));
    
      	//change Dates on Account, Lead, Contact
      	acct = [select id, Last_Engagement_Date__c from Account where id =: acct.id];
      	acct.Last_Engagement_Date__c = Date.today().addDAys(-10);
      	update acct;
      
      	ld = [select id, Last_Engagement_Date__c from Lead where id =: ld.id];
      	ld.Last_Engagement_Date__c = Date.today().addDAys(-10);
      	update ld;
      
      	con = [select id, Last_Engagement_Date__c from Contact where id =: con.id];
      	con.Last_Engagement_Date__c = Date.today().addDAys(-10);
      	update con;
      
        //envoke batchable class
        Test.StartTest();
      	BatchFillLastEngagementDate b = new BatchFillLastEngagementDate();
      	b.query = 'SELECT id, Last_Engagement_Date__c FROM Account WHERE id = \'' + acct.id + '\'';
       	ID batchprocessid = Database.executeBatch(b);
       	Test.StopTest();
       
       	//check Last Engagement Date
        system.assertEquals([select id, Last_Engagement_Date__c from Account where id =: acct.id].Last_Engagement_Date__c, Date.today().addDays(-2));
        system.assertEquals([select id, Last_Engagement_Date__c from Contact where id =: con.id].Last_Engagement_Date__c, Date.today().addDays(-2));
        system.assertEquals([select id, Last_Engagement_Date__c from Lead where id =: ld.id].Last_Engagement_Date__c, Date.today().addDays(-3));
   
    }
}