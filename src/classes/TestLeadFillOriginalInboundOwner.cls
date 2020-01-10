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
private class TestLeadFillOriginalInboundOwner {

    static testMethod void myUnitTest() {
		
		Lead ld1 = new Lead(firstName = 'test', lastName = 'Lead', company = 'VMTurbo', leadsource = 'Third Party', status = 'New', ownerId = '005D0000001x4tvIAA');
		insert ld1;
		
		Lead leadChangeOwner = [select id, ownerId from Lead where id =: ld1.id];
		leadChangeOwner.OwnerId = '005D0000004KbZHIA0';
		update leadChangeOwner;
		
		Lead resultLead = [select id, ownerId, Original_Inbound_Lead_Owner__c from Lead where id =: leadChangeOwner.id];
		system.assertEquals(resultLead.Original_Inbound_Lead_Owner__c,'005D0000004KbZHIA0');
		
		
    }
}