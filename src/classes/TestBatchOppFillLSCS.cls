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
private class TestBatchOppFillLSCS {

    static testMethod void myUnitTest() {
        
        /*
        List<Opportunity> oppInsert = new List<Opportunity>();
        Opportunity opp1 = new Opportunity(name = 'Opp 1', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Pipeline');
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(name = 'Opp 2', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(name = 'Opp 3', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Pipeline');
        oppInsert.add(opp3);
        Opportunity opp4 = new Opportunity(name = 'Opp 4', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Upside');
        oppInsert.add(opp4);
        Opportunity opp5 = new Opportunity(name = 'Opp 5', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.add(opp5);
        Opportunity opp6 = new Opportunity(name = 'Opp 6', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Pipeline');
        oppInsert.add(opp6);
        Opportunity opp7 = new Opportunity(name = 'Opp 7', amount = 1000, type = 'New', closeDate = date.today().addDays(30), stageName = 'Pipeline');
        oppInsert.add(opp7);
        
        insert oppInsert;
        
        List<Contact> conInsert = new List<Contact>();
        Contact con1 = new Contact(firstName = 'Test', lastName = 'One', leadSource = 'Prospecting - DiscoverOrg');
        conInsert.add(con1);
        Contact con2 = new Contact(firstName = 'Test', lastName = 'Two', leadSource = 'Prospecting - RainKing');
        conInsert.add(con2);
        Contact con3 = new Contact(firstName = 'Test', lastName = 'Three', leadSource = 'Prospecting - LinkedIn');
        conInsert.add(con3);
        Contact con4 = new Contact(firstName = 'Test', lastName = 'Four', leadSource = 'Prospecting - Other');
        conInsert.add(con4);
        Contact con5 = new Contact(firstName = 'Test', lastName = 'Five', leadSource = 'Tradeshow');
        conInsert.add(con5);
        Contact con6 = new Contact(firstName = 'Test', lastName = 'Six', leadSource = 'Inbound - Product Download');
        conInsert.add(con6);
        Contact con7 = new Contact(firstName = 'Test', lastName = 'Seven', leadSource = 'Third Party');
        conInsert.add(con7);
        Contact con8 = new Contact(firstName = 'Test', lastName = 'Eight', leadSource = 'Inbound - Website');
        conInsert.add(con8);
        
        insert conInsert;
        
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
        Campaign camp7 = new Campaign(name = 'Inbound - Product Download');
        campaigns.add(camp7);
        Campaign camp8 = new Campaign(name = '3PT: Some Garbage');
        campaigns.add(camp8);
        insert campaigns;
        
        List<OpportunityContactRole> ocrInsert = new List<OpportunityContactRole>();
        OpportunityContactRole ocr1 = new OpportunityContactRole(contactId = con1.id, opportunityId = opp1.id, isPrimary = true);
        ocrInsert.add(ocr1);
        OpportunityContactRole ocr2 = new OpportunityContactRole(contactId = con2.id, opportunityId = opp2.id, isPrimary = true);
        ocrInsert.add(ocr2);
        OpportunityContactRole ocr3 = new OpportunityContactRole(contactId = con3.id, opportunityId = opp3.id, isPrimary = true);
        ocrInsert.add(ocr3);
        OpportunityContactRole ocr4 = new OpportunityContactRole(contactId = con4.id, opportunityId = opp4.id, isPrimary = true);
        ocrInsert.add(ocr4);
        OpportunityContactRole ocr5 = new OpportunityContactRole(contactId = con5.id, opportunityId = opp5.id, isPrimary = true);
        ocrInsert.add(ocr5);
        OpportunityContactRole ocr6 = new OpportunityContactRole(contactId = con6.id, opportunityId = opp6.id, isPrimary = false);
        ocrInsert.add(ocr6);
//        OpportunityContactRole ocr7 = new OpportunityContactRole(contactId = con1.id, opportunityId = opp1.id, isPrimary = true);
//        ocrInsert.add(ocr7);
//        OpportunityContactRole ocr8 = new OpportunityContactRole(contactId = con1.id, opportunityId = opp1.id, isPrimary = true);
//        ocrInsert.add(ocr8);
//        OpportunityContactRole ocr9 = new OpportunityContactRole(contactId = con1.id, opportunityId = opp1.id, isPrimary = true);
//        ocrInsert.add(ocr9);
//        OpportunityContactRole ocr10 = new OpportunityContactRole(contactId = con1.id, opportunityId = opp1.id, isPrimary = true);
//        ocrInsert.add(ocr10);
        
        insert ocrInsert;
        
        List<CampaignMember> cmInsert = new List<CampaignMember>();
        //con 5
        CampaignMember cm1 = new CampaignMember(CampaignId = camp1.id, ContactId = con5.id, CreatedDate = DateTime.now().addDays(-3)); 
        cmInsert.add(cm1);
        CampaignMember cm2 = new CampaignMember(CampaignId = camp6.id, ContactId = con5.id, CreatedDate = DateTime.now().addDays(-2)); 
        cmInsert.add(cm2);
        //con 8
        CampaignMember cm3 = new CampaignMember(campaignId = camp1.id, ContactId = con8.id, CreatedDate = DateTime.now().addDays(-3)); 
        cmInsert.add(cm3);
        CampaignMember cm4 = new CampaignMember(campaignId = camp6.id, ContactId = con8.id, CreatedDate = DateTime.now().addDays(-5));
        cmInsert.add(cm4);
        //con 7
        CampaignMember cm5 = new CampaignMember(campaignId = camp8.id, ContactId = con7.id, CreatedDate = DateTime.now().addDays(-5));
        cmInsert.add(cm5);
        CampaignMember cm6 = new CampaignMember(campaignId = camp7.id, ContactId = con7.id, CreatedDate = DateTime.now().addDays(-3));
        cmInsert.add(cm6);
        
        insert cmInsert;
        
        
        List<Task> tskInsert = new List<Task>();
        Task tsk1 = new Task(activityDate = date.today().addDays(-7), subject = 'Demo', type = 'Demo', status = 'Completed', whoId = con7.id, whatId = opp6.id, first_demo__c = true);
        tskInsert.add(tsk1);
        Task tsk2 = new Task(activityDate = date.today().addDays(-5), subject = 'Demo', type = 'Demo', status = 'Completed', whoId = con8.id, whatId = opp7.id, first_demo__c = true);
        tskInsert.add(tsk2);
        Task tsk3 = new Task(activityDate = date.today().addDays(-5), subject = 'Demo', type = 'Demo', status = 'Completed', whoId = con6.id, whatId = opp6.id);
        tskInsert.add(tsk3);
        
        insert tskInsert;
        
        Test.StartTest();
        BatchOppFillLSCS n = new BatchOppFillLSCS();
        n.query = 'SELECT id, name, leadSource, CampaignId FROM Opportunity WHERE id = \'' + opp1.id + '\' OR id = \'' + opp2.id + '\' OR id = \'' + opp3.id + '\' OR id = \'' + opp4.id + '\' OR id = \'' + opp5.id + '\' OR id = \''  + opp6.id + '\' OR id =\'' + opp7.id + '\'';
        ID batchprocessid = Database.executeBatch(n);
        Test.StopTest();
        
        List<Opportunity> afterOpp = [select id, name, leadSource, campaignId from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id];
        Set<id> campaignIds = new Set<id>();
        for (Opportunity currOpp : afterOpp) {
        	campaignIds.add(currOpp.campaignId);
        }
        
        Map<id,Campaign> campaignMap = new map<id,Campaign>([select id, name from Campaign where id in: campaignIds]);
        
        for (Opportunity currOpp : afterOpp) {
            if (currOpp.id == opp1.id) {
                system.assertEquals(currOpp.LeadSource,'Prospecting - DiscoverOrg');
	            system.assert(campaignMap.containsKey(currOpp.campaignId));
            } else if (currOpp.id == opp2.id) {
                system.assertEquals(currOpp.LeadSource,'Prospecting - RainKing');
	            system.assert(campaignMap.containsKey(currOpp.campaignId));
            } else if (currOpp.id == opp3.id) {
                system.assertEquals(currOpp.LeadSource,'Prospecting - LinkedIn');
	            system.assert(campaignMap.containsKey(currOpp.campaignId));     
            } else if (currOpp.id == opp4.id) {
                system.assertEquals(currOpp.LeadSource,'Prospecting - Other');
	            system.assert(campaignMap.containsKey(currOpp.campaignId));     
            } else if (currOpp.id == opp5.id) {
                system.assertEquals(currOpp.LeadSource,'Tradeshow');
                system.assert(campaignMap.containsKey(currOpp.campaignId));
            } else if (currOpp.id == opp6.id) {
                system.assertEquals(currOpp.LeadSource,'Third Party');
                system.assert(campaignMap.containsKey(currOpp.campaignId));
            } else if (currOpp.id == opp7.id) {
                system.assertEquals(currOpp.LeadSource,'Inbound - Website');
                system.assert(campaignMap.containsKey(currOpp.campaignId));
            }
        }
        
       */ 
    } 
}