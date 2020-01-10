/**
* Case 1: All Sla's met
* Case 2: Only SLA 1 (Dials)
* Case 3: Only SLA 2 & SLA 1 met (dials)
* Case 4: Only SLA 3 met (dials)
* Case 5: Demo Scheduled (Closed SLA)
* Case 6: Normal After Hours
* Case 7: Friday After Hours
* Case 8: Saturday After Hours
* Case 9: Multiple SLAs (make sure only most recent grabbed)
* Case 10: Rapid Fire SLAs (make sure date caps work properly)
* Case 11: Closed (Expired) - no SLAs met
* Case 12: SLA 1 met through Conversion*** (LeadMethods.LeadDispositionSlaMet())
* Case 13: SLA 1 met through Disposition (LeadMethods.LeadDispositionSlaMet())***
* Case 14: SLA 1 met through Disposition (ContactMethods.ContactDispositionSlaMet())***
* Case 15: Manually dispositioned SLA
* Case 16: Meeting Set (Close SLA)
* Case 17: Both Meeting Set and Demo Scheduled (Demo should take precedence)
* Case 18: Meeting set and Demo scheduled on recently closed SLA (For code coverage)
*
 */
@isTest
private class TestBatchUpdateSLATracking {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        
        List<Account> acctInsert = new List<Account>();
		List<Lead> ldInsert = new List<Lead>();
		List<Contact> conInsert = new List<Contact>();
		List<Campaign> campaignInsert = new List<Campaign>();
		List<CampaignMember> cmInsert = new List<CampaignMember>();
		List<Task> tskInsert = new List<Task>();
		List<SLA__c> slaInsert = new List<SLA__c>();
		
		List<Time_Zone_Offset__c> timeZoneCS = new List<Time_Zone_Offset__c>();
    	Time_Zone_Offset__c emeaCS = new Time_Zone_Offset__c(Name = 'EMEA' , GMT_Offset__c = 1);
    	Time_Zone_Offset__c usCS = new Time_Zone_Offset__c(Name = 'NORAM' , GMT_Offset__c = -4);
    	timeZoneCS.add(emeaCS); timeZoneCS.add(usCS); 
    	insert timeZoneCS;
		
		Account a1 = new Account(name = 'acct1');
		Account a2 = new Account(name = 'acct2');
		Account a3 = new Account(name = 'acct3');
        Account a4 = new Account(name = 'acct4');
        Account a5 = new Account(name = 'acct5');
        
        acctInsert.add(a1); acctInsert.add(a2); acctInsert.add(a3); acctInsert.add(a4); acctInsert.add(a5);
        insert acctInsert;
        
