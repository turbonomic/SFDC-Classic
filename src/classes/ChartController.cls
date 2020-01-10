public with sharing class ChartController {

	// Query goals at once to keep DML limit low
	public static Monthly_Rep_Goals__c[] mrgList = [SELECT id,goal__c,minimum__c,Name from Monthly_Rep_Goals__c where Name IN ('Demos Scheduled','Demos Completed (Scheduled By)','Total Opportunities IDed','BDR ASP','Bookings ID\'d') and (Team_Type__c = 'BDR' or Team_Type__c = null) ];
	public static Decimal MonthlyRange = 30;
	public static User[] loggedInUser = [SELECT Start_Date__c from User where id = :UserInfo.getUserId()];
	public static Date startRange = loggedInUser[0].Start_Date__c;
	public static Date endRange = Date.today().addDays(14);
	public static Integer weeklyThreshold = 180; // number of days after which the chart should switch to weekly
	

    // Return a list of data points for a chart
    public List<Data> getData_DemosCompleted() {
        return ChartController.getChartData_DemosCompleted();
    }
    
    // Make the chart data available via JavaScript remoting
    @RemoteAction
    public static List<Data> getRemoteData_DemosCompleted() {
        return ChartController.getChartData_DemosCompleted();
    }

    // The actual chart data; needs to be static to be
    // called by a @RemoteAction method
    public static List<Data> getChartData_DemosCompleted() {
		Integer interval = startRange.daysBetween(endRange);
		Integer intervalRate = (interval > weeklyThreshold) ? 7 : 1; // the number of days the x axis of the chart will use
		Monthly_Rep_Goals__c mrg = ChartController.getMonthlyRepGoal('Demos Completed (Scheduled By)');
		Decimal MonthlyMinimum = (mrg != null) ? mrg.minimum__c : 7;
		Decimal MonthlyGoal = (mrg != null) ? mrg.goal__c : 11.2;
	
	
		Task[] userTasks = [SELECT id,ActivityDate FROM Task 
							WHERE ActivityDate != null 
							AND ActivityDate > :startRange AND ActivityDate < :endRange 
							AND CreatedById = :UserInfo.getUserId()
							AND Type = 'Demo'
							AND Status = 'Completed'
							ORDER BY ActivityDate
							]; // This query only returns completed demos
        List<Data> data = new List<Data>();

		Integer ActivityCount = 0;
		for (Integer day = 1; day < interval; day = day + intervalRate){
			// use activity count as index on userTasks and check if the task activity date equals startRange + day
			// if yes, incremenet activity count
			while (ActivityCount < userTasks.size() && 
					userTasks[ActivityCount].ActivityDate.DaysBetween(startRange.addDays(day)) <= intervalRate &&
					userTasks[ActivityCount].ActivityDate.DaysBetween(startRange.addDays(day)) >= 0
					){
/*
				System.Debug('day : ' + day);
				System.Debug('ActivityCount : ' + ActivityCount);
				System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
				System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);
*/
				ActivityCount++;
			}
	        data.add(new Data(
	        	String.valueOf(day), 
	        	ActivityCount, 
	        	((day/MonthlyRange) * MonthlyMinimum).setScale(2), 
	        	((day/MonthlyRange) * MonthlyGoal).setScale(2))
	        	);
			
		}
        return data;
    }
    
    public List<Data> getData_DemosScheduled() {
        return ChartController.getChartData_DemosScheduled();
    }
    
    // Make the chart data available via JavaScript remoting
    @RemoteAction
    public static List<Data> getRemoteData_DemosScheduled() {
        return ChartController.getChartData_DemosScheduled();
    }

    // The actual chart data; needs to be static to be
    // called by a @RemoteAction method
    public static List<Data> getChartData_DemosScheduled() {
		Integer interval = startRange.daysBetween(endRange);
		Integer intervalRate = (interval > weeklyThreshold) ? 7 : 1; // the number of days the x axis of the chart will use
		Monthly_Rep_Goals__c mrg = ChartController.getMonthlyRepGoal('Demos Scheduled');
		Decimal MonthlyMinimum = (mrg != null) ? mrg.minimum__c : 10;
		Decimal MonthlyGoal = (mrg != null) ? mrg.goal__c : 16;
	
		Task[] userTasks = [SELECT id,ActivityDate FROM Task 
							WHERE ActivityDate != null 
							AND ActivityDate > :startRange AND ActivityDate < :endRange 
							AND CreatedById = :UserInfo.getUserId()
							AND Type = 'Demo'
							ORDER BY ActivityDate
							];	// Demos scheduled includes all demos (so that they number grows even if demos are completed)

        List<Data> data = new List<Data>();

		Integer ActivityCount = 0;
		for (Integer day = 1; day < interval; day = day + intervalRate){
			// use activity count as index on userTasks and check if the task activity date equals startRange + day
			// if yes, incremenet activity count
			while (ActivityCount < userTasks.size() && 
					userTasks[ActivityCount].ActivityDate.DaysBetween(startRange.addDays(day)) <= intervalRate &&
					userTasks[ActivityCount].ActivityDate.DaysBetween(startRange.addDays(day)) >= 0
					){

				System.Debug('day : ' + day);
				System.Debug('ActivityCount : ' + ActivityCount);
				System.Debug('userTasks[ActivityCount].ActivityDate : ' + userTasks[ActivityCount].ActivityDate);
				System.Debug('userTasks[ActivityCount].ActivityDate.isSameDay(startRange.addDays(day) : ' + userTasks[ActivityCount].ActivityDate.isSameDay(startRange.addDays(day)));
				System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
				System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);

				ActivityCount++;
			}
			System.Debug('day : ' + day);
			System.Debug('ActivityCount : ' + ActivityCount);
			System.Debug('MonthlyRange : ' + MonthlyRange);
			System.Debug('MonthlyMinimum : ' + MonthlyMinimum);
			System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
			System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);
			
	        data.add(new Data(
	        	String.valueOf(day), 
	        	ActivityCount, 
	        	((day/MonthlyRange) * MonthlyMinimum).setScale(2), 
	        	((day/MonthlyRange) * MonthlyGoal).setScale(2)
	        	));
			
		}
        return data;
    }


    public List<Data> getData_OpportunitiesIdentifiedAmount() {
        return ChartController.getChartData_OpportunitiesIdentifiedAmount();
    }
    
    // Make the chart data available via JavaScript remoting
    @RemoteAction
    public static List<Data> getRemoteData_OpportunitiesIdentifiedAmount() {
        return ChartController.getChartData_OpportunitiesIdentifiedAmount();
    }

    // The actual chart data; needs to be static to be
    // called by a @RemoteAction method
    public static List<Data> getChartData_OpportunitiesIdentifiedAmount() {
		Integer interval = startRange.daysBetween(endRange);
		Integer intervalRate = (interval > weeklyThreshold) ? 7 : 1; // the number of days the x axis of the chart will use
		Monthly_Rep_Goals__c mrgId = ChartController.getMonthlyRepGoal('Total Opportunities IDed');
		Monthly_Rep_Goals__c mrgAm = ChartController.getMonthlyRepGoal('BDR ASP');
		Decimal MonthlyMinimum = (mrgId != null) ? mrgId.minimum__c * mrgAm.minimum__c : 100000;
		Decimal MonthlyGoal = (mrgId != null) ? mrgId.goal__c * mrgAm.goal__c : 160000;
		Integer GoalOffset = 30; // number of days before goal kicks in
	
		Opportunity[] userOpportunities = [SELECT id,Amount,Opportunity_ID_Date__c FROM Opportunity 
							WHERE (Opportunity_ID_Date__c != null)  
							AND Identified_By__c = :UserInfo.getUserId()
							ORDER BY Opportunity_ID_Date__c
							];	// Contains open & won opportunities

        List<Data> data = new List<Data>();

		Integer ActivityCount = 0;
		Decimal AggregateAmount = 0;
		for (Integer day = 1; day < interval; day = day + intervalRate){
			// use activity count as index on userTasks and check if the task activity date equals startRange + day
			// if yes, incremenet activity count
			while (ActivityCount < userOpportunities.size() && 
					userOpportunities[ActivityCount].Opportunity_ID_Date__c.DaysBetween(startRange.addDays(day)) <= intervalRate &&
					userOpportunities[ActivityCount].Opportunity_ID_Date__c.DaysBetween(startRange.addDays(day)) >= 0
					){
				AggregateAmount += userOpportunities[ActivityCount].Amount;
				ActivityCount++;
			}
/*
			System.Debug('day : ' + day);
			System.Debug('ActivityCount : ' + ActivityCount);
			System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
			System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);
*/
	        data.add(new Data(
	        	String.valueOf(day), 
	        	AggregateAmount.intValue(), 
	        	(day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyMinimum, 
	        	(day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyGoal
	        	));
			
		}
        return data;
    }


    public List<Data> getData_OpportunitiesIdentifiedCount() {
        return ChartController.getChartData_OpportunitiesIdentifiedCount();
    }
    
    // Make the chart data available via JavaScript remoting
    @RemoteAction
    public static List<Data> getRemoteData_OpportunitiesIdentifiedCount() {
        return ChartController.getChartData_OpportunitiesIdentifiedCount();
    }

    // The actual chart data; needs to be static to be
    // called by a @RemoteAction method
    public static List<Data> getChartData_OpportunitiesIdentifiedCount() {
		Integer interval = startRange.daysBetween(endRange);
		Integer intervalRate = (interval > weeklyThreshold) ? 7 : 1; // the number of days the x axis of the chart will use
		Monthly_Rep_Goals__c mrg = ChartController.getMonthlyRepGoal('Total Opportunities IDed');
		Decimal MonthlyMinimum = (mrg != null) ? mrg.minimum__c : 3;
		Decimal MonthlyGoal = (mrg != null) ? mrg.goal__c : 5;
		Integer GoalOffset = 30; // number of days before goal kicks in
	
		Opportunity[] userOpportunities = [SELECT id,Amount,Opportunity_ID_Date__c FROM Opportunity 
							WHERE (Opportunity_ID_Date__c != null)  
							AND Identified_By__c = :UserInfo.getUserId()
							ORDER BY Opportunity_ID_Date__c
							];	

        List<Data> data = new List<Data>();

		Integer ActivityCount = 0;
		Decimal AggregateAmount = 0;
		for (Integer day = 1; day < interval; day = day + intervalRate){
			// use activity count as index on userTasks and check if the task activity date equals startRange + day
			// if yes, incremenet activity count
			while (ActivityCount < userOpportunities.size() && 
					userOpportunities[ActivityCount].Opportunity_ID_Date__c.DaysBetween(startRange.addDays(day)) <= intervalRate &&
					userOpportunities[ActivityCount].Opportunity_ID_Date__c.DaysBetween(startRange.addDays(day)) >= 0
					){
				AggregateAmount += userOpportunities[ActivityCount].Amount;
				ActivityCount++;
			}
/*
			System.Debug('day : ' + day);
			System.Debug('ActivityCount : ' + ActivityCount);
			System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
			System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);
*/
	        data.add(new Data(
	        	String.valueOf(day), 
	        	ActivityCount, 
	        	((day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyMinimum).setScale(2), 
	        	((day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyGoal).setScale(2)
	        	));

			
		}
        return data;
    }

    public List<Data> getData_BookingsIdentifiedAmount() {
        return ChartController.getChartData_BookingsIdentifiedAmount();
    }
    
    // Make the chart data available via JavaScript remoting
    @RemoteAction
    public static List<Data> getRemoteData_BookingsIdentifiedAmount() {
        return ChartController.getChartData_BookingsIdentifiedAmount();
    }

    // The actual chart data; needs to be static to be
    // called by a @RemoteAction method
    public static List<Data> getChartData_BookingsIdentifiedAmount() {
		Integer interval = startRange.daysBetween(endRange);
		Integer intervalRate = (interval > weeklyThreshold) ? 7 : 1; // the number of days the x axis of the chart will use
		Monthly_Rep_Goals__c mrg = ChartController.getMonthlyRepGoal('Bookings ID\'d');
		Decimal MonthlyMinimum = (mrg != null) ? mrg.minimum__c : 25000;
		Decimal MonthlyGoal = (mrg != null) ? mrg.goal__c : 40000;
		Integer GoalOffset = 60; // number of days before goal kicks in
		
	
		Opportunity[] userOpportunities = [SELECT id,Amount,CloseDate FROM Opportunity 
							WHERE isWon = true  
							AND Identified_By__c = :UserInfo.getUserId()
							ORDER BY CloseDate
							];	// Bookings only contain won opportunities

        List<Data> data = new List<Data>();

		Integer ActivityCount = 0;
		Decimal AggregateAmount = 0;
		for (Integer day = 1; day < interval; day = day + intervalRate){
			// use activity count as index on userTasks and check if the task activity date equals startRange + day
			// if yes, incremenet activity count
			while (ActivityCount < userOpportunities.size() && 
					userOpportunities[ActivityCount].CloseDate.DaysBetween(startRange.addDays(day)) <= intervalRate &&
					userOpportunities[ActivityCount].CloseDate.DaysBetween(startRange.addDays(day)) >= 0
					){
				AggregateAmount += userOpportunities[ActivityCount].Amount;
				ActivityCount++;
			}
/*
			System.Debug('day : ' + day);
			System.Debug('ActivityCount : ' + ActivityCount);
			System.Debug('(day/MonthlyRange) * MonthlyMinimum : ' + (day/MonthlyRange) * MonthlyMinimum);
			System.Debug('(day/MonthlyRange) * MonthlyGoal : ' + (day/MonthlyRange) * MonthlyGoal);
*/
	        data.add(new Data(
	        	String.valueOf(day), 
	        	AggregateAmount.intValue(), 
	        	((day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyMinimum).setScale(2), 
	        	((day < GoalOffset) ? 0 : ((day-GoalOffset)/MonthlyRange) * MonthlyGoal).setScale(2)
	        	));
			
		}
        return data;
    }


    // Wrapper class
    public class Data {
        public String name { get; set; }
        public Integer sp1 { get; set; }
        public Decimal monthlyMin { get; set; }
        public Decimal monthlyGoal { get; set; }
        public Data(String name, Integer sp1, Decimal monthlyMin, Decimal monthlyGoal) {
            this.name = name;
            this.sp1 = sp1;
            this.monthlyMin = monthlyMin;
            this.monthlyGoal = monthlyGoal;
        }
    }

	// Quick list lookup method for goals
	public static Monthly_Rep_Goals__c getMonthlyRepGoal(String Name){
		for (Monthly_Rep_Goals__c mrg : mrgList){
			if (mrg.Name == Name) return mrg;
		}
		return null;
	}

}