@isTest
private class TestLeadFillRoundRobin {

	static testMethod void myUnitTest() {
		
		List<Lead_Round_Robin__c> lrrInsert = new List<Lead_Round_Robin__c>();
		Lead_Round_Robin__c lrr1 =  new Lead_Round_Robin__c(name = 'East RR', Lead_Field_Regions__c = 'Lead_Assign_North_East__c;Lead_Assign_North_East_2__c;Lead_Assign_North_East_3__c', round_robin_number__c = 0);
		lrrInsert.add(lrr1);
		Lead_Round_Robin__c lrr2 =  new Lead_Round_Robin__c(name = 'West RR', Lead_Field_Regions__c = 'Lead_Assign_West__c;Lead_Assign_West_2__c;Lead_Assign_West_3__c', round_robin_number__c = 0);
		lrrInsert.add(lrr2);
		
		insert lrrInsert;
		
		List<Account> acctInsert = new List<Account>();
		
		Account acct1 = new Account(name = 'New Account');
		acctInsert.add(acct1);
		
		insert acctInsert;
		
		List<Lead> leadInsert = new List<Lead>();
		
		
		Lead lead1 = new Lead(firstName = 'first', lastName = 'last', company = 'VMTurbo', state = 'Massachusetts', country = 'United States', leadSource = 'Tradeshow', email = 'first.last@vmturbo.com');
		leadInsert.add(lead1);
		Lead lead2 = new Lead(firstName = 'first', lastName = 'last2', company = 'VMTurbo', state = 'New Hampshire', country = 'United States', leadSource = 'Tradeshow', email = 'first.last2@vmturbo.com');
		leadInsert.add(lead2);
		Lead lead3 = new Lead(firstName = 'first', lastName = 'last3', company = 'VMTurbo', account__c = acct1.id, state = 'Massachusetts', country = 'United States', leadSource = 'Tradeshow', email = 'first.last3@vmturbo.com');
		leadInsert.add(lead3);
		Lead lead4 = new Lead(firstName = 'first', lastName = 'last4', company = 'VMTurbo', state = 'Oregon', country = 'United States', leadSource = 'Tradeshow', email = 'first.last4@vmturbo.com');
		leadInsert.add(lead4);
		Lead lead5 = new Lead(firstName = 'first', lastName = 'last5', company = 'VMTurbo', state = 'California', country = 'United States', leadSource = 'Tradeshow', email = 'first.last5@vmturbo.com');
		leadInsert.add(lead5);
		
		insert leadInsert;
		
		List<Lead> afterInsert = [select id, round_robin_number__c, ownerId, account__c from Lead where id =: lead1.id or id =: lead2.id or id =: lead3.id or id =: lead4.id or id =: lead5.id];
		double firstNum;
		double secondNum;
		double thirdNum;
		double fourthNum;
		for (Lead l : afterInsert) {
			
			if (l.id == lead1.id) {
				system.assert(l.round_robin_number__c >= 0.0);
				firstNum = l.round_robin_number__c;
			} else if (l.id == lead2.id) {
				system.assert(l.round_robin_number__c >= 0.0);
				secondNum = l.round_robin_number__c;
			} else if (l.id == lead3.id) {
				system.assertEquals(l.round_robin_number__c,null);
			} else if (l.id == lead4.id) {
				system.assert(l.round_robin_number__c >= 0.0);
				thirdNum = l.round_robin_number__c;
			} else if (l.id == lead5.id) {
				system.assert(l.round_robin_number__c >= 0.0);
				fourthNum = l.round_robin_number__c;
			}
		}
		
		system.assert(firstNum != secondNum);
		system.assert(thirdNum != fourthNum);
		
		List<Lead_Round_Robin__c> lrrResults = Lead_Round_Robin__c.getAll().values();
		for (Lead_Round_Robin__c lrr : lrrResults) {
			if (lrr.name == 'East RR') {
				system.assertEquals(lrr.Round_Robin_Number__c,2);
			} else if (lrr.name == 'West RR'){
				system.assertEquals(lrr.Round_Robin_Number__c,2);
			}
		}
		
		List<Lead> leadInsert2 = new List<Lead>();
		Lead lead6 = new Lead(firstName = 'first', lastName = 'last6', company = 'VMTurbo', state = 'New Hampshire', country = 'United States', leadSource = 'Tradeshow', email = 'first.last6@vmturbo.com');
		leadInsert2.add(lead6);
		Lead lead7 = new Lead(firstName = 'first', lastName = 'last7', company = 'VMTurbo', state = 'California', country = 'United States', leadSource = 'Tradeshow', email = 'first.last7@vmturbo.com');
		leadInsert2.add(lead7);
		
		insert leadInsert2;
		
		afterInsert = [select id, round_robin_number__c, ownerId, account__c from Lead where id =: lead6.id or id =: lead7.id];
		
		for (Lead l : afterInsert) {
			if (l.id == lead6.id) {
				system.assert(l.round_robin_number__c == 2);
			} else if (l.id == lead7.id) {
				system.assert(l.round_robin_number__c == 2);
			}
		}
		
		lrrResults = Lead_Round_Robin__c.getAll().values();
		for (Lead_Round_Robin__c lrr : lrrResults) {
			if (lrr.name == 'East RR') {
				system.assertEquals(lrr.Round_Robin_Number__c,3);
			} else {
				system.assertEquals(lrr.Round_Robin_Number__c,3);
			}
		}
		
	}


}