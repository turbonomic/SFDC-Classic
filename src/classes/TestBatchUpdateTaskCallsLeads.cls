@isTest (seeAllData=true)
private class TestBatchUpdateTaskCallsLeads {

    static testMethod void myUnitTest() {
        
        
        List<Lead> ldInsert = new List<Lead>();
        List<Task> tskInsert = new List<Task>();
        
        Lead ld1 = new Lead(firstName = 'Lead', lastName = 'One', status = 'New', LeadSource = 'Prospecting - DiscoverOrg', company = 'Test Company');
        ldInsert.add(ld1);
        Lead ld2 = new Lead(firstName = 'Lead', lastName = 'Two', status = 'Working', LeadSource = 'Third Party', company = 'Test Company', first_dial_date__c = date.today().addDays(-100), last_Dial_Date__c = date.today().addDays(-50), first_Connect_Date__c = date.today().addDays(-100), first_Conversation_Date__c = date.today().addDays(-100), last_Connect_Date__c = date.today().addDays(-50), last_Conversation_Date__c = date.today().addDays(-50));
        ldInsert.add(ld2);	
        
        Lead ld3 = new Lead(firstName = 'Lead', lastName = 'Three', status = 'New', LeadSource = 'Prospecting - DiscoverOrg', company = 'Test Company', Inbound_Qualified__c = true, Inbound_Qualified_By__c ='Eddie Genao', Inbound_Qualified_Date_Stamp__c = date.today().addDays(-8));
        ldInsert.add(ld3);
        Lead ld4 = new Lead(firstName = 'Lead', lastName = 'Four', status = 'New', LeadSource = 'Prospecting - DiscoverOrg', company = 'Test Company', Inbound_Qualified__c = true, Inbound_Qualified_By__c ='Eddie Genao', Inbound_Qualified_Date_Stamp__c = date.today().addDays(-20));
        ldInsert.add(ld4);					
        
        insert ldInsert;
        
        Campaign tp = new Campaign(name = '3PT: Whatever Campaign');
        insert tp;
        
        CampaignMember cm = new CampaignMember(leadId = ld1.id, campaignId = tp.id, status = 'Responded');
        insert cm;
        
        
        Task tsk1 = new Task(whoId = ld1.id, subject = 'Call', type = 'Call', status = 'Completed', Call_Disposition__c = 'No Answer', ActivityDate = date.today().addDays(-30));
        tskInsert.add(tsk1);
        Task tsk2 = new Task(whoId = ld1.id, subject = 'Call', type = 'Call', status = 'Completed', Call_Disposition__c = 'Connect', ActivityDate = date.today().addDays(-11));
        tskInsert.add(tsk2);
        Task tsk3 = new Task(whoId = ld1.id, subject = 'Call', type = 'Call', status = 'Completed', Call_Disposition__c = 'Connect', ActivityDate = date.today().addDays(-5));
        tskInsert.add(tsk3);
        Task tsk4 = new Task(whoId = ld1.id, subject = 'Call', type = 'Call', status = 'Completed', Call_Disposition__c = 'Conversation', ActivityDate = date.today().addDays(-9));
        tskInsert.add(tsk4);
        Task tsk5 = new Task(whoId = ld1.id, subject = 'Call', type = 'Call', status = 'Completed', Call_Disposition__c = 'Conversation', ActivityDate = date.today().addDays(-3));
        tskInsert.add(tsk5);
        
        insert tskInsert;
        
        
        Test.StartTest();
		BatchUpdateTaskCallsLeads n = new BatchUpdateTaskCallsLeads();
		n.query = 'SELECT id, name, status, first_dial_date__c, last_dial_date__c, dial_count__c, first_connect_date__c, last_Connect_Date__c, first_Conversation_Date__c, last_Conversation_Date__c, ' +
		'Dial_Count_since_Last_Status_Change__c, first_Dial_Date_Time__c, Status_Change_Date__c from Lead where id = \'' + ld1.id + '\'or id = \'' + ld2.id + '\'';
        ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
		
		List<Lead> getLeads = [select id, First_Dial_Date_Time__c, First_Dial_Date__c, Last_Dial_Date__c, Dial_Count__c, Status, Status_Change_Date__c, First_Connect_Date__c, Last_Connect_Date__c, First_Conversation_Date__c, Last_Conversation_Date__c, Dial_Count_Since_Last_Status_Change__c, Dials_until_First_Conversation__c, Inbound_Qualified__c, Inbound_Qualified_By__c, Inbound_Qualified_Date_Stamp__c from Lead where (id =: ld1.id or id =: ld2.id)];
		
		for(Lead l : getLeads) {
			if (l.id == ld1.id) {
				system.assertEquals(l.dial_count__c, 5);
				system.assertEquals(l.First_Dial_Date__c, date.today().addDays(-30));
				system.assertEquals(l.Last_Dial_Date__c, date.today().addDays(-3));
				system.assertEquals(l.First_Connect_Date__c, date.today().addDays(-11));
				system.assertEquals(l.Last_Connect_Date__c,date.today().addDays(-5));
				system.assertEquals(l.First_Conversation_Date__c, date.today().addDays(-9));
				system.assertEquals(l.Last_Conversation_Date__c, date.today().addDays(-3));
				system.assertEquals(l.Dials_until_First_Conversation__c, 3);
			} else if (l.id == ld2.id) {
				system.assertEquals(l.dial_Count__c, 0);
				system.assertEquals(l.First_Dial_Date__c,null);
				system.assertEquals(l.Last_Dial_Date__c,null);
				system.assertEquals(l.First_Connect_Date__c,null);
				system.assertEquals(l.Last_Connect_Date__c,null);
				system.assertEquals(l.First_Conversation_Date__c,null);
				system.assertEquals(l.Last_Conversation_Date__c,null);
				system.assertEquals(l.Dials_until_First_Conversation__c,null);
			} else if (l.id == ld3.id) {
				system.assertEquals(l.Inbound_Qualified__c, true);
				system.assertEquals(l.Inbound_Qualified_By__c, 'Eddie Genao');
				system.assertEquals(l.Inbound_Qualified_Date_Stamp__c,date.today().addDays(-8));
			} else if (l.id == ld4.id) {
				system.assertEquals(l.Inbound_Qualified__c, false);
				system.assertEquals(l.Inbound_Qualified_By__c, null);
				system.assertEquals(l.Inbound_Qualified_Date_Stamp__c,null);
			}
			
		}
        
    }
}