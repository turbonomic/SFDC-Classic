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
private class TestBatchFillPhoneHomeData {

    static testMethod void myUnitTest() {
    	
    	Account acct1 = new Account(name = 'VMTurbo');
    	insert acct1;
        
        List<Lead> leadInsert = new List<Lead>();
        
        Lead l1 = new Lead(firstName = 'Test', lastName = 'One', company = 'VMTurbo', email = 'abc@vmturbo.com', leadSource = 'Inbound - VHM', account__c = acct1.id);
        leadInsert.add(l1);
        Lead l2 = new Lead(firstName = 'Test', lastName = 'Two', company = 'Some Company that Does not Exist', email = 'def@vmturbo.com', leadSource = 'Inbound - VHM');
        leadInsert.add(l2);
        
        insert leadInsert;
        
        List<PhoneHome_Data__c> phInsert = new List<PhoneHome_Data__c>();
        
        PhoneHome_Data__c ph1 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-20), host_count__c = 20, vm_count__c = 200, license_type__c = 'VHM');
		phInsert.add(ph1);
		PhoneHome_Data__c ph2 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-10), host_count__c = 25, vm_count__c = 250, license_type__c = 'vmt_freemium');
		phInsert.add(ph2);
		PhoneHome_Data__c ph3 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today(), host_count__c = 50, vm_count__c = 500, license_type__c = 'VHM');
		phInsert.add(ph3);
		PhoneHome_Data__c ph4 = new PhoneHome_Data__c(Licensee_Email__c = 'def@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-20), host_count__c = 20, vm_count__c = 200, license_type__c = 'VHM');
		phInsert.add(ph4);        
        PhoneHome_Data__c ph5 = new PhoneHome_Data__c(Licensee_Email__c = 'def@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-18), host_count__c = 21, vm_count__c = 195, license_type__c = '30-Day Trial');
		phInsert.add(ph5); 
		
		insert phInsert;
		
		List<Turbonomic_License__c> tlInsert = new List<Turbonomic_License__c>();
		
		Turbonomic_License__c tl1 = new Turbonomic_License__c(Licensee_Email__c = 'abc@vmturbo.com', licensee_name__c = 'Test One', License_Type__c = 'Eval', License_end_date__c = date.today().addDays(-5), status__c = 'Open', license_creation_use_Cases__c = 'Other', other_reason__c = 'I dunno', license_key_plain_text__c = 'blah');
		tlInsert.add(tl1);
		Turbonomic_License__c tl2 = new Turbonomic_License__c(Licensee_Email__c = 'def@vmturbo.com', licensee_name__c = 'Test Two', License_Type__c = 'Eval', License_end_date__c = date.today().addDays(-5), status__c = 'Open', license_creation_use_cases__c = 'Other', other_reason__c = 'I dunno', license_key_plain_text__c = 'blah');
		tlInsert.add(tl2);
		
		insert tlInsert;
		
		Test.startTest();
		BatchFillPhoneHomeData b = new BatchFillPhoneHomeData();
		b.query = 'SELECT id, account__c, email, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Lead where id = \'' + l1.id + '\' or id = \'' + l2.id + '\'';
		ID batchprocessid = Database.executeBatch(b);
		Test.stopTest();
		
		List<Lead> leadResults = [select id, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Lead where id =: l1.id or id =: l2.id];
		List<Turbonomic_License__c> tlResults = [select id, account__c, lead__c, status__c from Turbonomic_License__c where id =: tl1.id or id =: tl2.id];
		
		for (Lead l : leadResults){
			if (l.id == l1.id) {
				system.assertEquals(l.phoneHome_Data_Last_Refreshed__c,date.today());
				system.assertEquals(l.phoneHome_Number_of_Hosts__c,50);
				system.assertEquals(l.phoneHome_Number_of_VMs__c,500);
				system.assertEquals(l.phoneHome_License_Type__c,'VHM');
			} else if (l.id == l2.id) {
				system.assertEquals(l.phoneHome_Data_Last_Refreshed__c,date.today().addDays(-18));
				system.assertEquals(l.phoneHome_Number_of_Hosts__c,21);
				system.assertEquals(l.phoneHome_Number_of_VMs__c,195);
				system.assertEquals(l.phoneHome_License_Type__c,'30-Day Trial');
			}
		}
		
		for (Turbonomic_License__c tl : tlResults) {
			if (tl.id == tl1.id) {
				system.assertEquals(tl.account__c,acct1.id);
				system.assertEquals(tl.lead__c,l1.id);
				system.assertEquals(tl.status__c,'Expired');
			} else {
				system.assertEquals(tl.account__c,null);
				system.assertEquals(tl.lead__c,l2.id);
				system.assertEquals(tl.status__c,'Expired');
			}
		}
		
    }
    
    
    static testMethod void myUnitTest2() {
    	
    	Account acct1 = new Account(name = 'VMTurbo');
    	insert acct1;
    	
    	List<Contact> leadInsert = new List<Contact>();
        
        Contact l1 = new Contact(firstName = 'Test', lastName = 'One', email = 'abc@vmturbo.com', leadSource = 'Inbound - VHM', accountId = acct1.id);
        leadInsert.add(l1);
        Contact l2 = new Contact(firstName = 'Test', lastName = 'Two', email = 'def@vmturbo.com', leadSource = 'Inbound - VHM');
        leadInsert.add(l2);
        
        insert leadInsert;
        
        List<PhoneHome_Data__c> phInsert = new List<PhoneHome_Data__c>();
        
        PhoneHome_Data__c ph1 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-20), host_count__c = 20, vm_count__c = 200, license_type__c = 'VHM');
		phInsert.add(ph1);
		PhoneHome_Data__c ph2 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-10), host_count__c = 25, vm_count__c = 250, license_type__c = 'vmt_freemium');
		phInsert.add(ph2);
		PhoneHome_Data__c ph3 = new PhoneHome_Data__c(Licensee_Email__c = 'abc@vmturbo.com', Last_Diag_Upload_Date__c = date.today(), host_count__c = 50, vm_count__c = 500, license_type__c = 'VHM');
		phInsert.add(ph3);
		PhoneHome_Data__c ph4 = new PhoneHome_Data__c(Licensee_Email__c = 'def@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-20), host_count__c = 20, vm_count__c = 200, license_type__c = 'VHM');
		phInsert.add(ph4);        
        PhoneHome_Data__c ph5 = new PhoneHome_Data__c(Licensee_Email__c = 'def@vmturbo.com', Last_Diag_Upload_Date__c = date.today().addDays(-18), host_count__c = 21, vm_count__c = 195, license_type__c = '30-Day Trial');
		phInsert.add(ph5); 
		
		insert phInsert;
		
		List<Turbonomic_License__c> tlInsert = new List<Turbonomic_License__c>();
		
		Turbonomic_License__c tl1 = new Turbonomic_License__c(Licensee_Email__c = 'abc@vmturbo.com', licensee_name__c = 'Test One', License_Type__c = 'Eval', License_end_date__c = date.today().addDays(-5), status__c = 'Open', license_creation_use_Cases__c = 'Other', other_reason__c = 'I dunno', license_key_plain_text__c = 'blah');
		tlInsert.add(tl1);
		Turbonomic_License__c tl2 = new Turbonomic_License__c(Licensee_Email__c = 'def@vmturbo.com', licensee_name__c = 'Test Two', License_Type__c = 'Eval', License_end_date__c = date.today().addDays(-5), status__c = 'Open', license_creation_use_cases__c = 'Other', other_reason__c = 'I dunno', license_key_plain_text__c = 'blah');
		tlInsert.add(tl2);
		
		insert tlInsert;
		
		Test.startTest();
		BatchFillPhoneHomeDataCon b = new BatchFillPhoneHomeDataCon();
		b.query = 'SELECT id, accountId, email, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Contact where id = \'' + l1.id + '\' or id = \'' + l2.id + '\'';
		ID batchprocessid = Database.executeBatch(b);
		Test.stopTest();
		
		List<Contact> leadResults = [select id, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Contact where id =: l1.id or id =: l2.id];
		List<Turbonomic_License__c> tlResults = [select id, Account__c, status__c from Turbonomic_License__c where id =: tl1.id or id =: tl2.id];
		
		
		for (Contact l : leadResults){
			if (l.id == l1.id) {
				system.assertEquals(l.phoneHome_Data_Last_Refreshed__c,date.today());
				system.assertEquals(l.phoneHome_Number_of_Hosts__c,50);
				system.assertEquals(l.phoneHome_Number_of_VMs__c,500);
				system.assertEquals(l.phoneHome_License_Type__c,'VHM');
			} else if (l.id == l2.id) {
				system.assertEquals(l.phoneHome_Data_Last_Refreshed__c,date.today().addDays(-18));
				system.assertEquals(l.phoneHome_Number_of_Hosts__c,21);
				system.assertEquals(l.phoneHome_Number_of_VMs__c,195);
				system.assertEquals(l.phoneHome_License_Type__c,'30-Day Trial');
			}
		}
		
		for (Turbonomic_License__c tl : tlResults) {
			if (tl.id == tl1.id) {
				system.assertEquals(tl.account__c, acct1.id);
				system.assertEquals(tl.status__c, 'Expired');
			} else {
				system.assertEquals(tl.account__c, null);
				system.assertEquals(tl.status__c, 'Expired');
			}
		}
    	
    	
    	
    }
}