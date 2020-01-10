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
private class TestUserGreenCirclePasswords {

    static testMethod void myUnitTest() {
        
        Map<id,User> fewUsers = new Map<id,User>([select id, green_circle_password__c, hashed_green_circle_password__c from User where isActive = true limit 2]);
        List<User> updateUsers = new List<User>();
        String decryptedPasswordId;
        
        Test.startTest();
        
        Integer i = 0;
        for (User u : fewUsers.values()) {
        	
        	String password = 'SecurePassword';
        	password += i;
        	
        	u.green_circle_password__c = password;
        	
        	if (i == 1) {
        		decryptedPasswordId = u.id;
        	}
        	
        	
        	updateUsers.add(u);
        	i++;
        }
        
        update updateUsers;
        
        system.debug('### check that users were updated with passwords');
        
        updateUsers =  [select id, green_circle_password__c, hashed_green_circle_password__c from User where id in: fewUsers.keySet()];
        for (User u : updateUsers) {
        	system.assert(u.hashed_green_circle_password__c != null);
        }
        
        User updateUser = [select id, green_circle_password__c, hashed_green_circle_password__c from User where id =: decryptedPasswordId];
        updateUser.green_circle_password__c = 'AnewPasswordForYou2';
        update updateUser;
        
        Test.stopTest();
        
        system.assert(updateUser.hashed_green_circle_password__c != null);
        system.debug('### check 2 that user was updated with password');
        
        String decryptedPassword = UserMethods.decryptHashedPassword(decryptedPasswordId);
        system.assertEquals(decryptedPassword,'AnewPasswordForYou2');
        
        
    }
}