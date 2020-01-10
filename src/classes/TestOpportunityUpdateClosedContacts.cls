/**
 * 
 *
 *
 */
@isTest
private class TestOpportunityUpdateClosedContacts {

    static testMethod void myUnitTest() {
      List<Opportunity> oppInsert = new List<Opportunity>();
      List<Opportunity> oppUpdate = new List<Opportunity>();
      List<Contact> conInsert = new List<Contact>();
      List<OpportunityContactRole> oppCRInsert = new List<OpportunityContactRole>();
      
      //Create Account
        Account acct1 = new Account(Name = 'Acct1');
        insert acct1;
        
        //Create Contacts
      Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Contact_Status__c = 'Working' );
      conInsert.add(con1);
      Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct1.id, Contact_Status__c = 'Working' );
      conInsert.add(con2);
      Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct1.id, Contact_Status__c = 'Working' );
      conInsert.add(con3);
      Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, Contact_Status__c = 'Closed', Status_Reason__c = 'Recently Closed/Unqualified Opportunity' );
      conInsert.add(con4);
      Contact con5 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct1.id, Contact_Status__c = 'Closed', Status_Reason__c = 'Recently Closed/Unqualified Opportunity' );
      conInsert.add(con5);
      Contact con6 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct1.id, Contact_Status__c = 'Working' );
      conInsert.add(con6);
      Contact con7 = new Contact(FirstName = 'Contact', LastName = 'Seven', AccountId = acct1.id, Contact_Status__c = 'Working' );
      conInsert.add(con7);
      
      insert conInsert;
      
      //Create Opportunities
        Opportunity opp1 = new Opportunity(Name = 'Opp1', AccountId = acct1.id, StageName = 'Identify', CloseDate = date.today(), type = 'New');
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Name = 'Opp2', AccountId = acct1.id, StageName = 'Pipeline', CloseDate = date.today(), type = 'New', Exec_Sponsor_Need_Timing__c = true);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Name = 'Opp3',  AccountId = acct1.id, StageName = 'Closed Lost', CloseDate = date.today(), type = 'New');
    oppInsert.add(opp3);
    Opportunity opp4 = new Opportunity(Name = 'Opp4', AccountId = acct1.id, StageName = 'Unqualified', CloseDate = date.today(), type = 'New');
        oppInsert.add(opp4);
    
    insert oppInsert;
    
    //Create Opportunity Contact Roles
    OpportunityContactRole oppCR1 = new OpportunityContactRole(ContactId = con1.id, OpportunityId = opp1.id, Role = 'Manager', IsPrimary = true);
    oppCRInsert.add(oppCR1);
    OpportunityContactRole oppCR2 = new OpportunityContactRole(ContactId = con2.id, OpportunityId = opp1.id, Role = 'Decision Maker');
    oppCRInsert.add(oppCR2);
    OpportunityContactRole oppCR3 = new OpportunityContactRole(ContactId = con3.id, OpportunityId = opp2.id, Role = 'Influencer');
    oppCRInsert.add(oppCR3);
    OpportunityContactRole oppCR4 = new OpportunityContactRole(ContactId = con4.id, OpportunityId = opp2.id, Role = 'Non-Responsive');
    oppCRInsert.add(oppCR4);
    OpportunityContactRole oppCR5 = new OpportunityContactRole(ContactId = con5.id, OpportunityId = opp3.id, Role = 'VMT Champion', IsPrimary = true);
    oppCRInsert.add(oppCR5);
    OpportunityContactRole oppCR6 = new OpportunityContactRole(ContactId = con6.id, OpportunityId = opp3.id, Role = 'Influencer');
    oppCRInsert.add(oppCR6);
    OpportunityContactRole oppCR7 = new OpportunityContactRole(ContactId = con7.id, OpportunityId = opp4.id, Role = 'Non-Responsive');
    oppCRInsert.add(oppCR7);
    
    insert oppCRInsert;
    
    opp1.stagename = 'Pipeline'; opp1.Exec_Sponsor_Need_Timing__c = true;
    oppupdate.add(opp1);
    opp2.StageName = 'Closed Lost';
    oppUpdate.add(opp2);
    opp3.StageName = 'Unqualified';
    oppUpdate.add(opp3);
    opp4.StageName = 'Unqualified';
    oppUpdate.add(opp4);
    
    update oppUpdate;
    
    
    List<Contact> getCons = [SELECT id, Contact_Status__c, Status_Reason__c FROM Contact WHERE id =: con1.id  OR id =: con2.id OR id =: con3.id OR id =: con4.id OR id =: con5.id OR id =: con6.id OR id =: con7.id];
    
    for (Contact con : getCons) {
      if (con.id == con1.id){
        system.assertEquals(con.Contact_Status__c, 'Working');
        /*system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); */
      }  
      else if (con.id == con2.id){
        system.assertEquals(con.Contact_Status__c, 'Working');
        /*system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); */
      }
      else if (con.id == con3.id){
        system.assertEquals(con.Contact_Status__c, 'Closed');
        system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); 
      }
      else if (con.id == con4.id){
        system.assertEquals(con.Contact_Status__c, 'Closed');
        system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); 
      }
      else if (con.id == con5.id){
        system.assertEquals(con.Contact_Status__c, 'Closed');
        system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); 
      }
      else if (con.id == con6.id){
        system.assertEquals(con.Contact_Status__c, 'Closed');
        system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity');
      }
      else if (con.id == con7.id){
        system.assertEquals(con.Contact_Status__c, 'Working');
        /*system.assertEquals(con.Status_Reason__c, 'Recently Closed/Unqualified Opportunity'); */
      }
    }
    }
}