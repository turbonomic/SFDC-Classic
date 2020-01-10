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
private class TestStampOpportunityProgress {

    static testMethod void myUnitTest() {
        
        List<Opportunity> listOpps = new List<Opportunity>();
        List<Account> listAcct = new List<Account>();
        
        Account acct1 = new Account(name = 'Test Company');
        listAcct.add(acct1);
        Account acct2 = new Account(name = 'Test Company 2');
        listAcct.add(acct2);
        Account acct3 = new Account(name = 'Test Company 3');
        listAcct.add(acct3);
        Account acct4 = new Account(name = 'Test Company 4');
        listAcct.add(acct4);
        Account acct5 = new Account(name = 'Test Company 5');
        listAcct.add(acct5);
        Account acct6 = new Account(name = 'Test Company 6');
        listAcct.add(acct6);
        Account acct7 = new Account(name = 'Test Company 7');
        listAcct.add(acct7);
        Account acct8 = new Account(name = 'Test Company 8');
        listAcct.add(acct8);
        Account acct9 = new Account(name = 'Test Company 9');
        listAcct.add(acct9);
		Account acct10 = new Account(name = 'Test Company 10');
        listAcct.add(acct10);
        Account acct11 = new Account(name = 'Test Company 11');
        listAcct.add(acct11);
		Account acct12 = new Account(name = 'Test Company 12');
        listAcct.add(acct12);
		Account acct13 = new Account(name = 'Test Company 13');
        listAcct.add(acct13);
        
        Opportunity opp1 = new Opportunity(name = 'Opp 1', accountId = acct1.id, amount = 100.00, stageName = 'Pipeline', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp1,'Pipeline');
		listOpps.add(opp1);
        Opportunity opp2 = new Opportunity(name = 'Opp 2', accountId = acct2.id, amount = 100.00, stageName = 'Pipeline', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp2,'Pipeline');
		listOpps.add(opp2);
        Opportunity opp3 = new Opportunity(name = 'Opp 3', accountId = acct3.id, amount = 100.00, stageName = 'Pipeline', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp3,'Pipeline');
		listOpps.add(opp3);
		Opportunity opp4 = new Opportunity(name = 'Opp 4', accountId = acct4.id, amount = 100.00, stageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));
		listOpps.add(opp4);
        Opportunity opp5 = new Opportunity(name = 'Opp 5', accountId = acct5.id, amount = 100.00, stageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));
		listOpps.add(opp5);
		Opportunity opp6 = new Opportunity(name = 'Opp 6', accountId = acct6.id, amount = 100.00, stageName = 'Closed Lost', type = 'New', closeDate = Date.today().addDays(30));
		listOpps.add(opp6);
		Opportunity opp7 = new Opportunity(name = 'Opp 7', accountId = acct7.id, amount = 100.00, stageName = 'Upside', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true, Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true);
		OpportunityMethods.oppSetStageHelper(opp7,'Upside');
		listOpps.add(opp7);
		Opportunity opp8 = new Opportunity(name = 'Opp 8', accountId = acct8.id, amount = 100.00, stageName = 'Commit', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true, Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true, Tech_Win_Established__c = true, Exec_Buy_In_on_BIP__c = true, Agreement_on_Contract_Terms__c = true);
		OpportunityMethods.oppSetStageHelper(opp8,'Commit');
		listOpps.add(opp8);
		Opportunity opp9 = new Opportunity(name = 'Opp 9', accountId = acct9.id, amount = 100.00, stageName = 'Strong Upside', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true, Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true, Tech_Win_Established__c = true, Exec_Buy_In_on_BIP__c = true);
		OpportunityMethods.oppSetStageHelper(opp9,'Strong Upside');
		listOpps.add(opp9);
		Opportunity opp10 = new Opportunity(name = 'Opp 10', accountId = acct10.id, amount = 100.00, stageName = 'Upside', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true, Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true);
		OpportunityMethods.oppSetStageHelper(opp10,'Upside');
		listOpps.add(opp10);
		Opportunity opp11 = new Opportunity(name = 'Opp 11', accountId = acct11.id, amount = 100.00, stageName = 'Pipeline', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp11,'Pipeline');
		listOpps.add(opp11);
        Opportunity opp12 = new Opportunity(name = 'Opp 12', accountId = acct12.id, amount = 100.00, stageName = 'Pipeline', type = 'New', closeDate = Date.today().addDays(30),Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp12,'Pipeline');
		listOpps.add(opp12);
        Opportunity opp13 = new Opportunity(name = 'Opp 13', accountId = acct13.id, amount = 100.00, stageName = 'Identify', type = 'New', closeDate = Date.today().addDays(30));
		listOpps.add(opp13);
		
		insert listAcct;
		insert listOpps;
		
		List<Opportunity> updateOppList = [select id, StageName, closeDate from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id];
		List<Opportunity> afterUpdateOppList = new List<Opportunity>();
		
		for (Opportunity opp : updateOppList) {
			if (opp.id == opp1.id) {
				opp.stageName = 'PO Received';
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp2.id) {
				opp.stageName = 'Commit'; OpportunityMethods.oppSetStageHelper(opp,'Commit');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp3.id) {
				opp.stageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp4.id) {
				opp.stageName = 'Upside'; OpportunityMethods.oppSetStageHelper(opp,'Upside');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp5.id) {
				opp.stageName = 'Pipeline'; OpportunityMethods.oppSetStageHelper(opp,'Pipeline');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp6.id) {
				opp.stageName = 'Identify';
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp7.id) {
				opp.stageName = 'Closed Lost';
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp8.id) {
				opp.stageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp9.id) {
				opp.stageName = 'Upside'; OpportunityMethods.oppSetStageHelper(opp,'Upside');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp10.id) {
				opp.stageName = 'Pipeline'; OpportunityMethods.oppSetStageHelper(opp,'Pipeline');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp11.id) {
				opp.stageName = 'Identify'; OpportunityMethods.oppSetStageHelper(opp,'Identify');
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp12.id) {
				opp.closeDate = opp.closeDate.addDays(5);
				afterUpdateOppList.add(opp);
			} else if (opp.id == opp13.id) {
				opp.closeDate = opp.closeDate.addDays(-5);
				afterUpdateOppList.add(opp);
			}
		}
		
		update afterUpdateOppList;
		
		List<Opportunity> finalList = [select id, Name, StageName, Opportunity_Progression__c, Stage_Close_Date_Change_Date__c, CloseDate from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id];
		
		for (Opportunity afterOpp : finalList) {
			system.debug('Current Opp being asserted: ' + afterOpp.Name + ' ' + afterOpp.StageName);
			if (afterOpp.id == opp1.id) {
				system.assert(afterOpp.stageName == 'PO Received');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());
			} else if (afterOpp.id == opp2.id) {
				system.assert(afterOpp.stageName == 'Commit');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());
			} else if (afterOpp.id == opp3.id) {
				system.assert(afterOpp.stageName == 'Strong Upside');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());		
			} else if (afterOpp.id == opp4.id) {
				system.assert(afterOpp.stageName == 'Upside');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());
			} else if (afterOpp.id == opp5.id) {
				system.assert(afterOpp.stageName == 'Pipeline');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());
			} else if (afterOpp.id == opp6.id) {
				system.assert(afterOpp.stageName == 'Identify');
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			} else if (afterOpp.id == opp7.id) {
				system.assert(afterOpp.stageName == 'Closed Lost');
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			} else if (afterOpp.id == opp8.id) {
				system.assert(afterOpp.stageName == 'Strong Upside');
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			} else if (afterOpp.id == opp9.id) {
				system.assert(afterOpp.stageName == 'Upside');
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());		
			} else if (afterOpp.id == opp10.id) {
				system.assert(afterOpp.stageName == 'Pipeline');
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			} else if (afterOpp.id == opp11.id) {
				system.assert(afterOpp.stageName == 'Identify');
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			} else if (afterOpp.id == opp12.id) {
				system.assert(afterOpp.closeDate == Date.today().addDays(35));
				system.assert(afterOpp.opportunity_progression__c == 'Regression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());		
			} else if (afterOpp.id == opp13.id) {
				system.assert(afterOpp.closeDate == Date.today().addDays(25));
				system.assert(afterOpp.opportunity_progression__c == 'Progression');
				system.assert(afterOpp.Stage_Close_Date_Change_Date__c == Date.today());	
			}
		}		
		
    }
}