/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 */
@isTest
private class testChartController {

    static testMethod void getChartData_Demos() {
		Test.StartTest();
		CreateNDemoScheduledTasks();
		CreateNDemoCompletedTasks();
		Test.StopTest();
		
		testChartController.BuildMonthlyRepGoals();

		ChartController.getRemoteData_DemosCompleted();
		ChartController.getRemoteData_DemosScheduled();
/*

		ChartController.getChartData_DemosCompleted();
		ChartController.getChartData_DemosScheduled();
*/
    }

    static testMethod void OpportunityUnitTest() {
		Test.StartTest();
		CreateNPipelineOpportunities();
		CreateNClosedWonOpportunities();
		Test.StopTest();
		
		testChartController.BuildMonthlyRepGoals();
		ChartController.getRemoteData_OpportunitiesIdentifiedAmount();
		ChartController.getRemoteData_OpportunitiesIdentifiedCount();
		ChartController.getRemoteData_BookingsIdentifiedAmount();

    }
    static testMethod void CreateNClosedWonOpportunities() {
    	
    	lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
		
		Date startRange = Date.today().addDays(-365);
		Date endRange = Date.today().addDays(14);
		Integer numOfOppsToCreate = 2; // ideal value 4, but org is not bulkified    	
		Id ownerId = UserInfo.getUserId();

		Campaign cpg = new Campaign(
				Name = 'Test One',
				IsActive = true,
				StartDate = date.today().addDays(-10),
				Type = 'Advertisement',
				Status = 'In Progress'
			);
		insert cpg;
		
		Account a = new Account(name = 'Test Account',ownerId=ownerId);
		insert a;

		Date oppDate = startRange;
		for (Integer opp = 0; opp < numOfOppsToCreate; opp++){
			oppDate = oppDate.addDays((Math.random() * 10).intValue() * 7);

			
			Opportunity o = new Opportunity(
								Name = 'Test Opp ' + opp,
								StageName = 'Closed Won',
								Owner_Team__c = 'Virtual Empire',
								accountid = a.id,
								amount = (Math.random() * 100000).intValue(),
								CloseDate = oppDate,
								Booking_Date__c = oppDate,
								Type = 'New',
								Identified_By__c = ownerId,
								Opportunity_ID_Date__c = oppDate,
								LeadSource = '3PT: eMedia 2013Q4',
								CampaignId = cpg.id,
								ownerId = ownerId
								);
			insert o;
		}
 
    }
	
	static testMethod void CreateNPipelineOpportunities() {
		
		lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
		insert leadnum;
		
		Date startRange = Date.today().addDays(-365);
		Date endRange = Date.today().addDays(14);
		Integer numOfOppsToCreate = 2; // ideal value 8, but org is not bulkified    	
		Id ownerId = UserInfo.getUserId();

		Campaign cpg = new Campaign(
				Name = 'Test One',
				IsActive = true,
				StartDate = date.today().addDays(-10),
				Type = 'Advertisement',
				Status = 'In Progress'
			);
		insert cpg;
		
		Account a = new Account(name = 'Test Account',ownerId=ownerId);
		insert a;

		Date oppDate = startRange;
		for (Integer opp = 0; opp < numOfOppsToCreate; opp++){
			oppDate = oppDate.addDays((Math.random() * 10).intValue() * 7);

			
			Opportunity o = new Opportunity(
								Name = 'Test Opp ' + opp,
								StageName = 'Pipeline',
								Owner_Team__c = 'Virtual Empire',
								accountid = a.id,
								amount = (Math.random() * 100000).intValue(),
								CloseDate = oppDate,
								Booking_Date__c = oppDate,
								Type = 'New',
								Identified_By__c = ownerId,
								Opportunity_ID_Date__c = oppDate,
								LeadSource = '3PT: eMedia 2013Q4',
								CampaignId = cpg.id,
								ownerId = ownerId
								);
			insert o;
		}
 
    }

	static testMethod void CreateNDemoCompletedTasks() {
		Date startRange = Date.today().addDays(-365);
		Date endRange = Date.today().addDays(14);
		Integer numToCreate = 2; // ideal value 70, but org is not bulkified    	
		Id ownerId = UserInfo.getUserId();

		Demo__c d = new Demo__c(name = 'Test Demo');
		insert d;

		Date taskDate = startRange;
		for (Integer i = 0; i < numToCreate; i++){
			taskDate = taskDate.addDays((Math.random() * 10).intValue() * 1);

			
			Task t = new Task(
							Subject = 'Test Task ' + i,
							Type = 'Demo',
							Status = 'Completed',
							ActivityDate = taskDate,
							WhatId = d.id,
							priority = 'Normal',
							ownerid = ownerId
							);
			insert t;

		}
 
    }

