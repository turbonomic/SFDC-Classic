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
private class TestAccountWrapper {

    static testMethod void myUnitTest() {
        
        lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
        
        AccountWrapper[] acctList = new List<AccountWrapper>();
        
        List<Account> insertAccts = new List<Account>();
        Account acct1 = new Account(name = 'United Airlines', socket_count__c = 1000);
        Account acct2 = new Account(name = 'Delta Airlines', socket_count__c = 1500);
        Account acct3 = new Account(name = 'Jet Blue Airlines', socket_count__c = 500);
        insertAccts.add(acct1);
        insertAccts.add(acct2);
        insertAccts.add(acct3);
        
        insert insertAccts;
        
        acct1 = [select id, name, VMT_Account_Score__c from Account where id =:acct1.id];
        acct2 = [select id, name, VMT_Account_Score__c from Account where id =:acct2.id];
        acct3 = [select id, name, VMT_Account_Score__c from Account where id =:acct3.id];
        
        acctList.add( new AccountWrapper(acct1));
        acctList.add( new AccountWrapper(acct2));
        acctList.add( new AccountWrapper(acct3));
        
        acctList.sort();

        system.assertEquals('Jet Blue Airlines', acctList[2].acct.name);
        system.assertEquals('United Airlines', acctList[1].acct.name);
        system.assertEquals('Delta Airlines', acctList[0].acct.name);
        
    }
}