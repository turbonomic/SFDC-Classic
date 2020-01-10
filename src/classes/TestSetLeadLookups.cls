/**
 * Test Class for setLeadLookups Method in LeadMethods Class
 */
@isTest
private class TestSetLeadLookups {

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
    	* Case 16-20: Do not call Leads
    	* 
    	* Case 21: Lead without Account - Active
    	* Case 22: Lead without Account - Inctive
    	* Case 23: Lead without Account - Do Not Call
    	* Case 24: Converted Lead
    	*
    	* Case 25: Newly Created Contact
    	* Case 26: Manual Override Active Contact
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
		List<Lead> insertLeads = new List<Lead>();
		
        Lead ld1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld2 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Two', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Unable to Contact - Non Responsive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld3 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Three', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today().addDays(-400), createdDate = System.now().addDays(-200));
        Lead ld4 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Four', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = false, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld5 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Five', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        
        Lead ld6 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Six', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld7 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Seven', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld8 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Eight', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld9 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Nine', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld10 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Ten', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        
        Lead ld11 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Eleven', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld12 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Twelve', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld13 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Thirteen', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld14 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Fourteen', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = false, Last_Engagement_Date__c = date.today().addDays(-400), createdDate = System.now().addDays(-200));
        Lead ld15 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Fifteen', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = false, Last_Engagement_Date__c = date.today().addDays(-400), createdDate = System.now().addDays(-200));
        
        Lead ld16 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Sixteen', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Closed',CFCR_Status_Reason__c = 'Do Not Call', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld17 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Seventeen', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect', DoNotCall = true, Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld18 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Eighteen', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld19 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Nineteen', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld20 = new Lead(Account__c = acct4.id, FirstName = 'Lead', LastName = 'Twenty', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        
        Lead ld21 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty One', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld22 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty Two', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld23 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty Three', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Inactive', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));
        Lead ld24 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty Four', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = true, Last_Engagement_Date__c = date.today(), createdDate = System.now().addDays(-200));

        Lead ld25 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty Five', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect', Opened_Marketo_Email_in_Last_Year__c = false);
        Lead ld26 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Twenty Six', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Closed', CFCR_Status_Reason__c = 'Existing open opportunity', Opened_Marketo_Email_in_Last_Year__c = false, Active_Lead_Manual__c = true, createdDate = System.now().addDays(-200));

        insertLeads.add(ld1); insertLeads.add(ld2); insertLeads.add(ld3); insertLeads.add(ld4); insertLeads.add(ld5);
        insertLeads.add(ld6); insertLeads.add(ld7); insertLeads.add(ld8); insertLeads.add(ld9); insertLeads.add(ld10);
        insertLeads.add(ld11); insertLeads.add(ld12); insertLeads.add(ld13); insertLeads.add(ld14); insertLeads.add(ld15);
        insertLeads.add(ld16); insertLeads.add(ld17); insertLeads.add(ld18); insertLeads.add(ld19); insertLeads.add(ld20);
        insertLeads.add(ld21); insertLeads.add(ld22);insertLeads.add(ld23); insertLeads.add(ld24); insertLeads.add(ld25); insertLeads.add(ld26);
        
        insert insertLeads;
        
        List<Lead> ldQuery = new List<Lead>([SELECT id, Account__c, isActive__c, Inactive_Lookup__c, Active_Lookup__c, Do_Not_Call_Lookup__c FROM Lead WHERE id =: ld6.id or id =: ld7.id or id =: ld8.id or id =: ld9.id or id =: ld10.id or id =: ld11.id or id =: ld12.id or id =: ld13.id or id =: ld14.id or id =: ld15.id or id =: ld16.id or id =: ld17.id or id =: ld18.id or id =: ld19.id or id =: ld20.id or id =: ld21.id or id =: ld22.id or id =: ld23.id or id =: ld24.id]);
        List<Lead> updateLeads = new List<Lead>();
        Database.LeadConvert lc = new Database.LeadConvert();
        
        for (Lead l: ldQuery) {
        	if (l.id == ld6.id) { l.Status = 'Closed'; l.CFCR_Status_Reason__c = 'Environment under 8 hosts'; l.Active_Lookup__c = acct1.id; updateLeads.add(l); }
        	if (l.id == ld7.id) { l.Status = 'Closed'; l.CFCR_Status_Reason__c = 'Inactive'; l.Active_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld8.id) { l.Status = 'Closed'; l.CFCR_Status_Reason__c = 'No Longer at Company'; l.Active_Lookup__c = acct3.id; updateLeads.add(l); }
        	if (l.id == ld9.id) { l.Status = 'Closed'; l.CFCR_Status_Reason__c = 'Existing open opportunity'; l.Inactive_Lookup__c = acct1.id; updateLeads.add(l); }
        	if (l.id == ld10.id) { l.Opened_Marketo_Email_in_Last_Year__c = false; l.Last_Engagement_Date__c = date.today().addDays(-400); l.Inactive_Lookup__c = acct3.id; updateLeads.add(l); }
        	if (l.id == ld11.id) { l.Status = 'New'; l.CFCR_Status_Reason__c = null; l.Inactive_Lookup__c = acct1.id; updateLeads.add(l); }
        	if (l.id == ld12.id) { l.Status = 'New'; l.CFCR_Status_Reason__c = null; l.Inactive_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld13.id) { l.Status = 'New'; l.CFCR_Status_Reason__c = null; l.Inactive_Lookup__c = acct3.id; updateLeads.add(l); }
        	if (l.id == ld14.id) { l.Opened_Marketo_Email_in_Last_Year__c = true; l.Active_Lookup__c = acct1.id; updateLeads.add(l); }
        	if (l.id == ld15.id) { l.Last_Engagement_Date__c = date.today(); l.Active_Lookup__c = acct2.id; l.Do_Not_Call_Lookup__c = acct3.id; updateLeads.add(l); }
        	if (l.id == ld16.id) { l.Account__c = acct4.id; l.Active_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld17.id) { l.Account__c = acct4.id; l.Active_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld18.id) { l.Status = 'Closed'; l.CFCR_Status_Reason__c = 'Do Not Call'; l.Active_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld19.id) { l.DoNotCall = true; l.Do_Not_Call_Lookup__c = acct3.id; l.Inactive_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld20.id) { l.DoNotCall = true; l.Do_Not_Call_Lookup__c = acct1.id; l.Inactive_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld21.id) { l.Account__c = null; l.Do_Not_Call_Lookup__c = acct1.id; l.Inactive_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld22.id) { l.Account__c = null; l.Do_Not_Call_Lookup__c = acct1.id; l.Active_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld23.id) { l.Account__c = null; l.Active_Lookup__c = acct1.id; l.Inactive_Lookup__c = acct2.id; updateLeads.add(l); }
        	if (l.id == ld24.id) {lc.setLeadId(l.id); }
        }
        
        update updateLeads;
       	
       	lc.setConvertedStatus('New');
       	lc.setDoNotCreateOpportunity(true);
       	Database.LeadConvertResult lcr = Database.convertLead(lc);
       	System.assert(lcr.isSuccess());
       	
       	Contact conAssert = [SELECT id, AccountId, isActive__c, Inactive_Lookup__c, Active_Lookup__c, Do_Not_Call_Lookup__c FROM Contact WHERE Lead_Safe_ID__c =: ld24.id LIMIT 1];
       	system.AssertEquals(conAssert.isActive__c, true);
        system.AssertEquals(conAssert.Active_Lookup__c, conAssert.AccountId);
        system.AssertEquals(conAssert.Inactive_Lookup__c, null);
        system.AssertEquals(conAssert.Do_Not_Call_Lookup__c, null);
        
        
        List<Lead> ldList = new List<Lead>([SELECT id, Account__c, isActive__c, Inactive_Lookup__c, Active_Lookup__c, Do_Not_Call_Lookup__c FROM Lead WHERE id =: ld1.id or id =: ld2.id or id =: ld3.id or id =: ld4.id or id =: ld5.id or id =: ld6.id or id =: ld7.id or id =: ld8.id or id =: ld9.id or id =: ld10.id or id =: ld11.id or id =: ld12.id or id =: ld13.id or id =: ld14.id or id =: ld15.id or id =: ld16.id or id =: ld17.id or id =: ld18.id or id =: ld19.id or id =: ld20.id or id =: ld21.id or id =: ld22.id or id =: ld23.id or id =: ld25.id or id =: ld26.id]);
        
        for (Lead ld: ldList) {
        	if (ld.id == ld1.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld2.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld3.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld4.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld5.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld6.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld7.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld8.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld9.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld10.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld11.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld12.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld13.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld14.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld15.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld16.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, ld.Account__c);
        	}
        	else if (ld.id == ld17.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, ld.Account__c);
        	}
        	else if (ld.id == ld18.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, ld.Account__c);
        	}
        	else if (ld.id == ld19.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, ld.Account__c);
        	}
        	else if (ld.id == ld20.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, ld.Account__c);
        	}
        	else if (ld.id == ld21.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld22.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld23.id) {
        		system.AssertEquals(ld.isActive__c, false);
        		system.AssertEquals(ld.Active_Lookup__c, null);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld25.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        	else if (ld.id == ld26.id) {
        		system.AssertEquals(ld.isActive__c, true);
        		system.AssertEquals(ld.Active_Lookup__c, ld.Account__c);
        		system.AssertEquals(ld.Inactive_Lookup__c, null);
        		system.AssertEquals(ld.Do_Not_Call_Lookup__c, null);
        	}
        }
    }
}