	static testMethod void CreateNDemoScheduledTasks() {
		Date startRange = Date.today().addDays(-365);
		Date endRange = Date.today().addDays(14);
		Integer numToCreate = 2; // ideal value 30, but org is not bulkified    	
		Id ownerId = UserInfo.getUserId();

		Demo__c d = new Demo__c(name = 'Test Demo');
		insert d;

		Date taskDate = startRange;
		for (Integer i = 0; i < numToCreate; i++){
			taskDate = taskDate.addDays((Math.random() * 10).intValue() * 3);

			
			Task t = new Task(
							Subject = 'Test Task ' + i,
							Type = 'Demo',
							Status = 'New',
							ActivityDate = taskDate,
							WhatId = d.id,
							priority = 'Normal',
							ownerid = ownerId
							);
			insert t;

		}
 
    }
    static testMethod void BuildMonthlyRepGoals() {
		Monthly_Rep_Goals__c demosSched = new Monthly_Rep_Goals__c(
												Name = 'Demos Scheduled',
												Goal_Label_for_Rep_Dash__c = 'Demos Scheduled',
												Team_Type__c = 'BDR',
												Rep_Type__c = 'BDR',
												Goal__c = 16.00,
												Minimum__c = 10.00												
												);
		insert demosSched;
		Monthly_Rep_Goals__c[] demosSchedList = [SELECT id,name from Monthly_Rep_Goals__c WHERE id = :demosSched.id];
		System.Assert(demosSchedList.size() > 0);
		System.Assert(demosSchedList[0].name == 'Demos Scheduled');
		
		Monthly_Rep_Goals__c demosComp = new Monthly_Rep_Goals__c(
												Name = 'Demos Completed (Scheduled By)',
												Goal_Label_for_Rep_Dash__c = 'Demos Completed',
												Team_Type__c = 'BDR',
												Rep_Type__c = 'BDR',
												Goal__c = 12.00,
												Minimum__c = 7.00												
												);
		insert demosComp;
		Monthly_Rep_Goals__c[] demosCompList = [SELECT id,name from Monthly_Rep_Goals__c WHERE id = :demosComp.id];
		System.Assert(demosCompList.size() > 0);
		System.Assert(demosCompList[0].name == 'Demos Completed (Scheduled By)');

		Monthly_Rep_Goals__c oppsId = new Monthly_Rep_Goals__c(
												Name = 'Total Opportunities IDed',
												Goal_Label_for_Rep_Dash__c = 'Opps IDed',
												Team_Type__c = 'BDR',
												Rep_Type__c = 'BDR',
												Goal__c = 3.75,
												Minimum__c = 2.00												
												);
		insert oppsId;
		Monthly_Rep_Goals__c[] oppsIdList = [SELECT id,name from Monthly_Rep_Goals__c WHERE id = :oppsId.id];
		System.Assert(oppsIdList.size() > 0);
		System.Assert(oppsIdList[0].name == 'Total Opportunities IDed');
		
		Monthly_Rep_Goals__c asp = new Monthly_Rep_Goals__c(
												Name = 'BDR ASP',
												Goal_Label_for_Rep_Dash__c = 'BDR ASP',
												Team_Type__c = 'BDR',
												Rep_Type__c = 'BDR',
												Goal__c = 40000,
												Minimum__c = 0												
												);
		insert asp;
		Monthly_Rep_Goals__c[] aspList = [SELECT id,name from Monthly_Rep_Goals__c WHERE id = :asp.id];
		System.Assert(aspList.size() > 0);
		System.Assert(aspList[0].name == 'BDR ASP');

		Monthly_Rep_Goals__c bookId = new Monthly_Rep_Goals__c(
												Name = 'Bookings ID\'d',
												Goal_Label_for_Rep_Dash__c = 'Bookings ID\'d',
												Team_Type__c = 'BDR',
												Rep_Type__c = 'BDR',
												Goal__c = 40000.00,
												Minimum__c = 25000.00												
												);
		insert bookId;
		Monthly_Rep_Goals__c[] bookIdList = [SELECT id,name from Monthly_Rep_Goals__c WHERE id = :bookId.id];
		System.Assert(bookIdList.size() > 0);
		System.Assert(bookIdList[0].name == 'Bookings ID\'d');
    }

    static testMethod void QueryForGoalThatDoesntExist() {
		testChartController.BuildMonthlyRepGoals();
		ChartController.getMonthlyRepGoal('ZZZZZZ');    	
    }
}