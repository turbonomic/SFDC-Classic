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
@isTest //(seeAllData=true)
private class TestAcctLookupMSAByZip {

    static testMethod void myUnitTest() {
        List<Account> acctInsert = new List<Account>();
        List<Account_MSA__c> msaInsert = new List<Account_MSA__c>();
        
        Account_MSA__c msa1 = new Account_MSA__c(Metropolitan_Statistical_Area__c = 'Milwaukee-Waukesha-West Allis, WI MSA', MSA_Number__c = 33340, Zip_Code__c = '53002');
        msaInsert.add(msa1);
        Account_MSA__c msa2 = new Account_MSA__c(Metropolitan_Statistical_Area__c = 'Los Angeles-Long Beach-Santa Ana, CA MSA', MSA_Number__c = 31100, Zip_Code__c = '90210');
        msaInsert.add(msa2);
        Account_MSA__c msa3 = new Account_MSA__c(Metropolitan_Statistical_Area__c = 'Akron, OH MSA', MSA_Number__c = 10420, Zip_Code__c = '44056');
        msaInsert.add(msa3);
        
        insert msaInsert;
        
        List<Account_MSA__c> msaList = [SELECT Zip_Code__c, Metropolitan_Statistical_Area__c, MSA_Number__c FROM Account_MSA__c];
		System.assert(!msaList.IsEmpty());
        
        //Normal Account
        Account acct1 = new Account(Name = 'acct1', BillingCountry = 'United States', BillingPostalCode = '53002');
        acctInsert.add(acct1);
        //Accouunt w/o Zip Code
        Account acct2 = new Account(Name = 'acct2', BillingCountry = 'United States');
        acctInsert.add(acct2);
        //Account w/o Country
        Account acct3 = new Account(Name = 'acct3', BillingPostalCode = '02116');
        acctInsert.add(acct3);
        //Account w/ Diff Country
        Account acct4 = new Account(Name = 'acct4', BillingCountry = 'Canada', BillingPostalCode = '02116');
        acctInsert.add(acct4);
        //Account with Zip Code added after insert
        Account acct5 = new Account(Name = 'acct5', BillingCountry = 'United States');
        acctInsert.add(acct5);
        //Account with Zip Code changed after insert
        Account acct6 = new Account(Name = 'acct6', BillingCountry = 'United States', BillingPostalCode = '53002');
        acctInsert.add(acct6);
        //Account with Zip Code removed after insert
        Account acct7 = new Account(Name = 'acct7', BillingCountry = 'United States', BillingPostalCode = '44056');
        acctInsert.add(acct7);
        //Account with Country and zip code changed
        Account acct8 = new Account(Name = 'acct8', BillingCountry = 'United States', BillingPostalCode = '90210');
        acctInsert.add(acct8);
        
        insert acctInsert;
        
        List<Account> acctUpdate = [SELECT id, BillingCountry, BillingPostalCode FROM Account WHERE id =: acct5.id OR id =: acct6.id OR id =: acct7.id OR id =: acct8.id];
        
        for (Account acct : acctUpdate) {
        	if (acct.id == acct5.id) {
        		acct.BillingPostalCode = '90210';
        	}
        	else if (acct.id == acct6.id) {
        		acct.BillingPostalCode = '44056';
        	}
        	else if (acct.id == acct7.id) {
        		acct.BillingPostalCode = '';
        	}
        	else if (acct.id == acct8.id) {
        		acct.BillingCountry = 'Canada';
        		acct.BillingPostalCode = 'W2 6BD';
        	}
        }
        
        update acctUpdate; 
        
        
        
        
        
        List<Account> getAccts = [SELECT id, Metropolitan_Statistical_Area__c, MSA_Number__c FROM Account WHERE id =: acct1.id OR id =: acct2.id OR id =: acct3.id OR id =: acct4.id OR id =: acct5.id OR id =: acct6.id OR id =: acct7.id OR id =: acct8.id];
        
        for (Account acct : getAccts) {
        	if (acct.id == acct1.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,'Milwaukee-Waukesha-West Allis, WI MSA');
        		system.assertEquals(acct.MSA_Number__c,33340);
        	}
        	else if (acct.id == acct2.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		system.assertEquals(acct.MSA_Number__c,null);
        	}
        	else if (acct.id == acct3.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		system.assertEquals(acct.MSA_Number__c,null);
        	}
        	else if (acct.id == acct4.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		system.assertEquals(acct.MSA_Number__c,null);
        	}
        	else if (acct.id == acct5.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,'Los Angeles-Long Beach-Santa Ana, CA MSA');
        		system.assertEquals(acct.MSA_Number__c,31100);
        		//system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		//system.assertEquals(acct.MSA_Number__c,null);
        	}
        	else if (acct.id == acct6.id) {
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,'Akron, OH MSA');
        		system.assertEquals(acct.MSA_Number__c,10420);
        	}
        	else if (acct.id == acct7.id) {
        		//system.assertEquals(acct.Metropolitan_Statistical_Area__c,'Akron, OH MSA');
        		//system.assertEquals(acct.MSA_Number__c,10420);
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		system.assertEquals(acct.MSA_Number__c,null);
        	}
        	else if (acct.id == acct8.id) {
        		//system.assertEquals(acct.Metropolitan_Statistical_Area__c,'Los Angeles-Long Beach-Santa Ana, CA MSA');
        		//system.assertEquals(acct.MSA_Number__c,31100);
        		system.assertEquals(acct.Metropolitan_Statistical_Area__c,null);
        		system.assertEquals(acct.MSA_Number__c,null);
        	} 
        }
        
    }
}