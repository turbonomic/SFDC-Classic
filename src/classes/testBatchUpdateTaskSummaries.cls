// Created by: Eustac// Created by: Eustace Consulting [Developer: Jennifer Blair]
// Class: testBatchUpdateTaskSummaries.cls
// Tests: BatchUpdateTaskSummaries.cls
@isTest (SeeAllData=true)
private class testBatchUpdateTaskSummaries {

    static testMethod void myUnitTest() {
/*      
      List<Account> acctInsert = new List<Account>();
      List<Lead> ldInsert = new List<Lead>();
      List<Contact> conInsert = new List<Contact>();
      List<Task> tskInsert = new List<Task>();
      List<Opportunity> oppInsert = new List<Opportunity>();
      
        //Create Accounts
        Account acct1 = new Account(Name = 'Acct1');
        acctInsert.add(acct1);
        Account acct2 = new Account(Name = 'Acct2');
        acctInsert.add(acct2);
        Account acct3 = new Account(Name = 'Acct3');
        acctInsert.add(acct3);
        Account acct4 = new Account(Name = 'Acct4', Rating = 'Revisit', Revisit_Date__c = Date.today().addDays(-40), Unqualified_Revisit_Reason__c = 'Too Small');
        acctInsert.add(acct4);
        Account acct5 = new Account(Name = 'Acct5', Focus_Account__c = true, Rating = 'Defunct Account');
        acctInsert.add(acct5);
        Account acct6 = new Account(Name = 'Acct6', Focus_Account__c = true, Status_Change_Date__c = Date.today(), Rating = 'Cold');
        acctInsert.add(acct6);
        insert acctInsert;
        
        //Create Leads
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = true);
        ldInsert.add(lead1);
        Lead lead2 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Two', Company = 'Acct2', LeadSource = 'Unknown', Status = 'No Interest', Status_Change_Date__c = Date.today().addDays(-200), Was_Prospect__c = true);
        ldInsert.add(lead2);
        Lead lead3 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Three', Company = 'Acct3', LeadSource = 'Unknown', Status = 'Call Back 15 Days', Was_Prospect__c = true);
        ldInsert.add(lead3);
        Lead lead4 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Four', Company = 'Acct4', LeadSource = 'Unknown');
        ldInsert.add(lead4);
        insert ldInsert;
        
        //Create Contacts
        Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
        conInsert.add(con1);
        Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct2.id);
        conInsert.add(con2);
        Contact con11 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.Today().addDays(-5));
        conInsert.add(con11);
        Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct3.id);
        conInsert.add(con3);
        Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct4.id);
        conInsert.add(con4);
        insert conInsert;
        
        //Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today(), Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct1.id);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', CloseDate = Date.today(), Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct2.id);
        oppInsert.add(opp2);
        insert oppInsert;
        
        User csUsr = [select id from User where isActive = true and UserRole.Name like '%customer success%' limit 1];
        system.assert(csUsr!=null);
        
        DateTime timeTask = DateTime.now();
        
        //Create completed Tasks 
        Task tsk1 = new Task(Status='Completed', Type = 'Call', Subject ='Call', ActivityDate=Date.Today().addDays(-11), Call_Date_Time__c = timeTask.addDays(-11), WhoId=lead1.id, OwnerId=csUsr.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk1);
        Task tsk15 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Left Voicemail', ActivityDate=Date.Today().addDays(-10), Call_Date_Time__c = timeTask.addDays(-10), WhoId=lead1.id, OwnerId=csUsr.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk15);
        Task tsk19 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), WhoId=lead1.id);
        tskInsert.add(tsk19);
        Task tsk2 = new Task(Status='Completed', Type = 'Call', Call_Disposition__c = 'Connect', Subject ='Call', ActivityDate=Date.Today(), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk2);
        Task tsk16 = new Task(Status='Completed', Type = 'Call', Subject ='Connect', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk16);
        Task tsk3 = new Task(Status='Completed', Type = 'Call', Subject ='Call', ActivityDate=Date.Today().addDays(-5), WhoId=lead2.id, OwnerId=csUsr.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk3);
        Task tsk17 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Left Voicemail', ActivityDate=Date.Today(), WhoId=lead2.id, OwnerId=csUsr.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk17);
        Task tsk20 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today(), WhoId=lead2.id);
        tskInsert.add(tsk20);
        Task tsk4 = new Task(Status='Completed', Type = 'Call', Call_Disposition__c = 'Conversation', Subject ='Call', ActivityDate=Date.Today().addDays(-2), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk4);
        Task tsk18 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk18);
        Task tsk5 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhatId=opp1.id, Outcomes__c = 'outcome', Description = 'outcome', OwnerId=csUsr.id);
        tskInsert.add(tsk5);
        Task tsk6 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp1.id);
        tskInsert.add(tsk6);
        Task tsk14 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp1.id);
        tskInsert.add(tsk14);
        Task tsk7 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Evaluation Meeting', ActivityDate=Date.Today().addDays(-15), WhatId=opp2.id);
        tskInsert.add(tsk7);
        Task tsk8 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Evaluation Meeting', ActivityDate=Date.Today().addDays(-1), WhatId=opp2.id);
        tskInsert.add(tsk8);
        Task tsk9 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Evaluation Meeting', ActivityDate=Date.Today().addDays(-1), WhatId=opp2.id);
        tskInsert.add(tsk9);
        Task tsk10 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk10);
        Task tsk11 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk11);
        Task tsk12 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk12);
        Task tsk13 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk13);
        Task tsk21 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-16), WhoId=lead3.id);
        tskInsert.add(tsk21);
        Task tsk22 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), Callback_Date__c = Date.Today().addDays(5), WhoId = lead3.id);
        tskInsert.add(tsk22);
        Task tsk23 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), Callback_Date__c = Date.Today().addDays(5), WhoId = con3.id);
        tskInsert.add(tsk23);
        Task tsk24 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-5), Callback_Date__c = Date.Today().addDays(-3), WhoId = lead4.id);
        tskInsert.add(tsk24);
        Task tsk25 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-5), Callback_Date__c = Date.Today().addDays(-3), WhoId = con4.id);
        tskInsert.add(tsk25);
        insert tskInsert;
        

        
        //envoke batchable class
        Test.StartTest();
      BatchUpdateTaskSummaries n = new BatchUpdateTaskSummaries();
      n.query = 'SELECT id, Last_Dial_Date__c, Dial_Count__c, Contact_Count__c, Lead_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Evaluation_Meeting_Count__c, Last_Evaluation_Meeting_Date__c, Focus_Account__c, ' + 
            'Latest_Demo_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, First_Conversation_Date__c, Latest_Conversation_Date__c, Dials_Before_First_Connect_Conv__c, Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, ' +
            'Email_Count__c, Contacts_Dialed_in_Last_X_Days__c, Leads_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Opps_Identify__c, Opps_open_Pipe__c, Opps_Closed_Won__c, Status_Change_Date__c, ' + 
            'Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, First_Dial_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Name, Rating, Revisit_Date__c, Prospect_Suspect_Lead_Count__c FROM Account WHERE id = \'' + 
            acct1.id + '\' OR id = \'' + acct2.id + '\' OR id = \'' + acct3.id + '\' OR id = \'' + acct4.id + '\' OR id = \'' + acct5.id + '\' OR id = \'' + acct6.id + '\'';
       ID batchprocessid = Database.executeBatch(n);
       Test.StopTest();
       
       //verify results
       List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Last_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Evaluation_Meeting_Count__c, Contact_Count__c, Lead_Count__c, Latest_Demo_Date__c, Dials_Before_First_Connect_Conv__c, 
         Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, Email_Count__c, Leads_Dialed_in_Last_X_Days__c, Contacts_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, 
         Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Rating, Revisit_Date__c, Status_Change_Date__c,
         Name from Account where (id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id or id =: acct5.id or id =: acct6.id)];
       List<Contact> getContacts = [select id, Last_Dial_Date__c, Dial_Count__c, Last_Connect_Date__c, Last_Conversation_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Green_Circle_Member__c from Contact where (id =: con1.id or id =: con11.id or id =: con2.id or id =: con3.id or id =: con4.id)];
       List<Lead> getLeads = [select id, First_Dial_Date_Time__c, Last_Dial_Date__c, Dial_Count__c, Status, Status_Change_Date__c, Marked_Non_Responsive_No_Interest__c, Last_Connect_Date__c, Last_Conversation_Date__c, Last_Email_Date__c, Dial_Count_Since_Last_Status_Change__c from Lead where (id =: lead1.id or id =: lead2.id or id =: lead3.id or id =: lead4.id)];
       List<Opportunity> getOpps = [select id, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Evaluation_Meeting_Count__c from Opportunity where id =: opp1.id or id =: opp2.id];

/*
        
        for (Account acct: getAccts) {
          	if (acct.id == acct1.id) {
	          	system.assertEquals(acct.Contact_Count__c, 2);
	          	system.assertEquals(acct.Green_Circle_Registration_Date__c, Date.today());
	            system.assertEquals(acct.First_Demo_Date__c, Date.today().addDays(-10));
	            system.assertEquals(acct.Latest_Demo_Date__c, Date.today());
	            system.assertEquals(acct.Demo_Count__c, 3);
	            system.assertEquals(acct.First_Evaluation_Meeting_Date__c, null);
	            system.assertEquals(acct.Last_Evaluation_Meeting_Date__c, null);
	            system.assertEquals(acct.Evaluation_Meeting_Count__c, 0);
	            system.assertEquals(acct.Connect_Count__c, 3);
	            system.assertEquals(acct.First_Connect_Date__c, Date.today().addDays(-10));
	            system.assertEquals(acct.Latest_Connect_Date__c, Date.today());
	            system.assertEquals(acct.Conversation_Count__c, 0);
	            system.assertEquals(acct.First_Conversation_Date__c, null);
	            system.assertEquals(acct.Latest_Conversation_Date__c, null);
	            system.assertEquals(acct.Dials_Before_First_Connect_Conv__c, null);  
	            system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c, null);  
	            system.assertEquals(acct.Dials_Before_First_Demo__c, 1);
//	            system.assertEquals(acct.Last_Customer_Success_Touch_Date__c, Date.today().addDays(-10));
	            system.assertEquals(acct.Last_Dial_Date__c, Date.today());
  	        	system.assertEquals(acct.Dial_Count__c, 5);
  	        	system.assertEquals(acct.Lead_Count__c, 1);
  	        	system.assertEquals(acct.Email_Count__c, 2);
  	        	system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c, 1);
  	         	system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c, 1);
 	          	system.assertEquals(acct.Dials_in_Last_30_Days__c, 5);
 	          	system.assertEquals(acct.Dials_in_Last_60_Days__c, 5);
 	          	system.assertEquals(acct.Dials_in_Last_90_Days__c, 5);  
 	          	system.assertEquals(acct.Emails_in_Last_30_Days__c, 2);
 	          	system.assertEquals(acct.Emails_in_Last_60_Days__c, 2);
 	          	system.assertEquals(acct.Emails_in_Last_90_Days__c, 2);  
 	          	system.assertEquals(acct.Last_Email_Date__c, Date.today().addDays(-1));
 	          	system.assertEquals(acct.Last_Activity_With_Outcome_Date__c, Date.today());
	        } else if(acct.id == acct2.id){
	          	system.assertEquals(acct.Contact_Count__c, 1);
	          	system.assertEquals(acct.Green_Circle_Registration_Date__c,null);
	            system.assertEquals(acct.First_Demo_Date__c, null);
	            system.assertEquals(acct.Latest_Demo_Date__c, null);
	            system.assertEquals(acct.Demo_Count__c, 0);
	            system.assertEquals(acct.First_Evaluation_Meeting_Date__c, Date.today().addDays(-15));
	            system.assertEquals(acct.Last_Evaluation_Meeting_Date__c, Date.today().addDays(-1));
	            system.assertEquals(acct.Evaluation_Meeting_Count__c, 3);
	            system.assertEquals(acct.Connect_Count__c, 0);
	            system.assertEquals(acct.First_Connect_Date__c, null);
	            system.assertEquals(acct.Latest_Connect_Date__c, null);
	            system.assertEquals(acct.Conversation_Count__c, 3);
	            system.assertEquals(acct.First_Conversation_Date__c, Date.today().addDays(-2));
	            system.assertEquals(acct.Latest_Conversation_Date__c, Date.today());
	            system.assertEquals(acct.Dials_Before_First_Connect_Conv__c, 1);  
	            system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c, 0);  
	            system.assertEquals(acct.Dials_Before_First_Demo__c, null);
//	            system.assertEquals(acct.Last_Customer_Success_Touch_Date__c, Date.today());  
	            system.assertEquals(acct.Last_Dial_Date__c, Date.today());
    	      	system.assertEquals(acct.Dial_Count__c, 5);
    	      	system.assertEquals(acct.Lead_Count__c, 1);
    	      	system.assertEquals(acct.Email_Count__c, 2);
    	      	system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c, 1);
    	       	system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c, 1);
    	       	system.assertEquals(acct.Dials_in_Last_30_Days__c, 5);
    	       	system.assertEquals(acct.Dials_in_Last_60_Days__c, 5);
    	       	system.assertEquals(acct.Dials_in_Last_90_Days__c, 5);  
    	       	system.assertEquals(acct.Emails_in_Last_30_Days__c, 2);
    	       	system.assertEquals(acct.Emails_in_Last_60_Days__c, 2);
    	       	system.assertEquals(acct.Emails_in_Last_90_Days__c, 2);  
    	       	system.assertEquals(acct.Last_Email_Date__c, Date.today().addDays(-1));
    	       	system.assertEquals(acct.Last_Activity_With_Outcome_Date__c, Date.today());
          	} else if (acct.id == acct4.id){
          		system.assertEquals(acct.Rating,'Cold');
          		system.assertEquals(acct.Revisit_Date__c,null);
          	} else if (acct.id == acct5.id){
          		system.assertEquals(acct.Status_Change_Date__c,Date.today());
          	} else if (acct.id == acct6.id){
          		system.assertEquals(acct.Status_Change_Date__c,null);
          	}
          	
        }
        
        for (Contact con: getContacts) {
          if (con.id == con1.id) {
            system.assertEquals(con.Last_Dial_Date__c, Date.today());
            system.assertEquals(con.Dial_Count__c, 2);
            system.assertEquals(con.Last_Connect_Date__c, Date.today());
            system.assertEquals(con.Last_Conversation_Date__c, null);
            system.assertEquals(con.Last_Email_Date__c, Date.today().addDays(-1));
            system.assertEquals(con.Green_Circle_Registration_Date__c, Date.today());
          } 
          else if (con.id == con2.id) {
            system.assertEquals(con.Last_Dial_Date__c, Date.today().addDays(-1));
            system.assertEquals(con.Dial_Count__c, 2);
            system.assertEquals(con.Last_Connect_Date__c, null);
            system.assertEquals(con.Last_Conversation_Date__c, Date.today().addDays(-1));
            system.assertEquals(con.Last_Email_Date__c, Date.today().addDays(-1));
            system.assertEquals(con.Green_Circle_Registration_Date__c, null);
          }

        }
        
        for (Lead ld: getLeads) {
          if (ld.id == lead1.id) {
            system.assertEquals(ld.Last_Dial_Date__c, Date.today().addDays(-10));
            system.assertEquals(ld.Dial_Count__c, 3);
            system.assertEquals(ld.Status, 'Prospect');
            system.assertEquals(ld.Status_Change_Date__c, Date.today());
            system.assertEquals(ld.Marked_Non_Responsive_No_Interest__c, 'Yes');
            system.assertEquals(ld.Last_Connect_Date__c, Date.today().addDays(-10));
            system.assertEquals(ld.Last_Conversation_Date__c, null);
            system.assertEquals(ld.Last_Email_Date__c, Date.today().addDays(-2));
            system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c, 3);
          } else if (ld.id == lead2.id) {
            system.assertEquals(ld.Last_Dial_Date__c, Date.today());
            system.assertEquals(ld.Dial_Count__c, 3);
            system.assertEquals(ld.Status, 'Prospect');
            system.assertEquals(ld.Status_Change_Date__c, Date.today());
            system.assertEquals(ld.Marked_Non_Responsive_No_Interest__c, 'Yes');
            system.assertEquals(ld.Last_Connect_Date__c, null);
            system.assertEquals(ld.Last_Conversation_Date__c, Date.today());
            system.assertEquals(ld.Last_Email_Date__c, Date.today().addDays(-2));
          } else if (ld.id == lead3.id) {
            system.assertEquals(ld.Status, 'Call Back 15 Days');
            system.assertEquals(ld.Last_Dial_Date__c, Date.today().addDays(-1));
          }
          
        }
        
        for (Opportunity opp: getOpps) {
          if (opp.id == opp1.id) {
            system.assertEquals(opp.First_Demo_Date__c, Date.today().addDays(-10));
            system.assertEquals(opp.Demo_Count__c, 3);
            system.assertEquals(opp.First_Evaluation_Meeting_Date__c, null);
            system.assertEquals(opp.Evaluation_Meeting_Count__c, 0);
          } else {
            system.assertEquals(opp.First_Evaluation_Meeting_Date__c, Date.today().addDays(-15));
            system.assertEquals(opp.Evaluation_Meeting_Count__c, 3);
            system.assertEquals(opp.First_Demo_Date__c, null);
            system.assertEquals(opp.Demo_Count__c, 0);
          }
        }
	
*/
	
    }
}