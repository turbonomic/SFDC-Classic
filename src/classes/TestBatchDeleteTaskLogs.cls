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
private class TestBatchDeleteTaskLogs {

    static testMethod void myUnitTest() {
        
        List<ClickToDialTaskLog__c> insertTaskLogs = new List<ClickToDialTaskLog__c>();
        ClickToDialTaskLog__c ctdtl1 = new ClickToDialTaskLog__c(saveparams__c = 'blah', createdDate = datetime.now().addDays(-100));
        ClickToDialTaskLog__c ctdtl2 = new ClickToDialTaskLog__c(saveparams__c = 'blah', createdDate = datetime.now().addDays(-20));
        insertTaskLogs.add(ctdtl1);
        insertTaskLogs.add(ctdtl2);
        insert insertTaskLogs;
        
        Test.startTest();
        BatchDeleteTaskLogs b = new BatchDeleteTaskLogs();
        b.execute(null);
        Test.stopTest();
        
        List<ClickToDialTaskLog__c> afterBatchLogs = [select id from ClickToDialTaskLog__c where id =: ctdtl1.id or id =: ctdtl2.id];
        system.assertEquals(afterBatchLogs.size(),1);
        
    }
}