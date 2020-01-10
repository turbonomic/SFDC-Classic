public class TaskFutureMethods {
	
  /*  
  *	This Class contains future methods that work in conjunction with the "TaskSetFirstDemoTrigger" to 
  *		set the "First Demo", "First Demo Scheduled", and "First Meeting" checkboxes on activities.
  *
  *	Test Class: TestSetFirstDemoScheduled.cls
  *
  *	Table of Contents - to quickly find the method you want, ctrl + F and use the below bracketed values
  *
  *  [TF1]  setFirstDemoTask
  *  [TF2]  setFirstDemoScheduledTask
  *  [TF3]  setFirstMeeting
  *  [TF4]  allFutureTaskQuery
  *	 [TF5]  setOppMostRecentOutcomeChange
  *  [TF6]  setOppReferralMet
  *
  */
  
  	
	
	/** 
	*
	* [TF1]
	*
	* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
	* Description: Class that holds asynchronous method that queries all Tasks associated with a set of Opportunities and set the 
	*  "First Demo" checkbox of the earliest completed Task of Type "Demo".
	*/
	@future
	public static void setFirstDemoTask (Set<id> oppIds) {
		
		//Get all Demo Tasks associated with Opportunities
        Map<id, Task> demoTasks = new Map<id, Task>([SELECT id, ActivityDate, WhatId, First_Demo__c FROM Task WHERE WhatId in: oppIds AND Status = 'Completed' AND Type = 'Demo']);  
		
		
		//sort results into map of Opportunity id and date of latest Demo Task
		Map<id, Date> oppDateMap = new Map<Id, Date>();

		for (Task tsk: demoTasks.values()) {
			if (tsk.ActivityDate == null) tsk.ActivityDate = Date.today();
			if (oppDateMap.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate < oppDateMap.get(tsk.WhatId)) { 
					oppDateMap.put(tsk.WhatId, tsk.ActivityDate);
				}
			} else {
				oppDateMap.put(tsk.WhatId, tsk.ActivityDate);
			}
		}

		//update checkbox on batch Tasks if necessary
		List<Task> updateTasks = new List<Task>();
		for (Task tsk: demoTasks.values()) {
			Boolean updated = false;

			if (oppDateMap.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate <= oppDateMap.get(tsk.WhatId)) {
					if (!tsk.First_Demo__c) {
						tsk.First_Demo__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Demo__c) {
						tsk.First_Demo__c = false;
						updated = true;
					}
				}
			} /*else {
				if (!tsk.First_Demo__c) {
					tsk.First_Demo__c = true;
					updated = true;
				}
			} */
		
			if (updated) updateTasks.add(tsk);
		}
		
		//commit changes to database
		if (updateTasks.size() > 0) update updateTasks;
			
	}
	
	
	/*
  	*  [TF2]
 	*  Set First Demo Scheduled Task
 	*
 	*/
	//@future
	public static void setFirstDemoScheduledTask (Set<id> oppIds) {
		
		//Get all Demo Tasks associated with Opportunities
        Map<id, Task> demoTasks = new Map<id, Task>([SELECT id, subject, CreatedDate, WhatId, First_Demo_Scheduled__c FROM Task WHERE WhatId in: oppIds AND Type = 'Demo']);
		//sort results into map of Opportunity id and date of latest Demo Task
		Map<id, DateTime> oppDateMap = new Map<Id, DateTime>();

		for (Task tsk: demoTasks.values()) {
			if (oppDateMap.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate < oppDateMap.get(tsk.WhatId)) { 
					oppDateMap.put(tsk.WhatId,tsk.CreatedDate);
				}
			} else {
				oppDateMap.put(tsk.WhatId, tsk.CreatedDate);
			}
		}

		//update checkbox on batch Tasks if necessary
		List<Task> updateTasks = new List<Task>();
		for (Task tsk: demoTasks.values()) {
			Boolean updated = false;

			if (oppDateMap.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate <= oppDateMap.get(tsk.WhatId)) {
					if (!tsk.First_Demo_Scheduled__c) {
						system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
						tsk.First_Demo_Scheduled__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Demo_Scheduled__c) {
						tsk.First_Demo_Scheduled__c = false;
						updated = true;
					}
				}
			} /*else {
				if (!tsk.First_Demo_Scheduled__c) {
					system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
					tsk.First_Demo_Scheduled__c = true;
					updated = true;
				}
			} */
		
			if (updated) updateTasks.add(tsk);
		}
		
		//commit changes to database
		if (updateTasks.size() > 0) update updateTasks;	
		
	}
	
	/*
  	*  [TF3]
 	*  Set First Meeting
 	*
 	*/
 	//@future
 	public static void setFirstMeeting (Set<id> oppIds) {
 		
 		//Get all Tasks associated with Opportunities
        Map<id, Task> oppTasks = new Map<id, Task>([SELECT id, ActivityDate, WhatId, First_Meeting__c, CreatedDate, First_Meeting_Scheduled__c, Status FROM Task WHERE WhatId in: oppIds AND (Type = 'Demo' OR Type = 'First Meeting' OR Type = 'On-Site Meeting' OR Type = 'Key Globals Exec Meeting' OR Type = 'Discovery Call')]);  
		Map<id, Task> completedOppTasks = new Map<id, Task>();
		
		
		//sort results into map of Opportunity id and date of earliest Task
		Map<id, DateTime> oppSchDateMap = new Map<Id, DateTime>();
		Map<id, Date> oppCompDateMap = new Map<Id, Date>();
		Map<id, Id> oppToCompTskMap = new Map<Id, Id>();

		for (Task tsk: oppTasks.values()) {
			if (oppSchDateMap.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate < oppSchDateMap.get(tsk.WhatId)) { 
					oppSchDateMap.put(tsk.WhatId, tsk.CreatedDate);
				}
			} else {
				oppSchDateMap.put(tsk.WhatId, tsk.CreatedDate);
			}
			
			if (tsk.Status == 'Completed') {
				completedOppTasks.put(tsk.id,tsk);
				if (tsk.ActivityDate == null) tsk.ActivityDate = Date.today();
				if (oppCompDateMap.containsKey(tsk.WhatId)) {
					if (tsk.ActivityDate < oppCompDateMap.get(tsk.WhatId)) { 
						oppCompDateMap.put(tsk.WhatId, tsk.ActivityDate);
						oppToCompTskMap.put(tsk.WhatId,tsk.id);
					}
				} else {
					oppCompDateMap.put(tsk.WhatId, tsk.ActivityDate);
					oppToCompTskMap.put(tsk.WhatId,tsk.id);
				}
			}
		}
		
		Boolean updated = false;
		//Loop through scheduled meetings and mark earliest one
		List<Task> updateSchTasks = new List<Task>();
		for (Task tsk: oppTasks.values()) {
			updated = false;

			if (oppSchDateMap.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate <= oppSchDateMap.get(tsk.WhatId)) {
					if (!tsk.First_Meeting_Scheduled__c) {
						tsk.First_Meeting_Scheduled__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Meeting_Scheduled__c) {
						tsk.First_Meeting_Scheduled__c = false;
						updated = true;
					}
				}
			}
			
			if (tsk.Status == 'Completed') {
				if (oppCompDateMap.containsKey(tsk.WhatId)) {
					if (tsk.ActivityDate <= oppCompDateMap.get(tsk.WhatId) && oppToCompTskMap.get(tsk.WhatId) == tsk.id) {
						if (!tsk.First_Meeting__c) {
							tsk.First_Meeting__c = true;
							updated = true;
						}
					} else {
						if (tsk.First_Meeting__c) {
							tsk.First_Meeting__c = false;
							updated = true;
						}
					} 
				} /*else {
					if (!tsk.First_Meeting__c) {
						tsk.First_Meeting__c = true;
						updated = true;
					}
				} */
			} 
		
			if (updated) updateSchTasks.add(tsk);
		}

		
		//commit changes to database
		if (updateSchTasks.size() > 0) update updateSchTasks;	
		//if (updateCompTasks.size() > 0) update updateCompTasks;	
		
 		
 	}
 	
 	
 	/*
  	*  [TF4]
 	*  All Future Task Query
 	*
 	*  Called by TaskSetFirstDemo on the TaskMethods class
 	*
 	*/
 	/*
 	//@future
 	public static void allFutureTaskQuery(Set<Id> oppIds, Set<id> demoCompleteOpps, Set<id> demoScheduledOpps, Set<id> meetingOpps) {
 		
 		Map<id, Task> allOppTasks = new Map<id,Task>([SELECT id, Type, Status, ActivityDate, WhatId, First_Demo__c, subject, CreatedDate, First_Demo_Scheduled__c, First_Meeting__c FROM Task WHERE WhatId in: oppIds]);
 		Map<id, Task> scheduledDemos = new Map<id, Task>();
 		Map<id, Task> completedDemos = new Map<id, Task>();
 		Map<id, Task> meetings = new Map<id, Task>();
 		
 		for(Task t: allOppTasks.values()) {
 			if (t.Type == 'Demo') {
 				if (t.Status == 'Completed' && demoCompleteOpps.contains(t.WhatId)) {
 					completedDemos.put(t.id,t);
 				}
 				if (demoScheduledOpps.contains(t.WhatId)) {
 					scheduledDemos.put(t.id,t);
 				}
 			}
 			if (t.Type == 'Demo' || t.Type == 'On-Site Meeting' || t.Type == 'Key Globals Exec Meeting' || t.Type == 'Discovery Call' ) {
 				if (t.Status == 'Completed' && meetingOpps.contains(t.WhatId)) {
 					meetings.put(t.id,t);
 				}
 			}
 		}
 		
 		//sort results into map of Opportunity id and date of earliest Demo Task
		Map<id, Date> oppDateMapDC = new Map<Id, Date>();

		for (Task tsk: completedDemos.values()) {
			if (tsk.ActivityDate == null) tsk.ActivityDate = Date.today();
			if (oppDateMapDC.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate < oppDateMapDC.get(tsk.WhatId)) { 
					oppDateMapDC.put(tsk.WhatId, tsk.ActivityDate);
				}
			} else {
				oppDateMapDC.put(tsk.WhatId, tsk.ActivityDate);
			}
		}

		//update checkbox on batch Tasks if necessary
		List<Task> updateTasks = new List<Task>();
		Map<id,Task> updateTasksMap = new Map<id,Task>();
		
		for (Task tsk: completedDemos.values()) {
			Boolean updated = false;

			if (oppDateMapDC.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate <= oppDateMapDC.get(tsk.WhatId)) {
					if (!tsk.First_Demo__c) {
						tsk.First_Demo__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Demo__c) {
						tsk.First_Demo__c = false;
						updated = true;
					}
				}
			} 

			if (updated) updateTasks.add(tsk);
		}
		
		//sort results into map of Opportunity id and date of earliest Demo Scheduled Task
		Map<id, DateTime> oppDateMapDS = new Map<Id, DateTime>();
		for (Task tsk: scheduledDemos.values()) {
			if (oppDateMapDS.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate < oppDateMapDS.get(tsk.WhatId)) { 
					oppDateMapDS.put(tsk.WhatId,tsk.CreatedDate);
				}
			} else {
				oppDateMapDS.put(tsk.WhatId, tsk.CreatedDate);
			}
		}

		//update checkbox on batch Tasks if necessary
		List<Task> updateTasks2 = new List<Task>();
		for (Task tsk: scheduledDemos.values()) {
			Boolean updated = false;

			if (oppDateMapDS.containsKey(tsk.WhatId)) {
				if (tsk.CreatedDate <= oppDateMapDS.get(tsk.WhatId)) {
					if (!tsk.First_Demo_Scheduled__c) {
						system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
						tsk.First_Demo_Scheduled__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Demo_Scheduled__c) {
						tsk.First_Demo_Scheduled__c = false;
						updated = true;
					}
				}
			} 

			if (updated) updateTasks2.add(tsk);
		}
		
		//sort results into map of Opportunity id and date of earliest Task
		Map<id, Date> oppDateMapMeetings = new Map<Id, Date>();

		for (Task tsk: meetings.values()) {
			if (tsk.ActivityDate == null) tsk.ActivityDate = Date.today();
			if (oppDateMapMeetings.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate < oppDateMapMeetings.get(tsk.WhatId)) { 
					oppDateMapMeetings.put(tsk.WhatId, tsk.ActivityDate);
				}
			} else {
				oppDateMapMeetings.put(tsk.WhatId, tsk.ActivityDate);
			}
		}

		//update checkbox on batch Tasks if necessary
		List<Task> updateTasks3 = new List<Task>();
		for (Task tsk: meetings.values()) {
			Boolean updated = false;

			if (oppDateMapMeetings.containsKey(tsk.WhatId)) {
				if (tsk.ActivityDate <= oppDateMapMeetings.get(tsk.WhatId)) {
					if (!tsk.First_Meeting__c) {
						tsk.First_Meeting__c = true;
						updated = true;
					}
				} else {
					if (tsk.First_Meeting__c) {
						tsk.First_Meeting__c = false;
						updated = true;
					}
				} 
			}

			if (updated) updateTasks3.add(tsk);
		}
		
		//commit changes to database
		if (updateTasks.size() > 0) update updateTasks;
		if (updateTasks2.size() > 0) update updateTasks2;
		if (updateTasks3.size() > 0) update updateTasks3;	
 		
 	} */
 	
 	/*
  	*  [TF5]
 	*  Set Opp Most Recent Outcome Change
 	*
 	*  Called by TaskSetOppLatestOutcome on the TaskMethods class
 	*
 	*/
 	//@future
 	public static void setOppMostRecentOutcomeChange(Map<Id,Task> oppIdToTaskMap) {
 		
 		Map<id,Opportunity> oppMap = new Map<id,Opportunity>([SELECT id, Most_Recent_Outcome_Change_Modified__c, Most_Recent_Outcome_Change__c FROM Opportunity WHERE id in: oppIdToTaskMap.Keyset() and Type != 'Maintenance Renewal' and Type != 'Quota' and Type != 'Forecast']);
		List<Opportunity> oppsToUpdate = new List<Opportunity>();
		
		for (Opportunity opp: oppMap.values()) {
			Boolean updated = false;
			Date taskDate = Date.today(); //Default task date for comparison to today in case task Activity Date is empty
			if (oppIdToTaskMap.get(opp.id).ActivityDate != null) taskDate = oppIdToTaskMap.get(opp.id).ActivityDate;
			
			//if Task is more recent than the Most recent outcome/change currently recorded on the opp then we will want to override
			if (opp.Most_Recent_Outcome_Change_Modified__c != null) {
				if (taskDate > opp.Most_Recent_Outcome_Change_Modified__c.date()) {
					opp.Most_Recent_Outcome_Change__c = oppIdToTaskMap.get(opp.id).Description.abbreviate(255);
					updated = true;
				} 
			}
			else if (opp.Most_Recent_Outcome_Change__c == null || opp.Most_Recent_Outcome_Change__c == '') {
				opp.Most_Recent_Outcome_Change__c = oppIdToTaskMap.get(opp.id).Description.abbreviate(255);
				updated = true; 
			}
			
			if (updated) oppsToUpdate.add(opp);
		}
	
	
		if (oppsToUpdate.size() > 0) update oppsToUpdate;
 	
 	}
 	
 	/*
  	*  [TF6]
 	*  Set Opp Referral Met
 	*
 	*  Called by  on the TaskMethods class
 	*
 	*/
 	//@future
 	public static void setOppReferralMet(List<Id> oppIds) {
 		
 		Map<id,Opportunity> oppMap = new Map<id,Opportunity>([SELECT id, Customer_Referral_Completed__c FROM Opportunity WHERE id in: oppIds AND Customer_Referral_Completed__c != true]);
 		
 		List<Opportunity> updateOpps = new List<Opportunity>();
 		Boolean updated = false;
 		
 		for (Opportunity opp: oppMap.values()) {
 			if (!opp.Customer_Referral_Completed__c) {
 				opp.Customer_Referral_Completed__c = true;
 				updated = true;
 			}
 			
 			if (updated) updateOpps.add(opp);
 		}
 		
 		if (updateOpps.size() > 0) update updateOpps;
 		
 		
 	}
    
}