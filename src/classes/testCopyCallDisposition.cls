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
private class testCopyCallDisposition {

    static testMethod void myUnitTest(){
    	
    	lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
    	
		Account acct = new Account (Name = 'Test Company', Industry = 'Financial Services');
        insert acct;
        
        Task tsk = new Task(Subject = 'Test', ActivityDate=Date.today(), WhatId = acct.id, CallDisposition = 'No Answer');
        insert tsk;
		
		tsk = [select CallDisposition, Call_Disposition__c from Task where id=:tsk.id];
		System.assert( tsk.CallDisposition.equals(tsk.Call_Disposition__c) );
		
		Task tsk2 = new Task(Subject = 'Test2', ActivityDate=Date.today(), WhatId = acct.id, CallDisposition = 'Left Voicemail');
        insert tsk2;
		
		tsk2 = [select CallDisposition, Call_Disposition__c from Task where id=:tsk2.id];
		System.assert( tsk2.CallDisposition.equals(tsk2.Call_Disposition__c) );
	}
}