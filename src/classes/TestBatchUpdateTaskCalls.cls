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
@isTest (seeAllData=true)
private class TestBatchUpdateTaskCalls {

    static testMethod void myUnitTest() {
    
    List<Account> acctInsert = new List<Account>();
    List<Lead> ldInsert = new List<Lead>();
    List<Contact> conInsert = new List<Contact>();
    List<Task> tskInsert = new List<Task>();
    List<CampaignMember> cmInsert = new List<CampaignMember>();
    
    //Create Accounts
    Account acct1 = new Account(Name = 'Acct1');
    Account acct2 = new Account(Name = 'Acct2', First_Evaluation_Meeting_Date__c = date.today().addDays(-2), Green_Circle_Registration_Date__c = date.today());
    Account acct3 = new Account(Name = 'Acct3', first_demo_date__c = date.today());
    Account acct4 = new Account(Name = 'Acct4');
    Account acctEmpty = new Account(name = 'AcctEmpty', billingCountry = 'United States', billingState = 'Massachusetts'); //testing switchboard
        
    acctInsert.add(acct1); acctInsert.add(acct2); acctInsert.add(acct3); acctInsert.add(acct4); acctInsert.add(acctEmpty);
    
    insert acctInsert;
        
    //Create Opportunity
    Opportunity opp1 = new Opportunity(Name = 'Opp1', CloseDate = Date.today().addDays(30), Booking_Date__c = Date.today(), StageName = 'Identify', AccountId = acct2.id, Stage_Change_Date__c = Date.today().addDays(-90));
    insert opp1;
       

    //Create Contacts
    Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.today() );
    // no dials
    Contact con11 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct1.id, Green_Circle_Registration_Date__c = Date.Today().addDays(-5), dial_count__c = 100, last_dial_date__c = date.today().addDays(-1000), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000), first_Connect_Date__c = date.today().addDays(-1000), first_Conversation_Date__c = date.today().addDays(-1000));
    
    Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct2.id);
    // differing Connect Dates/number
    Contact con22 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct2.id, dial_count__c = 100, last_dial_date__c = date.today().addDays(-1000), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000), First_Demo_Date__c = date.today(), First_Demo_Scheduled_Date__c = date.today().addDays(-10));
    
    Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct3.id);
    // differing Conversation Dates/number 
    Contact con33 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct3.id, dial_count__c = 100, last_dial_date__c = date.today().addDays(-1000), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000));
      
    conInsert.add(con1); conInsert.add(con11); conInsert.add(con2); conInsert.add(con22); conInsert.add(con3); conInsert.add(con33);
    
    insert conInsert;
    
    
    //Create Leads
    Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Unknown', Status = 'Non-Responsive', Status_Change_Date__c = Date.today().addDays(-100), Was_Prospect__c = true);
    ldInsert.add(lead1);
    Lead lead4 = new Lead(Account__c = acct1.id, FirstName = 'Lead', lastName = 'Four', company = 'Acct1', leadSource = 'Unknown', Status = 'Prospect', dial_count__c = 100, last_dial_date__c = date.today(), first_Connect_Date__c = date.today().addDays(-1000), first_Conversation_Date__c = date.today().addDays(-1000), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000));
    ldInsert.add(lead4);  // no dials

        
    Lead lead2 = new Lead(Account__c = acct2.id, FirstName = 'Lead', LastName = 'Two', Company = 'Acct2', LeadSource = 'Unknown', Status = 'No Interest', Status_Change_Date__c = Date.today().addDays(-200), Was_Prospect__c = true);
    ldInsert.add(lead2);
    Lead lead5 = new Lead(Account__c = acct2.id, FirstName = 'Lead', lastName = 'Five', company = 'Acct2', leadSource = 'Unknown', Status = 'Prospect', dial_count__c = 100, last_dial_date__c = date.today(), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000));
    ldInsert.add(lead5);  // differing Connect Date/number
        
    Lead lead3 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'Three', Company = 'Acct3', LeadSource = 'Unknown', Status = 'Call Back 15 Days', Was_Prospect__c = true);
    ldInsert.add(lead3);
    Lead lead6 = new Lead(Account__c = acct3.id, FirstName = 'Lead', lastName = 'Six', company = 'Acct3', leadSource = 'Unknown', Status = 'Prospect', dial_count__c = 100, last_dial_date__c = date.today().addDays(-1000), last_connect_date__c = date.today().addDays(-1000), last_Conversation_date__c = date.today().addDays(-1000), first_dial_date__c = date.today().addDays(-1000));
    ldInsert.add(lead6);  // differing Conversation Date/number
        
    Lead lead7 = new Lead(Account__c = acct3.id, firstName = 'Lead', lastName = 'Seven', status = 'New', LeadSource = 'Prospecting - DiscoverOrg', company = 'Test Company', Inbound_Qualified__c = true, Inbound_Qualified_By__c ='Eddie Genao', Inbound_Qualified_Date_Stamp__c = date.today());
    ldInsert.add(lead7);
    Lead lead8 = new Lead(Account__c = acct3.id, firstName = 'Lead', lastName = 'Eight', status = 'New', LeadSource = 'Prospecting - DiscoverOrg', company = 'Test Company', Inbound_Qualified__c = true, Inbound_Qualified_By__c ='Eddie Genao');
    ldInsert.add(lead8);  

        
    insert ldInsert;
        
    lead8 = [SELECT id, Inbound_Qualified_Date_Stamp__c FROM Lead WHERE id =: lead8.id];
    lead8.Inbound_Qualified_Date_Stamp__c = date.today().addDays(-20);
    update(lead8);
        
    Campaign tp = new Campaign(name = '3PT: Whatever Campaign');
    insert tp;
        
        
    CampaignMember cmcon1 = new CampaignMember(contactId = con1.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmcon2 = new CampaignMember(contactId = con2.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmcon22 = new CampaignMember(contactId = con22.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmcon3 = new CampaignMember(contactId = con3.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmcon33 = new CampaignMember(contactId = con33.id, campaignId = tp.id, status = 'Responded');
    
    CampaignMember cmlead1 = new CampaignMember(leadId = lead1.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmlead2 = new CampaignMember(leadId = lead2.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmlead3 = new CampaignMember(leadId = lead3.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmlead5 = new CampaignMember(leadId = lead5.id, campaignId = tp.id, status = 'Responded');
    CampaignMember cmlead6 = new CampaignMember(leadId = lead6.id, campaignId = tp.id, status = 'Responded');
    
    cmInsert.add(cmcon1); cmInsert.add(cmcon2); cmInsert.add(cmcon22); cmInsert.add(cmcon3); cmInsert.add(cmcon33);
    cmInsert.add(cmlead1); cmInsert.add(cmlead2); cmInsert.add(cmlead3); cmInsert.add(cmlead5); cmInsert.add(cmlead6);
    
    insert cmInsert;
    
    
    DateTime timeTask = DateTime.now();
    //create Tasks
    
    //attached to acct1
    Task tsk18 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        
    Task tsk19 = new Task(Status='Completed', Type = 'Email', Subject ='Email: XXX', ActivityDate=Date.Today().addDays(-2), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
    
    //attached to lead1
    Task tsk1 = new Task(Status='Completed', Type = 'Call', Subject ='Call', ActivityDate=Date.Today().addDays(-11), CreatedDate = timeTask.addDays(-11), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk2 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Left Voicemail', ActivityDate=Date.Today().addDays(-10), CreatedDate = timeTask.addDays(-10), WhoId=lead1.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk3 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), WhoId=lead1.id);

    //attached to con1
    Task tsk4 = new Task(Status='Completed', Type = 'Call', Call_Disposition__c = 'Connect', Subject ='Call', ActivityDate=Date.Today(), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk5 = new Task(Status='Completed', Type = 'Call', Subject ='Connect', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-1), WhoId=con1.id, Outcomes__c = 'outcome', Description = 'outcome');
        
    //attached to acct2
    //attached to lead2
    Task tsk6 = new Task(Status='Completed', Type = 'Call', Subject ='Call', ActivityDate=Date.Today().addDays(-5), CreatedDate=timeTask.addDays(-5), WhoId=lead2.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk7 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Left Voicemail', ActivityDate=Date.Today(), WhoId=lead2.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk8 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today(), WhoId=lead2.id);
          
    //attached to lead5
    Task tsk11 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Connect', ActivityDate=Date.today(), CreatedDate=timeTask, WhoId=lead5.id, Outcomes__c = 'outcome', Description = 'outcome');
          
    //attached to con2
    Task tsk9 = new Task(Status='Completed', Type = 'Call', Call_Disposition__c = 'Conversation', Subject ='Call', ActivityDate=Date.Today().addDays(-2), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk10 = new Task(Status='Completed', Type = 'Call', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId=con2.id, Outcomes__c = 'outcome', Description = 'outcome');
    
    //attached to con22
    Task tsk12 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Connect', ActivityDate=Date.today(), WhoId=con22.id, Outcomes__c = 'outcome', Description = 'outcome');
    Task tsk17 = new Task(Status='Completed', Type = 'Demo', Subject = 'Demo', ActivityDate=Date.today().addDays(20), WhoId = con22.id, whatId = opp1.id);
          
    //attached to acct3
    //attached to lead3
    Task tsk13 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId = lead3.id);
      
    //attached to lead 6
    Task tsk14 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId = lead6.id);
          
    //attached to con3
    Task tsk15 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId = con3.id);
         
    //attached to con33
    Task tsk16 = new Task(Status='Completed', Type = 'Call', Subject = 'Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-1), WhoId = con33.id);
          
    tskInsert.add(tsk18); tskInsert.add(tsk19);
    tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3);
    tskInsert.add(tsk4); tskInsert.add(tsk5);
    tskInsert.add(tsk6); tskInsert.add(tsk7); tskInsert.add(tsk8);
    tskInsert.add(tsk11);
    tskInsert.add(tsk9); tskInsert.add(tsk10);
    tskInsert.add(tsk12); tskInsert.add(tsk17);
    tskInsert.add(tsk13);
    tskInsert.add(tsk14);
    tskInsert.add(tsk15);
    tskInsert.add(tsk16);
        
    insert tskInsert;
        
    Test.StartTest();
    BatchUpdateTaskCalls n = new BatchUpdateTaskCalls();
    n.query = 'SELECT id, Last_Dial_Date__c, Dial_Count__c, Contact_Count__c, Lead_Count__c, ' + 
            'Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, First_demo_date__c, first_evaluation_meeting_date__c, First_Conversation_Date__c, Latest_Conversation_Date__c, Dials_Before_First_Connect_Conv__c, Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, ' +
            'Contacts_Dialed_in_Last_X_Days__c, Leads_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c,' + 
            'First_Dial_Date__c, Green_Circle_Registration_Date__c, Name FROM Account WHERE id = \'' + 
            acct1.id + '\' OR id = \'' + acct2.id + '\' OR id = \'' + acct3.id + '\'';
    ID batchprocessid = Database.executeBatch(n);
    Test.StopTest();
    
    //verify results
    List<Account> getAccts = [select id, Last_Dial_Date__c, Dial_Count__c, First_Dial_Date__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, 
         First_Conversation_Date__c, Latest_Conversation_Date__c, Contact_Count__c, Lead_Count__c, Dials_Before_First_Connect_Conv__c, Email_Count__c, Last_Email_Date__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c,
         Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, Leads_Dialed_in_Last_X_Days__c, Contacts_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, 
         Green_Circle_Registration_Date__c, Name from Account where (id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id)];
    List<Contact> getContacts = [select id, Last_Dial_Date__c, First_Dial_Date__c, Dial_Count__c, First_Connect_Date__c, First_Conversation_Date__c, Last_Connect_Date__c, Last_Conversation_Date__c, Green_Circle_Registration_Date__c, Green_Circle_Member__c, Dials_until_First_Conversation__c, Dials_until_First_Demo__c, last_email_date__c from Contact where (id =: con1.id or id =: con11.id or id =: con2.id or id =: con22.id or id =: con3.id or id =: con33.id)];
    List<Lead> getLeads = [select id, First_Dial_Date_Time__c, First_Dial_Date__c, Last_Dial_Date__c, Dial_Count__c, Status, Status_Change_Date__c, Marked_Non_Responsive_No_Interest__c, First_Connect_Date__c, First_Conversation_Date__c, Last_Connect_Date__c, Last_Conversation_Date__c, Dial_Count_Since_Last_Status_Change__c, Dials_until_First_Conversation__c, Inbound_Qualified__c, Inbound_Qualified_By__c, Inbound_Qualified_Date_Stamp__c, last_email_date__c from Lead where (id =: lead1.id or id =: lead2.id or id =: lead3.id or id =: lead4.id or id =: lead5.id or id =: lead6.id or id =: lead7.id or id =: lead8.id)];
    
    
    for (Account acct: getAccts) {
            if (acct.id == acct1.id) {
              system.assertEquals(acct.Dial_Count__c,5);
              system.assertEquals(acct.First_Dial_Date__c,date.today().addDays(-11));
              system.assertEquals(acct.Last_Dial_Date__c,date.today());
              system.assertEquals(acct.Contact_Count__c,2);
              system.assertEquals(acct.Lead_Count__c,2);
              system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c,1);
              system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c,1);
              system.assertEquals(acct.Green_Circle_Registration_Date__c,date.today());
              system.assertEquals(acct.Connect_Count__c,3);
              system.assertEquals(acct.First_Connect_Date__c,date.today().addDays(-10));
              system.assertEquals(acct.Latest_Connect_Date__c,date.today());
              system.assertEquals(acct.Conversation_Count__c,0);
              system.assertEquals(acct.First_Conversation_Date__c,null);
              system.assertEquals(acct.Latest_Conversation_Date__c,null);
              system.assertEquals(acct.Dials_Before_First_Demo__c,null);
              system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c,null);
              system.assertEquals(acct.Dials_Before_First_Connect_Conv__c,null);
              system.assertEquals(acct.Dials_in_Last_30_Days__c,5);
              system.assertEquals(acct.Dials_in_Last_60_Days__c,5);
              system.assertEquals(acct.Dials_in_Last_90_Days__c,5);
              system.assertEquals(acct.Email_Count__c,2);
              system.assertEquals(acct.Last_Email_Date__c,date.today().addDays(-1));
              system.assertEquals(acct.Emails_in_Last_30_Days__c,2);
              system.assertEquals(acct.Emails_in_Last_60_Days__c,2);
              system.assertEquals(acct.Emails_in_Last_90_Days__c,2);
            } else if (acct.id == acct2.id) {
              system.assertEquals(acct.Dial_Count__c,7);
              system.assertEquals(acct.First_Dial_Date__c,date.today().addDays(-5));
              system.assertEquals(acct.Last_Dial_Date__c,date.today());
              system.assertEquals(acct.Contact_Count__c,2);
              system.assertEquals(acct.Lead_Count__c,2);
              system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c,2);
              system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c,2);
              system.assertEquals(acct.Green_Circle_Registration_Date__c,null);
              system.assertEquals(acct.Connect_Count__c,2);
              system.assertEquals(acct.First_Connect_Date__c,date.today());
              system.assertEquals(acct.Latest_Connect_Date__c,date.today());
              system.assertEquals(acct.Conversation_Count__c,3);
              system.assertEquals(acct.First_Conversation_Date__c,date.today().addDays(-2));
              system.assertEquals(acct.Latest_Conversation_Date__c,date.today());
              system.assertEquals(acct.Dials_Before_First_Demo__c,null);
              system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c,1);
              system.assertEquals(acct.Dials_Before_First_Connect_Conv__c,1);
              system.assertEquals(acct.Dials_in_Last_30_Days__c,7);
              system.assertEquals(acct.Dials_in_Last_60_Days__c,7);
              system.assertEquals(acct.Dials_in_Last_90_Days__c,7);              
            } else if (acct.id == acct3.id) {
              system.assertEquals(acct.Dial_Count__c,4);
              system.assertEquals(acct.First_Dial_Date__c,date.today().addDays(-1));
              system.assertEquals(acct.Last_Dial_Date__c,date.today().addDays(-1));
              system.assertEquals(acct.Contact_Count__c,2);
              system.assertEquals(acct.Lead_Count__c,4);
              system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c,2);
              system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c,2);
              system.assertEquals(acct.Green_Circle_Registration_Date__c,null);
              system.assertEquals(acct.Connect_Count__c,0);
              system.assertEquals(acct.First_Connect_Date__c,null);
              system.assertEquals(acct.Latest_Connect_Date__c,null);
              system.assertEquals(acct.Conversation_Count__c,4);
              system.assertEquals(acct.First_Conversation_Date__c,date.today().addDays(-1));
              system.assertEquals(acct.Latest_Conversation_Date__c,date.today().addDays(-1));
              system.assertEquals(acct.Dials_Before_First_Demo__c,4);
              system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c,null);
              system.assertEquals(acct.Dials_Before_First_Connect_Conv__c,0);
              system.assertEquals(acct.Dials_in_Last_30_Days__c,4);
              system.assertEquals(acct.Dials_in_Last_60_Days__c,4);
              system.assertEquals(acct.Dials_in_Last_90_Days__c,4);     
            } else if (acct.id == acct4.id) {
              system.assertEquals(acct.Dial_Count__c,null);
              system.assertEquals(acct.First_Dial_Date__c,null);
              system.assertEquals(acct.Last_Dial_Date__c,null);
              system.assertEquals(acct.Contact_Count__c,null);
              system.assertEquals(acct.Lead_Count__c,null);
              system.assertEquals(acct.Leads_Dialed_in_Last_X_Days__c,null);
              system.assertEquals(acct.Contacts_Dialed_in_Last_X_Days__c,null);
              system.assertEquals(acct.Green_Circle_Registration_Date__c,null);
              system.assertEquals(acct.Connect_Count__c,null);
              system.assertEquals(acct.First_Connect_Date__c,null);
              system.assertEquals(acct.Latest_Connect_Date__c,null);
              system.assertEquals(acct.Conversation_Count__c,null);
              system.assertEquals(acct.First_Conversation_Date__c,null);
              system.assertEquals(acct.Latest_Conversation_Date__c,null);
              system.assertEquals(acct.Dials_Before_First_Demo__c,null);
              system.assertEquals(acct.Dials_Before_First_Evaluation_Meeting__c,null);
              system.assertEquals(acct.Dials_Before_First_Connect_Conv__c,null);
              system.assertEquals(acct.Dials_in_Last_30_Days__c,null);
              system.assertEquals(acct.Dials_in_Last_60_Days__c,null);
              system.assertEquals(acct.Dials_in_Last_90_Days__c,null);  
            }
            else if (acct.id == acctEmpty.id){
              system.assertEquals(0, acctEmpty.lead_Count__c); //Verifying that switchboard lead does not count.
            }
    }
    
    for (Contact con: getContacts) {
      //acct 1 Contacts
      if (con.id == con1.id){
        system.assertEquals(con.Dial_Count__c,2);
        system.assertEquals(con.Last_Dial_Date__c,date.today());
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(con.Last_Connect_Date__c,date.today());
        system.assertEquals(con.Last_Conversation_Date__c,null);
        system.assertEquals(con.First_Connect_Date__c,date.today().addDays(-1));
        system.assertEquals(con.Dials_until_First_Conversation__c, null);
        system.assertEquals(con.Dials_until_First_Demo__c, null);
        system.assertEquals(con.Last_Email_Date__c,date.today().addDays(-1));
      } else if (con.id == con11.id) {
        system.assertEquals(con.Dial_Count__c,0);
        system.assertEquals(con.Last_Dial_Date__c,null);
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(con.Last_Connect_Date__c,null);
        system.assertEquals(con.Last_Conversation_Date__c,null);
        system.assertEquals(con.First_Connect_Date__c,date.today().addDays(-1000));
        system.assertEquals(con.First_Conversation_Date__c,date.today().addDays(-1000));
        system.assertEquals(con.Dials_until_First_Conversation__c, null);
        system.assertEquals(con.Dials_until_First_Demo__c, null);
      }
      //acct 2 Contacts 
      else if (con.id == con2.id) {
        system.assertEquals(con.Dial_Count__c,2);
        system.assertEquals(con.Last_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-2));
        system.assertEquals(con.Last_Connect_Date__c,null);
        system.assertEquals(con.Last_Conversation_Date__c,date.today().addDays(-1));
        system.assertEquals(con.First_Conversation_Date__c,date.today().addDays(-2));
        system.assertEquals(con.Dials_until_First_Conversation__c, 1);
        system.assertEquals(con.Dials_until_First_Demo__c, null);
      } else if (con.id == con22.id) {
        system.assertEquals(con.Dial_Count__c,1);
        system.assertEquals(con.Last_Dial_Date__c,date.today());
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(con.Last_Connect_Date__c,date.today());
        system.assertEquals(con.Last_Conversation_Date__c,null);
        system.assertEquals(con.Dials_until_First_Conversation__c, null);
        system.assertEquals(con.Dials_until_First_Demo__c,0);
      } 
      //acct 3 Contacts
      else if (con.id == con3.id) {
        system.assertEquals(con.Dial_Count__c,1);
        system.assertEquals(con.Last_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(con.Last_Connect_Date__c,null);
        system.assertEquals(con.Last_Conversation_Date__c,date.today().addDays(-1));
        system.assertEquals(con.Dials_until_First_Conversation__c, 1);
        system.assertEquals(con.Dials_until_First_Demo__c, null);
      } else if (con.id == con33.id) {
        system.assertEquals(con.Dial_Count__c,1);
        system.assertEquals(con.Last_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(con.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(con.Last_Connect_Date__c,null);
        system.assertEquals(con.Last_Conversation_Date__c,date.today().addDays(-1));
        system.assertEquals(con.Dials_until_First_Conversation__c, 1);
        system.assertEquals(con.Dials_until_First_Demo__c, null);
      }
    }
    
    for (Lead ld : getLeads) {
      //acct 1 Leads
      if (ld.id == lead1.id) {
        system.assertEquals(ld.Dial_Count__c,3);
        //system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,3);
        system.assertEquals(ld.Last_Dial_Date__c,date.today().addDays(-10));
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-11));
        system.assertEquals(ld.First_Dial_Date_Time__c,timeTask.addDays(-11));
        system.assertEquals(ld.First_Connect_Date__c,date.today().addDays(-10));
        system.assertEquals(ld.Dials_until_First_Conversation__c, null);
        system.assertEquals(ld.Last_Email_Date__c,date.today().addDays(-2));
      } else if (ld.id == lead4.id) {
        system.assertEquals(ld.Dial_Count__c,0);
        system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,0);
        system.assertEquals(ld.Last_Dial_Date__c,null);
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(ld.First_Dial_Date_Time__c,null);
        system.assertEquals(ld.First_Connect_Date__c,date.today().addDays(-1000));
        system.assertEquals(ld.First_Conversation_Date__c,date.today().addDays(-1000));
        system.assertEquals(ld.Dials_until_First_Conversation__c, null);
      }
      //acct 2 Leads
      else if (ld.id == lead2.id) {
        system.assertEquals(ld.Dial_Count__c,3);
        //system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,3);
        system.assertEquals(ld.Last_Dial_Date__c,date.today());
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-5));
        system.assertEquals(ld.First_Dial_Date_Time__c,timeTask.addDays(-5));
        system.assertEquals(ld.First_Conversation_date__c,date.today());
        system.assertEquals(ld.Dials_until_First_Conversation__c, 3);
      } else if (ld.id == lead5.id) {
        system.assertEquals(ld.Dial_Count__c,1);
        //system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,1);
        system.assertEquals(ld.Last_Dial_Date__c,date.today());
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(ld.First_Dial_Date_Time__c,timeTask);
        system.assertEquals(ld.Dials_until_First_Conversation__c, null);
      }
      //acct 3 Leads
      else if (ld.id == lead3.id) {
        system.assertEquals(ld.Dial_Count__c,1);
        //system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,1);
        system.assertEquals(ld.Last_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(ld.Dials_until_First_Conversation__c, 1);
      } else if (ld.id == lead6.id) {
        system.assertEquals(ld.Dial_Count__c,1);
        //system.assertEquals(ld.Dial_Count_Since_Last_Status_Change__c,1);
        system.assertEquals(ld.Last_Dial_Date__c,date.today().addDays(-1));
        system.assertEquals(ld.First_Dial_Date__c,date.today().addDays(-1000));
        system.assertEquals(ld.Dials_until_First_Conversation__c, 1);
      }
      //Inbound Qualified Leads
      else if (ld.id == lead7.id) {
        system.assertEquals(ld.Inbound_Qualified__c, true);
        system.assertEquals(ld.Inbound_Qualified_By__c, UserInfo.getName());
        system.assertEquals(ld.Inbound_Qualified_Date_Stamp__c,date.today());
      } else if (ld.id == lead8.id) {
        system.assertEquals(ld.Inbound_Qualified__c, false);
        system.assertEquals(ld.Inbound_Qualified_By__c, null);
        system.assertEquals(ld.Inbound_Qualified_Date_Stamp__c,null);
      }
    }
    
    

    }
}