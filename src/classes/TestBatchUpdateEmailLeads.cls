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
private class TestBatchUpdateEmailLeads {

    static testMethod void myUnitTest() {
        
    	List<Lead> leadInsertList = new List<Lead>();
    	
    	Lead l1 = new Lead(firstName = 'Test', lastName = 'One', company = 'Test Company', leadSource = 'Inbound - Product Download');
    	leadInsertList.add(l1);
    	Lead l2 = new Lead(firstName = 'Test', lastName = 'One', company = 'Test Company', leadSource = 'Inbound - Product Download', last_email_date__c = date.today());
        leadInsertList.add(l2);
        
        insert leadInsertList;
        
        List<Task> taskInsertList = new List<Task>();
        
        //attached to L1
        Task tsk1 = new Task(subject = 'Email', type = 'Email', Description = 'Comments', activityDate = date.today().addDays(-10), whoId = l1.id, status = 'Completed');
        taskInsertList.add(tsk1);
        Task tsk2 = new Task(subject = 'Email', type = 'Email', Description = 'Comments', activityDate = date.today().addDays(-5), whoId = l1.id, status = 'Completed');
        taskInsertList.add(tsk2);
        
        insert taskInsertList;
        
        
        //no tasks for L2
        
        
        //start batch test
        Test.StartTest();
        BatchUpdateEmailsLeads n = new BatchUpdateEmailsLeads();
        n.query = 'SELECT id, name, Last_Email_Date__c FROM Lead WHERE id = \'' + l1.id + '\' OR id = \'' + l2.id + '\'';
        ID batchprocessid = Database.executeBatch(n);
        Test.StopTest();
        
        List<Lead> afterLeadList = [select id, name, Last_Email_Date__c from Lead where id =: l1.id OR id =: l2.id];
        
        //verify results
        for (Lead l : afterLeadList) {
        	if (l.id == l1.id) {
        		system.assertEquals(l.Last_Email_Date__c,date.today().addDays(-5));
        	} else if (l.id == l2.id) {
        		system.assertEquals(l.Last_Email_Date__c,null);
        	}
        }
        
    }
}