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
private class TestBatchFillCorporateSFMetrics {

    static testMethod void myUnitTest() {
        
        Map<id,User> allUsers = new Map<id,User>([select id, full_name__c, trigger_workflow_rules__c, has_talent_management_file__c from User where isActive = true and (UserRole.Name like 'Corporate Account Executive%' or UserRole.Name like 'Enterprise Rep%') limit 5]);
        List<id> userIds = new List<id>();
        
        
        Map<id,Talent_Management__c> allTM = new Map<id,Talent_Management__c>();
        List<Talent_Management__c> insertTMs = new List<Talent_Management__c>();
        Integer i = 0;
        for (User u : allUsers.values()) {
        	userIds.add(u.id);
        	Talent_Management__c newTM = new Talent_Management__c(ownerId = u.id, name = u.full_name__c);
        	if (i != 3 && i != 5) {
        		insertTMs.add(newTM);
        	}
        	i++;
        }
        
        insert insertTMs;
        
        Test.StartTest();
        BatchFillCorporateSFMetrics n = new BatchFillCorporateSFMetrics();
        n.query = 'SELECT id, full_name__c, trigger_workflow_rules__c, has_talent_Management_file__c from User where id = \'' + userIds.get(0) + '\' or id = \'' + userIds.get(1) + '\' or id = \'' + userIds.get(2) + '\' or id = \'' + userIds.get(3) + '\' or id = \'' + userIds.get(4) + '\'';                                            
        ID batchprocessid = Database.executeBatch(n);
        Test.StopTest();
        
        List<User> afterUsers = [select id, trigger_workflow_rules__c, has_talent_management_file__c from User where id in: allUsers.KeySet()];
        List<Talent_Management__c> afterTMs = [select id from Talent_Management__c where user_safe_id__c in: allUsers.KeySet()];
        
        system.assertEquals(afterUsers.size(),afterTMs.size());
        
        for (User u : afterUsers) {
        	if (u.id == userIds.get(2) || u.id == userIds.get(4)) {
        		system.assertEquals(u.has_talent_management_file__c,true);
        	} else {
        		system.assertEquals(u.has_talent_management_file__c,true);
        		system.assert(u.trigger_workflow_rules__c != null);
        	}
        }
        
        
        
    }
}