        Lead ld1 = new Lead(Account__c = a1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', CreatedDate = System.now().addDays(-30));
        Lead ld2 = new Lead(Account__c = a2.id, FirstName = 'Lead', LastName = 'Two', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', CreatedDate = System.now().addDays(-30));
        Lead ld3 = new Lead(Account__c = a2.id, FirstName = 'Lead', LastName = 'Three', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', CreatedDate = System.now().addDays(-30));
        Lead ld4 = new Lead(FirstName = 'Lead', LastName = 'Four', Company = 'Acct33', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', CreatedDate = System.now().addDays(-30));
    	Lead ld5 = new Lead(FirstName = 'Lead', LastName = 'Five', Company = 'Acct45', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', CreatedDate = System.now().addDays(-30));
    	Lead ld6 = new Lead(FirstName = 'Lead', LastName = 'Six', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'United States', CreatedDate = System.now());
    	Lead ld7 = new Lead(FirstName = 'Lead', LastName = 'Seven', Company = 'Acct77', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'United States', CreatedDate = System.now());
    	
    	ldInsert.add(ld1); ldInsert.add(ld2); ldInsert.add(ld3); ldInsert.add(ld4); ldInsert.add(ld5); ldInsert.add(ld6); ldInsert.add(ld7);
    	insert ldInsert;
    	
    	Contact con1 = new Contact(AccountId = a1.id, FirstName = 'Con', LastName = 'One', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-30));
    	Contact con2 = new Contact(AccountId = a1.id, FirstName = 'Con', LastName = 'Two', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-30));
    	Contact con3 = new Contact(AccountId = a2.id, FirstName = 'Con', LastName = 'Three', LeadSource = 'Inbound - website', MailingCountry = 'Canada', CreatedDate = System.now().addDays(-30));
    	Contact con4 = new Contact(AccountId = a2.id, FirstName = 'Con', LastName = 'Four', LeadSource = 'Inbound - website', MailingCountry = 'France', CreatedDate = System.now().addDays(-30));
    	Contact con5 = new Contact(AccountId = a3.id, FirstName = 'Con', LastName = 'Five', LeadSource = 'Inbound - website', MailingCountry = 'United Kingdom', CreatedDate = System.now().addDays(-30));
		Contact con6 = new Contact(AccountId = a3.id, FirstName = 'Con', LastName = 'Six', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-31));
		Contact con7 = new Contact(AccountId = a4.id, FirstName = 'Con', LastName = 'Seven', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now());
		Contact con8 = new Contact(AccountId = a5.id, FirstName = 'Con', LastName = 'Eight', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now());
		Contact con9 = new Contact(AccountId = a5.id, FirstName = 'Con', LastName = 'Nine', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now());
		Contact con10 = new Contact(AccountId = a5.id, FirstName = 'Con', LastName = 'Ten', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now());
		Contact con11 = new Contact(AccountId = a5.id, FirstName = 'Con', LastName = 'Eleven', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now());
		
		    
    	conInsert.add(con1); conInsert.add(con2); conInsert.add(con3); conInsert.add(con4); conInsert.add(con5); conInsert.add(con6); conInsert.add(con7); conInsert.add(con8); conInsert.add(con9); conInsert.add(con10); conInsert.add(con11);
    	insert conInsert;
    	
    	
    	Campaign c1 = new Campaign(Name = 'INB: Website', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true);
        Campaign c2 = new Campaign(Name = 'INB: Webinar', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	Campaign c3 = new Campaign(Name = 'INB: Product Download', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	Campaign c4 = new Campaign(Name = 'INB: Testing', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	
    	
    	campaignInsert.add(c1); campaignInsert.add(c2); campaignInsert.add(c3); campaignInsert.add(c4);
    	insert campaignInsert;
    	
    	//Create control hour to ensure SLAs 1-5 are created during daytime hours
    	Integer currHour = system.now().hour();
    	Integer hoursToAdjust = 10 - currHour;
    	
    	SLA__c sla1 = new SLA__c(Campaign__c = c1.id, lead__c = ld1.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust)); //All SLAs met
    	SLA__c sla2 = new SLA__c(Campaign__c = c1.id, lead__c = ld2.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust)); //Only SLA 1 met
    	SLA__c sla3 = new SLA__c(Campaign__c = c1.id, lead__c = ld3.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust)); //SLA 2 met
    	
    	SLA__c sla4 = new SLA__c(Campaign__c = c1.id, lead__c = ld4.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Close_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust));
    	SLA__c sla5 = new SLA__c(Campaign__c = c1.id, contact__c = con1.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Close_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust));
    	
    	//Calculate the most recent Thursday dateTimes for SLAs 6, 7, and 8
		DateTime dt = System.now();
		
		Map<String, Integer> dayofWeekMap = new Map<String, Integer>();
		dayofWeekMap.put('Sun', -10); dayofWeekMap.put('Mon', -11); dayofWeekMap.put('Tue', -12); dayofWeekMap.put('Wed', -13); dayofWeekMap.put('Thu', -14); dayofWeekMap.put('Fri', -15); dayofWeekMap.put('Sat', -16);
		
		Date tempDate = dt.Date().addDays(dayOfWeekMap.get(dt.format('EEE')));
		Time tempTime = Time.newInstance(19, 0, 0, 0);
		DateTime dt1 = DateTime.newInstance(tempDate,tempTime);
		//DateTime dtGMT = DateTime.newInstanceGMT(tempDate,tempTime);
		//DateTime dt1 = dtGMT.addHours(-5);
		
		//system.debug('Custom Date for SLAs 6, 7, and 8: ' + dt1 + '\n' + 'Day of Week: ' + dt1.format('EEE'));
    	
