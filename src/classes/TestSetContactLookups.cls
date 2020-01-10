/**
 * Test Class for setContactLookups Method in ContactMethods Class
 */
@isTest
private class TestSetContactLookups {

    static testMethod void myUnitTest() {
    	
    	/*
    	* Case 1: Normal, all active criteria
    	* Case 2: Closed, Non-responsive but active
    	* Case 3: Opened Marketo Email is true
    	* Case 4: Last Engagment date within last year
    	* Case 5: Closed but not active
    	*
    	* Cases 6-10: All active updated to inactive for acct2
    	* Cases 11-15: All inactive updated to active for Acct 3
    	*
    	* Case 16-20: Do not call Contacts
    	*
    	* Case 21: Newly Created Contact
    	* Case 22: Manual Override Active Contact
    	* 
    	*/
        
        //Create Test Accounts
        List<Account> insertAccts = new List<Account>();
		Account acct1 = new Account(Name = 'acct1');
		Account acct2 = new Account(Name = 'acct2'); 
		Account acct3 = new Account(Name = 'acct3');
		Account acct4 = new Account(Name = 'acct4');
		
		insertAccts.add(acct1); insertAccts.add(acct2); insertAccts.add(acct3); insertAccts.add(acct4);
		
		insert insertAccts;
		
		//Create Test Contacts
		List<Contact> insertContacts = new List<Contact>();
		
		Contact con1 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'One', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con2 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Two', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c = 'Unable to Contact - Non Responsive', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con3 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Three', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today().addDays(-400));
		Contact con4 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Four', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = false,Last_Engagement_Date__c  = date.today());
		Contact con5 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Five', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		
		Contact con6 = new Contact(AccountId = acct2.id, FirstName = 'Con', LastName = 'Six', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con7 = new Contact(AccountId = acct2.id, FirstName = 'Con', LastName = 'Seven', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con8 = new Contact(AccountId = acct2.id, FirstName = 'Con', LastName = 'Eight', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con9 = new Contact(AccountId = acct2.id, FirstName = 'Con', LastName = 'Nine', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con10 = new Contact(AccountId = acct2.id, FirstName = 'Con', LastName = 'Ten', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		
		Contact con11 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Eleven', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = false,Last_Engagement_Date__c  = date.today().addDays(-400));
		Contact con12 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Twelve', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con13 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Thirteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con14 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Fourteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con15 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Fifteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		
		Contact con16 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Sixteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Do Not Call', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con17 = new Contact(AccountId = acct3.id, FirstName = 'Con', LastName = 'Seventeen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Suspect',DoNotCall = true, Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con18 = new Contact(AccountId = acct4.id, FirstName = 'Con', LastName = 'Eighteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con19 = new Contact(AccountId = acct4.id, FirstName = 'Con', LastName = 'Nineteen', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		Contact con20 = new Contact(AccountId = acct4.id, FirstName = 'Con', LastName = 'Twenty', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'Closed',Status_Reason__c ='Bad Data', Opened_Marketo_Email_in_Last_Year__c = true,Last_Engagement_Date__c  = date.today());
		
		Contact con21 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Twenty One', LeadSource = 'Inbound - website', MailingCountry = 'United States', Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = false,Last_Engagement_Date__c  = date.today().addDays(-400));
		Contact con22 = new Contact(AccountId = acct1.id, FirstName = 'Con', LastName = 'Twenty Two', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-400), Contact_Status__c = 'New', Opened_Marketo_Email_in_Last_Year__c = false,Last_Engagement_Date__c  = date.today().addDays(-400), Active_Contact_Manual__c = true);
		
		
		insertContacts.add(con1); insertContacts.add(con2); insertContacts.add(con3); insertContacts.add(con4); insertContacts.add(con5);
		insertContacts.add(con6); insertContacts.add(con7); insertContacts.add(con8); insertContacts.add(con9); insertContacts.add(con10);
		insertContacts.add(con11); insertContacts.add(con12); insertContacts.add(con13); insertContacts.add(con14); insertContacts.add(con15);
		insertContacts.add(con16); insertContacts.add(con17); insertContacts.add(con18); insertContacts.add(con19); insertContacts.add(con20);
		insertContacts.add(con21); insertContacts.add(con22);
		
        insert insertContacts;
        
        List<Contact> updateConsQuery = new List<Contact>([SELECT id,Contact_Status__c,Status_Reason__c,Opened_Marketo_Email_in_Last_Year__c,Last_Engagement_Date__c, DoNotCall, Active_Lookup__c,Inactive_Lookup__c, Do_Not_Call_Lookup__c FROM Contact WHERE id =: con6.id or id =: con7.id or id =: con8.id or id =: con9.id or id =: con10.id or id =: con11.id or id =: con12.id or id =: con13.id or id =: con14.id or id =: con15.id or id =: con16.id or id =: con17.id or id =: con18.id or id =: con19.id or id =: con20.id ]);
        List<Contact> updateCons = new List<Contact>();
        
        for (Contact c: updateConsQuery) {
        	if (c.id == con6.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'Environment under 8 hosts'; c.Active_Lookup__c = acct1.id; updateCons.add(c); }
        	if (c.id == con7.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'Inactive'; c.Active_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con8.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'No Longer at Company'; c.Active_Lookup__c = acct3.id; updateCons.add(c); }
        	if (c.id == con9.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'Unable to Contact - Bad Data'; c.Inactive_Lookup__c = acct1.id; updateCons.add(c); }
        	if (c.id == con10.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'Existing open opportunity'; c.Inactive_Lookup__c = acct3.id; updateCons.add(c); }
        	if (c.id == con11.id) { c.Opened_Marketo_Email_in_Last_Year__c = true; c.Inactive_Lookup__c = acct1.id; updateCons.add(c); }
        	if (c.id == con12.id) { c.Contact_Status__c = 'New'; c.Status_Reason__c = null; c.Inactive_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con13.id) { c.Contact_Status__c = 'New'; c.Status_Reason__c = null; c.Inactive_Lookup__c = acct3.id; updateCons.add(c); }
        	if (c.id == con14.id) { c.Contact_Status__c = 'New'; c.Status_Reason__c = null; c.Active_Lookup__c = acct1.id; updateCons.add(c); }
        	if (c.id == con15.id) { c.Contact_Status__c = 'New'; c.Status_Reason__c = null; c.Active_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con16.id) { c.AccountId = acct4.id; c.Active_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con17.id) { c.AccountId = acct4.id; c.Active_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con18.id) { c.Contact_Status__c = 'Closed'; c.Status_Reason__c = 'Do Not Call'; c.Active_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con19.id) { c.DoNotCall = true; c.Do_Not_Call_Lookup__c = acct3.id; c.Inactive_Lookup__c = acct2.id; updateCons.add(c); }
        	if (c.id == con20.id) { c.DoNotCall = true; c.Do_Not_Call_Lookup__c = acct1.id; c.Inactive_Lookup__c = acct2.id; updateCons.add(c); }
        }
        
        update updateCons;
        
        List<Contact> conList = new List<Contact>([SELECT id, AccountId, isActive__c, Inactive_Lookup__c, Active_Lookup__c, Do_Not_Call_Lookup__c FROM Contact WHERE id =: con1.id or id =: con2.id or id =: con3.id or id =: con4.id or id =: con5.id or id =: con6.id or id =: con7.id or id =: con8.id or id =: con9.id or id =: con10.id or id =: con11.id or id =: con12.id or id =: con13.id or id =: con14.id or id =: con15.id or id =: con16.id or id =: con17.id or id =: con18.id or id =: con19.id or id =: con20.id or id =: con21.id or id =: con22.id]);
        
        for (Contact c: conList) {
        	if (c.id == con1.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con2.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con3.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con4.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con5.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con6.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con7.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con8.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con9.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con10.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con11.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con12.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con13.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con14.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con15.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con16.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, c.AccountId);
        	}
        	else if (c.id == con17.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, c.AccountId);
        	}
        	else if (c.id == con18.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, c.AccountId);
        	}
        	else if (c.id == con19.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, c.AccountId);
        	}
        	else if (c.id == con20.id) {
        		system.AssertEquals(c.isActive__c, false);
        		system.AssertEquals(c.Active_Lookup__c, null);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, c.AccountId);
        	}
        	else if (c.id == con21.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        	else if (c.id == con22.id) {
        		system.AssertEquals(c.isActive__c, true);
        		system.AssertEquals(c.Active_Lookup__c, c.AccountId);
        		system.AssertEquals(c.Inactive_Lookup__c, null);
        		system.AssertEquals(c.Do_Not_Call_Lookup__c, null);
        	}
        }
    }
}