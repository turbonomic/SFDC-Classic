// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Trigger: TaskSetActivityTypeText.trigger      
// Description: Any time a Task is inserted or updated, set the "Activity Type (workflow)" text field to be used for
// reporting. For some strange reason, a WFR to do this doesn't work for email Tasks.
trigger TaskSetActivityTypeText on Task (before insert, before update) {
	/*
	for (Task tsk : trigger.new) {
		tsk.Activity_type_workflow__c = tsk.Type;
	}*/
}