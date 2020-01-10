/* Test Class for New Opportunity Name Trigger
*
*
*
*/

@isTest
private class TestOppAutoNameCreation {
	
	static testmethod void AutoNamingTest() {
		/*
			3 - Essentials Term1, Term2, Perm
			1 - Advanced Perm
			1 - Premier Perm
			4 - Legacy Term
			1 - No Perm or Term
			1 - No Product Type
			1 - Cores
			1 - Sockets
			1 - Name Override
			14 Opps
		*/
		
		//Create Test Account
		Account acct1 = new Account(Name = 'acct1');
		insert acct1;
				
		//Create Test Cases
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		//Essentials Term
		Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 11, Product_Type__c = 'Essentials');
		
		//Essentials Term
		Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Pipeline',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=100,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 24, Product_Type__c = 'Essentials');
		
		//Essentials Perm
		Opportunity opp3 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_Virtual_Machines__c=200,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Essentials');
		
		//Advanced Term
		Opportunity opp4 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Upside',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=300,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Advanced');
		
		//Premier Perm
		Opportunity opp5 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=0,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Premier');
		
		//Workload Perm
		Opportunity opp6 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Strong Upside',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_Virtual_Machines__c=550,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Workload');
		
		//Application Perm
		Opportunity opp7 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_Virtual_Machines__c=1000,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Application');
		
		//Cloud Native Perm
		Opportunity opp8 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Cloud Native');
		
		//Virtualization Perm
		Opportunity opp9 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_Virtual_Machines__c=880,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 6, Product_Type__c = 'Virtualization');
		
		//No Perm or Term
		Opportunity opp10 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,of_Virtual_Machines__c=950,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Advanced');
		
		//No Product Type
		Opportunity opp11 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=1020,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 36);
		
		//Core based name
		Opportunity opp12 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm', of_Cores__c = 3000, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Advanced');
		
		//Socket Based name
		Opportunity opp13 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Perm', Term_or_Perm__c='Perm',of_CPU_Sockets__c=80, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Advanced');
		
		//Name Override
		Opportunity opp14 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=900,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Advanced',Opportunity_Name_Override__c = 'Account 1');
		
		
		oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
		oppInsert.add(opp6); oppInsert.add(opp7); oppInsert.add(opp8); oppInsert.add(opp9); oppInsert.add(opp10);
		oppInsert.add(opp11); oppInsert.add(opp12); oppInsert.add(opp13); oppInsert.add(opp14); 
		
		//Insert Test Opps into database
		insert oppInsert;
		
		//Query all test opportunities and place in a list
		List<Opportunity> oppList = [SELECT id,name,amount,Amount_OLD__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id or id =: opp14.id];
		//system.debug('debugOppName: ' + oppList);
		
		//Run through all the test opportunities to check that they match what we expect
		for (Opportunity oppResult: oppList) {
			
			if (oppResult.id == opp1.id) {
				System.assertEquals(oppResult.name,'acct1-800 Wklds Essentials Edition-11 Month Term');
			} else if (oppResult.id == opp2.id) {
				System.assertEquals(oppResult.name,'acct1-100 Wklds Essentials Edition-2 Year Term');
			} else if (oppResult.id == opp3.id) {
				System.assertEquals(oppResult.name,'acct1-200 Wklds Essentials Edition-Perm (1 Year SNM)');
			} else if (oppResult.id == opp4.id) {
				System.assertEquals(oppResult.name,'acct1-300 Wklds Advanced Edition-1 Year Term');
			} else if (oppResult.id == opp5.id) {
				System.assertEquals(oppResult.name,'acct1-0 Wklds Premier Edition-1 Year Term');
			} else if (oppResult.id == opp6.id) {
				System.assertEquals(oppResult.name,'acct1-550 Wklds Wrkld-Perm (3 Year SNM)');
			} else if (oppResult.id == opp7.id) {
				System.assertEquals(oppResult.name,'acct1-1000 Wklds App-Perm (3 Year SNM)');
			} else if (oppResult.id == opp8.id) {
				System.assertEquals(oppResult.name,'acct1-700 Wklds Cloud-Perm (3 Year SNM)');
			} else if (oppResult.id == opp9.id) {
				System.assertEquals(oppResult.name,'acct1-880 Wklds Virt-Perm (6 Month SNM)');
			} else if (oppResult.id == opp10.id) {
				System.assertEquals(oppResult.name,'acct1-950 Wklds Advanced Edition-');
			} else if (oppResult.id == opp11.id) {
				System.assertEquals(oppResult.name,'acct1-1020 Wklds -3 Year Term');
			} else if (oppResult.id == opp12.id) {
				System.assertEquals(oppResult.name,'acct1-3000 Cores Advanced Edition-Perm (1 Year SNM)');
			} else if (oppResult.id == opp13.id) {
				System.assertEquals(oppResult.name,'acct1-80 Sckts Advanced Edition-Perm (1 Year SNM)');
			} else if (oppResult.id == opp14.id) {
				System.assertEquals(oppResult.name,'Account 1-900 Wklds Advanced Edition-3 Year Term');
			} 
		}
		
	}
	
	//Test Core Based Pricing
	//static testmethod void myUnitTest() {
		/*
			3 - Workload Term1, Term2, Perm
			3 - Workload Starter Term1, Term2, Perm
			3 - Application Term1, Term2, Perm
			3 - Cloud Term1, Term2, Perm
			1 - No Perm or Term
			1 - No Product Type
			1 - No Core but Socket
			1 - No Core but VM
			16 Opps
			
		*/
		/*
		//Create Test Account
		Account acct1 = new Account(Name = 'acct1');
		insert acct1;
		
		//System.debug('New account: ' + acct1 + ' and name: ' + acct1.Name + ' and id: ' + acct1.Id);
		
		//Create Test Cases
		List<Opportunity> oppInsert = new List<Opportunity>();
		
		//Workload Term Price (Monthly)
		Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term', Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 11, Product_Type__c = 'Workload');
		
		//Workload Term Price (Yearly)
		Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp2',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_CPU_Sockets__c=90, of_Cores__c = 100, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Workload');
				
		//Workload Perm Price
		Opportunity opp3 = new Opportunity(Type='New',amount=50000,closedate=date.Today(),stageName='Upside',name='opp3',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Perm',of_Virtual_Machines__c=800, of_Cores__c = 200, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload', has_incremental_registration__c = true, Exec_Sponsor_Need_Timing__c = true, Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = true, Began_Eval__c = true, Exec_Sponsors_Eval_Criteria_Documented__c = true);
		
		//Workload Starter Term Price (Monthly)
		Opportunity opp4 = new Opportunity(Type='New',amount=90000,closedate=date.Today(),stageName='Identify',name='opp4',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term', of_Cores__c = 300, Term_or_SNM_Length_in_Months__c = 6, Product_Type__c = 'Virtualization');
		
		//Workload Starter Term Price (Yearly)
		Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today(),stageName='Identify',name='opp5',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=400, of_Cores__c = 0, Term_or_SNM_Length_in_Months__c = 14, Product_Type__c = 'Virtualization');
		
		//Workload Starter Perm Price
		Opportunity opp6 = new Opportunity(Type='New',amount=12345,closedate=date.Today(),stageName='Identify',name='opp6',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Perm',of_Virtual_Machines__c=0,of_CPU_Sockets__c=10, of_Cores__c = 550, Term_or_SNM_Length_in_Months__c = 5, Product_Type__c = 'Virtualization');
		
		//Application Term Price (Monthly)
		Opportunity opp7 = new Opportunity(Type='New',amount=67890,closedate=date.Today(),stageName='Identify',name='opp7',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=0,of_CPU_Sockets__c=0, of_Cores__c = 1000, Term_or_SNM_Length_in_Months__c = 4, Product_Type__c = 'Application');
		
		//Application Term Price (Yearly)
		Opportunity opp8 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Pipeline',name='opp8',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 700, Term_or_SNM_Length_in_Months__c = 25, Product_Type__c = 'Application', Exec_Sponsor_Need_Timing__c = true);

		//Application Perm Price
		Opportunity opp9 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp9',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Perm',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 880, Product_Type__c = 'Application');
		
		//Cloud Native Term Price (Monthly)
		Opportunity opp10 = new Opportunity(Type='New',amount=30000,closedate=date.Today(),stageName='Identify',name='opp10',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 950, Term_or_SNM_Length_in_Months__c = 9, Product_Type__c = 'Cloud Native');
		
		//Cloud Native Term Price (Yearly)
		Opportunity opp11 = new Opportunity(Type='New',amount=40000,closedate=date.Today(),stageName='Identify',name='opp11',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 1020, Term_or_SNM_Length_in_Months__c = 35, Product_Type__c = 'Cloud Native');
		
		//Cloud Native Perm Price
		Opportunity opp12 = new Opportunity(Type='New',amount=40000,closedate=date.Today(),stageName='Identify',name='opp12',accountId=acct1.Id,leadsource='Tradeshow',Term_or_Perm__c='Perm',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 3000, Product_Type__c = 'Cloud Native');
		
		//No Perm or Term
		Opportunity opp13 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp13',accountId=acct1.Id,leadsource='Tradeshow',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 800, Product_Type__c = 'Cloud Native');
		
		//No Product Type
		Opportunity opp14 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp14',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=900, of_Cores__c = 900, Term_or_SNM_Length_in_Months__c = 36);
		
		//No Length Term
		Opportunity opp15 = new Opportunity(Type='New',amount=40000,closedate=date.Today(),stageName='Identify',name='opp15',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c = 'Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, of_Cores__c = 80, Product_Type__c = 'Cloud Native');
		
		//No Core but Socket
		Opportunity opp16 = new Opportunity(Type='New',amount=80000,closedate=date.Today(),stageName='Identify',name='opp16',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Product_Type__c = 'Virtualization');
		
		//No Core but VM
		Opportunity opp17 = new Opportunity(Type='New',amount=5000,closedate=date.Today(),stageName='Identify',name='opp17',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Term_or_Perm__c='Perm',of_Virtual_Machines__c=1600, Product_Type__c = 'Workload');
		
		
		oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
		oppInsert.add(opp6); oppInsert.add(opp7); oppInsert.add(opp8); oppInsert.add(opp9); oppInsert.add(opp10);
		oppInsert.add(opp11); oppInsert.add(opp12); oppInsert.add(opp13); oppInsert.add(opp14); oppInsert.add(opp15);
		oppInsert.add(opp16); oppInsert.add(opp17);
		
		//Insert Test Opps into database
		insert oppInsert;
		
		//Query all test opportunities and place in a list
		List<Opportunity> oppList = [SELECT id,name,amount,Amount_OLD__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id or id =: opp14.id or id =: opp15.id or id =: opp16.id or id =: opp17.id];
		//system.debug('debugOppName: ' + oppList);
		
		//Run through all the test opportunities to check that they match what we expect
		for (Opportunity oppResult: oppList) {
			
			if (oppResult.id == opp1.id) {
				System.assertEquals(oppResult.name,'acct1-640 Cores Wrkld-11 Month Term');
				//System.assertEquals(oppResult.amount,46464);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp2.id) {
				System.assertEquals(oppResult.name,'acct1-100 Cores Wrkld-3 Year Term');
				//System.assertEquals(oppResult.amount,22500);
				//System.assertEquals(oppResult.Amount_OLD__c,40500);
			}
			
			else if (oppResult.id == opp3.id) {
				System.assertEquals(oppResult.name,'acct1-200 Cores Wrkld-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,18000);
				//System.assertEquals(oppResult.Amount_OLD__c,15000);
			}
			
			else if (oppResult.id == opp4.id) {
				System.assertEquals(oppResult.name,'acct1-300 Cores Virt-6 Month Term');
				//System.assertEquals(oppResult.amount,7560);
				//System.assertEquals(oppResult.Amount_OLD__c,16875);
			}
			
			else if (oppResult.id == opp5.id) {
				System.assertEquals(oppResult.name,'acct1-0 Cores Virt-1 Year Term');
				//System.assertEquals(oppResult.amount,0);
				//System.assertEquals(oppResult.Amount_OLD__c,0);
			}
			
			else if (oppResult.id == opp6.id) {
				System.assertEquals(oppResult.name,'acct1-550 Cores Virt-Perm (5 Month SNM)');
				//System.assertEquals(oppResult.amount,54450);
				//System.assertEquals(oppResult.Amount_OLD__c,10000);
			}
			
			else if (oppResult.id == opp7.id) {
				System.assertEquals(oppResult.name,'acct1-1000 Cores App-4 Month Term');
				//System.assertEquals(oppResult.amount,38400);
				//System.assertEquals(oppResult.Amount_OLD__c,0);
			}
			
			else if (oppResult.id == opp8.id) {
				System.assertEquals(oppResult.name,'acct1-700 Cores App-2 Year Term');
				//System.assertEquals(oppResult.amount,157920);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp9.id) {
				System.assertEquals(oppResult.name,'acct1-880 Cores App-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,198000);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp10.id) {
				System.assertEquals(oppResult.name,'acct1-950 Cores Cloud-9 Month Term');
				//System.assertEquals(oppResult.amount,107730);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp11.id) {
				System.assertEquals(oppResult.name,'acct1-1020 Cores Cloud-3 Year Term');
				//System.assertEquals(oppResult.amount,459000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp12.id) {
				System.assertEquals(oppResult.name,'acct1-3000 Cores Cloud-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,898200);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp13.id) {
				System.assertEquals(oppResult.name,'acct1-800 Cores Cloud-');
				//System.assertEquals(oppResult.amount,239520);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp14.id) {
				System.assertEquals(oppResult.name,'acct1-900 Cores -3 Year Term');
				//System.assertEquals(oppResult.amount,405000);
				//System.assertEquals(oppResult.Amount_OLD__c,50625);
			}
			
			else if (oppResult.id == opp15.id) {
				System.assertEquals(oppResult.name,'acct1-80 Cores Cloud-1 Year Term');
				//System.assertEquals(oppResult.amount,12000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp16.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Virt-1 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			else if (oppResult.id == opp17.id) {
				System.assertEquals(oppResult.name,'acct1-160 SKTS Wrkld-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,160000);
				//System.assertEquals(oppResult.Amount_OLD__c,160000);
			}
		}
	}
	
	//Test old Socket and VM based pricing
	static testmethod void oldUnitTest() {
		
		//Create Test Account
		Account acct1 = new Account(Name = 'acct1');
		insert acct1;
		
		//System.debug('New account: ' + acct1 + ' and name: ' + acct1.Name + ' and id: ' + acct1.Id);
		
		//Create Test Cases
		List<Opportunity> oppInsert = new List<Opportunity>();
		//Integer counter = 1; //incremental counter for use as key in the opp insert map
		
		//Normal
		Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Term_or_SNM_Length_in_Months__c = 36, Product_Type__c = 'Virtualization');
		
		//No VM data
		Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp2',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_CPU_Sockets__c=90, Product_Type__c = 'Workload');
				
		//No Socket data
		Opportunity opp3 = new Opportunity(Type='New',amount=50000,closedate=date.Today(),stageName='Identify',name='opp3',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Application');
		
		//No Socket or VM Data
		Opportunity opp4 = new Opportunity(Type='New',amount=90000,closedate=date.Today(),stageName='Identify',name='opp4',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term', Term_or_SNM_Length_in_Months__c = 6, Product_Type__c = 'Cloud Native');
		
		//Zero Sockets
		Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today(),stageName='Identify',name='opp5',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=0, Term_or_SNM_Length_in_Months__c = 1);
		
		//Zero VMs
		Opportunity opp6 = new Opportunity(Type='New',amount=12345,closedate=date.Today(),stageName='Identify',name='opp6',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=0,of_CPU_Sockets__c=10, Term_or_SNM_Length_in_Months__c = 0, Product_Type__c = 'Virtualization');
		
		//Zero Sockets and VMs
		Opportunity opp7 = new Opportunity(Type='New',amount=67890,closedate=date.Today(),stageName='Identify',name='opp7',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=0,of_CPU_Sockets__c=0, Product_Type__c = 'Workload');
		
		//Pipeline Stage
		Opportunity opp8 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Pipeline',name='opp8',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Product_Type__c = 'Application', Exec_Sponsor_Need_Timing__c = true);
		OpportunityMethods.oppSetStageHelper(opp8,'Pipeline');
		//Perm deal 1
		Opportunity opp9 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp9',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Term_or_Perm__c='Perm',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Term_or_SNM_Length_in_Months__c = 24, Product_Type__c = 'Cloud Native');
		
		//Perm deal 2
		Opportunity opp10 = new Opportunity(Type='New',amount=30000,closedate=date.Today(),stageName='Identify',name='opp10',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 2+ Years Maintenance',Term_or_Perm__c='Perm',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Virtualization');
		
		//Deal type other than Term/Perm
		Opportunity opp11 = new Opportunity(Type='New',amount=40000,closedate=date.Today(),stageName='Identify',name='opp11',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Training/Services Only',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Product_Type__c = 'Workload');
		
		//No Deal Type
		Opportunity opp12 = new Opportunity(Type='New',amount=40000,closedate=date.Today(),stageName='Identify',name='opp12',accountId=acct1.Id,leadsource='Tradeshow',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Product_Type__c = 'Application');
		
		//No Amount
		Opportunity opp13 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp13',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80, Product_Type__c = 'Cloud Native');
		
		//No Amount or Sockets
		Opportunity opp14 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp14',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=900);
		
		//No Amount or VMs
		Opportunity opp15 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp15',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_CPU_Sockets__c=80, Product_Type__c = 'Virtualization');
		
		//No Amount, Sockets, or VMs
		Opportunity opp16 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp16',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term', Product_Type__c = 'Workload');
		
		//No Amount, Sockets, VMs, or Deal type
		Opportunity opp17 = new Opportunity(Type='New',closedate=date.Today(),stageName='Identify',name='opp17',accountId=acct1.Id,leadsource='Tradeshow');
		
		//Under 10 Vms, no Sockets
		Opportunity opp18 = new Opportunity(Type='New',amount=2000,closedate=date.Today(),stageName='Identify',name='opp18',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=7, Product_Type__c = 'Cloud Native');
		
		//0 VMs, No Sockets
		Opportunity opp19 = new Opportunity(Type='New',amount=5000,closedate=date.Today(),stageName='Identify',name='opp19',AccountId = acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=0, Product_Type__c = 'Application');
		
		//Control Module Only Opp
		Opportunity opp20 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp20-CC Only',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_CPU_Sockets__c=90,Control_Module_Only__c = true, Product_Type__c = 'Virtualization');
		
		//Test Opp Name Override 1
		Opportunity opp21 = new Opportunity(Type='New',amount=5000,closedate=date.Today(),stageName='Identify',name='opp21',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_CPU_Sockets__c=90,Opportunity_Name_Override__c = 'Acct 1-Group 2', Product_Type__c = 'Workload');
		
		//Test Opp Name Override 2
		Opportunity opp22 = new Opportunity(Type='Upsell',amount=2000,closedate=date.Today(),stageName='Pipeline',name='opp22',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Term_or_Perm__c='Perm',of_CPU_Sockets__c=20,Opportunity_Name_Override__c = 'Opp22 Insurance', Term_or_SNM_Length_in_Months__c = 6, Product_Type__c = 'Application');
		
		//Test Opp Name has incremental reg
		Opportunity opp23 = new Opportunity(Type='Upsell',amount=2000,closedate=date.Today(),stageName='Pipeline',name='opp23',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Term_or_Perm__c='Perm',of_CPU_Sockets__c=20,Opportunity_Name_Override__c = 'Opp23 Insurance', has_incremental_registration__c = true, Product_Type__c = 'Cloud Native');
		
		//Zero Sockets has incremental reg
		Opportunity opp24 = new Opportunity(Type='New',amount=50000,closedate=date.Today(),stageName='Identify',name='opp24',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Term_or_Perm__c='Term',of_Virtual_Machines__c=800, has_incremental_registration__c = true);
		
		
		oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
		oppInsert.add(opp6); oppInsert.add(opp7); oppInsert.add(opp8); oppInsert.add(opp9); oppInsert.add(opp10);
		oppInsert.add(opp11); 
		//oppInsert.add(opp12);
	    oppInsert.add(opp13); oppInsert.add(opp14); oppInsert.add(opp15);
		oppInsert.add(opp16);
		//oppInsert.add(opp17);
		oppInsert.add(opp18); oppInsert.add(opp19); oppInsert.add(opp20);
		oppInsert.add(opp21); oppInsert.add(opp22); oppInsert.add(opp23); oppInsert.add(opp24); 
				
		//Insert Test Opps into database
		insert oppInsert;
		
		System.debug('Last Opp: '+ oppInsert);
		//system.assert(oppInsert.size() == 18 );
		
		/*for (Opportunity debugOpps: oppInsert.values()) {
			system.debug('debugOppName: ' + debugOpps.name);
		} */
		
		/*
		//Query all test opportunities and place in a list
		List<Opportunity> oppList = [SELECT id,name,amount,Amount_OLD__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id or id =: opp14.id or id =: opp15.id or id =: opp16.id or id =: opp17.id or id =: opp18.id or id =: opp19.id or id =: opp20.id or id =: opp21.id or id =: opp22.id or id =: opp23.id or id =: opp24.id];
		//system.debug('debugOppName: ' + oppList);
		
		//Run through all the test opportunities to check that they match what we expect
		for (Opportunity oppResult: oppList) {
			
			If (oppResult.id == opp1.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Virt-3 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp2.id) {
				System.assertEquals(oppResult.name,'acct1-90 SKTS Wrkld-1 Year Term');
				//System.assertEquals(oppResult.amount,40500);
				//System.assertEquals(oppResult.Amount_OLD__c,40500);
			}
			
			else if (oppResult.id == opp3.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS App-1 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp4.id) {
				System.assertEquals(oppResult.name,'acct1- Cloud-6 Month Term');
				//System.assertEquals(oppResult.amount,90000);
				//System.assertEquals(oppResult.Amount_OLD__c,90000);
			}
			
			else if (oppResult.id == opp5.id) {
				System.assertEquals(oppResult.name,'acct1-0 SKTS -1 Month Term');
				//System.assertEquals(oppResult.amount,0);
				//System.assertEquals(oppResult.Amount_OLD__c,0);
			}
			
			else if (oppResult.id == opp6.id) {
				System.assertEquals(oppResult.name,'acct1-10 SKTS Virt-0 Month Term');
				//System.assertEquals(oppResult.amount,4500);
				//System.assertEquals(oppResult.Amount_OLD__c,4500);
			}
			
			else if (oppResult.id == opp7.id) {
				System.assertEquals(oppResult.name,'acct1-0 SKTS Wrkld-1 Year Term');
				//System.assertEquals(oppResult.amount,0);
				//System.assertEquals(oppResult.Amount_OLD__c,0);
			}
			
			else if (oppResult.id == opp8.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS App-1 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp9.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Cloud-Perm (2 Year SNM)');
				//System.assertEquals(oppResult.amount,80000);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp10.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Virt-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,80000);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp11.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Wrkld-');
				//System.assertEquals(oppResult.amount,80000);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp12.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS App-');
				//System.assertEquals(oppResult.amount,80000);
				//System.assertEquals(oppResult.Amount_OLD__c,80000);
			}
			
			else if (oppResult.id == opp13.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Cloud-1 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp14.id) {
				System.assertEquals(oppResult.name,'acct1-90 SKTS -1 Year Term');
				//System.assertEquals(oppResult.amount,40500);
				//System.assertEquals(oppResult.Amount_OLD__c,40500);
			}
			
			else if (oppResult.id == opp15.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS Virt-1 Year Term');
				//System.assertEquals(oppResult.amount,36000);
				//System.assertEquals(oppResult.Amount_OLD__c,36000);
			}
			
			else if (oppResult.id == opp16.id) {
				System.assertEquals(oppResult.name,'acct1- Wrkld-1 Year Term');
				//System.assertEquals(oppResult.amount,null);
				//System.assertEquals(oppResult.Amount_OLD__c,null);
			}
			
			else if (oppResult.id == opp17.id) {
				System.assertEquals(oppResult.name,'acct1- Wrkld-1 Year Term');
				//System.assertEquals(oppResult.amount,null);
				//System.assertEquals(oppResult.Amount_OLD__c,null);
			}
			
			else if (oppResult.id == opp18.id) {
				System.assertEquals(oppResult.name,'acct1-2 SKTS Cloud-1 Year Term');
				//System.assertEquals(oppResult.amount,900);
				//System.assertEquals(oppResult.Amount_OLD__c,900);
			}
			
			else if (oppResult.id == opp19.id) {
				System.assertEquals(oppResult.name,'acct1-0 SKTS App-1 Year Term');
				//System.assertEquals(oppResult.amount,0);
				//System.assertEquals(oppResult.Amount_OLD__c,0);
			}
			
			else if (oppResult.id == opp20.id) {
				System.assertEquals(oppResult.name,'opp20-CC Only');
				//System.assertEquals(oppResult.amount,100000);
				//System.assertEquals(oppResult.Amount_OLD__c,null);
			}
			
			else if (oppResult.id == opp21.id) {
				System.assertEquals(oppResult.name,'Acct 1-Group 2-90 SKTS Wrkld-1 Year Term');
				//System.assertEquals(oppResult.amount,40500);
				//System.assertEquals(oppResult.Amount_OLD__c,40500);
			}
			
			else if (oppResult.id == opp22.id) {
				System.assertEquals(oppResult.name,'Opp22 Insurance-20 SKTS App-Perm (6 Month SNM)');
				//System.assertEquals(oppResult.amount,20000);
				//System.assertEquals(oppResult.Amount_OLD__c,20000);
			}
			
			else if (oppResult.id == opp23.id) {
				System.assertEquals(oppResult.name,'Opp23 Insurance-20 SKTS Cloud-Perm (1 Year SNM)');
				//System.assertEquals(oppResult.amount,12000);
				//System.assertEquals(oppResult.Amount_OLD__c,12000);
			}
			
			else if (oppResult.id == opp24.id) {
				System.assertEquals(oppResult.name,'acct1-80 SKTS -1 Year Term');
				//System.assertEquals(oppResult.amount,21600);
				//System.assertEquals(oppResult.Amount_OLD__c,21600);
			}
		}
	} */
}