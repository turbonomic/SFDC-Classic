public with sharing class SetFirstDemoScheduled {

	@future
	public static void setFirstDemoScheduledTask (Set<Id> oppIds) {
		/*
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
			} else {
				if (!tsk.First_Demo_Scheduled__c) {
					system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
					tsk.First_Demo_Scheduled__c = true;
					updated = true;
				}
			}

			if (updated) updateTasks.add(tsk);
		}
		
		//commit changes to database
		if (updateTasks.size() > 0) update updateTasks;	*/
	}

}