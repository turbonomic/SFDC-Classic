/**

 */
@isTest //(seeAllData=true)
private class TestBatchUpdateTaskOthers {

    static testMethod void myUnitTest() {
        
//		FCRM.FCR_SupportAPI.DisableApplicationForContext();
		List<Account> acctInsert = new List<Account>();
		List<Lead> ldInsert = new List<Lead>();
		List<Contact> conInsert = new List<Contact>();
		List<Task> tskInsert = new List<Task>();
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		User salesUser = [select id, team__c from User where isActive = true and team_group_buckets__c = 'US Velocity' and UserRole.Name like '%Account Executive%' limit 1];
		
		//Create Accounts
        Account acct1 = new Account(Name = 'Acct1', Hypervisor_Vendor__c = 'Oracle VM', AE_Rep__c = salesUser.id);
        Account acct2 = new Account(Name = 'Acct2', First_Evaluation_Meeting_Date__c = date.today().addDays(-2) , email_count__c = 10, Hypervisor_Vendor__c = 'Hyper-V (Microsoft)', socket_count__c = 50, VM_Count__c = 200);
        Account acct3 = new Account(Name = 'Acct3', first_demo_date__c = date.today(), Rating = 'Revisit', Revisit_Date__c = date.today().addDays(-60), Last_Activity_With_Outcome_Date__c = date.today().addDays(-100),Most_Recent_EBC_Meeting__c = date.today(), Most_Recent_Roadmap_Meeting__c = date.today() );
        Account acct4 = new Account(Name = 'Acct4');
        
        acctInsert.add(acct1); acctInsert.add(acct2); acctInsert.add(acct3); acctInsert.add(acct4);
        insert acctInsert;

		Account afterAcct2 = [select id, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c from Account where id =: acct2.id limit 1];
		afterAcct2.Last_Socket_Count_update_Date__c = date.today().addDays(-10);
		afterAcct2.Last_VM_Count_Update_Date__c = date.today().addDays(-10);
		
		update afterAcct2;

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
		
		
		//Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct1.id, Hypervisors_Relevant_for_This_Opp__c = 'KVM (Redhat);OracleVM', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000, ownerId = salesUser.id);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct2.id, Demo_Count__c = 2, First_Demo_Date__c = date.today(), Last_Executive_Visit__c = date.today(), Hypervisors_Relevant_for_This_Opp__c = 'VMware', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Name = 'Opp3', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct3.id, Evaluation_Meeting_Count__c = 2, First_Evaluation_Meeting_Date__c = date.today(), Total_SE_Follow_Ups__c = 2, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000, First_On_Site_Meeting__c = Date.today().addDays(-5),Last_On_Site_Meeting__c = Date.Today().addDays(-2));
		oppInsert.add(opp3);
		
//		Opportunity opp4 = new Opportunity(Name = 'Opp4', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct4.id, Partner_Trainings_With_Portal_Admin__c = 0, Partner_Trainings_with_Tech_Engineering__c = 0, Partner_Trainings_with_Sales__c = 0);
//		oppInsert.add(opp4);
		Opportunity opp10 = new Opportunity(Name = 'Opp10', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct1.id, Hypervisors_Relevant_for_This_Opp__c = 'OracleVM;Heterogeneous', of_CPU_Sockets__c = 300, of_Virtual_Machines__c = 3000);
        oppInsert.add(opp10);
        
        /*Test opps for auto-unqualify
    	Opportunity opp5 = new Opportunity(Name = 'Opp5', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Stage_Change_Date__c = Date.today().addDays(-90));
        oppInsert.add(opp5);
        Opportunity opp6 = new Opportunity(Name = 'Opp6', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Stage_Change_Date__c = Date.today().addDays(-100));
        oppInsert.add(opp6);
        Opportunity opp7 = new Opportunity(Name = 'Opp7', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Stage_Change_Date__c = Date.today().addDays(-100), Exclude_from_Auto_Unqualify__c = true);
        oppInsert.add(opp7);
        Opportunity opp8 = new Opportunity(Name = 'Opp8', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Pipeline', AccountId = acct1.id, Stage_Change_Date__c = Date.today().addDays(-120));
        oppInsert.add(opp8);
        Opportunity opp9 = new Opportunity(Name = 'Opp9', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Stage_Change_Date__c = Date.today().addDays(-120),Type = 'Subscription Renewal');
        oppInsert.add(opp9);
        */
        
       	//System.debug('4. Amount of CPU time (in ms) used before Opp Insert MyUnitTest: ' + Limits.getCpuTime());
        insert oppInsert;
        //System.debug('4. Amount of CPU time (in ms) used after Opp Insert MyUnitTest: ' + Limits.getCpuTime());
        
		Map<id,Opportunity> updateOpps = new Map<id,Opportunity>([select id, CPU_Socket_Update_Date__c, VM_Update_Date__c from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp10.id]);
		for (Opportunity o: updateOpps.values()) {
			if (o.id == opp1.id || o.id == opp2.id || o.id == opp3.id) {
				o.CPU_Socket_Update_Date__c = date.today().addDays(-5);
        		o.VM_Update_Date__c = date.today().addDays(-5);
			} else {
				o.CPU_Socket_Update_Date__c = date.today().addDays(-3); 
				o.VM_Update_Date__c = date.today().addDays(-3);				
			}
		}
		
		update updateOpps.values();
		
		DateTime timeTask = DateTime.now();
		//create Tasks
		
		//attached to acct1
        Task tsk1 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', First_Demo__c = true, ActivityDate=Date.Today().addDays(-10), WhatId=opp1.id, Outcomes__c = 'outcome', Description = 'outcome', executive_visit__c = true, whoId = con1.id);
        Task tsk2 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp1.id, whoId = con1.id);
        Task tsk3 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp1.id, executive_visit__c = true, whoId = con1.id);
        
        Task tsk4 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject = 'Evaluation Meeting', ActivityDate=Date.today().addDays(-1), WhatId=opp1.id);
        Task tsk5 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject = 'Evaluation Meeting', ActivityDate=Date.today(), WhatId=opp1.id);
        
        Task tsk6 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        
        Task tsk7 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
        
        //attached to acct2
        Task tsk8 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhatId=opp2.id, Outcomes__c = 'outcome', Description = 'outcome');
        Task tsk9 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp2.id);
        Task tsk10 = new Task(Status='Completed', Type = 'Evaluation Meeting', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp2.id);
        
        //attached to acct3
        Task tsk11 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhatId=opp3.id, CPU_Sockets__c = 10, Virtual_Machines_VMs__c = 100);
        Task tsk12 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp3.id, CPU_Sockets__c = 20, Virtual_Machines_VMs__c = 150);
        Task tsk13 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp3.id, executive_visit__c = true);
        
        
