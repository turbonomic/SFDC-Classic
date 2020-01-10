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
private class TestLeadFillTerritoryOwner {

    static testMethod void myUnitTest() {
/*        
//        FCRM.FCR_SupportAPI.DisableApplicationForContext();
        
        List<Lead> leadInsert = new List<Lead>();
        
        Lead l1 = new Lead(firstName = 'Lead', lastName = 'One', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'DE', status = 'Suspect');
        leadInsert.add(l1);
        Lead l2 = new Lead(firstName = 'Lead', lastName = 'Two', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'DC', status = 'Suspect');
        leadInsert.add(l2);
        Lead l3 = new Lead(firstName = 'Lead', lastName = 'Three', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'OH', status = 'Suspect');
        leadInsert.add(l3);
        Lead l4 = new Lead(firstName = 'Lead', lastName = 'Four', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'MA', status = 'Suspect');
        leadInsert.add(l4);
        Lead l5 = new Lead(firstName = 'Lead', lastName = 'Five', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'NY', status = 'Suspect');
        leadInsert.add(l5);
        Lead l6 = new Lead(firstName = 'Lead', lastName = 'Six', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'CA', status = 'Suspect');
        leadInsert.add(l6);
        Lead l7 = new Lead(firstName = 'Lead', lastName = 'Seven', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'NM', status = 'Suspect');
        leadInsert.add(l7);
        Lead l8 = new Lead(firstName = 'Lead', lastName = 'Eight', company = 'Test Company', leadSource = 'Inbound - Product Download', country = 'United Kingdom', status = 'Suspect');
        leadInsert.add(l8);
        Lead l9 = new Lead(firstName = 'Lead', lastName = 'Nine', company = 'Test Company', leadSource = 'Inbound - Product Download', country = 'Sweden', status = 'Suspect');
        leadInsert.add(l9);
        Lead l10 = new Lead(firstName = 'Lead', lastName = 'Ten', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'AZ', status = 'Suspect');
        leadInsert.add(l10);
        Lead l11 = new Lead(firstName = 'Lead', lastName = 'Eleven', company = 'Test Company', leadSource = 'Inbound - Product Download', state = 'MI', status = 'Suspect');
        leadInsert.add(l11);
        
        insert leadInsert;
        
        List<Lead> afterInsert = [select id, Territory_Owner_Lead__c from Lead where id =: l1.id or id =: l2.id or id =: l3.id or id =: l4.id or id =: l5.id or id =:l6.id or id =: l7.id or id =: l8.id or id =: l9.id or id =: l10.id or id =: l11.id];
        
        system.assert(afterInsert.size() == 11);
        
        for (Lead l : afterInsert) {
            system.assert(l.Territory_Owner_Lead__c != null);
        }
*/       
    }
}