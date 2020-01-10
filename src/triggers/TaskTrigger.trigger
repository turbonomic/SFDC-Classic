trigger TaskTrigger on Task (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	Map<id,Task> oldTasks = new Map<id,Task>();
	List<Task> insertTasks = new List<Task>();
	List<Task> updateTasks = new List<Task>();
	List<Task> allTasks = new List<Task>();
	Map<id,Task> deletedTasks = new Map<id,Task>(); 
	
	if (trigger.isDelete) {
		for (Task t: trigger.old) {
			deletedTasks.put(t.id,trigger.OldMap.get(t.id));
			allTasks.add(t);
		}
	} else {
		for (Task t : trigger.new) {
			if (trigger.isInsert) {
				insertTasks.add(t);
				allTasks.add(t);
			} else if (trigger.isUpdate) {
				updateTasks.add(t);
				oldTasks.put(t.id,trigger.oldMap.get(t.id));
				allTasks.add(t);
			} //else if (trigger.isUndelete) {
				//allTasks.add(t);
			//}
		}
	}
	
	TaskMethods.allTaskQueries(allTasks);
	
	if (trigger.isBefore) {
		
		if (trigger.isInsert) {
			TaskMethods.TaskStampWarmAccount(insertTasks);
			TaskMethods.TaskSetActivityType(insertTasks);
			TaskMethods.CopyCallDisposition(insertTasks);
			
		} else if (trigger.isUpdate) {
			TaskMethods.TaskSetActivityType(updateTasks);
		}
		
	} else if (trigger.isAfter) {
		
		if (trigger.isInsert) {
			TaskMethods.TaskAfterInsertUpdate(insertTasks,oldTasks);
			TaskMethods.TaskStatusProgression(insertTasks,oldTasks);
			TaskMethods.TaskSetFirstDemo(insertTasks,oldTasks);
			TaskMethods.TaskSetOpenFlagOnLeadContact(insertTasks,oldTasks);
			TaskMethods.TaskSetOppLatestOutcome(insertTasks);
			TaskMethods.TaskSetOppReferralCompleted(insertTasks);
			TaskMethods.updateLastAcctOutcomeDate(insertTasks);
		} else if (trigger.isUpdate) {
			TaskMethods.TaskAfterInsertUpdate(updateTasks,oldTasks);
			TaskMethods.TaskStatusProgression(updateTasks,oldTasks);
			TaskMethods.TaskSetFirstDemo(updateTasks,oldTasks);
			TaskMethods.TaskSetOpenFlagOnLeadContact(updateTasks,oldTasks);
			TaskMethods.TaskSetOppLatestOutcome(updateTasks);
			TaskMethods.TaskSetOppReferralCompleted(updateTasks);
			TaskMethods.updateLastAcctOutcomeDate(updateTasks);
		} else if (trigger.isDelete) {
			List<Task> deleteTasks = new List<Task>();
			TaskMethods.TaskSetFirstDemo(deleteTasks,deletedTasks);
			TaskMethods.TaskSetLastEngagement(deletedTasks);
			TaskMethods.TaskSetOpenFlagOnLeadContact(deleteTasks,deletedTasks);
		}
	}
	
	
	
}