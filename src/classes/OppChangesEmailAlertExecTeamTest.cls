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
private class OppChangesEmailAlertExecTeamTest {

    static testMethod void myUnitTest() {
        List<Account> acctInsert = new List<Account>();
        List<Opportunity> oppInsert = new List<Opportunity>();
        List<Opportunity> oppUpdate1 = new List<Opportunity>();
        List<Opportunity> oppUpdate2 = new List<Opportunity>();
        
		Account acct1 = new Account(Name = 'acct1');
		acctInsert.add(acct1);
		
		insert acctInsert;
        
		Opportunity opp1 = new Opportunity(partner_account__c = acct1.id, Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp2',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Upside',name='opp3',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp3);
        Opportunity opp4 = new Opportunity(Type='New',amount=160000,closedate=date.Today().addDays(30),stageName='Upside',name='opp4',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=160);
        oppInsert.add(opp4);
        Opportunity opp5 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Strong Upside',name='opp5',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp5);
        Opportunity opp6 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Commit',name='opp6',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp6);
        Opportunity opp7 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='PO Recieved',name='opp7',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp7);
        Opportunity opp8 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Closed Won',name='opp8',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp8);
        Opportunity opp9 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Closed Lost',name='opp9',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp9);
        Opportunity opp10 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Unqualified',name='opp10',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp10);
        Opportunity opp11 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp11',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp11);
        Opportunity opp12 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp12',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp12);
        Opportunity opp13 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp13',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp13);
        Opportunity opp14 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp14',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp14);
        Opportunity opp15 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp15);
        Opportunity opp16 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp16);
        
        insert oppInsert;
        
        //Insert Emails should be sent for opp4, opp5, opp6, opp7, opp8, and opp9
        
        //Update Emails should be sent for opp2, opp3, opp5, opp6, opp7, opp8
        List<Opportunity> oppGrab1 = [select id, stageName from Opportunity where id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id];
        
        for (Opportunity o : oppGrab1) {
			o.stageName = 'Identify';
			oppUpdate1.add(o);
        }
        
        update oppUpdate1;
        
        //Update Emails should be sent for opp4, opp11, opp12, opp13, opp14, opp15, opp16
        List<Opportunity> oppGrab2 = [select id, stageName, closeDate, amount from Opportunity where id =: opp4.id or id =: opp11.id or id =: opp12.id or id =: opp13.id or id =: opp14.id or id =: opp15.id or id =: opp16.id];
        for (Opportunity o : oppGrab2) {
        	if (o.id == opp4.id) {
	        	o.StageName = 'Strong Upside';
	        	oppUpdate2.add(o);
        	} else if (o.id == opp11.id) {
		        o.StageName = 'Commit';
		        oppUpdate2.add(o);
        	} else if (o.id == opp12.id) {
		        o.StageName = 'PO Received';
		        oppUpdate2.add(o);
        	} else if (o.id == opp13.id) {
		        o.StageName = 'Closed Won';
		        oppUpdate2.add(o);
        	} else if (o.id == opp14.id) {
		        o.StageName = 'Closed Lost';
		        oppUpdate2.add(o);
        	} else if (o.id == opp15.id) {
		        o.StageName = 'Commit'; o.CloseDate = date.Today().addDays(15);
		        oppUpdate2.add(o);
        	} else if (o.id == opp16.id) {
	        o.StageName = 'Commit'; o.Amount = 40000;
	        oppUpdate2.add(o);
        	}
        }
        update oppUpdate2;
    }
}