@isTest
private class TestBatchUpdateSocketAutomations {
	static testMethod void myUnitTest() {
		lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
		
		Account acct1 = new Account(name = 'Test Company');
        insert acct1;
		
		List<Opportunity> oppList = new List<Opportunity>();
		Opportunity opp1 = new Opportunity(accountId = acct1.id, name = 'Test Opp', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));
        oppList.add(opp1);
        Opportunity opp2 = new Opportunity(accountId = acct1.id, name = 'Test Opp 2', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(45), First_Socket_Automation_Date__c = Date.today().addDays(-1));
        oppList.add(opp2);
        insert oppList;
		
		List<Socket_Automation__c> saList = new List<Socket_Automation__c>();
        Socket_Automation__c sa1 = new Socket_Automation__c(Opportunity__c = opp1.id, Date_of_Automation__c = Date.today(), number_of_sockets_automated__c = 1);
        saList.add(sa1);
        Socket_Automation__c sa2 = new Socket_Automation__c(Opportunity__c = opp1.id, Date_of_Automation__c = Date.today().addDays(-30), number_of_sockets_automated__c = 1);
        saList.add(sa2);
        Socket_Automation__c sa3 = new Socket_Automation__c(Opportunity__c = opp2.id, Date_of_Automation__c = Date.today().addDays(-30), number_of_sockets_automated__c = 1);
        saList.add(sa3);
        Socket_Automation__c sa4 = new Socket_Automation__c(Opportunity__c = opp2.id, Date_of_Automation__c = Date.today(), number_of_sockets_automated__c = 1);
        saList.add(sa4);
        insert saList;
        
        Test.StartTest();
      	BatchUpdateSocketAutomations n = new BatchUpdateSocketAutomations();
      	n.query = 'SELECT id, name, stageName, first_socket_automation_date__c FROM Opportunity WHERE (stageName != \'Closed Lost\' AND stageName !=  \'Closed Won\' AND stageName != \'Unqualified\') AND (Type = \'New\' OR Type = \'Upsell\')';
      	//n.query = 'SELECT id, name, first_socket_automation_date__c, stageName FROM Opportunity WHERE id = \'' + opp1.id + '\' OR id = \'' + opp2.id + '\'';
      	ID batchprocessid = Database.executeBatch(n,5);
      	Test.StopTest();
      	
      	Opportunity oppAfter = [select id, name, first_socket_automation_date__c from Opportunity where id =: opp1.id ];
      	system.assertEquals(date.today().addDays(-30), oppAfter.first_socket_automation_date__c);
      	Opportunity oppAfter2 = [select id, name, first_socket_automation_date__c from Opportunity where id =: opp2.id ];
      	system.assertEquals(date.today().addDays(-30), oppAfter2.first_socket_automation_date__c);
	}

}