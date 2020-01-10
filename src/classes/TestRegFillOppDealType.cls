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
private class TestRegFillOppDealType {

    static testMethod void myUnitTest() {
        
        Account a1 = new Account(name = 'Test Acct');
        insert a1;
        
        List<User> partnerMgrs = [select id, name from User where team__c = 'Xccelerators' and isActive = true limit 2];
        
        List<Opportunity> insertOpps = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test Opp', amount = 10000, stageName = 'Identify', type = 'New', closeDate = date.today().addDays(30), accountId = a1.id);
        insertOpps.add(o1);
        Opportunity o2 = new Opportunity(name = 'Test Opp 2', amount = 15000, stageName = 'Identify', type = 'New', closeDate = date.today().addDays(30), accountId = a1.id, deal_type__c = 'Direct');
        insertOpps.add(o2);
        insert insertOpps;
        
        //create 2 registrations to map to each of the 2 opps - one with any deal type, one with different deal type than o2
        List<VartopiaDRS__Registration__c> insertRegs = new List<VartopiaDRS__Registration__c>();
        VartopiaDRS__Registration__c vrc1 = new VartopiaDRS__Registration__c ( VartopiaDRS__Vendor_Status__c = 'Submitted', VartopiaDRS__Opportunity__c = o1.id, VartopiaDRS__Date_Submitted__c = date.today(), Partner_Manager__c = partnerMgrs.get(0).id, Deal_Type__c = 'Incremental');
        insertRegs.add(vrc1);
        VartopiaDRS__Registration__c vrc2 = new VartopiaDRS__Registration__c ( VartopiaDRS__Vendor_Status__c = 'Submitted', VartopiaDRS__Opportunity__c = o2.id, VartopiaDRS__Date_Submitted__c = date.today(), Partner_Manager__c = partnerMgrs.get(0).id, Deal_Type__c = 'Joint/Accelerated');
        insertRegs.add(vrc2);
        insert insertRegs;
        
        List<Opportunity> oppResults = [select id, Deal_Type__c from Opportunity where id =: o1.id or id =: o2.id];
        for (Opportunity o : oppResults) {
        	if (o.id == o1.id) {
        		system.assertEquals(o.deal_type__c,'Incremental');
        	} else if (o.id == o2.id) {
        		system.assertEquals(o.deal_type__c,'Joint/Accelerated');
        	}
        }
        
        
        
    }
}