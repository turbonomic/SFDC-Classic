/**
 * 
 */
@isTest
private class TestOpportunityCountContactRoleTrigger {

    static testMethod void myUnitTest() {
    	List<Opportunity> oppInsert = new List<Opportunity>();
    	List<Opportunity> oppUpdate = new List<Opportunity>();
    	List<Contact> conInsert = new List<Contact>();
    	List<OpportunityContactRole> oppCRInsert = new List<OpportunityContactRole>();
    	
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
    	Contact con6 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con6);
    	Contact con7 = new Contact(FirstName = 'Contact', LastName = 'Seven', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    	conInsert.add(con7);
    	
    	insert conInsert;
    	
    	//Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Hypervisors_Relevant_for_This_Opp__c = 'KVM (Redhat);OracleVM', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', CloseDate = Date.today(), type = 'New', Booking_Date__c = Date.today(), StageName = 'Pipeline', AccountId = acct1.id, Demo_Count__c = 2, First_Demo_Date__c = date.today(), Last_Executive_Visit__c = date.today(), Hypervisors_Relevant_for_This_Opp__c = 'VMware', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000, Exec_Sponsor_Need_Timing__c = true);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Name = 'Opp3', CloseDate = Date.today(), type = 'Upsell', Booking_Date__c = Date.today(), StageName = 'Upside', AccountId = acct1.id, Evaluation_Meeting_Count__c = 2, First_Evaluation_Meeting_Date__c = date.today(), Total_SE_Follow_Ups__c = 2, of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000, Exec_Sponsor_Need_Timing__c= true,Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true );
		oppInsert.add(opp3);
		Opportunity opp4 = new Opportunity(Name = 'Opp4', CloseDate = Date.today(), type = 'Quota', Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct1.id, Hypervisors_Relevant_for_This_Opp__c = 'KVM (Redhat);OracleVM', of_CPU_Sockets__c = 100, of_Virtual_Machines__c = 1000);
        oppInsert.add(opp4);
		
		insert oppInsert;
		
		//Create Opportunity Contact Roles
		OpportunityContactRole oppCR1 = new OpportunityContactRole(ContactId = con1.id, OpportunityId = opp1.id, Role = 'Manager', IsPrimary = true);
		oppCRInsert.add(oppCR1);
		OpportunityContactRole oppCR2 = new OpportunityContactRole(ContactId = con2.id, OpportunityId = opp1.id, Role = 'Decision Maker');
		oppCRInsert.add(oppCR2);
		OpportunityContactRole oppCR3 = new OpportunityContactRole(ContactId = con3.id, OpportunityId = opp1.id, Role = 'Influencer');
		oppCRInsert.add(oppCR3);
		OpportunityContactRole oppCR4 = new OpportunityContactRole(ContactId = con4.id, OpportunityId = opp2.id, Role = 'Non-Responsive');
		oppCRInsert.add(oppCR4);
		OpportunityContactRole oppCR5 = new OpportunityContactRole(ContactId = con5.id, OpportunityId = opp2.id, Role = 'VMT Champion', IsPrimary = true);
		oppCRInsert.add(oppCR5);
		OpportunityContactRole oppCR6 = new OpportunityContactRole(ContactId = con6.id, OpportunityId = opp3.id, Role = 'Influencer');
		oppCRInsert.add(oppCR6);
		OpportunityContactRole oppCR7 = new OpportunityContactRole(ContactId = con7.id, OpportunityId = opp4.id, Role = 'Non-Responsive');
		oppCRInsert.add(oppCR7);
		
		insert oppCRInsert;
		
		opp1.StageName = 'Upside'; opp1.Exec_Sponsor_Need_Timing__c = true; opp1.Began_Eval__c = true; opp1.Exec_Sponsors_Eval_Criteria_Documented__c = true;
		oppUpdate.add(opp1);
		opp2.StageName = 'Strong Upside'; opp2.Exec_Sponsor_Need_Timing__c = true; opp2.Began_Eval__c = true; opp2.Exec_Sponsors_Eval_Criteria_Documented__c = true; opp2.Tech_Win_Established__c = true; opp2.Exec_Buy_In_on_BIP__c = true; 
		oppUpdate.add(opp2);
		opp3.StageName = 'Strong Upside'; opp3.Tech_Win_Established__c = true; opp3.Exec_Buy_In_on_BIP__c = true; 
		oppUpdate.add(opp3);
		opp4.StageName = 'Upside'; opp4.Exec_Sponsor_Need_Timing__c = true; opp4.Began_Eval__c = true; opp4.Exec_Sponsors_Eval_Criteria_Documented__c = true;
		oppUpdate.add(opp4);
		
		update oppUpdate;
		
		List<Opportunity> getOpps = [SELECT id, Contact_Role_Count__c FROM Opportunity WHERE id =: opp1.id  OR id =: opp2.id OR id =: opp3.id OR id =: opp4.id];
		
		for (Opportunity opp : getOpps) {
			if (opp.id == opp1.id) {
				system.assertEquals(opp.Contact_Role_Count__c,3);
			}
			else if (opp.id == opp2.id) {
				system.assertEquals(opp.Contact_Role_Count__c,2);
			}
			else if (opp.id == opp3.id) {
				system.assertEquals(opp.Contact_Role_Count__c,1);
			}
			else if (opp.id == opp4.id) {
				system.assertEquals(opp.Contact_Role_Count__c,0);
			}
			
		}
        
    }
}