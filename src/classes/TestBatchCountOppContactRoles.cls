/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestBatchCountOppContactRoles {

    static testMethod void myUnitTest() {
    /*	
   		List<Opportunity> oppInsert = new List<Opportunity>();
    	List<Contact> conInsert = new List<Contact>();
    	List<OpportunityContactRole> oppCRInsert = new List<OpportunityContactRole>();
    	List<Task> tskInsert = new List<Task>();
    	
    	//Create Account
        Account acct1 = new Account(Name = 'Acct1');
        insert acct1;
        
        //Create Contacts
    	Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con1);
    	Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con2);
    	Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con3);
    	Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con4);
    	Contact con5 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con5);
    	
    	insert conInsert;
    	
    	//Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Closed Won', AccountId = acct1.id, Hypervisors_Relevant_for_This_Opp__c = 'KVM (Redhat);OracleVM', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Demo_Count__c = 2, First_Demo_Date__c = date.today(), Last_Executive_Visit__c = date.today(), Hypervisors_Relevant_for_This_Opp__c = 'VMware', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Name = 'Opp3', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Pipeline', AccountId = acct1.id, Evaluation_Meeting_Count__c = 2, First_Evaluation_Meeting_Date__c = date.today(), Total_SE_Follow_Ups__c = 2, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
		oppInsert.add(opp3);
		
		insert oppInsert;
		
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
		
		
		
		Test.StartTest();
		BatchCountOppContactRoles n = new BatchCountOppContactRoles();
		n.query = 'SELECT id, Contact_Role_Count__c, Name, Type, First_Demo_Contact_Safe_Id__c FROM Opportunity WHERE id = \'' + opp1.id + '\' OR id = \'' + opp2.id + '\' OR id = \'' + opp3.id + '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
		
		List<Opportunity> getOpps = [SELECT id, Contact_Role_Count__c, First_Demo_Contact_Safe_Id__c FROM Opportunity WHERE id =: opp1.id  OR id =: opp2.id OR id =: opp3.id];
		
		for (Opportunity opp : getOpps) {
			if (opp.id == opp1.id) {
				system.assertEquals(opp.Contact_Role_Count__c,4);
				system.assertEquals(opp.First_Demo_Contact_Safe_Id__c,con1.id);
				
			}
			else if (opp.id == opp2.id) {
				system.assertEquals(opp.Contact_Role_Count__c,1);
				system.assertEquals(opp.First_Demo_Contact_Safe_Id__c,con2.id);
			}
			else if (opp.id == opp3.id) {
				system.assertEquals(opp.Contact_Role_Count__c,0);
				system.assertEquals(opp.First_Demo_Contact_Safe_Id__c,null);
			}
			
		}
        */
    }
}