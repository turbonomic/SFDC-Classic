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
@isTest (seeAllData=true)
private class TestLeadReassignmentClass {

    static testMethod void myUnitTest() {
        
        List<Lead> leadInsert = new List<Lead>();
        //default lead with everything filled in
        Lead ld1 = new Lead(OwnerId = '005D0000004k29LIAQ', firstName = 'test', lastName = 'one', company = 'A Company I\'ve Never Heard of', leadSource = 'Tradeshow', status = 'Suspect', phone = '9784409108', email = 'abc@jpmc.com');
		leadInsert.add(ld1);
		//lead with no phone, personal email
		Lead ld2 = new Lead(OwnerId = '005D0000004k29LIAQ', firstName = 'test', lastName = 'two', company = 'A Company I\'ve Never Heard of', leadSource = 'Tradeshow', status = 'Suspect', email = 'abc@gmail.com'); 
        leadInsert.add(ld2);
        //lead with phone, peronsal email
        Lead ld3 = new Lead(OwnerId = '005D0000004k29LIAQ', firstName = 'test', lastName = 'three', company = 'A Company I\'ve Never Heard of', leadSource = 'Tradeshow', status = 'Suspect', phone = '9784409108', email = 'abc@yahoo.com');
        leadInsert.add(ld3);
        //same as ld2
       	Lead ld4 = new Lead(OwnerId = '005D0000004k29LIAQ', firstName = 'test', lastName = 'four', company = 'A Company I\'ve Never Heard of', leadSource = 'Tradeshow', status = 'Suspect', email = 'abc@gmail.com'); 
		leadInsert.add(ld4);
        
        insert leadInsert;
        
//        List<Lead> leadOwnerUpdate = [select id, phone, email, ownerId, retrigger_assignment_rules__c from Lead where id =: ld1.id or id =: ld2.id or id =: ld3.id or id =: ld4.id];
//        List<Lead> leadUpdate2 = new List<Lead>();
        
//        for (Lead l : leadOwnerUpdate) {
//			l.OwnerId = '005D0000004k29LIAQ';
//			leadUpdate2.add(l);
//        }
 
// 		update leadUpdate2;   
 		
 		Test.startTest();
 		
        List<Lead> leadAfterInsert = [select id, phone, email, ownerId, retrigger_assignment_rules__c from Lead where id =: ld1.id or id =: ld2.id or id =: ld3.id or id =: ld4.id];
        List<Lead> leadUpdate = new List<Lead>();
        
        MyLeadReassignmentClass.futureMethodAlreadyCalled = false;
        
        for (Lead l : leadAfterInsert) {
        	if (l.id == ld1.id) {
//     			system.assertEquals(l.Ownerid,'005D0000004k29LIAQ');
//        		leadUpdate.add(l);
        	} else if (l.id == ld2.id) {
        		system.assertEquals(l.Ownerid,'005D0000004k29LIAQ');
        		l.email = 'abc@jpmc.com';
        		leadUpdate.add(l);
        	} else if (l.id == ld3.id) {
        		system.assertEquals(l.Ownerid,'005D0000004k29LIAQ');
        		l.email = 'abc@vmturbo.com';
        		leadUpdate.add(l);
        	} else if (l.id == ld4.id) {
        		system.assertEquals(l.Ownerid,'005D0000004k29LIAQ');
        		l.email = 'abc@jpmc.com';
        		l.phone = '9784409108';
        		leadUpdate.add(l);
        	}
        }
        
        update leadUpdate;
        
        List<Lead> results = [select id, ownerId, retrigger_assignment_rules__c from Lead where id =: ld1.id or id =: ld2.id or id =: ld3.id or id =: ld4.id];
        
        Test.stopTest();
        
        List<Lead> results2 = [select id, ownerId, retrigger_assignment_rules__c from Lead where id =: ld1.id or id =: ld2.id or id =: ld3.id or id =: ld4.id];
        
        system.assert(MyLeadReassignmentClass.futureMethodAlreadyCalled == true);
        
        for (Lead l : results2) {
        	if (l.id == ld1.id) {
//        		system.assertEquals(l.retrigger_assignment_rules__c,false);
//        		system.assert(l.OwnerId != '005D0000004k29LIAQ');		//wrong
        	} else if (l.id == ld2.id) {
        		system.assertEquals(l.retrigger_assignment_rules__c,false);
        		system.assert(l.OwnerId != '005D0000004k29LIAQ');
        	} else if (l.id == ld3.id) {
        		system.assertEquals(l.retrigger_assignment_rules__c,false);
        		system.assert(l.OwnerId != '005D0000004k29LIAQ');
        	} else if (l.id == ld4.id) {
        		system.assertEquals(l.retrigger_assignment_rules__c,false);
        		system.assert(l.OwnerId != '005D0000004k29LIAQ');
        	} 
        }
        
    }
}