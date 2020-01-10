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
private class TestBatchUpdatePartnerInfo {
/*
    static testMethod void myUnitTest() {
        
        List<Account> accountInsert = new List<Account>();
        List<Opportunity> oppInsert = new List<Opportunity>();
        List<VartopiaDRS__Registration__c> regInsert = new List<VartopiaDRS__Registration__c>();
        List<Partner_Office__c> poInsert = new List<Partner_Office__c>();
        
        //account with normal parameters - has offices, regs, bookings
        Account acct1 = new Account(name = 'Test Company');
        accountInsert.add(acct1);
        //account with nothing but has stats, so they should all be zeroed or nulled out
        Account acct2 = new Account(name = 'Test Company 2', first_registration_date__c = date.today().addDays(-15), last_registration_date__c = date.today(), number_of_registrations__c = 5, Active_Partner__c = true, number_of_booked_registrations__c = 1, number_of_partner_offices__c = 4);
		accountInsert.add(acct2);
		//account with wrong stats, fixed by batch
		Account acct3 = new Account(name = 'Test Company 3', first_registration_date__c = date.today().addDays(-15), last_registration_date__c = date.today(), number_of_registrations__c = 5, Active_Partner__c = true, number_of_booked_registrations__c = 1, number_of_partner_offices__c = 4);
		accountInsert.add(acct3);
		//account that is marked active partner but not really
		Account acct4 = new Account(name = 'Test Company 4', first_registration_date__c = date.today().addDays(-15), last_registration_date__c = date.today(), number_of_registrations__c = 5, Active_Partner__c = true, number_of_booked_registrations__c = 1, number_of_partner_offices__c = 4);
		accountInsert.add(acct4);
		
		insert accountInsert;
        
		//linked to acct1
		Opportunity opp1 = new Opportunity(accountId = acct1.id, name = 'Test Opp', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));		
		oppInsert.add(opp1);
		Opportunity opp2 = new Opportunity(accountId = acct1.id, name = 'Test Opp', amount = 100.00, StageName = 'Closed Won', type = 'New', closeDate = Date.today());		
		oppInsert.add(opp2);
		//linked to acct3
		Opportunity opp3 = new Opportunity(accountId = acct3.id, name = 'Test Opp', amount = 100.00, StageName = 'Closed Won', type = 'New', closeDate = Date.today());		
		oppInsert.add(opp3);
		//linked to acct4
		Opportunity opp4 = new Opportunity(accountId = acct4.id, name = 'Test Opp', amount = 100.00, StageName = 'Closed Won', type = 'New', closeDate = Date.today());		
		oppInsert.add(opp4);
		Opportunity opp5 = new Opportunity(accountId = acct4.id, name = 'Test Opp', amount = 100.00, StageName = 'Identify', type = 'New', closeDate = Date.today());		
		oppInsert.add(opp5);
		insert oppInsert;

		//linked to acct1
        VartopiaDRS__Registration__c reg1 = new VartopiaDRS__Registration__c(VartopiaDRS__Approved_Date__c = Date.today().addDays(-15), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-15), VartopiaDRS__Partner_Account__c = acct1.id, VartopiaDRS__Opportunity__c = opp1.id);
		regInsert.add(reg1);
		VartopiaDRS__Registration__c reg2 = new VartopiaDRS__Registration__c(VartopiaDRS__Approved_Date__c = Date.today().addDays(-15), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = acct1.id, VartopiaDRS__Opportunity__c = opp2.id);
		regInsert.add(reg2);
		//linked to acct3
		VartopiaDRS__Registration__c reg3 = new VartopiaDRS__Registration__c(VartopiaDRS__Approved_Date__c = Date.today().addDays(-10), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-25), VartopiaDRS__Partner_Account__c = acct3.id, VartopiaDRS__Opportunity__c = opp3.id);
		regInsert.add(reg3);
		VartopiaDRS__Registration__c reg4 = new VartopiaDRS__Registration__c(VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = acct3.id, VartopiaDRS__Opportunity__c = opp3.id);
		regInsert.add(reg4);
		//linked to acct4
		VartopiaDRS__Registration__c reg5 = new VartopiaDRS__Registration__c(VartopiaDRS__Approved_Date__c = Date.today().addDays(-370), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-380), VartopiaDRS__Partner_Account__c = acct4.id, VartopiaDRS__Opportunity__c = opp4.id);
		regInsert.add(reg5);
		VartopiaDRS__Registration__c reg6 = new VartopiaDRS__Registration__c(VartopiaDRS__Date_Submitted__c = Date.today().addDays(-200), VartopiaDRS__Partner_Account__c = acct4.id, VartopiaDRS__Opportunity__c = opp5.id);
		regInsert.add(reg6);
		
		insert regInsert;
		
		//linked to acct1
		Partner_Office__c po1 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct1.id);
		poInsert.add(po1);
		Partner_Office__c po2 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct1.id);
		poInsert.add(po2);
		//linked to acct3
		Partner_Office__c po3 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct3.id);
		poInsert.add(po3);
		Partner_Office__c po4 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct3.id);
		poInsert.add(po4);
		//linked to acct4
		Partner_Office__c po5 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct4.id);
		poInsert.add(po5);
		Partner_Office__c po6 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct4.id);
		poInsert.add(po6);
		Partner_Office__c po7 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct4.id);
		poInsert.add(po7);
		Partner_Office__c po8 = new Partner_Office__c(name = 'Test Company [arizona]', parent_partner_account__c = acct4.id);
		poInsert.add(po8);
		
		insert(poInsert);
		
		Test.StartTest();
		BatchUpdatePartnerInfo b = new BatchUpdatePartnerInfo();
		b.query = 'Select id, name, first_registration_date__c, last_registration_date__c, number_of_registrations__c, Active_Partner__c, number_of_booked_registrations__c, number_of_partner_offices__c from Account where id = \'' + acct1.id + '\' or id = \'' + acct2.id + '\' or id =\'' + acct3.id + '\' or id = \'' + acct4.id + '\'';
		ID batchprocessid = Database.executeBatch(b,10);
		Test.StopTest();
		
		List<Account> acctResults = [select id, name, first_registration_date__c, last_registration_date__c, number_of_registrations__c, Active_Partner__c, number_of_booked_registrations__c, number_of_partner_offices__c from Account where id =: acct1.id or id =: acct2.id or id =: acct3.id or id =: acct4.id];
		List<Opportunity> oppResults = [select id, number_of_approved_registrations__c from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id];
		
		for (Account a : acctResults){
			if (a.id == acct1.id) {
				system.assertEquals(a.first_registration_date__c,date.today().addDays(-15));
				system.assertEquals(a.last_registration_date__c,date.today().addDays(-5));
				system.assertEquals(a.number_of_registrations__c,2);
				system.assertEquals(a.number_of_booked_registrations__c,1);
				system.assertEquals(a.Active_Partner__c,true);
				system.assertEquals(a.number_of_partner_offices__c,2);
			} else if (a.id == acct2.id) {
				system.assertEquals(a.first_registration_date__c,null);
				system.assertEquals(a.last_registration_date__c,null);
				system.assertEquals(a.number_of_registrations__c,0);
				system.assertEquals(a.number_of_booked_registrations__c,0);
				system.assertEquals(a.Active_Partner__c,false);
				system.assertEquals(a.number_of_partner_offices__c,0);
			} else if (a.id == acct3.id) {
				system.assertEquals(a.first_registration_date__c,date.today().addDays(-25));
				system.assertEquals(a.last_registration_date__c,date.today().addDays(-5));
				system.assertEquals(a.number_of_registrations__c,2);
				system.assertEquals(a.number_of_booked_registrations__c,2);
				system.assertEquals(a.Active_Partner__c,true);
				system.assertEquals(a.number_of_partner_offices__c,2);
			}  else if (a.id == acct4.id) {
				system.assertEquals(a.first_registration_date__c,date.today().addDays(-380));
				system.assertEquals(a.last_registration_date__c,date.today().addDays(-200));
				system.assertEquals(a.number_of_registrations__c,2);
				system.assertEquals(a.number_of_booked_registrations__c,1);
				system.assertEquals(a.Active_Partner__c,false);
				system.assertEquals(a.number_of_partner_offices__c,4);
			} 
		}
		
		for (Opportunity o : oppResults) {
			if (o.id == opp1.id) {
				system.assertEquals(o.number_of_approved_registrations__c,1);
			} else if (o.id == opp2.id) {
				system.assertEquals(o.number_of_approved_registrations__c,1);
			} else if (o.id == opp3.id) {
				system.assertEquals(o.number_of_approved_registrations__c,1);
			} else if (o.id == opp4.id) {
				system.assertEquals(o.number_of_approved_registrations__c,1);
			} else if (o.id == opp5.id) {
				system.assertEquals(o.number_of_approved_registrations__c,0);
			}
		}	
    }
*/
    
