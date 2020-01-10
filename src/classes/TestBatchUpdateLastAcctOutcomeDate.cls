@isTest
private class TestBatchUpdateLastAcctOutcomeDate {
	//Batch Test
	static testMethod void myUnitTest() {
		
		List<Account> acctInsert = new List<Account>();
		List<Lead> ldInsert = new List<Lead>();
		List<Contact> conInsert = new List<Contact>();
		List<Task> tskInsert = new List<Task>();
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		
		//Create Accounts
        Account acct1 = new Account(Name = 'Acct1');
        acctInsert.add(acct1);
        Account acct2 = new Account(Name = 'Acct2', First_Evaluation_Meeting_Date__c = date.today().addDays(-2) , email_count__c = 10);
        acctInsert.add(acct2);
        Account acct3 = new Account(Name = 'Acct3', first_demo_date__c = date.today(), Rating = 'Revisit', Revisit_Date__c = date.today().addDays(-60), last_customer_touchpoint__c = Datetime.now().addDays(-150), customer_status__c = 'Yellow');
        acctInsert.add(acct3);
        Account acct4 = new Account(Name = 'Acct4', last_customer_touchpoint__c = Datetime.now().addDays(-150), Customer_Attention_Reason_NEW__c = 'Minimal product usage', customer_status__c = 'Yellow');
        acctInsert.add(acct4);
        insert acctInsert;

		//Create Contacts
		Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
		conInsert.add(con1);
		Contact con11 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, last_email_date__c = date.today().addDays(-1000));
		conInsert.add(con11);	// no dials
		
		Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct2.id);
		conInsert.add(con2);
		Contact con22 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct2.id, last_email_date__c = date.today());
		conInsert.add(con22);	// differing Connect Dates/number
		
		Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct3.id);
        conInsert.add(con3);
        Contact con33 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct3.id);
		conInsert.add(con33);	// differing Conversation Dates/number
		
		insert conInsert;
		
		
		//Create Leads
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = true);
        ldInsert.add(lead1);
        Lead lead4 = new Lead(Account__c = acct1.id, FirstName = 'Lead', lastName = 'Four', company = 'Acct1', leadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = false, last_email_date__c = date.today());
        ldInsert.add(lead4);	// no dials

        
        insert ldInsert;
		
		
		DateTime timeTask = DateTime.now();
		//create Tasks
		
		//attached to acct1
        Task tsk1 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome', executive_visit__c = true);
        tskInsert.add(tsk1);
        Task tsk6 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk6);
        Task tsk7 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk7);
        
        
        //attached to acct2
        Task tsk8 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk8);

        insert tskInsert;
        
        
        Test.StartTest();
		BatchUpdateLastAcctOutcomeDate n = new BatchUpdateLastAcctOutcomeDate();
		n.query = 'SELECT id, Demo_Count__c, First_Demo_Date__c, Latest_Demo_Date__c, Evaluation_Meeting_Count__c, First_Evaluation_Meeting_Date__c, Last_Evaluation_Meeting_Date__c, ' + 
            'Last_Activity_With_Outcome_Date__c, Rating, Revisit_Date__c, customer_status__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c, ' +
            'Name FROM Account WHERE id = \'' + 
            acct1.id + '\' OR id = \'' + acct2.id + '\' OR id = \'' + acct3.id + '\' OR id = \'' + acct4.id + '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
        
        List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Last_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Evaluation_Meeting_Count__c, Contact_Count__c, Lead_Count__c, Latest_Demo_Date__c, Dials_Before_First_Connect_Conv__c, 
         Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, customer_status__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c, 
         Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Rating, Revisit_Date__c, 
         Name from Account where (id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id)];
		
        for (Account acct : getAccts) {
        	if (acct.id == acct1.id) {
        		system.assertEquals(date.today().addDays(-1), acct.Last_Activity_With_Outcome_Date__c);
        	} else if (acct.id == acct2.id) {
        		system.assertEquals(date.today().addDays(-10), acct.Last_Activity_With_Outcome_Date__c);
        	} else if (acct.id == acct3.id) {
        		system.assertEquals(null, acct.Last_Activity_With_Outcome_Date__c);
        		system.assertEquals(acct.Customer_Attention_Reason_NEW__c,'No interaction in 4+ months');
        	} else if (acct.id == acct4.id) {
        		system.assertEquals(acct.Customer_Attention_Reason_NEW__c,'Minimal product usage');
        	}
        }
    }
	
	//Task Trigger Method Test
	static testMethod void myUnitTest2() {
		
		List<Account> acctInsert = new List<Account>();
		List<Lead> ldInsert = new List<Lead>();
		List<Contact> conInsert = new List<Contact>();
		List<Task> tskInsert = new List<Task>();
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		
		//Create Accounts
        Account acct1 = new Account(Name = 'Acct1');
        acctInsert.add(acct1);
        Account acct2 = new Account(Name = 'Acct2', First_Evaluation_Meeting_Date__c = date.today().addDays(-2) , email_count__c = 10);
        acctInsert.add(acct2);
        Account acct3 = new Account(Name = 'Acct3', first_demo_date__c = date.today(), Rating = 'Revisit', Revisit_Date__c = date.today().addDays(-60), last_customer_touchpoint__c = Datetime.now().addDays(-150), customer_status__c = 'Yellow');
        acctInsert.add(acct3);
        Account acct4 = new Account(Name = 'Acct4', last_customer_touchpoint__c = Datetime.now().addDays(-150), Customer_Attention_Reason_NEW__c = 'Minimal product usage', customer_status__c = 'Yellow');
        acctInsert.add(acct4);
        insert acctInsert;

		//Create Contacts
		Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
		conInsert.add(con1);
		Contact con11 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, last_email_date__c = date.today().addDays(-1000));
		conInsert.add(con11);	// no dials
		
		Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct2.id);
		conInsert.add(con2);
		Contact con22 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct2.id, last_email_date__c = date.today());
		conInsert.add(con22);	// differing Connect Dates/number
		
		Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct3.id);
        conInsert.add(con3);
        Contact con33 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct3.id);
		conInsert.add(con33);	// differing Conversation Dates/number
		
		insert conInsert;
		
		
		//Create Leads
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = true);
        ldInsert.add(lead1);
        Lead lead4 = new Lead(Account__c = acct1.id, FirstName = 'Lead', lastName = 'Four', company = 'Acct1', leadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = false, last_email_date__c = date.today());
        ldInsert.add(lead4);	// no dials

        
        insert ldInsert;
		
		
		DateTime timeTask = DateTime.now();
		//create Tasks
		
		//attached to acct1
        Task tsk1 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome', executive_visit__c = true);
        tskInsert.add(tsk1);
        Task tsk6 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk6);
        Task tsk7 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk7);
        
        
        //attached to acct2
        Task tsk8 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk8);
        
        //attached to acct3
		Task tsk9 = new Task(Status='Completed', Type = 'Call', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhoId=con3.id, Outcomes__c = 'outcome', Description = 'outcome');
		tskInsert.add(tsk9);
		
		//attached to lead4
		Task tsk10 = new Task(Status='Not Started', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-20), WhoId=lead4.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk10);

        insert tskInsert;
        
        Task tsk10update = [SELECT id, Status FROM Task WHERE id =: tsk10.id LIMIT 1];
        tsk10update.Status = 'Completed';
        update tsk10update;
        
        List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Last_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Evaluation_Meeting_Count__c, Contact_Count__c, Lead_Count__c, Latest_Demo_Date__c, Dials_Before_First_Connect_Conv__c, 
         Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, customer_status__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c, 
         Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Rating, Revisit_Date__c, 
         Name from Account where (id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id)];
		
        for (Account acct : getAccts) {
        	if (acct.id == acct1.id) {
        		system.assertEquals(date.today().addDays(-1), acct.Last_Activity_With_Outcome_Date__c);
        	} else if (acct.id == acct2.id) {
        		system.assertEquals(date.today().addDays(-10), acct.Last_Activity_With_Outcome_Date__c);
        	} else if (acct.id == acct3.id) {
        		system.assertEquals(Date.Today().addDays(-10), acct.Last_Activity_With_Outcome_Date__c);
        		system.assertEquals(acct.Customer_Attention_Reason_NEW__c,'No interaction in 4+ months');
        	} else if (acct.id == acct4.id) {
        		system.assertEquals(acct.Customer_Attention_Reason_NEW__c,'Minimal product usage');
        	}
        }
    }
}