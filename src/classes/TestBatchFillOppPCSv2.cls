@isTest
private class TestBatchFillOppPCSv2 {

    static testMethod void myUnitTest() {

/*
        
        lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;

        Account acct1 = new Account(name = 'Test Company');
        insert acct1;
        
        List<Contact> conList = new List<Contact>();
  
        Contact con1 = new Contact(accountId = acct1.id, lastName = 'One', firstName = 'Test', leadSource = 'Tradeshow');
        conList.add(con1); //con1 is in TSE: VMWorld 2014Q3  <- Campaign IS inserted
        Contact con2 = new Contact(accountId = acct1.id, lastName = 'Two', firstName = 'Test', leadSource = 'Prospecting - DiscoverOrg');
        conList.add(con2); //con2 is in PRO: DiscoverOrg  <- Campaign IS inserted
        Contact con3 = new Contact(accountId = acct1.id, lastName = 'Three', firstName = 'Test', leadSource = 'Prospecting - RainKing');
        conList.add(con3); //con3 is in PRO: RainKing		<- Campaign NOT inserted yet
        Contact con4 = new Contact(accountId = acct1.id, lastName = 'Four', firstName = 'Test', leadSource = 'Prospecting - LinkedIn');
        conList.add(con4); //con4 is in TSE: VMWorld 2014Q3 AND PRO: LinkedIn <- PRO: LinkedIn should win out here - only VMWorld Campaign inserted
        Contact con5 = new Contact(accountId = acct1.id, lastName = 'Five', firstName = 'Test', leadSource = 'Inbound - Website');
        conList.add(con5);
		insert conList;		

        List<Campaign> campaigns = new List<Campaign>();
        
        Campaign camp1 = new Campaign(name = 'TSE: VMWorld 2014Q3');
        campaigns.add(camp1);
        Campaign camp2 = new Campaign(name = 'PRO: DiscoverOrg');
        campaigns.add(camp2);
        Campaign camp3 = new Campaign(name = 'PRO: RainKing');
        campaigns.add(camp3);
        Campaign camp4 = new Campaign(name = 'PRO: LinkedIn');
        campaigns.add(camp4);
        Campaign camp5 = new Campaign(name = 'PRO: Prospecting');
        campaigns.add(camp5);
        Campaign camp6 = new Campaign(name = 'INB: Website');
        campaigns.add(camp6);
        insert campaigns;
 
        
        CampaignMember cm1 = new CampaignMember(CampaignId = camp1.id, ContactId = con1.id); 
        insert cm1;
        CampaignMember cm2 = new CampaignMember(CampaignId = camp2.id, ContactId = con2.id); 
        insert cm2;
        CampaignMember cm3 = new CampaignMember(campaignId = camp1.id, ContactId = con4.id); 
        insert cm3;
        CampaignMember cm4 = new CampaignMember(campaignId = camp6.id, ContactId = con5.id);
        insert cm4;
        
        List<Opportunity> oppList = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity(accountId = acct1.id, name = 'Test Opp', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));
        oppList.add(opp1);
        Opportunity opp2 = new Opportunity(accountId = acct1.id, name = 'Test Opp 2', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(45));
        oppList.add(opp2);
		Opportunity opp3 = new Opportunity(accountId = acct1.id, name = 'Test Opp 3', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(45));
        oppList.add(opp3);
        Opportunity opp4 = new Opportunity(accountId = acct1.id, name = 'Test Opp 4', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(60));
        oppList.add(opp4);
        Opportunity opp5 = new Opportunity(accountId = acct1.id, name = 'Test Opp 5', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(60));
        oppList.add(opp5);
        insert oppList;
        
        List<Task> tskList = new List<Task>();
        
        Task task1 = new Task(whoId = con1.id, whatid = opp1.id, subject = 'Demo 2', type = 'Demo', activityDate = Date.today(), status = 'Completed');
        tskList.add(task1);
        Task task2 = new Task(whoId = con2.id, whatid = opp1.id, subject = 'Demo', type = 'Demo', activityDate = Date.today().addDays(-30), status = 'Completed');
        tskList.add(task2);
        Task task3 = new Task(whoId = con3.id, whatid = opp2.id, subject = 'Demo', type = 'Demo', activityDate = Date.today().addDays(-30), status = 'Completed');
        tskList.add(task3);
        Task task4 = new Task(whoId = con4.id, whatid = opp3.id, subject = 'Demo', type = 'Demo', activityDate = Date.today().addDays(-30), status = 'Completed');
        tskList.add(task4);
        Task task5 = new Task(whoId = con1.id, whatId = opp4.id, subject = 'Demo', type = 'Demo', activityDate = Date.today().addDays(-30), status = 'Completed');
        tskList.add(task5);
        Task task6 = new Task(whoId = con5.id, whatId = opp5.id, subject = 'Demo', type = 'Demo', activityDate = Date.today().addDays(-30), status = 'Completed');
        tskList.add(task6);
        insert tskList;
        
        
        
        
        Test.StartTest();
      	BatchFillOppPCSv2 n = new BatchFillOppPCSv2();
      	n.query = 'SELECT id, name, CampaignId FROM Opportunity WHERE id = \'' + opp1.id + '\' OR id = \'' + opp2.id + '\' OR id = \'' + opp3.id + '\' OR id = \'' + opp4.id + '\' OR id = \'' + opp5.id + '\'';
      	ID batchprocessid = Database.executeBatch(n);
      	Test.StopTest();
      	
      	Opportunity oppAfter = [select id, name, campaign.Name from Opportunity where id =: opp1.id ];
      	system.assertEquals(oppAfter.Campaign.Name,'PRO: DiscoverOrg');
 		system.assertEquals(oppAfter.campaignId, camp2.id);

 		Opportunity oppAfter2 = [select id, name, campaign.Name from Opportunity where id =: opp2.id ];
 		system.assertEquals(oppAfter2.Campaign.Name,'PRO: RainKing');
 		system.assertEquals(oppAfter2.campaignId, camp3.id);
 		
 		Opportunity oppAfter3 = [select id, name, campaign.Name from Opportunity where id =: opp3.id ];
 		system.assertEquals(oppAfter3.Campaign.Name,'PRO: LinkedIn');
 		system.assertEquals(oppAfter3.campaignId, camp4.id);
 		
 		Opportunity oppAfter4 = [select id, name, Campaign.Name, leadSource from Opportunity where id =: opp4.id ];
 		system.assertEquals(oppAfter4.Campaign.Name,'TSE: VMWorld 2014Q3');
 		system.assertEquals(oppAfter4.LeadSource,'Tradeshow');
 		
 		Opportunity oppAfter5 = [select id, name, Campaign.Name, leadSource from Opportunity where id =: opp5.id ];
 		system.assertEquals(oppAfter5.Campaign.Name,'INB: Website');
 		system.assertEquals(oppAfter5.LeadSource,'Inbound - Website');
*/
        
    }
}