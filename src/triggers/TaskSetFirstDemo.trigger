/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: When a Task is created, updated or deleted and is a completed "Demo" Task under an Opportunity, call future class to set 
*  the "First Demo" checkbox on the appropriate Task under Opportunities related to the Tasks in the context of this Trigger.
*/

trigger TaskSetFirstDemo on Task (after delete, after insert, after update) {
	/*
	
	String oppPrefix = Schema.SObjectType.Opportunity.getKeyPrefix();
	Set<Id> allOppIds = new Set<Id>();
	Set<Id> oppIds = new Set<Id>();
	Set<Id> oppIds2 = new Set<Id>();
	Set<Id> oppsId3 = new Set<Id>();
	
	if (!VMTUtils.inBatch) { //do not run this trigger if we are within a batch method because a batch class cannot call a future method
		if (trigger.IsInsert || trigger.IsUpdate) {
			for (Task t : trigger.new) {
				if (t.Type == 'Demo' && t.WhatId != null) {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppIds2.add(t.WhatId);
						allOppIds.add(t.WhatId);
					}
				}
				
				if (t.Type == 'Demo' && t.WhatId != null && t.Status == 'Completed') {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppIds.add(t.WhatId);
						allOppIds.add(t.WhatId);
					}
				}
				
				if (t.WhatId != null && t.Status == 'Completed' && (t.Type == 'Demo' || t.Type == 'On-Site Meeting' || t.Type == 'Key Globals Exec Meeting' || t.Type == 'Discovery Call')) {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppsId3.add(t.WhatId);
						allOppIds.add(t.WhatId);
					}
				}
			}
		} else {
			for (Task t : trigger.old) {
				if (t.Type == 'Demo' && t.WhatId != null) {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppIds2.add(t.whatId);
						allOppIds.add(t.WhatId);
					}
				}
				
				if (t.Type == 'Demo' && t.WhatId != null && t.Status == 'Completed') {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppIds.add(t.WhatId);
						allOppIds.add(t.WhatId);
					}
				}
				
				if (t.WhatId != null && t.Status == 'Completed' && (t.Type == 'Demo' || t.Type == 'On-Site Meeting' || t.Type == 'Key Globals Exec Meeting' || t.Type == 'Discovery Call')) {
					if (((String)t.WhatId).startsWith(oppPrefix)) {
						oppsId3.add(t.WhatId);
						allOppIds.add(t.WhatId);
					}
				}
			}
		}
		
		if(allOppIds.size() > 0 && !System.isFuture() && !System.isBatch()) {
			TaskFutureMethods.allFutureTaskQuery(allOppIds, oppIds, oppIds2, oppsId3);
			if (oppIds.size() > 0) {
				system.debug('TaskSetFirstDemo.trigger: Calling future method!'); 
				//TaskFutureMethods.setFirstDemoTask(oppIds); 
			}
			if (oppIds2.size() > 0) {
				system.debug('TaskSetFirstDemoScheduled.trigger: Calling future method!');
				//TaskFutureMethods.setFirstDemoScheduledTask(oppIds2);
			}
			if (oppsId3.size() > 0) {
				system.debug('TaskSetFirstMeeting.trigger: Calling future method!');
				//TaskFutureMethods.setFirstMeeting(oppsId3);
			}
		}
	}
*/
}