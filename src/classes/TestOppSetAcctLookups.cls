/**
 * Test Class for the setOppLookups in the Opportunity Methods Class
 *
 *	Case 1: Closed Won Opp
 *	Case 2: Closed Lost Opp
 *	Case 3: Unqualified Opp within Last 3 Months
 *	Case 4: Unqualified Opp older than 3 Months
 *	Case 5: Maintenance Renewal
 *	Case 6: Normal Open Opp
 *	Case 7: Open opp closed
 *	Case 8: Maintenance Renewal Closed
 *	Case 9: Open Opp switched to Maintenance Renewal
 *	Case 10: Maintenance Renewal switched to Non-Maintenance Renewal
 *  Case 11: Closed Opp Reopened
 *
 *
 *
 */
@isTest
private class TestOppSetAcctLookups {

    static testMethod void myUnitTest() {
    	
        //Create Test Account
		Account acct1 = new Account(Name = 'acct1');
		insert acct1;
		
		//Create Test Cases
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		//Case 1
		Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Closed Won',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 2
		Opportunity opp2 = new Opportunity(Type='Upsell',amount=100000,closedate=date.Today(),stageName='Closed Lost',name='opp2',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 3
		Opportunity opp3 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),Lost_Unqual_Date__c = date.today(),stageName='Unqualified',name='opp3',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 4
		Opportunity opp4 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),Lost_Unqual_Date__c=date.today().addMonths(-3),stageName='Unqualified',name='opp4',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 5
		Opportunity opp5 = new Opportunity(Type='Maintenance Renewal',amount=100000,Undiscounted_Renewal_Amount__c = 100000,closedate=date.Today(),stageName='Upside',name='opp5',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 6
		Opportunity opp6 = new Opportunity(Type='Subscription Renewal',amount=100000,closedate=date.Today(),stageName='Pipeline',name='opp6',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 7
		Opportunity opp7 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='PO received',name='opp7',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 8
		Opportunity opp8 = new Opportunity(Type='Maintenance Renewal',amount=100000,Undiscounted_Renewal_Amount__c = 100000,closedate=date.Today(),stageName='Commit',name='opp8',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 9
		Opportunity opp9 = new Opportunity(Type='New',amount=100000,Undiscounted_Renewal_Amount__c = 100000,closedate=date.Today(),stageName='Strong Upside',name='opp9',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 10
		Opportunity opp10 = new Opportunity(Type='Maintenance Renewal',amount=100000,Undiscounted_Renewal_Amount__c = 100000,closedate=date.Today(),stageName='Identify',name='opp10',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		//Case 11
		Opportunity opp11 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Closed Won',name='opp11',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
		
		oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
		oppInsert.add(opp6); oppInsert.add(opp7); oppInsert.add(opp8); oppInsert.add(opp9); oppInsert.add(opp10);
		oppInsert.add(opp11);
        
        insert oppInsert;
        
        List<Opportunity> oppUpdate = new List<Opportunity>();
        
        List<Opportunity> oppQuery= new List<Opportunity>([SELECT id, type, stageName FROM Opportunity WHERE id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id]);
        
        for (Opportunity o: oppQuery) {
        	if (o.id == opp7.id) {o.StageName = 'Closed Lost'; oppUpdate.add(o);}
        	else if (o.id == opp8.id) {o.StageName = 'Closed Won'; oppUpdate.add(o);}
        	else if (o.id == opp9.id) {o.Type = 'Maintenance Renewal'; oppUpdate.add(o);}
        	else if (o.id == opp10.id) {o.Type = 'Upsell'; oppUpdate.add(o);}
        	else if (o.id == opp11.id) {o.StageName = 'Commit'; oppUpdate.add(o);}
        } 
        
        update oppUpdate;
        
        
        
        //Query all test opportunities and place in a list
		List<Opportunity> oppAsserts = [SELECT id, AccountId, Closed_Lookup__c, Maintenance_Lookup__c, Active_Lookup__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id];
		//system.debug('debugOppName: ' + oppList);
		
		//Run through all the test opportunities to check that they match what we expect
		for (Opportunity oppResult: oppAsserts) {
			if (oppResult.id == opp1.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp2.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp3.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp4.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp5.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp6.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,oppResult.AccountId);
			}
			else if (oppResult.id == opp7.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp8.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp9.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,oppResult.AccountId);
				System.assertEquals(oppResult.Active_Lookup__c,null);
			}
			else if (oppResult.id == opp10.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,oppResult.AccountId);
			}
			else if (oppResult.id == opp11.id) {
				System.assertEquals(oppResult.Closed_Lookup__c,null);
				System.assertEquals(oppResult.Maintenance_Lookup__c,null);
				System.assertEquals(oppResult.Active_Lookup__c,oppResult.AccountId);
			}
		} 
    }
}