/*        //attached to acct4
        Task tsk14 = new Task(Status ='Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Sales', WhatId=opp4.id);
        tskInsert.add(tsk14);
        Task tsk15 = new Task(Status = 'Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Portal Administration', WhatId=opp4.id);
        tskInsert.add(tsk15); 
        Task tsk16 = new Task(Status = 'Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Sales;Technical/Engineering', WhatId=opp4.id);
        tskInsert.add(tsk16);
        Task tsk17 = new Task(Status ='Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Sales', WhatId=opp4.id);
        tskInsert.add(tsk17);
        Task tsk18 = new Task(Status = 'Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Portal Administration', WhatId=opp4.id);
        tskInsert.add(tsk18); 
        Task tsk19 = new Task(Status = 'Completed', Type = 'Partner Training', ActivityDate=Date.Today(), Partner_Team_Present__c = 'Technical/Engineering', WhatId=opp4.id);
        tskInsert.add(tsk19); 
*/
        
        //Testing first discovery call date
        Task tsk20 = new Task(Status = 'Completed', Type = 'Discovery Call', Subject = 'Discovery Call', ActivityDate = Date.Today().addDays(-10), WhatId = opp3.id);
        Task tsk21 = new Task(Status = 'Completed', Type = 'Discovery Call', ActivityDate = Date.Today(), WhatId = opp3.id);
        Task tsk22 = new Task(Status = 'Completed', Type = 'Discovery Call', ActivityDate = Date.Today().addDays(-1), WhatId = opp2.id);
        
        Task tsk23 = new Task(Status = 'Completed', Type = 'SE Follow-up Conversation', Subject = 'Chat with X', WhatId = opp2.id, WhoId = con22.id, activityDate = date.today());
        Task tsk24 = new Task(Status = 'Completed', Type = 'SE Follow-up Email', Subject = 'Email follow-up', whatId = opp2.id, WhoId = con22.id, activityDate = date.today());
        
        
        //First and Last On-Site meeting testing
        Task tsk25 = new Task(Status = 'Completed', Type = 'On-Site Meeting', Subject = 'First On-Site for Opp 1', WhatId = opp1.id, activityDate = date.today().addDays(-1));
        Task tsk26 = new Task(Status = 'Completed', Type = 'On-Site Meeting', Subject = 'First On-Site for Opp 2', WhatId = opp2.id, activityDate = date.today().addDays(-3));
        Task tsk27 = new Task(Status = 'Completed', Type = 'On-Site Meeting', Subject = 'Middle On-Site for Opp 2', WhatId = opp2.id, activityDate = date.today().addDays(-2));
        Task tsk28 = new Task(Status = 'Completed', Type = 'On-Site Meeting', Subject = 'Last On-Site for Opp 2', WhatId = opp2.id, activityDate = date.today().addDays(-1));
        
        //Most Recent Customer EBC and Customer Roadmap Meetings
        Task tsk29 = new Task(Status = 'Completed', Type = 'Customer EBC', Subject = 'Customer EBC for Acct 1', WhatId = acct1.id, activityDate = date.today().addDays(-3));
        Task tsk30 = new Task(Status = 'Completed', Type = 'Customer EBC', Subject = 'Most Recent Customer EBC for Acct 2', WhatId = acct2.id, activityDate = date.today().addDays(-5));
        Task tsk31 = new Task(Status = 'Completed', Type = 'Customer EBC', Subject = 'First Customer EBC for Acct 2', WhatId = opp2.id, activityDate = date.today().addDays(-20));
        
        Task tsk32 = new Task(Status = 'Completed', Type = 'Customer Roadmap Meeting', Subject = 'Most Recent Customer RoadMap for Acct 1', WhatId = opp1.id, activityDate = date.today().addDays(-2));
        Task tsk33 = new Task(Status = 'Completed', Type = 'Customer Roadmap Meeting', Subject = 'First Customer Roadmap for Acct 1', WhatId = acct1.id, activityDate = date.today().addDays(-10));
        Task tsk34 = new Task(Status = 'Completed', Type = 'Customer Roadmap Meeting', Subject = 'Customer Roadmap for Acct 2', WhatId = acct2.id, activityDate = date.today().addDays(-1));

        tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3); tskInsert.add(tsk4); tskInsert.add(tsk5); tskInsert.add(tsk6); tskInsert.add(tsk7);
        tskInsert.add(tsk8); tskInsert.add(tsk9); tskInsert.add(tsk10);
        tskInsert.add(tsk11); tskInsert.add(tsk12); tskInsert.add(tsk13);
        tskInsert.add(tsk20); tskInsert.add(tsk21); tskInsert.add(tsk22); tskInsert.add(tsk23); tskInsert.add(tsk24);
        tskInsert.add(tsk25); tskInsert.add(tsk26); tskInsert.add(tsk27); tskInsert.add(tsk28);
        tskInsert.add(tsk29); tskInsert.add(tsk30); tskInsert.add(tsk31); tskInsert.add(tsk32); tskInsert.add(tsk33); tskInsert.add(tsk34);
        
        insert tskInsert;
        
        Test.StartTest();
		BatchUpdateTaskOthers n = new BatchUpdateTaskOthers();
		n.query = 'SELECT id, Demo_Count__c, First_Demo_Date__c, Latest_Demo_Date__c, Evaluation_Meeting_Count__c, First_Evaluation_Meeting_Date__c, Last_Evaluation_Meeting_Date__c, ' + 
            'Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Activity_With_Outcome_Date__c, Rating, Revisit_Date__c, ' +
            'Hypervisor_Vendor__c, Name, Socket_Count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, auto_bill__c, Status__c, Customer_LTV_Tier__c, Exclude_From_Auto_Bill__c, Most_Recent_EBC_Meeting__c, Most_Recent_Roadmap_Meeting__c FROM Account WHERE id = \'' + 
            acct1.id + '\' OR id = \'' + acct2.id + '\' OR id = \'' + acct3.id + '\' OR id = \'' + acct4.id + '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
        
        List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Last_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Evaluation_Meeting_Count__c, Contact_Count__c, Lead_Count__c, Latest_Demo_Date__c, Dials_Before_First_Connect_Conv__c, 
         Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, Email_Count__c, Leads_Dialed_in_Last_X_Days__c, Contacts_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, 
         Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Rating, Revisit_Date__c, Hypervisor_Vendor__c,
         Name, socket_count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, auto_bill__c, Most_Recent_EBC_Meeting__c, Most_Recent_Roadmap_Meeting__c from Account where (id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id)];
		List<Contact> getContacts = [select id, first_Demo_Date__c, demo_count__c,First_Demo_Scheduled_Date__c from Contact where (id =: con1.id or id =: con11.id or id =: con2.id or id =: con22.id or id =: con3.id or id =: con33.id)];
		List<Lead> getLeads = [select id, First_Dial_Date_Time__c, Last_Dial_Date__c, Dial_Count__c, Status, Status_Change_Date__c, Marked_Non_Responsive_No_Interest__c, Last_Connect_Date__c, Last_Conversation_Date__c, Last_Email_Date__c, Dial_Count_Since_Last_Status_Change__c from Lead where (id =: lead1.id or id =: lead4.id )];        
		List<Opportunity> getOpps = [select id, Hypervisors_Relevant_for_This_Opp__c, First_Demo_Date__c, First_Demo_Contact_Safe_Id__c, First_Evaluation_Meeting_Date__c, First_Discovery_Call_Date__c, Demo_Count__c, Evaluation_Meeting_Count__c, Last_Executive_Visit__c, 
				Total_SE_Follow_Ups__c, of_Virtual_Machines__c, of_CPU_Sockets__c, First_On_Site_Meeting__c, Last_On_Site_Meeting__c from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id];
        /*
        List<OpportunitySplit> oppSplits = [select id, Split_Owner_Team__c from OpportunitySplit where Opportunity.Name = 'Opp1'];
        
        for (OpportunitySplit os : oppSplits) {
        	system.assertEquals(os.split_owner_team__c,salesUser.team__c);
        }
        */
        for (Account acct : getAccts) {
        	if (acct.id == acct1.id) {
        		system.assertEquals(acct.Demo_Count__c,3);
        		system.assertEquals(acct.First_Demo_Date__c,date.today().addDays(-10));
        		system.assertEquals(acct.Latest_Demo_Date__c,date.today());
        		system.assertEquals(acct.Evaluation_Meeting_Count__c,2);
        		system.assertEquals(acct.First_Evaluation_Meeting_Date__c,date.today().addDays(-1));
        		system.assertEquals(acct.Last_Evaluation_Meeting_Date__c,date.today());
        		String str = acct.Hypervisor_Vendor__c;
        		system.assert(str.contains('OracleVM'));
        		system.assert(str.contains('KVM (Redhat)'));
        		system.assert(str.contains('Heterogeneous'));
        		system.assertEquals(acct.Socket_Count__c,300);
        		system.assertEquals(acct.VM_Count__c,3000);
        		system.assertEquals(acct.Most_Recent_EBC_Meeting__c,date.today().addDays(-3));
        		system.assertEquals(acct.Most_Recent_Roadmap_Meeting__c,date.today().addDays(-2));
        	} else if (acct.id == acct2.id) {
        		system.assertEquals(acct.Demo_Count__c,0);
        		system.assertEquals(acct.First_Demo_Date__c,null);
        		system.assertEquals(acct.Latest_Demo_Date__c,null);
        		system.assertEquals(acct.Evaluation_Meeting_Count__c,3);
        		system.assertEquals(acct.First_Evaluation_Meeting_Date__c,date.today().addDays(-10));
        		system.assertEquals(acct.Last_Evaluation_Meeting_Date__c,date.today());
        		String str = acct.Hypervisor_Vendor__c;
        		system.assert(str.contains('VMware'));
        		system.assert(str.contains('Hyper-V (Microsoft)'));
        		system.assert(!str.contains('OracleVM'));
        		system.assertEquals(acct.Socket_Count__c,100);
        		system.assertEquals(acct.VM_Count__c,1000);
        		system.assertEquals(acct.Most_Recent_EBC_Meeting__c,date.today().addDays(-5));
        		system.assertEquals(acct.Most_Recent_Roadmap_Meeting__c,date.today().addDays(-1));
        	} else if (acct.id == acct3.id) {
        		system.assertEquals(acct.Demo_Count__c,3);
        		system.assertEquals(acct.First_Demo_Date__c,date.today().addDays(-10));
        		system.assertEquals(acct.Latest_Demo_Date__c,date.today());
        		system.assertEquals(acct.Evaluation_Meeting_Count__c,0);
        		system.assertEquals(acct.First_Evaluation_Meeting_Date__c,null);
        		system.assertEquals(acct.Last_Evaluation_Meeting_Date__c,null);
        		system.assertEquals(acct.Rating,'Cold');
        		system.assertEquals(acct.Revisit_Date__c,null);
        		system.assertEquals(acct.Socket_Count__c,100);
        		system.assertEquals(acct.VM_Count__c,1000);
        		system.assertEquals(acct.Most_Recent_EBC_Meeting__c,null);
        		system.assertEquals(acct.Most_Recent_Roadmap_Meeting__c,null);
        	}
        	
        }
        
        for (Contact con : getContacts) {
        	if (con.id == con1.id) {
        		system.assertEquals(con.first_Demo_Date__c,date.today().addDays(-10));
        		system.assertEquals(con.demo_count__c,3);
        		system.assertEquals(con.First_Demo_Scheduled_Date__c,date.today());
        	} else if (con.id == con2.id) {
        		system.assert(con.first_Demo_Date__c == null);
        		system.assert(con.demo_count__c == 0);
        		system.assertEquals(con.First_Demo_Scheduled_Date__c,null);
        	}
        }
        
        for (Opportunity opp : getOpps) {
        	if (opp.id == opp1.id) {
        		system.assertEquals(opp.Demo_Count__c,3);
        		system.assertEquals(opp.First_Demo_Date__c,date.today().addDays(-10));
        		system.assertEquals(opp.Evaluation_Meeting_Count__c,2);
        		system.assertEquals(opp.First_Evaluation_Meeting_Date__c,date.today().addDays(-1));
        		system.assertEquals(opp.Last_Executive_Visit__c,date.today());
        		system.assertEquals(opp.First_Demo_Contact_Safe_Id__c,con1.id);
        		system.assertEquals(opp.First_On_Site_Meeting__c,date.Today().addDays(-1));
        		system.assertEquals(opp.Last_On_Site_Meeting__c,date.Today().addDays(-1));
        	} else if (opp.id == opp2.id) {
        		system.assertEquals(opp.Demo_Count__c,0);
        		system.assertEquals(opp.First_Demo_Date__c,null);
        		system.assertEquals(opp.Evaluation_Meeting_Count__c,3);
        		system.assertEquals(opp.First_Evaluation_Meeting_Date__c,date.today().addDays(-10));
        		system.assertEquals(opp.Last_Executive_Visit__c,null);
        		system.assertEquals(opp.First_Discovery_Call_Date__c, date.today().addDays(-1));
        		system.assertEquals(opp.Total_SE_Follow_Ups__c,2);
        		system.assertEquals(opp.First_On_Site_Meeting__c,date.Today().addDays(-3));
        		system.assertEquals(opp.Last_On_Site_Meeting__c,date.Today().addDays(-1));
        	} else if (opp.id == opp3.id) {
        		system.assertEquals(opp.Demo_Count__c,3);
        		system.assertEquals(opp.First_Demo_Date__c,date.today().addDays(-10));
        		system.assertEquals(opp.Evaluation_Meeting_Count__c,0);
        		system.assertEquals(opp.First_Evaluation_Meeting_Date__c,null);
        		system.assertEquals(opp.Last_Executive_Visit__c,date.today());
        		system.assertEquals(opp.First_Discovery_Call_Date__c,date.today().addDays(-10));
        		system.assertEquals(opp.Total_SE_Follow_Ups__c,0);
        		system.assertEquals(opp.First_On_Site_Meeting__c,null);
        		system.assertEquals(opp.Last_On_Site_Meeting__c,null);
        	} /*else if (opp.id == opp4.id) {
        		
        		system.assertEquals(6, opp.Partner_Total_Trainings_Performed__c);
        		system.assertEquals(3, opp.Partner_Trainings_with_Sales__c);
        		system.assertEquals(2, opp.Partner_Trainings_with_Portal_Admin__c);
        		system.assertEquals(2, opp.Partner_Trainings_with_Tech_Engineering__c);
        		
        	}  else if (opp.id == opp5.id) {
            	system.assertEquals('Identify', opp.StageName);
          	} else if (opp.id == opp6.id) {
            	system.assertEquals('Unqualified', opp.StageName);
          	} else if (opp.id == opp7.id) {
            	system.assertEquals('Identify', opp.StageName);
          	} else if (opp.id == opp8.id) {
            	system.assertEquals('Pipeline', opp.StageName);
          	} else if (opp.id == opp9.id) {
            	system.assertEquals('Identify', opp.StageName);
          	} 
          	*/
        }
        
    }
    
    static testMethod void myUnitTest2() {
    	
		List<Account> acctInsert = new List<Account>();
		List<Opportunity> oppInsert = new List<Opportunity>();
    	
    	//Accounts for auto-bill
        Account acct5 = new Account(Name = 'Acct5'); //No Maintenance Renewal
        Account acct6 = new Account(Name = 'Acct6'); //Renewal <6k
        Account acct7 = new Account(Name = 'Acct7'); //Renewal >6k
        Account acct8 = new Account(Name = 'Acct8'); //Multiple Renewals all <6k
        Account acct9 = new Account(Name = 'Acct9'); //Multiple Renewals one >6k
        Account acct10 = new Account(Name = 'Acct10'); //Closed Renewal in January
        Account acct11 = new Account(Name = 'Acct11', Customer_LTV_Tier__c = 'Tier 1 (1M+)'); //Tier 1 with 6k+ renewal
        Account acct12 = new Account(Name = 'Acct12', Customer_LTV_Tier__c = 'Tier 2 (500K+)'); //Tier 2 with <6k renewal
        Account acct13 = new Account(Name = 'Acct13', Customer_LTV_Tier__c = 'Tier 3 (100K+)'); //Tier 3 with 6k+ renewal
        Account acct14 = new Account(Name = 'Acct14', Customer_LTV_Tier__c = 'Tier 4 (50K+)'); //Tier 4 with <6k renewal
        Account acct15 = new Account(Name = 'Acct15', Customer_LTV_Tier__c = 'Tier 5 (<50K)'); //Tier 5 <6k renewal
        Account acct16 = new Account(Name = 'Acct16', Customer_LTV_Tier__c = 'Tier 5 (<50K)', Exclude_From_Auto_Bill__c = true); //Tier 5 with <6k renewal and exclusion flag
        Account acct17 = new Account(Name = 'Acct17'); //Non-Customer account with <6k renewal
        
        acctInsert.add(acct5); acctInsert.add(acct6); acctInsert.add(acct7); acctInsert.add(acct8); acctInsert.add(acct9); acctInsert.add(acct10); acctInsert.add(acct11); 
        acctInsert.add(acct12); acctInsert.add(acct13); acctInsert.add(acct14); acctInsert.add(acct15); acctInsert.add(acct16); acctInsert.add(acct17);
    	
    	insert acctInsert;
    
    	//Test Opps for Auto-bill
        //Closed Won opps for Accounts 6-18
        Opportunity opp11 = new Opportunity(Name = 'Opp11', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct5.id,Type = 'New', Amount = 50000);
        Opportunity opp12 = new Opportunity(Name = 'Opp12', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct6.id,Type = 'New', Amount = 50000);
        Opportunity opp13 = new Opportunity(Name = 'Opp13', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct7.id,Type = 'New', Amount = 50000);
        Opportunity opp14 = new Opportunity(Name = 'Opp14', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct8.id,Type = 'New', Amount = 50000);
        Opportunity opp15 = new Opportunity(Name = 'Opp15', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct9.id,Type = 'New', Amount = 50000);
        Opportunity opp16 = new Opportunity(Name = 'Opp16', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct10.id,Type = 'New', Amount = 50000);
        Opportunity opp17 = new Opportunity(Name = 'Opp17', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct11.id,Type = 'New', Amount = 50000);
        Opportunity opp18 = new Opportunity(Name = 'Opp18', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct12.id,Type = 'New', Amount = 50000);
        Opportunity opp19 = new Opportunity(Name = 'Opp19', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct13.id,Type = 'New', Amount = 50000);
        Opportunity opp20 = new Opportunity(Name = 'Opp20', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct14.id,Type = 'New', Amount = 50000);
        Opportunity opp21 = new Opportunity(Name = 'Opp21', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct15.id,Type = 'New', Amount = 50000);
        Opportunity opp22 = new Opportunity(Name = 'Opp22', CloseDate = Date.today().addDays(-30), StageName = 'Closed Won', AccountId = acct16.id,Type = 'New', Amount = 50000);
        
        oppInsert.add(opp11); oppInsert.add(opp12); oppInsert.add(opp13); oppInsert.add(opp14); oppInsert.add(opp15); oppInsert.add(opp16); 
        oppInsert.add(opp17); oppInsert.add(opp18); oppInsert.add(opp19); oppInsert.add(opp20); oppInsert.add(opp21); oppInsert.add(opp22);
        
        //Maintenance Renewals for Auto bill testing
        Opportunity opp23 = new Opportunity(Name = 'Opp23', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct6.id,Type = 'Maintenance Renewal', Amount = 5000, Undiscounted_Renewal_Amount__c = 5000);
        Opportunity opp24 = new Opportunity(Name = 'Opp24', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct7.id,Type = 'Maintenance Renewal', Amount = 20000, Undiscounted_Renewal_Amount__c = 20000);
        Opportunity opp25 = new Opportunity(Name = 'Opp25', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct8.id,Type = 'Maintenance Renewal', Amount = 5900, Undiscounted_Renewal_Amount__c = 5900);
        Opportunity opp26 = new Opportunity(Name = 'Opp26', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct8.id,Type = 'Maintenance Renewal', Amount = 3000, Undiscounted_Renewal_Amount__c = 3000);
        Opportunity opp27 = new Opportunity(Name = 'Opp27', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct9.id,Type = 'Maintenance Renewal', Amount = 10000, Undiscounted_Renewal_Amount__c = 10000);
        Opportunity opp28 = new Opportunity(Name = 'Opp28', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct9.id,Type = 'Maintenance Renewal', Amount = 2000, Undiscounted_Renewal_Amount__c = 2000);
        Opportunity opp29 = new Opportunity(Name = 'Opp29', CloseDate = Date.newInstance(Date.today().year(),1,1), StageName = 'Closed Won', AccountId = acct10.id,Type = 'Maintenance Renewal', Amount = 3500, Undiscounted_Renewal_Amount__c = 3500);
        Opportunity opp30 = new Opportunity(Name = 'Opp30', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct11.id,Type = 'Maintenance Renewal', Amount = 35000, Undiscounted_Renewal_Amount__c = 35000);
        Opportunity opp31 = new Opportunity(Name = 'Opp31', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct12.id,Type = 'Maintenance Renewal', Amount = 3700, Undiscounted_Renewal_Amount__c = 3700);
        Opportunity opp32 = new Opportunity(Name = 'Opp32', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct13.id,Type = 'Maintenance Renewal', Amount = 7500, Undiscounted_Renewal_Amount__c = 7500);
        Opportunity opp33 = new Opportunity(Name = 'Opp33', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct14.id,Type = 'Maintenance Renewal', Amount = 4500, Undiscounted_Renewal_Amount__c = 4500);
        Opportunity opp34 = new Opportunity(Name = 'Opp34', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct15.id,Type = 'Maintenance Renewal', Amount = 2500, Undiscounted_Renewal_Amount__c = 2500);
        Opportunity opp35 = new Opportunity(Name = 'Opp35', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct16.id,Type = 'Maintenance Renewal', Amount = 2000, Undiscounted_Renewal_Amount__c = 2000);
        Opportunity opp36 = new Opportunity(Name = 'Opp36', CloseDate = Date.today().addDays(-30), StageName = 'Renewal', AccountId = acct17.id,Type = 'Maintenance Renewal', Amount = 1000, Undiscounted_Renewal_Amount__c = 1000);
        
        oppInsert.add(opp23); oppInsert.add(opp24); oppInsert.add(opp25); oppInsert.add(opp26); oppInsert.add(opp27); oppInsert.add(opp28); oppInsert.add(opp29); 
        oppInsert.add(opp30); oppInsert.add(opp31); oppInsert.add(opp32); oppInsert.add(opp33); oppInsert.add(opp34); oppInsert.add(opp35); oppInsert.add(opp36);
        
        //System.debug('4. Amount of CPU time (in ms) used before Opp Insert MyUnitTest2: ' + Limits.getCpuTime());
        insert oppInsert;
        //System.debug('4. Amount of CPU time (in ms) used after Opp Insert MyUnitTest2: ' + Limits.getCpuTime());
        
        Test.StartTest();
		BatchUpdateTaskOthers n = new BatchUpdateTaskOthers();
		n.query = 'SELECT id, Demo_Count__c, First_Demo_Date__c, Latest_Demo_Date__c, Evaluation_Meeting_Count__c, First_Evaluation_Meeting_Date__c, Last_Evaluation_Meeting_Date__c, ' + 
            'Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Activity_With_Outcome_Date__c, Rating, Revisit_Date__c, ' +
            'Hypervisor_Vendor__c, Name, Socket_Count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, auto_bill__c, Status__c, Customer_LTV_Tier__c, Exclude_From_Auto_Bill__c, Most_Recent_EBC_Meeting__c, Most_Recent_Roadmap_Meeting__c FROM Account WHERE id = \'' + 
            acct5.id + '\' OR id = \'' + acct6.id + '\' OR id = \'' + acct7.id + '\' OR id = \'' + acct8.id + '\' OR id = \'' +  acct9.id + '\' OR id = \'' + acct10.id + '\' OR id = \'' + 
            acct11.id + '\' OR id = \'' + acct12.id + '\' OR id = \'' + acct13.id + '\' OR id = \'' + acct14.id + '\' OR id = \'' + acct15.id + '\' OR id = \'' + acct16.id + '\' OR id = \'' + acct17.id + '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
		
		List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Last_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Evaluation_Meeting_Count__c, Contact_Count__c, Lead_Count__c, Latest_Demo_Date__c, Dials_Before_First_Connect_Conv__c, 
         Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, Email_Count__c, Leads_Dialed_in_Last_X_Days__c, Contacts_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Emails_in_Last_30_Days__c, 
         Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Customer_Success_Touch_Date__c, Last_Activity_With_Outcome_Date__c, Last_Email_Date__c, Green_Circle_Registration_Date__c, Rating, Revisit_Date__c, Hypervisor_Vendor__c,
         Name, socket_count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, auto_bill__c from Account where (id =: acct5.id or id =: acct6.id or 
         id =: acct7.id or id =: acct8.id or id =: acct9.id or id =: acct10.id or id =: acct11.id or id =: acct12.id or id =: acct13.id or id =: acct14.id or id =: acct15.id or id =: acct16.id or id =: acct17.id)];
       
        for (Account acct : getAccts) {
        	if (acct.id == acct5.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct6.id) {
        		system.assertEquals(acct.auto_bill__c,true);
        	}
        	else if (acct.id == acct7.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct8.id) {
        		system.assertEquals(acct.auto_bill__c,true);
        	}
        	else if (acct.id == acct9.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct10.id) {
        		system.assertEquals(acct.auto_bill__c,true);
        	}
        	else if (acct.id == acct11.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct12.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct13.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct14.id) {
        		system.assertEquals(acct.auto_bill__c,true);
        	}
        	else if (acct.id == acct15.id) {
        		system.assertEquals(acct.auto_bill__c,true);
        	}
        	else if (acct.id == acct16.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        	else if (acct.id == acct17.id) {
        		system.assertEquals(acct.auto_bill__c,false);
        	}
        }
    }
    
    //Test Referall counts
    static testMethod void myUnitTest3() {
    	
    	List<Account> acctInsert = new List<Account>();
    	
    	Account acct1 = new Account(Name = 'Acct1');
    	Account acct2 = new Account(Name = 'Acct2');
    	
  		acctInsert.add(acct1); acctInsert.add(acct2);
  
        insert acctInsert;
        
        //Create Opportunities
        List<Opportunity> oppInsert = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct2.id, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct2.id, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        Opportunity opp3 = new Opportunity(Name = 'Opp3', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct2.id, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
		
		oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3);
		
		insert oppInsert;
		
		//Creat Contacts
		List<Contact> conInsert = new List<Contact>();
		
		Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id); //2 Completed, 1 Not Started, 1 Deleted
		Contact con2 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Referral_Count__c = 1); //Update Referral Count
		Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct1.id); //No Referrals
		Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct1.id, Referral_Count__c = 1); //Referral deleted
		Contact con5 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, Referral_Count__c = 2); //No Referrals
		
		conInsert.add(con1); conInsert.add(con2); conInsert.add(con3); conInsert.add(con4); conInsert.add(con5);
				
		insert conInsert;
		
		//Create Referral Tasks
		List<Task> tskInsert = new List<Task>();
		
		Task tsk1 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con1.id, WhatId = opp1.id, ActivityDate = date.today());
		Task tsk2 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con1.id, WhatId = opp2.id, ActivityDate = date.today());
		Task tsk3 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con1.id, WhatId = opp3.id, ActivityDate = date.today());
		Task tsk4 = new Task(Type = 'Referral', Status = 'Not Started', WhoId = con1.id, WhatId = opp1.id, ActivityDate = date.today());
		
		Task tsk5 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con2.id, WhatId = opp2.id, ActivityDate = date.today());
		Task tsk6 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con2.id, WhatId = opp2.id, ActivityDate = date.today());
		
		Task tsk7 = new Task(Type = 'Referral', Status = 'Completed', WhoId = con3.id, WhatId = opp2.id, ActivityDate = date.today());
		
		tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3); tskInsert.add(tsk4); tskInsert.add(tsk5);
		tskInsert.add(tsk6); tskInsert.add(tsk7);
		
		insert tskInsert;
		
		List<Task> deleteTasks = new List<Task>();
		deleteTasks.add(tsk3); deleteTasks.add(tsk7);
		
		delete deleteTasks;
		
		Test.StartTest();
		BatchUpdateTaskOthers n = new BatchUpdateTaskOthers();
		n.query = 'SELECT id, Demo_Count__c, First_Demo_Date__c, Latest_Demo_Date__c, Evaluation_Meeting_Count__c, First_Evaluation_Meeting_Date__c, Last_Evaluation_Meeting_Date__c, ' + 
            'Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Activity_With_Outcome_Date__c, Rating, Revisit_Date__c, ' +
            'Hypervisor_Vendor__c, Name, Socket_Count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, auto_bill__c, Status__c, Customer_LTV_Tier__c, Exclude_From_Auto_Bill__c, Most_Recent_EBC_Meeting__c, Most_Recent_Roadmap_Meeting__c FROM Account WHERE id = \'' + 
            acct1.id + '\' OR id = \'' + acct2.id +  '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
		
		List<Contact> conAsserts = new List<Contact>([SELECT id, Referral_Count__c FROM Contact WHERE id =: con1.id OR id =: con2.id OR id =: con3.id OR id =: con4.id]);
		
		for (Contact con: conAsserts) {
			if (con.id == con1.id) {
				System.assertEquals(con.Referral_Count__c,2);
			} else if (con.id == con2.id) {
				System.assertEquals(con.Referral_Count__c,2);
			} else if (con.id == con3.id) {
				System.assertEquals(con.Referral_Count__c,null);
			} else if (con.id == con4.id) {
				System.assertEquals(con.Referral_Count__c,0);
			} else if (con.id == con5.id) {
				System.assertEquals(con.Referral_Count__c,0);
			}
		}
    
    }
    
}