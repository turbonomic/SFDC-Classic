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
private class TestRegFillPartnerManager {

    static testMethod void myUnitTest() {
        
		List<User> partnerMgrs = [select id, name from User where team__c = 'Xccelerators' and isActive = true limit 2];
        
        Account acct = new Account(name = 'test Acct');
        insert acct;
        
        Opportunity channelOpp = new Opportunity(name = 'test Opp', amount = 10000, stageName = 'Identify', closeDate = date.today().addDays(30), type = 'New', accountId = acct.id);
        insert channelOpp;
        
        VartopiaDRS__Registration__c vrc = new VartopiaDRS__Registration__c ( VartopiaDRS__Vendor_Status__c = 'Submitted', VartopiaDRS__Opportunity__c = channelOpp.id, VartopiaDRS__Date_Submitted__c = date.today(), Partner_Manager__c = partnerMgrs.get(0).id);
        insert vrc;
        
        Opportunity afterTestOpp = [select id, Partner_Manager__c, Registration_Partner_Manager__c from Opportunity where id =: channelOpp.id];
        system.assert(afterTestOpp.Partner_Manager__c == partnerMgrs.get(0).id);
        system.assert(afterTestOpp.Registration_Partner_Manager__c == partnerMgrs.get(0).name);
        
        VartopiaDRS__Registration__c vrcUpdate = [select id, Partner_Manager__c, Partner_Manager_Name__c from VartopiaDRS__Registration__c where id =: vrc.id];
        vrcUpdate.Partner_Manager__c = partnerMgrs.get(1).id;
        update vrcUpdate;
        
        afterTestOpp = [select id, Partner_Manager__c, Registration_Partner_Manager__c from Opportunity where id =: channelOpp.id];
        system.assertEquals(afterTestOpp.Partner_Manager__c,partnerMgrs.get(1).id);
        system.assertEquals(afterTestOPp.Registration_Partner_Manager__c,partnerMgrs.get(1).name);
    }
}