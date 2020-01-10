@isTest (seeAllData=true)
private class TestBatchUpdateTaskEmails {
/*
    static testMethod void myUnitTest() {
        
        //FCRM.FCR_SupportAPI.DisableApplicationForContext();
        
        List<Account> acctInsert = new List<Account>();
        List<Lead> ldInsert = new List<Lead>();
        List<Contact> conInsert = new List<Contact>();
        List<Task> tskInsert = new List<Task>();
        
        
        //Create Accounts
        Account acct1 = new Account(Name = 'Acct1');
        acctInsert.add(acct1);
        insert acctInsert;

        //Create Contacts
        Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
        conInsert.add(con1);
        insert conInsert;
        
        
        //Create Leads
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = true);
        ldInsert.add(lead1);
        
        insert ldInsert;
        
        
        DateTime timeTask = DateTime.now();
        //create Tasks
        
        //attached to acct1
        Task tsk6 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk6);
        
        Task tsk7 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
        tskInsert.add(tsk7);
                 
        insert tskInsert;
        
        
        Test.StartTest();
        BatchUpdateEmails n = new BatchUpdateEmails();
        n.query = 'SELECT id, Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, ' +
            'Name FROM Account WHERE id = \'' + acct1.id + '\'';
        ID batchprocessid = Database.executeBatch(n);
        Test.StopTest();
        
        List<Account> getAccts = [select id, Email_Count__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Email_Date__c, Name from Account where id =: acct1.id];
        List<Contact> getContacts = [select id, Last_Email_Date__c from Contact where id =: con1.id];
        List<Lead> getLeads = [select id, Last_Email_Date__c from Lead where id =: lead1.id];        
        
        for (Account acct : getAccts) {
            if (acct.id == acct1.id) {
                system.assertEquals(acct.Email_Count__c,2);
                system.assertEquals(acct.Last_Email_Date__c,date.today().addDays(-1));
                system.assertEquals(acct.Emails_in_Last_30_Days__c,2);
                system.assertEquals(acct.Emails_in_Last_60_Days__c,2);
                system.assertEquals(acct.Emails_in_Last_90_Days__c,2);
            }
        }
        
        for (Contact con : getContacts) {
            if (con.id == con1.id) {
                system.assertEquals(con.Last_Email_Date__c,date.today().addDays(-1));
            }
        }
        
        for (Lead ld : getLeads) {
            if (ld.id == lead1.id) {
                system.assertEquals(ld.Last_Email_Date__c,date.today().addDays(-2));
            }

        }
        
    }
*/
}