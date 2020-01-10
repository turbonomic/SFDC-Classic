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
private class TestOpportunityFillRegVendorStatus {

    static testMethod void myUnitTest() {
        
        Opportunity opp1 = new Opportunity(name = 'Reg Opp', amount = 1000.00, stageName = 'PO Received', LeadSource = 'Channel', closeDate = date.today());
        insert opp1;
        
        VartopiaDRS__Registration__c reg = new VartopiaDRS__Registration__c(VartopiaDRS__Deal_Name__c = 'Opp1 Reg', Deal_Type__c = 'Incremental', VartopiaDRS__Vendor_Status__c = 'Approved', VartopiaDRS__Opportunity__c = opp1.id, Sales_Ops_Audit__c = 'Approved');
        insert reg;
        
        opp1.stageName = 'Closed Won';
        update opp1;
        
        VartopiaDRS__Registration__c regCheck = [select id, VartopiaDRS__Vendor_Status__c from VartopiaDRS__Registration__c where id =: reg.id];
        system.assertEquals(regCheck.VartopiaDRS__Vendor_Status__c,'Closed-Won');
        
    }
}