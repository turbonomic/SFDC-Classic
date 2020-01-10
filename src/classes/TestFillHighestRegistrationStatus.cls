@isTest
private class TestFillHighestRegistrationStatus {

    static testMethod void myUnitTest() {
        
        List<Opportunity> insertOpps = new List<Opportunity>();
        List<VartopiaDRS__Registration__c> insertVRs = new List<VartopiaDRS__Registration__c>();
        List<Contact> conInsert = new List<Contact>();
    	List<OpportunityContactRole> oppCRInsert = new List<OpportunityContactRole>();
    	List<Task> tskInsert = new List<Task>();
        
        Account acct = new Account(name = 'Some Company');
        insert acct;
        
        //Create Contacts
    	Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con1);
    	Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con2);
    	Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con3);
    	Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con4);
    	Contact con5 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con5);
    	
    	insert conInsert;
        
        Opportunity opp1 = new Opportunity(name = 'Test Opp1', amount = 100, stageName = 'Closed Won', closeDate = date.today(), type = 'New', accountId = acct.id, highest_vendor_status__c = 'Closed-Won');
        insertOpps.add(opp1);
        Opportunity opp2 = new Opportunity(name = 'Test Opp2', amount = 100, stageName = 'Commit', closeDate = date.today(), type = 'Upsell', accountId = acct.id, highest_vendor_status__c = 'Closed-Lost');
        insertOpps.add(opp2);
        Opportunity opp3 = new Opportunity(name = 'Test Opp3', amount = 100, stageName = 'Pipeline', closeDate = date.today().addDays(30), type = 'Upsell', accountId = acct.id, highest_vendor_status__c = 'Approved');
        insertOpps.add(opp3);
        Opportunity opp4 = new Opportunity(name = 'Test Opp4', amount = 100, stageName = 'Pipeline', closeDate = date.today().addDays(30), type = 'Upsell', accountId = acct.id, highest_vendor_status__c = 'Expired');
        insertOpps.add(opp4);
        Opportunity opp5 = new Opportunity(name = 'Test Opp5', amount = 100, stageName = 'Identify', closeDate = date.today().addDays(30), type = 'Upsell', accountId = acct.id, highest_vendor_status__c = 'Submitted');
        insertOpps.add(opp5);
        Opportunity opp6 = new Opportunity(name = 'Test Opp6', amount = 100, stageName = 'Identify', closeDate = date.today().addDays(30), type = 'Upsell', accountId = acct.id, highest_vendor_status__c = 'Returned');
        insertOpps.add(opp6);
        Opportunity opp7 = new Opportunity(name = 'Test Opp7', amount = 100, stageName = 'Identify', closeDate = date.today().addDays(30), type = 'Upsell', accountId = acct.id);
        insertOpps.add(opp7);
        
        insert insertOpps;
        
        //Create Opportunity Contact Roles
		OpportunityContactRole oppCR1 = new OpportunityContactRole(ContactId = con1.id, OpportunityId = opp1.id, Role = 'Manager', IsPrimary = true);
		oppCRInsert.add(oppCR1);
		OpportunityContactRole oppCR2 = new OpportunityContactRole(ContactId = con2.id, OpportunityId = opp1.id, Role = 'Decision Maker');
		oppCRInsert.add(oppCR2);
		OpportunityContactRole oppCR3 = new OpportunityContactRole(ContactId = con3.id, OpportunityId = opp1.id, Role = 'Influencer');
		oppCRInsert.add(oppCR3);
		OpportunityContactRole oppCR4 = new OpportunityContactRole(ContactId = con4.id, OpportunityId = opp1.id, Role = 'Non-Responsive');
		oppCRInsert.add(oppCR4);
		OpportunityContactRole oppCR5 = new OpportunityContactRole(ContactId = con5.id, OpportunityId = opp2.id, Role = 'VMT Champion', IsPrimary = true);
		oppCRInsert.add(oppCR5);
		
		insert oppCRInsert;
        

        VartopiaDRS__Registration__c vr2 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Closed-Won', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp2.id);
        insertVRs.add(vr2);
        VartopiaDRS__Registration__c vr3 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Closed-Lost', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp3.id);
        insertVRs.add(vr3);
        VartopiaDRS__Registration__c vr4 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Approved', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp4.id);
        insertVRs.add(vr4);
        VartopiaDRS__Registration__c vr5 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Approved', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp5.id);
        insertVRs.add(vr5);
        VartopiaDRS__Registration__c vr6 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Approved', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp6.id);
        insertVRs.add(vr6);
        VartopiaDRS__Registration__c vr7 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Submitted', VartopiaDRS__Opportunity__c = opp7.id);
        insertVRs.add(vr7);
		VartopiaDRS__Registration__c vr8 = new VartopiaDRS__Registration__c(VartopiaDRS__Vendor_Status__c = 'Approved', Deal_type__c = 'Incremental', VartopiaDRS__Opportunity__c = opp7.id);
        insertVRs.add(vr8);

        insert insertVRs;
        
		//Create Demo Tasks
		Task tsk1 = new Task(Status='Not Started', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-10), WhatId=opp1.id, WhoId = Con1.id, CPU_Sockets__c = 10, Virtual_Machines_VMs__c = 100, First_Demo_Scheduled__c = true, First_Demo__c = false);
        tskInsert.add(tsk1);
        Task tsk2 = new Task(Status='Not Started', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today().addDays(-5), WhatId=opp2.id, WhoId = con2.id, CPU_Sockets__c = 20, Virtual_Machines_VMs__c = 150, First_Demo_Scheduled__c = true);
        tskInsert.add(tsk2);
        Task tsk3 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp2.id, WhoId = con3.id, CPU_Sockets__c = 20, Virtual_Machines_VMs__c = 150);
        tskInsert.add(tsk3);
        Task tsk4 = new Task(Status='Completed', Type = 'Demo', Subject ='Demo', ActivityDate=Date.Today(), WhatId=opp3.id, CPU_Sockets__c = 20, Virtual_Machines_VMs__c = 150);
        tskInsert.add(tsk4);
        
        insert tskInsert;
        
        //recruiting candidate initialization
