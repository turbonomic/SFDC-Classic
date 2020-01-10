/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: Class that holds asynchronous method that queries all Tasks associated with a set of Opportunities and set the 
*  "First Demo" checkbox of the earliest completed Task of Type "Demo".
*/
public class SetFirstDemo {
	
	@future
	public static void setFirstDemoTask (Set<Id> oppIds) {
		/*
		//Get all Demo Tasks associated with Opportunities
        Map<id, Task> demoTasks = new Map<id, Task>([SELECT id, ActivityDate, WhatId, First_Demo__c FROM Task WHERE WhatId in: oppIds AND Status = 'Completed' AND Type = 'Demo']);  
		
		//sort results into map of Opportunity id and date of latest Demo Task
		Map<id, Date> oppDateMap = new Map<Id, Date>();

		for (Task tsk: demoTasks.values()) {
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
			} else {
				if (!tsk.First_Demo__c) {
					tsk.First_Demo__c = true;
					updated = true;
				}
			}

			if (updated) updateTasks.add(tsk);
		}
		
		//commit changes to database
		if (updateTasks.size() > 0) update updateTasks;	*/
	}

}