    static testMethod void myUnitTest2() {
    	
    	// instantiate all partner accounts
    	List<Account> partnerAcctInsert = new List<Account>();
    	Account a1 = new Account(name = 'Partner A');		//all criteria are 5
    	partnerAcctInsert.add(a1);
    	Account a2 = new Account(name = 'Partner B');		//all criteria are 4
    	partnerAcctInsert.add(a2);
    	Account a3 = new Account(name = 'Partner C');		//all criteria are 3
    	partnerAcctInsert.add(a3);
    	Account a4 = new Account(name = 'Partner D');		//all criteria are 2
    	partnerAcctInsert.add(a4);
    	Account a5 = new Account(name = 'Partner E');		//all criteria are 1
    	partnerAcctInsert.add(a5);
    	Account a6 = new Account(name = 'Partner F');		//all criteria are 0
    	partnerAcctInsert.add(a6);
    	insert partnerAcctInsert;
    	
    	// instantiate all customer accts for mapping
    	List<Account> customerAcctInsert = new List<Account>();
    	Account acct1 = new Account(name = 'customer Acct');
    	Account acct2 = new Account(name = 'customer Acct2');
    	Account acct3 = new Account(name = 'customer Acct3');
    	Account acct4 = new Account(name = 'customer Acct4');
    	Account acct5 = new Account(name = 'customer Acct5');
    	customerAcctInsert.add(acct1);
    	customerAcctInsert.add(acct2);
    	customerAcctInsert.add(acct3);
    	customerAcctInsert.add(acct4);
    	customerAcctInsert.add(acct5);
    	for (Integer i=0; i<50; i++) {
    		Account tempAcct = new Account(name = 'ACustomer ' + i, partner_account_1__c = a1.id);
    		customerAcctInsert.add(tempAcct);
    	}
    	for (Integer i=0; i<40; i++) {
    		Account tempAcct = new Account(name = 'BCustomer ' + i, partner_account_1__c = a2.id);
    		customerAcctInsert.add(tempAcct);
    	}
    	for (Integer i=0; i<30; i++) {
    		Account tempAcct = new Account(name = 'CCustomer ' + i, partner_account_1__c = a3.id);
    		customerAcctInsert.add(tempAcct);
    	}
    	for (Integer i=0; i<20; i++) {
    		Account tempAcct = new Account(name = 'DCustomer ' + i, partner_account_1__c = a4.id);
    		customerAcctInsert.add(tempAcct);
    	}
    	for (Integer i=0; i<10; i++) {
    		Account tempAcct = new Account(name = 'ECustomer ' + i, partner_account_1__c = a5.id);
    		customerAcctInsert.add(tempAcct);
    	}
    	insert customerAcctInsert;
    	
    	List<Partner_Office__c> partnerOfficeInsert = new List<Partner_Office__c>();
    	for (Integer i=0; i<10; i++) {
    		Partner_Office__c tempPO = new Partner_Office__c(name = 'OfficeA', parent_partner_account__c = a1.id);
    		partnerOfficeInsert.add(tempPO);
    	}
    	for (Integer i=0; i<8; i++) {
    		Partner_Office__c tempPO = new Partner_Office__c(name = 'OfficeB', parent_partner_account__c = a2.id);
    		partnerOfficeInsert.add(tempPO);
    	}
    	for (Integer i=0; i<6; i++) {
    		Partner_Office__c tempPO = new Partner_Office__c(name = 'OfficeC', parent_partner_account__c = a3.id);
    		partnerOfficeInsert.add(tempPO);
    	}
    	for (Integer i=0; i<4; i++) {
    		Partner_Office__c tempPO = new Partner_Office__c(name = 'OfficeD', parent_partner_account__c = a4.id);
    		partnerOfficeInsert.add(tempPO);
    	}
    	for (Integer i=0; i<2; i++) {
    		Partner_Office__c tempPO = new Partner_Office__c(name = 'OfficeE', parent_partner_account__c = a5.id);
    		partnerOfficeInsert.add(tempPO);
    	}
    	insert partnerOfficeInsert;
    	
    	List<Contact> contactInsert = new List<Contact>();
    	for (Integer i=0; i<50; i++) {
    		Contact tempCon = new Contact(firstName = 'Test', lastName = 'Contact', accountId = a1.id, Partner_Contact__c = 'A');
    		if (i < 25) {
    			tempCon.Partner_Contact_Department__c = 'Sales';
    		} else if (i < 40){
    			tempCon.Partner_Contact_Department__c = 'Technical';
    		} else {
    			tempCon.Partner_Contact_Department__c = 'Management';
    		}
    		if (i < 40) {
    			if (math.mod(i,4) == 0) {
    				tempCon.Ace_Certification__c = 'Ace';
    			}
    		}
    		contactInsert.add(tempCon);
    	}
    	for (Integer i=0; i<40; i++) {
    		Contact tempCon = new Contact(firstName = 'Test', lastName = 'Contact', accountId = a2.id, Partner_Contact__c = 'A');
    		if (i < 20) {
    			tempCon.Partner_Contact_Department__c = 'Sales';
    		} else if (i < 32){
    			tempCon.Partner_Contact_Department__c = 'Technical';
    		} else {
    			tempCon.Partner_Contact_Department__c = 'Management';
    		}
    		if (i < 32) {
    			if (math.mod(i,4) == 0) {
    				tempCon.Ace_Certification__c = 'Ace';
    			}
    		}
    		contactInsert.add(tempCon);
    	}
    	for (Integer i=0; i<30; i++) {
    		Contact tempCon = new Contact(firstName = 'Test', lastName = 'Contact', accountId = a3.id, Partner_Contact__c = 'A');
    		if (i<15) {
    			tempCon.Partner_Contact_Department__c = 'Sales';
    		} else if (i < 24){
    			tempCon.Partner_Contact_Department__c = 'Technical';
    		} else {
    			tempCon.Partner_Contact_Department__c = 'Management';
    		}
    		if (i < 24) {
	    		if (math.mod(i,4) == 0) {
	    			tempCon.Ace_Certification__c = 'Ace';
	    		}
    		}
    		contactInsert.add(tempCon);
    	}
    	for (Integer i=0; i<20; i++) {
    		Contact tempCon = new Contact(firstName = 'Test', lastName = 'Contact', accountId = a4.id, Partner_Contact__c = 'A');
    		if (i < 10) {
    			tempCon.Partner_Contact_Department__c = 'Sales';
    		} else if (i < 16){
    			tempCon.Partner_Contact_Department__c = 'Technical';
    		} else {
    			tempCon.Partner_Contact_Department__c = 'Management';
    		}
    		if (i < 16) {
	    		if (math.mod(i,4) == 0) {
	    			tempCon.Ace_Certification__c = 'Ace';
	    		}
    		}
    		contactInsert.add(tempCon);
    	}
    	for (Integer i=0; i<10; i++) {
    		Contact tempCon = new Contact(firstName = 'Test', lastName = 'Contact', accountId = a5.id, Partner_Contact__c = 'A');
    		if (i < 5) {
    			tempCon.Partner_Contact_Department__c = 'Sales';
    		} else if (i < 8){
    			tempCon.Partner_Contact_Department__c = 'Technical';
    		} else {
    			tempCon.Partner_Contact_Department__c = 'Management';
    		}
    		if (i < 8) {
	    		if (math.mod(i,4) == 0) {
	    			tempCon.Ace_Certification__c = 'Ace';
	    		}
    		}
    		contactInsert.add(tempCon);
    	}
    	insert contactInsert;
    	
    	Map<Integer,Map<id,Opportunity>> oppInsert = new Map<Integer,Map<id,Opportunity>>();
    	for (integer i=1; i<6; i++) {
    		Map<id,Opportunity> tempOppMap = new Map<id,Opportunity>();
    		oppInsert.put(i,tempOppMap);
    	}
    	List<Opportunity> oppsToInsert = new List<Opportunity>();
		Set<id> oppIds = new Set<id>();
		
		for (Integer i=0; i<50; i++) {
			Opportunity tempOpp = new Opportunity(name = 'opp', accountId = acct1.id, amount = 40000, type = 'New');
			if (i < 13) {
				tempOpp.stageName = 'Closed Won';
				tempOpp.closeDate = date.today().addDays(-3);
			} else {
				tempOpp.stageName = 'Upside';
				tempOpp.closeDate = date.today().addDays(5);
			}
			oppsToInsert.add(tempOpp);
		}
		for (Integer i=0; i<40; i++) {
			Opportunity tempOpp = new Opportunity(name = 'opp', accountId = acct2.id, amount = 40000, type = 'New');
			if (i < 10) {
				tempOpp.stageName = 'Closed Won';
				tempOpp.closeDate = date.today().addDays(-3);
			} else {
				tempOpp.stageName = 'Upside';
				tempOpp.closeDate = date.today().addDays(5);
			}
			oppsToInsert.add(tempOpp);
		}
		for (Integer i=0; i<30; i++) {
			Opportunity tempOpp = new Opportunity(name = 'opp', accountId = acct3.id, amount = 40000, type = 'New');
			if (i < 8) {
				tempOpp.stageName = 'Closed Won';
				tempOpp.closeDate = date.today().addDays(-3);
			} else {
				tempOpp.stageName = 'Upside';
				tempOpp.closeDate = date.today().addDays(5);
			}
			oppsToInsert.add(tempOpp);
		}
		for (Integer i=0; i<20; i++) {
			Opportunity tempOpp = new Opportunity(name = 'opp', accountId = acct4.id, amount = 40000, type = 'New');
			if (i < 5) {
				tempOpp.stageName = 'Closed Won';
				tempOpp.closeDate = date.today().addDays(-3);
			} else {
				tempOpp.stageName = 'Upside';
				tempOpp.closeDate = date.today().addDays(5);
			}
			oppsToInsert.add(tempOpp);
		}
		for (Integer i=0; i<10; i++) {
			Opportunity tempOpp = new Opportunity(name = 'opp', accountId = acct5.id, amount = 40000, type = 'New');
			if (i < 3) {
				tempOpp.stageName = 'Closed Won';
				tempOpp.closeDate = date.today().addDays(-3);
			} else {
				tempOpp.stageName = 'Upside';
				tempOpp.closeDate = date.today().addDays(5);
			}
			oppsToInsert.add(tempOpp);
		}
		system.debug('### inserting ' + oppsToInsert.size() + ' opps');
		insert oppsToInsert;
		
		
		
		
		Map<id,Opportunity> afterInsertOpps = new Map<id,Opportunity>([select id, accountId, amount, stageName, type, opportunity_id_date__c, closeDate from Opportunity where accountId =: acct1.id or accountId =: acct2.id or accountId =: acct3.id or accountId =: acct4.id or accountId =: acct5.id]);
		system.debug('### managed to query ' + afterInsertOpps.size() + ' opps out of ' + oppsToInsert.size());

		system.debug('### oppsInserted has ' + afterInsertOpps.size());
		for (Opportunity o : afterInsertOpps.values()) {
			if (o.accountId == acct1.id) {
				Map<id,Opportunity> tempOppMap = oppInsert.get(1);
				tempOppMap.put(o.id,o);
				oppInsert.put(1,tempOppMap);
			}
			if (o.accountId == acct2.id) {
				Map<id,Opportunity> tempOppMap = oppInsert.get(2);
				tempOppMap.put(o.id,o);
				oppInsert.put(2,tempOppMap);
			}
			if (o.accountId == acct3.id) {
				Map<id,Opportunity> tempOppMap = oppInsert.get(3);
				tempOppMap.put(o.id,o);
				oppInsert.put(3,tempOppMap);
			}
			if (o.accountId == acct4.id) {
				Map<id,Opportunity> tempOppMap = oppInsert.get(4);
				tempOppMap.put(o.id,o);
				oppInsert.put(4,tempOppMap);
			}
			if (o.accountId == acct5.id) {
				Map<id,Opportunity> tempOppMap = oppInsert.get(5);
				tempOppMap.put(o.id,o);
				oppInsert.put(5,tempOppMap);
			}
		}
		
		List<VartopiaDRS__Registration__c> regInsert = new List<VartopiaDRS__Registration__c>();
		
		Integer x=0;
		Integer y=0;
		Map<id,Opportunity> oppMap1 = oppInsert.get(1);
		system.debug('### oppMap1 has ' + oppMap1.size() + ' opps');
		system.assert(oppMap1.size() == 50);
		
		List<Opportunity> updateOppIdDateList = new List<Opportunity>();
		for (Opportunity o : oppMap1.values()) {
			if (o.stageName == 'Closed Won') {
				if (math.mod(x,2) != 0) {
					system.debug('### processing new reg: x = ' + x + ' and approval date is > 6 months ago' );
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a1.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				} else {
					system.debug('### processing new reg: x = ' + x + ' and approval date is < 6 months ago' );
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a1.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				}
			} else {
				if (math.mod(y,2) == 0) {
					system.debug('### processing new reg: y = ' + y + ' and approval date is > 6 months ago' );
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a1.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				} else {
					system.debug('### processing new reg: y = ' + y + ' and approval date is < 6 months ago' );
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a1.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				}
			}
		}
		
		x=0;
		y=0;
		Map<id,Opportunity> oppMap2 = oppInsert.get(2);
		for (Opportunity o : oppMap2.values()) {
			if (o.stageName == 'Closed Won') {
				if (math.mod(x,2) != 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a2.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a2.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				}
			} else {
				if (math.mod(y,2) == 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a2.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a2.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				}
			}
		}
		
		x=0;
		y=0;
		Map<id,Opportunity> oppMap3 = oppInsert.get(3);
		for (Opportunity o : oppMap3.values()) {
			if (o.stageName == 'Closed Won') {
				if (math.mod(x,2) != 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a3.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a3.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				}
			} else {
				if (math.mod(y,2) == 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a3.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a3.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				}
			}
		}
		
		x=0;
		y=0;
		Map<id,Opportunity> oppMap4 = oppInsert.get(4);
		for (Opportunity o : oppMap4.values()) {
			if (o.stageName == 'Closed Won') {
				if (math.mod(x,2) != 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a4.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a4.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				}
			} else {
				if (math.mod(y,2) == 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a4.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a4.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				}
			}
		}
		
		x=0;
		y=0;
		Map<id,Opportunity> oppMap5 = oppInsert.get(5);
		for (Opportunity o : oppMap5.values()) {
			if (o.stageName == 'Closed Won') {
				if (math.mod(x,2) != 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a5.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a5.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					x++;
				}
			} else {
				if (math.mod(y,2) == 0) {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Joint/Accelerated', VartopiaDRS__Approved_Date__c = Date.today().addDays(-185), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a5.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				} else {
					VartopiaDRS__Registration__c tempReg = new VartopiaDRS__Registration__c(deal_type__c = 'Incremental', VartopiaDRS__Approved_Date__c = Date.today().addDays(-5), VartopiaDRS__Date_Submitted__c = Date.today().addDays(-5), VartopiaDRS__Partner_Account__c = a5.id, VartopiaDRS__Opportunity__c = o.id);
					regInsert.add(tempReg);
					y++;
				}
			}
		}
		insert regInsert;
		
		Integer o1 = 0;	Integer o11 = 0; Integer o111 = 0; Integer o1111 = 0;
		Integer o2 = 0;	Integer o22 = 0; Integer o222 = 0; Integer o2222 = 0;
		Integer o3 = 0;	Integer o33 = 0; Integer o333 = 0; Integer o3333 = 0;
		Integer o4 = 0;	Integer o44 = 0; Integer o444 = 0; Integer o4444 = 0;
		Integer o5 = 0;	Integer o55 = 0; Integer o555 = 0; Integer o5555 = 0;
		
		List<VartopiaDRS__Registration__c> regList = [select deal_type__c, vartopiaDRS__Opportunity__c, vartopiaDRS__partner_account__c from VartopiaDRS__Registration__c where vartopiaDRS__partner_account__c =: a1.id or vartopiaDRS__partner_account__c =: a2.id or vartopiaDRS__partner_account__c =: a3.id or vartopiaDRS__partner_account__c =: a4.id or vartopiaDRS__partner_account__c =: a5.id];
		List<Opportunity> oppIDdateListUpdate = new List<Opportunity>();
		x=0;
		for (VartopiaDRS__Registration__c reg : regList) {
			if (reg.vartopiaDRS__partner_account__c == a1.id) {
				x++;
				Opportunity o = oppMap1.get(reg.vartopiaDRS__opportunity__c);
				
				if (reg.deal_type__c == 'Incremental') {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o111,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o111++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o111++;
						}
					}
					if (math.mod(o1,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o1++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o1++;
					}
				} else {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o1111,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o1111++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o1111++;
						}
					}
					if (math.mod(o11,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o11++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o11++;
					}
				}
				oppIDdateListUpdate.add(o);
			} else if (reg.vartopiaDRS__partner_account__c == a2.id) {
				Opportunity o = oppMap2.get(reg.vartopiaDRS__opportunity__c);
				
				if (reg.deal_type__c == 'Incremental') {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o222,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o222++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o222++;
						}
					}
					if (math.mod(o2,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o2++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o2++;
					}
				} else {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o2222,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o2222++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o2222++;
						}
					}
					if (math.mod(o22,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o22++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o22++;
					}
				}
				oppIDdateListUpdate.add(o);
			} else if (reg.vartopiaDRS__partner_account__c == a3.id) {
				Opportunity o = oppMap3.get(reg.vartopiaDRS__opportunity__c);
				
				if (reg.deal_type__c == 'Incremental') {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o333,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o333++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o333++;
						}
					}
					if (math.mod(o3,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o3++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o3++;
					}
				} else {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o3333,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o3333++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o3333++;
						}
					}
					if (math.mod(o33,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o33++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o33++;
					}
				}
				oppIDdateListUpdate.add(o);
			} else if (reg.vartopiaDRS__partner_account__c == a4.id) {
				Opportunity o = oppMap4.get(reg.vartopiaDRS__opportunity__c);
				
				if (reg.deal_type__c == 'Incremental') {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o444,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o444++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o444++;
						}
					}
					if (math.mod(o4,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o4++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o4++;
					}
				} else {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o4444,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o4444++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o4444++;
						}
					}
					if (math.mod(o44,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o44++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o44++;
					}
				}
				oppIDdateListUpdate.add(o);
			} else if (reg.vartopiaDRS__partner_account__c == a5.id) {
				Opportunity o = oppMap5.get(reg.vartopiaDRS__opportunity__c);
				
				if (reg.deal_type__c == 'Incremental') {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o555,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o555++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o555++;
						}
					}
					if (math.mod(o5,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o5++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o5++;
					}
				} else {
					if (o.stageName == 'Closed Won') {
						if (math.mod(o5555,2) != 0) {
							o.closeDate = date.today().addDays(-185);
							o5555++;
						} else {
							o.closeDate = date.today().addDays(-3);
							o5555++;
						}
					}
					if (math.mod(o55,2) == 0) {
						o.opportunity_id_date__c = date.today().addDays(-5);
						o55++;
					} else {
						o.opportunity_id_date__c = date.today().addDays(-185);
						o55++;
					}
				}
				oppIDdateListUpdate.add(o);
			}
		}
		
		system.debug('### ' + x);
		
		update oppIDdateListUpdate;
		
		
		
		Test.StartTest();
		BatchUpdatePartnerInfo b = new BatchUpdatePartnerInfo();
		b.query = 	'SELECT ID, Name, AR12_Score__c, AR6_Score__c, IP12_Score__c, IP6_Score__c, TP12_Score__c, TP6_Score__c, IR12_Score__c, IR6_Score__c, TR12_Score__c, ' + 
					'TR6_Score__c, NGPC_Score__c, NAS_Score__c, NAT_Score__c, NPO_Score__c, NMA_Score__c, NAC_Score__c, Graded_Partners_C_and_Above__c, A_and_B_Graded_Sales_Partners__c, ' +
					'A_and_B_Graded_Tech_Partners__c, Number_of_ACE_Certified_Contacts__c, number_of_mapped_sales_accounts__c, Number_Of_Partner_Offices__c, registered_bookings_last_12_months__c, ' +
					'registered_bookings_last_6_months__c, incremental_bookings_last_12_months__c, incremental_bookings_last_6_months__c, registered_pipe_adds_last_12_months__c, ' +
					'registered_pipe_adds_last_6_months__c, incremental_pipe_adds_last_12_months__c, incremental_pipe_adds_last_6_months__c, approved_registrations_last_12_months__c, ' +
					'approved_registrations_last_6_months__c, Active_Partner__c, first_registration_date__c, last_registration_date__c, number_of_registrations__c, number_of_booked_registrations__c ' +
					'FROM Account WHERE id = \'' + a1.id + '\' OR id = \'' + a2.id + '\' OR id = \'' + a3.id + '\' OR id = \'' + a4.id + '\' OR id = \'' + a5.id + '\' OR id = \'' + a6.id + '\''; 
		ID batchprocessid = Database.executeBatch(b);
		Test.StopTest();
		
		
		List<Account> acctResults = [SELECT ID, Name, AR12_Score__c, AR6_Score__c, IP12_Score__c, IP6_Score__c, TP12_Score__c, TP6_Score__c, IR12_Score__c, IR6_Score__c, TR12_Score__c, 
									TR6_Score__c, NGPC_Score__c, NAS_Score__c, NAT_Score__c, NPO_Score__c, NMA_Score__c, NAC_Score__c, Graded_Partners_C_and_Above__c, A_and_B_Graded_Sales_Partners__c,
									A_and_B_Graded_Tech_Partners__c, Number_of_ACE_Certified_Contacts__c, number_of_mapped_sales_accounts__c, Number_Of_Partner_Offices__c, registered_bookings_last_12_months__c, 
									registered_bookings_last_6_months__c, incremental_bookings_last_12_months__c, incremental_bookings_last_6_months__c, registered_pipe_adds_last_12_months__c, 
									registered_pipe_adds_last_6_months__c, incremental_pipe_adds_last_12_months__c, incremental_pipe_adds_last_6_months__c, approved_registrations_last_12_months__c, 
									approved_registrations_last_6_months__c, Active_Partner__c, first_registration_date__c, last_registration_date__c, number_of_registrations__c, number_of_booked_registrations__c, Partner_Score__c 
									FROM Account WHERE id =: a1.id or id =: a2.id or id =: a3.id or id =: a4.id or id =: a5.id or id =:a6.id];
									
		for (Account a : acctResults) {
			if (a.id == a1.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,50);
				system.assertEquals(a.approved_registrations_last_6_months__c,25);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,1000000);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,520000);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,2000000);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,1040000);
				system.assertEquals(a.incremental_bookings_last_12_months__c,280000);
				system.assertEquals(a.incremental_bookings_last_6_months__c,160000);
				system.assertEquals(a.registered_bookings_last_12_months__c,520000);
				system.assertEquals(a.registered_bookings_last_6_months__c,280000);
				system.assertEquals(a.graded_partners_c_and_above__c,50);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,25);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,15);
				system.assertEquals(a.number_of_partner_offices__c,10);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,50);
				system.assertEquals(a.number_of_ace_certified_contacts__c,10);
				system.assertEquals(a.AR12_Score__c,5);
				system.assertEquals(a.AR6_Score__c,5);
				system.assertEquals(a.IP12_Score__c,5);
				system.assertEquals(a.IP6_Score__c,5);
				system.assertEquals(a.TP12_score__c,5);
				system.assertEquals(a.TP6_Score__c,5);
				system.assertEquals(a.IR12_Score__c,5);
				system.assertEquals(a.IR6_Score__c,5);
				system.assertEquals(a.TR12_Score__c,5);
				system.assertEquals(a.TR6_Score__c,5);
				system.assertEquals(a.NGPC_Score__c,5);
				system.assertEquals(a.NAS_Score__c,5);
				system.assertEquals(a.NAT_Score__c,5);
				system.assertEquals(a.NPO_Score__c,5);
				system.assertEquals(a.NMA_Score__c,5);
				system.assertEquals(a.NAC_Score__c,5);
				system.assertEquals(a.Partner_Score__c,100);
			} else if (a.id == a2.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,40);
				system.assertEquals(a.approved_registrations_last_6_months__c,20);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,800000);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,400000);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,1600000);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,800000);
				system.assertEquals(a.incremental_bookings_last_12_months__c,200000);
				system.assertEquals(a.incremental_bookings_last_6_months__c,120000);
				system.assertEquals(a.registered_bookings_last_12_months__c,400000);
				system.assertEquals(a.registered_bookings_last_6_months__c,240000);
				system.assertEquals(a.graded_partners_c_and_above__c,40);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,20);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,12);
				system.assertEquals(a.number_of_partner_offices__c,8);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,40);
				system.assertEquals(a.number_of_ace_certified_contacts__c,8);
				system.assertEquals(a.AR12_Score__c,4);
				system.assertEquals(a.AR6_Score__c,4);
				system.assertEquals(a.IP12_Score__c,4);
				system.assertEquals(a.IP6_Score__c,4);
				system.assertEquals(a.TP12_score__c,4);
				system.assertEquals(a.TP6_Score__c,4);
				system.assertEquals(a.IR12_Score__c,4);
				system.assertEquals(a.IR6_Score__c,4);
				system.assertEquals(a.TR12_Score__c,4);
				system.assertEquals(a.TR6_Score__c,4);
				system.assertEquals(a.NGPC_Score__c,4);
				system.assertEquals(a.NAS_Score__c,4);
				system.assertEquals(a.NAT_Score__c,4);
				system.assertEquals(a.NPO_Score__c,4);
				system.assertEquals(a.NMA_Score__c,4);
				system.assertEquals(a.NAC_Score__c,4);
				system.assertEquals(a.Partner_Score__c,80);
			} else if (a.id == a3.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,30);
				system.assertEquals(a.approved_registrations_last_6_months__c,15);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,600000);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,320000);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,1200000);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,640000);
				system.assertEquals(a.incremental_bookings_last_12_months__c,160000);
				system.assertEquals(a.incremental_bookings_last_6_months__c,80000);
				system.assertEquals(a.registered_bookings_last_12_months__c,320000);
				system.assertEquals(a.registered_bookings_last_6_months__c,160000);
				system.assertEquals(a.graded_partners_c_and_above__c,30);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,15);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,9);
				system.assertEquals(a.number_of_partner_offices__c,6);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,30);
				system.assertEquals(a.number_of_ace_certified_contacts__c,6);
				system.assertEquals(a.AR12_Score__c,3);
				system.assertEquals(a.AR6_Score__c,3);
				system.assertEquals(a.IP12_Score__c,3);
				system.assertEquals(a.IP6_Score__c,3);
				system.assertEquals(a.TP12_score__c,3);
				system.assertEquals(a.TP6_Score__c,3);
				system.assertEquals(a.IR12_Score__c,3);
				system.assertEquals(a.IR6_Score__c,3);
				system.assertEquals(a.TR12_Score__c,3);
				system.assertEquals(a.TR6_Score__c,3);
				system.assertEquals(a.NGPC_Score__c,3);
				system.assertEquals(a.NAS_Score__c,3);
				system.assertEquals(a.NAT_Score__c,3);
				system.assertEquals(a.NPO_Score__c,3);
				system.assertEquals(a.NMA_Score__c,3);
				system.assertEquals(a.NAC_Score__c,3);
				system.assertEquals(a.Partner_Score__c,60);
			} else if (a.id == a4.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,20);
				system.assertEquals(a.approved_registrations_last_6_months__c,10);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,400000);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,200000);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,800000);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,400000);
				system.assertEquals(a.incremental_bookings_last_12_months__c,120000);
				system.assertEquals(a.incremental_bookings_last_6_months__c,80000);
				system.assertEquals(a.registered_bookings_last_12_months__c,200000);
				system.assertEquals(a.registered_bookings_last_6_months__c,120000);
				system.assertEquals(a.graded_partners_c_and_above__c,20);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,10);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,6);
				system.assertEquals(a.number_of_partner_offices__c,4);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,20);
				system.assertEquals(a.number_of_ace_certified_contacts__c,4);
				system.assertEquals(a.AR12_Score__c,2);
				system.assertEquals(a.AR6_Score__c,2);
				system.assertEquals(a.IP12_Score__c,2);
				system.assertEquals(a.IP6_Score__c,2);
				system.assertEquals(a.TP12_score__c,2);
				system.assertEquals(a.TP6_Score__c,2);
				system.assertEquals(a.IR12_Score__c,2);
				system.assertEquals(a.IR6_Score__c,3);
				system.assertEquals(a.TR12_Score__c,2);
				system.assertEquals(a.TR6_Score__c,2);
				system.assertEquals(a.NGPC_Score__c,2);
				system.assertEquals(a.NAS_Score__c,2);
				system.assertEquals(a.NAT_Score__c,2);
				system.assertEquals(a.NPO_Score__c,2);
				system.assertEquals(a.NMA_Score__c,2);
				system.assertEquals(a.NAC_Score__c,2);
				system.assertEquals(a.Partner_Score__c,42);
			} else if (a.id == a5.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,10);
				system.assertEquals(a.approved_registrations_last_6_months__c,5);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,200000);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,120000);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,400000);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,240000);
				system.assertEquals(a.incremental_bookings_last_12_months__c,80000);
				system.assertEquals(a.incremental_bookings_last_6_months__c,40000);
				system.assertEquals(a.registered_bookings_last_12_months__c,120000);
				system.assertEquals(a.registered_bookings_last_6_months__c,80000);
				system.assertEquals(a.graded_partners_c_and_above__c,10);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,5);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,3);
				system.assertEquals(a.number_of_partner_offices__c,2);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,10);
				system.assertEquals(a.number_of_ace_certified_contacts__c,2);
				system.assertEquals(a.AR12_Score__c,1);
				system.assertEquals(a.AR6_Score__c,1);
				system.assertEquals(a.IP12_Score__c,1);
				system.assertEquals(a.IP6_Score__c,1);
				system.assertEquals(a.TP12_score__c,1);
				system.assertEquals(a.TP6_Score__c,1);
				system.assertEquals(a.IR12_Score__c,1);
				system.assertEquals(a.IR6_Score__c,1);
				system.assertEquals(a.TR12_Score__c,1);
				system.assertEquals(a.TR6_Score__c,1);
				system.assertEquals(a.NGPC_Score__c,1);
				system.assertEquals(a.NAS_Score__c,1);
				system.assertEquals(a.NAT_Score__c,1);
				system.assertEquals(a.NPO_Score__c,1);
				system.assertEquals(a.NMA_Score__c,1);
				system.assertEquals(a.NAC_Score__c,1);
				system.assertEquals(a.Partner_Score__c,20);
			} else if (a.id == a6.id) {
				system.assertEquals(a.approved_registrations_last_12_months__c,0);
				system.assertEquals(a.approved_registrations_last_6_months__c,0);
				system.assertEquals(a.incremental_pipe_adds_last_12_months__c,0);
				system.assertEquals(a.incremental_pipe_adds_last_6_months__c,0);
				system.assertEquals(a.registered_pipe_adds_last_12_months__c,0);
				system.assertEquals(a.registered_pipe_adds_last_6_months__c,0);
				system.assertEquals(a.incremental_bookings_last_12_months__c,0);
				system.assertEquals(a.incremental_bookings_last_6_months__c,0);
				system.assertEquals(a.registered_bookings_last_12_months__c,0);
				system.assertEquals(a.registered_bookings_last_6_months__c,0);
				system.assertEquals(a.graded_partners_c_and_above__c,0);
				system.assertEquals(a.a_and_b_graded_sales_partners__c,0);
				system.assertEquals(a.a_and_b_graded_tech_partners__c,0);
				system.assertEquals(a.number_of_partner_offices__c,0);
				system.assertEquals(a.number_of_mapped_sales_accounts__c,0);
				system.assertEquals(a.number_of_ace_certified_contacts__c,0);
				system.assertEquals(a.AR12_Score__c,0);
				system.assertEquals(a.AR6_Score__c,0);
				system.assertEquals(a.IP12_Score__c,0);
				system.assertEquals(a.IP6_Score__c,0);
				system.assertEquals(a.TP12_score__c,0);
				system.assertEquals(a.TP6_Score__c,0);
				system.assertEquals(a.IR12_Score__c,0);
				system.assertEquals(a.IR6_Score__c,0);
				system.assertEquals(a.TR12_Score__c,0);
				system.assertEquals(a.TR6_Score__c,0);
				system.assertEquals(a.NGPC_Score__c,0);
				system.assertEquals(a.NAS_Score__c,0);
				system.assertEquals(a.NAT_Score__c,0);
				system.assertEquals(a.NPO_Score__c,0);
				system.assertEquals(a.NMA_Score__c,0);
				system.assertEquals(a.NAC_Score__c,0);
				system.assertEquals(a.Partner_Score__c,0);
			}
			
			
			
		}	
		
    }
    
    
    
}