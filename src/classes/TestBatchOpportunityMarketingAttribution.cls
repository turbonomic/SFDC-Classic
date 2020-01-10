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
private class TestBatchOpportunityMarketingAttribution {

    static testMethod void myUnitTest() {
        
        List<Account> acctInsert = new List<Account>();
        //a1: 1 open opp for this account, 1 bizible touchpoint
        Account a1 = new Account(name = 'Test Acct 1');
        acctInsert.add(a1);
        //a2: multiple open opp for this account, 1 bizible touchpoint per opp
        Account a2 = new Account(name = 'Test Acct 2');
        acctInsert.add(a2);
        //a3: multiple open opp for this account, multiple bizible touchpoints per opp
        Account a3 = new Account(name = 'Test Acct 3');
        acctInsert.add(a3);
        //a4: multiple open opp for this account, multiple bizible touchpoints per opp, some touchpoints don't match accepted timeline
        Account a4 = new Account(name = 'Test Acct 4');
        acctInsert.add(a4);
        insert acctInsert;
        
        List<Opportunity> oppInsert = new List<Opportunity>();
        //o1: attached to a1
        Opportunity o1 = new Opportunity(name = 'test opp 1', accountId = a1.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o1);
        //o2: attached to a2
        Opportunity o2 = new Opportunity(name = 'test opp 2', accountId = a2.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o2);
        //o3: attached to a2
        Opportunity o3 = new Opportunity(name = 'test opp 3', accountId = a2.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o3);
        //o4: attached to a3
        Opportunity o4 = new Opportunity(name = 'test opp 4', accountId = a3.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o4);
        //o5: attached to a3
        Opportunity o5 = new Opportunity(name = 'test opp 5', accountId = a3.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o5);
        //o6: attached to a4
        Opportunity o6 = new Opportunity(name = 'test opp 6', accountId = a4.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Identify');
        oppInsert.add(o6);
        //o7: attached to a4
        Opportunity o7 = new Opportunity(name = 'test opp 7', accountId = a4.id, amount = 10000, type = 'New', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-30), stageName = 'Identify');
        oppInsert.add(o7);
        insert oppInsert;
        
        List<Lead> leadInsert = new List<Lead>();
        Lead l1 = new Lead(firstName = 'one', lastName = 'done', company = 'test acct 1', account__c = a1.id, leadSource = 'Inbound - Website', status = 'New', email = 'one.done@testacct1.com');
        leadInsert.add(l1);
        Lead l2 = new Lead(firstName = 'two', lastName = 'done', company = 'test acct 2', account__c = a2.id, leadSource = 'Inbound - Website', status = 'New', email = 'two.done@testacct2.com');
        leadInsert.add(l2);
        Lead l3 = new Lead(firstName = 'three', lastName = 'done', company = 'test acct 3', account__c = a3.id, leadSource = 'Inbound - Website', status = 'New', email = 'three.done@testacct3.com');
        leadInsert.add(l3);
        Lead l4 = new Lead(firstName = 'four', lastName = 'done', company = 'test acct 4', account__c = a4.id, leadSource = 'Inbound - Website', status = 'New', email = 'four.done@testacct4.com');
        leadInsert.add(l4);
        insert leadInsert;
        
        List<Contact> conInsert = new List<Contact>();
        Contact c1 = new Contact (firstName = 'first', lastName = 'last', accountId = a1.id, leadSource = 'Inbound - Website', contact_status__c = 'New', email = 'first.last@testacct1.com');
        conInsert.add(c1);
        Contact c2 = new Contact (firstName = 'second', lastName = 'last', accountId = a2.id, leadSource = 'Inbound - Website', contact_status__c = 'New', email = 'second.last@testacct2.com');
        conInsert.add(c2);
        Contact c3 = new Contact (firstName = 'third', lastName = 'last', accountId = a3.id, leadSource = 'Inbound - Website', contact_status__c = 'New', email = 'third.last@testacct3.com');
        conInsert.add(c3);
        Contact c4 = new Contact (firstName = 'fourth', lastName = 'last', accountId = a4.id, leadSource = 'Inbound - Website', contact_status__c = 'New', email = 'fourth.last@testacct4.com');
        conInsert.add(c4);
        insert conInsert;
        
        List<bizible2__Bizible_Person__c> personInsert = new List<bizible2__Bizible_Person__c>();
        bizible2__Bizible_Person__c bp1 = new bizible2__Bizible_Person__c(bizible2__Lead__c = l1.id);
        personInsert.add(bp1);
        bizible2__Bizible_Person__c bp2 = new bizible2__Bizible_Person__c(bizible2__Lead__c = l2.id);
        personInsert.add(bp2);
        bizible2__Bizible_Person__c bp3 = new bizible2__Bizible_Person__c(bizible2__Lead__c = l3.id);
        personInsert.add(bp3);
        bizible2__Bizible_Person__c bp4 = new bizible2__Bizible_Person__c(bizible2__Lead__c = l4.id);
        personInsert.add(bp4);
        bizible2__Bizible_Person__c bp5 = new bizible2__Bizible_Person__c(bizible2__Contact__c = c1.id);
        personInsert.add(bp5);
        bizible2__Bizible_Person__c bp6 = new bizible2__Bizible_Person__c(bizible2__Contact__c = c2.id);
        personInsert.add(bp6);
        bizible2__Bizible_Person__c bp7 = new bizible2__Bizible_Person__c(bizible2__Contact__c = c3.id);
        personInsert.add(bp7);
        bizible2__Bizible_Person__c bp8 = new bizible2__Bizible_Person__c(bizible2__Contact__c = c4.id);
        personInsert.add(bp8);
        insert personInsert;
        
        List<bizible2__Bizible_Touchpoint__c> touchpointInsert = new List<bizible2__Bizible_Touchpoint__c>();
        //CASE 1
        //attach to o1
        bizible2__Bizible_Touchpoint__c bt1 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp1.id, createdDate = datetime.now().addDays(-45), bizible2__Touchpoint_Date__c = datetime.now().addDays(-45));
        touchpointInsert.add(bt1);
        