/*
        Recruiting_Spec__c rs = new Recruiting_Spec__c(name = 'BDR US - Mar 2015', Report_To__c = 'Justin Chang', target_hires__c = 20, hiring_manager__c = 'Tim Daniels');
        insert rs;
        Recruiting_Candidate__c rc = new Recruiting_Candidate__c(Status__c = '1 - Application Submitted', Recruiting_Spec__c = rs.id);
        DateTime useDate = DateTime.now().addDays(-40);
        rc.Manual_Last_Modified_Date__c = useDate;
        insert rc;
*/
        
        Test.startTest();
        BatchFillHighestRegistrationStatus b = new BatchFillHighestRegistrationStatus();
        b.query = 'SELECT id, name, highest_vendor_status__c, Contact_Role_Count__c, Type, First_Demo_Contact_Safe_Id__c FROM Opportunity WHERE id = \'' + opp1.id + '\' OR id = \'' + opp2.id + '\' OR id = \'' + opp3.id + '\' OR id = \'' + opp4.id + '\' OR id = \'' + opp5.id + '\' OR id = \'' + opp6.id + '\' OR id = \'' + opp7.id + '\'';
        ID batchprocessid = Database.executeBatch(b);
        Test.stopTest();
        
        
        Map<Id,Opportunity> afterOpps = new Map<Id,Opportunity>([select id, highest_vendor_status__c, Partner_Manager__c, Contact_Role_Count__c, first_demo_contact_safe_id__c from Opportunity where (id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =:opp6.id or id =:opp7.id)]);
        
        Opportunity afterOpp = afterOpps.get(opp1.id);
        system.assertEquals(afterOpp.highest_vendor_status__c,'Closed-Won');
        system.assertEquals(afterOpp.Contact_Role_Count__c,4);
		system.assertEquals(afterOpp.First_Demo_Contact_Safe_Id__c,con1.id);
        Opportunity afterOpp7 = afterOpps.get(opp7.id);
        system.assertEquals(afterOpp7.highest_vendor_status__c,'Approved');
        Opportunity afterOpp2 = afterOpps.get(opp2.id);
        system.assertEquals(afterOpp2.highest_vendor_status__c,'Closed-Won');
        system.assertEquals(afterOpp2.Contact_Role_Count__c,1);
		system.assertEquals(afterOpp2.First_Demo_Contact_Safe_Id__c,con2.id);
        Opportunity afterOpp3 = afterOpps.get(opp3.id);
        system.assertEquals(afterOpp3.highest_vendor_status__c,'Approved');
        system.assertEquals(afterOpp3.Contact_Role_Count__c,0);
		system.assertEquals(afterOpp3.First_Demo_Contact_Safe_Id__c,null);
        Opportunity afterOpp4 = afterOpps.get(opp4.id);
        system.assertEquals(afterOpp4.highest_vendor_status__c,'Approved');
        Opportunity afterOpp5 = afterOpps.get(opp5.id);
        system.assertEquals(afterOpp5.highest_vendor_status__c,'Approved');
        Opportunity afterOpp6 = afterOpps.get(opp6.id);
        system.assertEquals(afterOpp6.highest_vendor_status__c,'Approved');

       	// test code for recruiting candidate
//        Recruiting_Candidate__c rc1 = [select id, Status__c from Recruiting_Candidate__c where id =: rc.id];
//        system.assertEquals(rc1.Status__c,'Non-Responsive'); 
        
    }
}