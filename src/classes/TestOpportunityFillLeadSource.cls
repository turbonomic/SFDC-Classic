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
@isTest
private class TestOpportunityFillLeadSource {

    static testMethod void myUnitTest() {
/*        
        Map<id,Opportunity> oppInsert = new Map<id,Opportunity>();
        Map<id,Opportunity> oppUpdate = new Map<id,Opportunity>();
        List<Campaign> campInsert = new List<Campaign>();
        
        Opportunity opp1 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp1.id,opp1);
        Opportunity opp2 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp2.id,opp2);
        Opportunity opp3 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp3.id,opp3); 
        Opportunity opp4 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp4.id,opp4);
        Opportunity opp5 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp5.id,opp5);
        Opportunity opp6 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp6.id,opp6);
        Opportunity opp7 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify'); 
        oppInsert.put(opp7.id,opp7);
        Opportunity opp8 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify'); 
        oppInsert.put(opp8.id,opp8);
        Opportunity opp9 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify'); 
        oppInsert.put(opp9.id,opp9);
        Opportunity opp10 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify'); 
        oppInsert.put(opp10.id,opp10);
        Opportunity opp11 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp11.id,opp11);
        Opportunity opp12 = new Opportunity(amount = 1000.00, name = 'Test Opp', closeDate = date.today().addDays(30), stageName = 'Identify');
        oppInsert.put(opp12.id,opp12);
        
        insert oppInsert.values();
        
        Campaign c1 = new Campaign(Name = 'TSE: Test Campaign');
        campInsert.add(c1);
        Campaign c2 = new Campaign(Name = '3PT: Test Campaign');
        campInsert.add(c2);
        Campaign c3 = new Campaign(Name = 'CCL: Test Campaign');
        campInsert.add(c3);
        Campaign c4 = new Campaign(Name = 'INB: Webinar');
        campInsert.add(c4);
        Campaign c5 = new Campaign(Name = 'INB: Product Download');
        campInsert.add(c5);
        Campaign c6 = new Campaign(Name = 'INB: Website');
        campInsert.add(c6);
        Campaign c7 = new Campaign(Name = 'PRO: DiscoverOrg');
        campInsert.add(c7);
        Campaign c8 = new Campaign(Name = 'PRO: LinkedIn');
        campInsert.add(c8);
        Campaign c9 = new Campaign(Name = 'PRO: Direct Sales');
        campInsert.add(c9);
        Campaign c10 = new Campaign(Name = 'PRO: RainKing');
        campInsert.add(c10);
        Campaign c11 = new Campaign(Name = 'PRO: Test Campaign');
        campInsert.add(c11);
        Campaign c12 = new Campaign(Name = 'CHN: Test Campaign');
        campInsert.add(c12);
        
        insert campInsert;
        
        List<Opportunity> afterOppList2 = [select id, CampaignId from Opportunity where id in: oppINsert.keySet()];
        
        for (Opportunity opp : afterOppList2) {
        	if (opp.id == opp1.id) {
        		opp.Campaign = c1;

        	} else if (opp.id == opp2.id) {
        		opp.Campaign = c2;
        	} else if (opp.id == opp3.id) {
        		opp.Campaign = c3;
        	} else if (opp.id == opp4.id) {
        		opp.Campaign = c4;
        	} else if (opp.id == opp5.id) {
        		opp.Campaign = c5;
        	} else if (opp.id == opp6.id) {
        		opp.Campaign = c6;
        	} else if (opp.id == opp7.id) {
        		opp.Campaign = c7;
        	} else if (opp.id == opp8.id) {
        		opp.Campaign = c8;
        	} else if (opp.id == opp9.id) {
        		opp.Campaign = c9;
        	} else if (opp.id == opp10.id) {
        		opp.Campaign = c10;
        	} else if (opp.id == opp11.id) {
        		opp.Campaign = c11;
        	} else if (opp.id == opp12.id) {
        		opp.Campaign = c12;
        	} 
        	oppUpdate.put(opp.id,opp);
        }
        

        update oppUpdate.values();
        
        List<Opportunity> afterOppList = [select id, LeadSource from Opportunity where id in: oppInsert.keySet()];
        for (Opportunity opp : afterOppList) {
        	if (opp.id == opp1.id) {
        		system.assertEquals(opp.LeadSource,'Tradeshow');
        	} else if (opp.id == opp2.id) {
        		system.assertEquals(opp.LeadSource,'Third Party');
        	} else if (opp.id == opp3.id) {
        		system.assertEquals(opp.LeadSource,'Cold Call List');
        	} else if (opp.id == opp4.id) {
        		system.assertEquals(opp.LeadSource,'Inbound - Webinar');
        	} else if (opp.id == opp5.id) {
        		system.assertEquals(opp.LeadSource,'Inbound - Product Download');
        	} else if (opp.id == opp6.id) {
        		system.assertEquals(opp.LeadSource,'Inbound - Website');
        	} else if (opp.id == opp7.id) {
        		system.assertEquals(opp.LeadSource,'Prospecting - DiscoverOrg');
        	} else if (opp.id == opp8.id) {
        		system.assertEquals(opp.LeadSource,'Prospecting - LinkedIn');
        	} else if (opp.id == opp9.id) {
        		system.assertEquals(opp.LeadSource,'Prospecting - Direct Sales');
        	} else if (opp.id == opp10.id) {
        		system.assertEquals(opp.LeadSource,'Prospecting - RainKing');
        	} else if (opp.id == opp11.id) {
        		system.assertEquals(opp.LeadSource,'Prospecting - Other');
        	} else if (opp.id == opp12.id) {
        		system.assertEquals(opp.LeadSource,'Channel');
        	}
        }
*/
           
    }
}