    	SLA__c sla6 = new SLA__c(Campaign__c = c1.id, Lead__c = ld5.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = dt1);
        SLA__c sla7 = new SLA__c(Campaign__c = c1.id, Contact__c = con2.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = dt1.addDays(1));
        SLA__c sla8 = new SLA__c(Campaign__c = c1.id, Contact__c = con3.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other', CreatedDate = dt1.addDays(2));
        
        
        SLA__c sla9a = new SLA__c(Campaign__c = c1.id, Contact__c = con4.id, SLA_Status__c = 'Closed (Expired)', Expiration_Date__c = system.now().addDays(-30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-60));
        SLA__c sla9b = new SLA__c(Campaign__c = c1.id, Contact__c = con4.id, SLA_Status__c = 'Closed (New SLA Came In)', Expiration_Date__c = system.now().addDays(15), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-15));
        SLA__c sla9c = new SLA__c(Campaign__c = c1.id, Contact__c = con4.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(20), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-10));
        
        
        
        SLA__c sla10a = new SLA__c(Campaign__c = c1.id, Contact__c = con5.id, SLA_Status__c = 'Closed (New SLA Came In)', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addHours(-1));
        SLA__c sla10b = new SLA__c(Campaign__c = c2.id, Contact__c = con5.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addMinutes(-30));
        
        SLA__c sla11 = new SLA__c(Campaign__c = c2.id, Contact__c = con6.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(-1), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addDays(-31));
        
        SLA__c sla12 = new SLA__c(Campaign__c = c1.id, Lead__c = ld6.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addMinutes(-30));
        SLA__c sla13 = new SLA__c(Campaign__c = c1.id, Lead__c = ld7.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addMinutes(-30));
        SLA__c sla14 = new SLA__c(Campaign__c = c1.id, Contact__c = con7.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', CreatedDate = System.now().addMinutes(-30));
        
        SLA__c sla15 = new SLA__c(Campaign__c = c1.id, Contact__c = con8.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', Account_Status_Stamped__c = 'Active Opportunity');
        
        SLA__c sla16 = new SLA__c(Campaign__c = c1.id, Contact__c = con9.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', Account_Status_Stamped__c = 'Active Opportunity', CreatedDate = System.now().addMinutes(-40));
        SLA__c sla17 = new SLA__c(Campaign__c = c1.id, Contact__c = con10.id, SLA_Status__c = 'Open', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', Account_Status_Stamped__c = 'Active Opportunity', CreatedDate = System.now().addMinutes(-40));
        SLA__c sla18 = new SLA__c(Campaign__c = c1.id, Contact__c = con11.id, SLA_Status__c = 'Closed (Demo Scheduled)', Expiration_Date__c = date.today().addDays(30), Web_Form_Fill__c = 'Other', Account_Status_Stamped__c = 'Active Opportunity', CreatedDate = System.now().addMinutes(-40), Close_Date__c = system.now().addHours(2));
        
        slaInsert.add(sla1); slaInsert.add(sla2); slaInsert.add(sla3); slaInsert.add(sla4); slaInsert.add(sla5);
        slaInsert.add(sla6); slaInsert.add(sla7); slaInsert.add(sla8); slaInsert.add(sla9a); slaInsert.add(sla9b); slaInsert.add(sla9c); slaInsert.add(sla10a); slaInsert.add(sla10b);
        slaInsert.add(sla11); slaInsert.add(sla12); slaInsert.add(sla13); slaInsert.add(sla14); slaInsert.add(sla15);
        slaInsert.add(sla16); slaInsert.add(sla17); slaInsert.add(sla18);
        
        insert slaInsert;
    	
    	//Create and Insert Tasks
    	
    	//SLA 1 Tasks
    	Task tsk1 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust));
    	Task tsk2 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-27).addHours(-5));
    	Task tsk3 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-20));
    	Task tsk4 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-21));
    	Task tsk5 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-15));
    	Task tsk6 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-10));
    	Task tsk7 = new Task(Type = 'Call', WhoId = ld1.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-5));
    	
    	//SLA 2 Task
    	Task tsk8 = new Task(Type = 'Call', WhoId = ld2.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust+10));
    	
    	//SLA 3 Task
    	Task tsk9 = new Task(Type = 'Call', WhoId = ld3.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust));
    	
    	//SLA 4 Tasks
    	Task tsk10 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-5));
    	Task tsk11 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-4));
    	Task tsk12 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-10));
    	Task tsk13 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-15));
    	Task tsk14 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-25));
    	Task tsk15 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-3));
    	Task tsk16 = new Task(Type = 'Call', WhoId = ld4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-26));
    	
    	//SLA 5 Task
    	Task tsk17 = new Task(Type = 'Demo', WhoId= con1.id, Status='Not Started', Subject ='Call', ActivityDate=Date.Today().addDays(-10), CreatedDate = System.now().addDays(-28).addHours(hoursToAdjust+1));
    	
    	//SLA 6 Task
    	Task tsk18 = new Task(Type = 'Call', WhoId= ld5.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=dt1.date().addDays(4), CreatedDate = dt1.addDays(1).addHours(-6));
    	
    	//SLA 7 Task
    	Task tsk19 = new Task(Type = 'Call', WhoId= con2.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=dt1.date().addDays(3), CreatedDate = dt1.addDays(4).addHours(-6));
    	
    	//SLA 8 Task
    	Task tsk20 = new Task(Type = 'Call', WhoId= con3.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=dt1.date().addDays(2), CreatedDate = dt1.addDays(4).addHours(-6));
    	
    	//SLA 9 Tasks
    	Task tsk21 = new Task(Type = 'Call', WhoId = con4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-20), CreatedDate = System.now().addDays(-15));
    	Task tsk22 = new Task(Type = 'Call', WhoId = con4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today(), CreatedDate = System.now().addHours(-6));
    	Task tsk23 = new Task(Type = 'Call', WhoId = con4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-12), CreatedDate = System.now().addDays(-10).addMinutes(25));
    	Task tsk24 = new Task(Type = 'Call', WhoId = con4.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'Conversation', ActivityDate=Date.Today().addDays(-12), CreatedDate = System.now().addDays(-10).addMinutes(24));
    	
    	//SLA 10 Tasks
    	Task tsk25 = new Task(Type = 'Call', WhoId = con5.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(-20), CreatedDate = System.now().addMinutes(-20));
    	
    	//SLA 16 Tasks
    	Task tsk26 = new Task(Type = 'First Meeting', WhoId = con9.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(2));
    	
    	//SLA 17 Tasks
    	Task tsk27 = new Task(Type = 'Discovery Call', WhoId = con10.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(2), CreatedDate = System.now().addMinutes(-20));
    	Task tsk28 = new Task(Type = 'Demo', WhoId = con10.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(3), CreatedDate = System.now().addMinutes(-30));
    	
    	//SLA 18 Tasks
    	Task tsk29 = new Task(Type = 'Key Globals Exec Meeting', WhoId = con11.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(1), CreatedDate = System.now().addMinutes(-30));
    	Task tsk30 = new Task(Type = 'Demo', WhoId = con11.id, Status='Completed', Subject ='Call', Call_Disposition__c = 'No Answer', ActivityDate=Date.Today().addDays(2), CreatedDate = System.now().addMinutes(-20));
    	
    	tskInsert.add(tsk1); tskInsert.add(tsk2); tskInsert.add(tsk3); tskInsert.add(tsk4); tskInsert.add(tsk5);
        tskInsert.add(tsk6); tskInsert.add(tsk7); tskInsert.add(tsk8); tskInsert.add(tsk9); tskInsert.add(tsk10);
        tskInsert.add(tsk11); tskInsert.add(tsk12); tskInsert.add(tsk13); tskInsert.add(tsk14); tskInsert.add(tsk15);
        tskInsert.add(tsk16); tskInsert.add(tsk17); tskInsert.add(tsk18); tskInsert.add(tsk19); tskInsert.add(tsk20);
        tskInsert.add(tsk21); tskInsert.add(tsk22); tskInsert.add(tsk23); tskInsert.add(tsk24); tskInsert.add(tsk25);
        tskInsert.add(tsk26); tskInsert.add(tsk27); tskInsert.add(tsk28); tskInsert.add(tsk29); tskInsert.add(tsk30);
		insert tskInsert;
    	
    	
        //Create Campaign Members for Cases 9 and 10
        CampaignMember cm1 = new CampaignMember(CampaignId = c3.id, ContactId = con4.id, status = 'Responded');
        CampaignMember cm2 = new CampaignMember(CampaignId = c3.id, ContactId = con5.id, status = 'Responded');
        
        cmInsert.add(cm1); cmInsert.add(cm2);
        insert cmInsert;
        
        CampaignMember cm3 = new CampaignMember(CampaignId = c4.id, ContactId = con5.id, status = 'Responded');
        insert cm3;
       
        //Convert Lead for Case 12 and Close Lead for Case 13
       	Map<id,Lead> leadQuery = new Map<id,Lead>([SELECT id, status FROM LEAD WHERE id =: ld6.id OR id =: ld7.id ]);
       	Lead ld7update;
       	
       	Database.LeadConvert lc = new Database.LeadConvert();
       	
       	
       	for (lead l : leadQuery.values()) {
       		if (l.id == ld6.id) {
       			lc.setLeadId(l.id);
       		}
       		else if (l.id == ld7.id) {
       			ld7update = l;
       			ld7update.status = 'Closed';
       		}
       	}
       	
       	lc.setConvertedStatus('New');
       	lc.setDoNotCreateOpportunity(true);
       	Database.LeadConvertResult lcr = Database.convertLead(lc);
       	System.assert(lcr.isSuccess());
        update ld7update;
        
        
        //Close Contact for Case 14
        Contact con7update = [SELECT id, Contact_Status__c FROM Contact WHERE id =: con7.id LIMIT 1];
        con7update.Contact_Status__c = 'Closed';
        update con7update;
        
        //Manually Disposition SLA for Case 15
        SLA__c slaToClose = [SELECT id, Disposition_Reason_Manual__c, Disposition_Detail__c FROM SLA__c WHERE id =: sla15.id LIMIT 1]; 
        slaToClose.Disposition_Reason_Manual__c = 'Recent Meeting';
        slaToClose.Disposition_Detail__c = 'Testing';
        update slaToClose;

		//Run Batch
		
		
	    Test.StartTest();
	    BatchUpdateSLATracking n = new BatchUpdateSLATracking();
	    n.query = 'SELECT id, SLA_1_Met__c, SLA_2_Met__c, SLA_3_Met__c, SLA_Status__c, Close_Date__c, Campaign__c, Contact__c, Lead__c, Expiration_Date__c, Rapid_Response_Eligible__c, CreatedDate, Demo__c, SLA_Dial_Count__c, SLA_Connect_Count__c, SLA_Conversation_Count__c, Lead_Contact_Name__c FROM SLA__c';
	    ID batchprocessid = Database.executeBatch(n);
	    Test.StopTest();
		
		
		//Query for SLA Assertions
		Map<id, SLA__c> slaAssertMap = new Map<id, SLA__c>([SELECT id, SLA_1_Met__c, SLA_2_Met__c, SLA_3_Met__c, SLA_Status__c, Close_Date__c, Campaign__c, Contact__c, Lead__c, Expiration_Date__c, Demo__c, SLA_Dial_Count__c, SLA_Connect_Count__c, SLA_Conversation_Count__c  FROM SLA__c WHERE Campaign__c =: c1.id OR Campaign__c =: c2.id OR Campaign__c =: c3.id OR Campaign__c =: c4.id]);
		
		for (SLA__c s: slaAssertMap.values()) {
			if (s.id == sla1.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,true);
				System.assertEquals(s.SLA_Status__c, 'Closed (SLA Met)');
				System.assertEquals(s.Close_Date__c.date(),System.now().date()); 
				System.assertEquals(s.Demo__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,7);
				System.assertEquals(s.SLA_Connect_Count__c,2);
				System.assertEquals(s.SLA_Conversation_Count__c,2);
				
			}
			else if (s.id == sla2.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				//System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,1);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla3.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,1);
			}
			else if (s.id == sla4.id) {
				System.assertEquals(s.SLA_1_Met__c,false);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,true);
				System.assertEquals(s.SLA_Status__c, 'Closed (SLA Met)');
				System.assertEquals(s.Close_Date__c.date(),System.now().date());
				System.assertEquals(s.Demo__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,7);
				System.assertEquals(s.SLA_Connect_Count__c,4);
				System.assertEquals(s.SLA_Conversation_Count__c,1);
			}
			else if (s.id == sla5.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,true);
				System.assertEquals(s.SLA_Status__c, 'Closed (Demo Scheduled)');
				System.assertEquals(s.Close_Date__c,tsk17.CreatedDate);
				System.assertEquals(s.Demo__c,tsk17.id);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla6.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla7.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,1);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla8.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,1);
			}
			
			else if (s.id == sla9a.id) {
				System.assertEquals(s.SLA_1_Met__c,false);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (Expired)');
				System.assertEquals(s.SLA_Dial_Count__c,null);
				System.assertEquals(s.SLA_Connect_Count__c,null);
				System.assertEquals(s.SLA_Conversation_Count__c,null);
			}
			else if (s.id == sla9b.id) {
				System.assertEquals(s.SLA_1_Met__c,false);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (New SLA Came In)');
				System.assertEquals(s.SLA_Dial_Count__c,null);
				System.assertEquals(s.SLA_Connect_Count__c,null);
				System.assertEquals(s.SLA_Conversation_Count__c,null);
			}
			else if (s.id == sla9c.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (New SLA Came In)');
				System.assertEquals(s.Close_Date__c.Date(),System.now().Date());
				System.assertEquals(s.SLA_Dial_Count__c,3);
				System.assertEquals(s.SLA_Connect_Count__c,1);
				System.assertEquals(s.SLA_Conversation_Count__c,1);
			}
			
			else if (s.contact__c == con4.id && s.SLA_Status__c == 'Open') {
				System.assertEquals(s.SLA_1_Met__c,false);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.Campaign__c, c3.id);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.contact__c == con5.id && s.SLA_Status__c == 'Open') {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.Close_Date__c,null);
				System.assertEquals(s.Campaign__c, c4.id);
				System.assertEquals(s.SLA_Dial_Count__c,1);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla11.id) {
				System.assertEquals(s.SLA_1_Met__c,false);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (Expired)');
				System.assertEquals(s.Close_Date__c,s.Expiration_Date__c);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla12.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Open');
				System.assertEquals(s.Close_Date__c,null);
				System.assert(s.Contact__c != null);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla13.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (Lead Dispositioned)');
				System.assertEquals(s.Close_Date__c.date(),date.Today());
				System.assertEquals(s.Contact__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla14.id) {
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Status__c, 'Closed (Contact Dispositioned)');
				System.assertEquals(s.Close_Date__c.date(),date.Today());
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla15.id) {
				System.assertEquals(s.SLA_Status__c, 'Closed (Manually Dispositioned)');
				System.assert(s.Close_Date__c != null);
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,false);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla16.id) {
				System.assertEquals(s.SLA_Status__c, 'Closed (Meeting Set)');
				System.assertEquals(s.Close_Date__c.date(), Date.today());
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,true);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla17.id) {
				System.assertEquals(s.SLA_Status__c, 'Closed (Demo Scheduled)');
				System.assertEquals(s.Close_Date__c, tsk28.CreatedDate);
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,true);
				System.assertEquals(s.Demo__c,tsk28.id);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			else if (s.id == sla18.id) {
				System.assertEquals(s.SLA_Status__c, 'Closed (Demo Scheduled)');
				System.assert(s.Close_Date__c != null);
				System.assertEquals(s.SLA_1_Met__c,true);
				System.assertEquals(s.SLA_2_Met__c,true);
				System.assertEquals(s.SLA_3_Met__c,false);
				System.assertEquals(s.Demo__c,null);
				System.assertEquals(s.SLA_Dial_Count__c,0);
				System.assertEquals(s.SLA_Connect_Count__c,0);
				System.assertEquals(s.SLA_Conversation_Count__c,0);
			}
			
		}
    
    }
}