        //CASE 2
        //attach to o2 and o3
        bizible2__Bizible_Touchpoint__c bt2 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp6.id, createdDate = datetime.now().addDays(-50), bizible2__Touchpoint_Date__c = datetime.now().addDays(-50));
        touchpointInsert.add(bt2);
        bizible2__Bizible_Touchpoint__c bt3 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp6.id, createdDate = datetime.now().addDays(-45), bizible2__Touchpoint_Date__c = datetime.now().addDays(-45));
        touchpointInsert.add(bt3);
        
        //CASE 3
        //attach to o4 and o5
        bizible2__Bizible_Touchpoint__c bt4 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp3.id, createdDate = datetime.now().addDays(-50), bizible2__Touchpoint_Date__c = datetime.now().addDays(-50));
        touchpointInsert.add(bt4);
		bizible2__Bizible_Touchpoint__c bt5 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp7.id, createdDate = datetime.now().addDays(-60), bizible2__Touchpoint_Date__c = datetime.now().addDays(-60));
        touchpointInsert.add(bt5);
        
        //CASE 4
        //attach to o6 and o7
        bizible2__Bizible_Touchpoint__c bt6 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp4.id, createdDate = datetime.now().addDays(-50), bizible2__Touchpoint_Date__c = datetime.now().addDays(-50));
        touchpointInsert.add(bt6);
        bizible2__Bizible_Touchpoint__c bt7 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp8.id, createdDate = datetime.now().addDays(-60), bizible2__Touchpoint_Date__c = datetime.now().addDays(-60));
        touchpointInsert.add(bt7);
        bizible2__Bizible_Touchpoint__c bt8 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp8.id, createdDate = datetime.now().addDays(-90), bizible2__Touchpoint_Date__c = datetime.now().addDays(-90));
        touchpointInsert.add(bt8);
        bizible2__Bizible_Touchpoint__c bt9 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp4.id, createdDate = datetime.now().addDays(-120), bizible2__Touchpoint_Date__c = datetime.now().addDays(-120));
        touchpointInsert.add(bt9);
		bizible2__Bizible_Touchpoint__c bt10 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = bp8.id, createdDate = datetime.now().addDays(-150), bizible2__Touchpoint_Date__c = datetime.now().addDays(-150));
        touchpointInsert.add(bt10);
        insert touchpointInsert;
        
        Test.startTest();
        BatchOpportunityMarketingAttribution b = new BatchOpportunityMarketingAttribution();
        b.query = 'select id, accountId, createdDate, Marketing_Attribution_Calculated__c from Opportunity where (id = \'' + o1.id + '\'or id = \'' + o2.id + '\'or id = \'' + o3.id + '\'or id = \'' + o4.id + '\'or id = \'' + o5.id + '\'or id = \'' + o6.id + '\'or id = \'' + o7.id + '\')';
        ID batchprocessid = Database.executeBatch(b);
        Test.stopTest();
        
        List<Marketing_Attribution__c> attributionResults = [select id, opportunity__c, Bizible_Touchpoint__c from Marketing_Attribution__c where Opportunity__c =: o1.id or Opportunity__c =: o2.id or Opportunity__c =: o3.id or Opportunity__c =: o4.id or Opportunity__c =: o5.id or Opportunity__c =: o6.id or Opportunity__c =: o7.id];
        
        system.assertEquals(attributionResults.size(),16);
        
        
        Integer[] counterArray = new Integer[]{0,0,0,0,0,0,0};
        for (Marketing_Attribution__c ma : attributionResults) {
        	if (ma.opportunity__c == o1.id) {
        		counterArray[0]++;
        	} else if (ma.opportunity__c == o2.id) {
        		counterArray[1]++;
        	} else if (ma.opportunity__c == o3.id) {
        		counterArray[2]++;
        	} else if (ma.opportunity__c == o4.id) {
        		counterArray[3]++;
        	} else if (ma.opportunity__c == o5.id) {
        		counterArray[4]++;
        	} else if (ma.opportunity__c == o6.id) {
        		counterArray[5]++;
        	} else if (ma.opportunity__c == o7.id) {
        		counterArray[6]++;
        	}
        }
        
        system.assertEquals(counterArray[0],1);
        system.assertEquals(counterArray[1],2);
        system.assertEquals(counterArray[2],2);
        system.assertEquals(counterArray[3],2);
        system.assertEquals(counterArray[4],2);
        system.assertEquals(counterArray[5],3);
        system.assertEquals(counterArray[6],4);
        
    }
}