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
private class TestTaskStatusProgression {

    static testMethod void myUnitTest() {
        
        Account acct1 = new Account(name = 'Test Company');
        insert acct1;
        
        List<Lead> leadInsert = new List<Lead>();
        Lead ld1 = new Lead(firstName = 'test', lastName = 'one', company = 'test company', account__c = acct1.id, status = 'New', leadsource = 'Prospecting - Other');
        leadInsert.add(ld1);
        Lead ld2 = new Lead(firstName = 'test', lastName = 'two', company = 'test company', account__c = acct1.id, status = 'Closed', cfcr_status_reason__c = 'Not Interested');
        leadInsert.add(ld2);
        Lead ld3 = new Lead(firstName = 'test', lastName = 'three', company = 'test company', account__c = acct1.id, status = 'Suspect');
        leadInsert.add(ld3);
        insert leadInsert;
        
        List<Contact> conInsert = new List<Contact>();
        Contact con1 = new Contact(firstName = 'test', lastName = 'con1', accountId = acct1.id, contact_status__c = 'Suspect', leadSource = 'Prospecting - DiscoverOrg');
        conInsert.add(con1);
        Contact con2 = new Contact(firstName = 'test', lastName = 'con2', accountId = acct1.id, contact_status__c = 'Closed', status_reason__c = 'No longer with company', leadSource = 'Inbound - website');
        conInsert.add(con2);
        Contact con3 = new Contact(firstName = 'test', lastName = 'con3', accountId = acct1.id, contact_status__c = 'Suspect', leadSource = 'Prospecting - DiscoverOrg');
        conInsert.add(con3);
        insert conInsert;
        
        List<Task> tskInsert = new List<Task>();
        Task tsk1 = new Task(subject = 'tsk1', type = 'Call', status = 'Completed', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = ld1.id);
        tskInsert.add(tsk1);
        Task tsk2 = new Task(subject = 'tsk2', type = 'Call', status = 'Completed', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = con1.id);
        tskInsert.add(tsk2);
        Task tsk3 = new Task(subject = 'tsk3', type = 'Call', status = 'Completed', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = ld2.id);
        tskInsert.add(tsk3);
        Task tsk4 = new Task(subject = 'tsk4', type = 'Call', status = 'Completed', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = con2.id);
        tskInsert.add(tsk4);
        Task tsk5 = new Task(subject = 'tsk5', type = 'Call', status = 'Not Started', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = ld3.id);
        tskInsert.add(tsk5);
        Task tsk6 = new Task(subject = 'tsk6', type = 'Call', status = 'Not Started', activityDate = date.today(), call_disposition__c = 'Conversation', whoId = con3.id);
        tskInsert.add(tsk6);
        insert tskInsert;
        
        List<Lead> updatedLeads = [select id, status from Lead where id =: ld1.id or id =: ld2.id or id =: ld3.id];
        List<Contact> updatedContacts = [select id, contact_status__c from Contact where id =: con1.id or id =: con2.id or id =: con3.id];
        
        for (Lead l : updatedLeads) {
        	if (l.id == ld1.id) {
        		system.assertEquals(l.status,'Working');
        	} else if (l.id == ld2.id) {
        		system.assertEquals(l.status,'Closed');
        	} else if (l.id == ld3.id) {
        		system.assertEquals(l.status,'Suspect');
        	}
        }
        
        for (Contact c : updatedContacts) {
        	if (c.id == con1.id) {
        		system.assertEquals(c.contact_status__c,'Working');
        	} else if (c.id == con2.id) {
        		system.assertEquals(c.contact_status__c,'Closed');
        	} else if (c.id == con3.id) {
        		system.assertEquals(c.contact_status__c,'Suspect');
        	}
        }
        
        List<Task> tskToUpdate = [select id, status from Task where id =: tsk5.id or id =: tsk6.id];
        List<Task> tskUpdate = new List<Task>();
        for (Task tsk : tskToUpdate) {
        	tsk.status = 'Completed';
        	tskUpdate.add(tsk);
        }
        update tskUpdate;
        
        Lead afterLead3 = [select id, status from Lead where id =: ld3.id];
        Contact afterCon3 = [select id, contact_status__c from Contact where id =: con3.id];
        
        system.assertEquals(afterLead3.status,'Working');
        system.assertEquals(afterCon3.contact_status__c,'Working');
    }
}