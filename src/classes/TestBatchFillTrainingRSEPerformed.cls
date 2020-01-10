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
private class TestBatchFillTrainingRSEPerformed {

    static testMethod void myUnitTest() {
        
        lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
        
        Date useDate = date.today().addDays(-100);
        
        Account acct1 = new Account(name = 'Acct 1');
        insert acct1;
        
        Contact con1 = new Contact (firstName = 'Contact', lastName = 'One', accountId = acct1.id);
        insert con1;
        
        Opportunity opp1 = new Opportunity(name = 'Opp 1', closeDate = useDate, stageName = 'Closed Won', amount = 1000);
        insert opp1;
        
//        Product2 prd1 = new Product2(name = 'RAPID Success Engagement (US Only) - future or additional engagements will be priced at $12,500 each', isActive = true, productCode = 'PSO-RPD-US', productFamily = 'RAPID Sucess');
//        insert prd1;
        
        
        List<Asset> assetList = new List<Asset>();
        
        Asset asset1 = new Asset(name = 'RAPID Success Engagement (US Only) - future or additional engagements will be priced at $12,500 each', accountId = acct1.id, Purchase_Opportunity__c = opp1.id, purchaseDate = useDate, ContactId = con1.id, installDate = useDate, quantity = 1, 
        						price = 12504, status = 'Purchased', Services_Status__c = 'Delivered', Services_Delivery_Date__c = useDate);
        assetList.add(asset1);
        Asset asset2 = new Asset(name = '2-Day Quick Start Training & Deployment Workshop', accountId = acct1.id, Purchase_Opportunity__c = opp1.id, purchaseDate = useDate, ContactId = con1.id, installDate = useDate, quantity = 1, price = 2500, status = 'Purchased',
        						Training_Status__c = 'Completed', Training_Delivery_Date__c = useDate);
        assetList.add(asset2);
        
        insert assetList;
        
        Test.StartTest();
        BatchFillTrainingRSEPerformed b = new BatchFillTrainingRSEPerformed();
        b.query = 'SELECT id, name, Training__c, RSE__c from Account where id = \'' + acct1.id + '\'';
        ID batchprocessid = Database.executeBatch(b);        
        Test.StopTest();
        
        Account getAccount = [select id, name, Training__c, RSE__c from Account where id =: acct1.id];
        system.assertEquals(getAccount.RSE__c,'Yes');
        system.assertEquals(getAccount.Training__c,'Yes');
        
        
    }
}