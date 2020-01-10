// Created by: Eustace Consulting [Developer: Jennifer Blair]
// Description: This class will go through all Tasks associated with Opportunities and check the "First Demo" box if that Tasks is the first 
//  completed Demo Task associated with that Opportunity.
global class BatchSetFirstDemo implements Database.Batchable<sObject>{
	public String query;
    
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    public static id runBatchNow() {
    	BatchSetFirstDemo b = new BatchSetFirstDemo();
		b.query = 'SELECT Id, Type, WhatId, First_Demo__c, ActivityDate FROM Task WHERE WhatId != null AND Type = \'Demo\' AND Status = \'Completed\' ';
		return Database.executeBatch(b, 200);   	
    	
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;

    	//collect all Accounts & initialize maps
    	Set<id> oppIds = new Set<id>();
    	Map<id, Task> batchTasks = new Map<Id, Task>();
    	system.debug('###Num Tasks in this batch: ' + scope.size());
    	
    	String oppPrefix = Schema.SObjectType.Opportunity.getKeyPrefix();
    	
    	for(sObject s : scope){
            Task tsk = (Task)s;
            if (((String)tsk.WhatId).startsWith(oppPrefix)) {
            	batchTasks.put(tsk.id, tsk);
            	oppIds.add(tsk.WhatId);
    		}
    	}
    	
        //Get all Demo Tasks associated with Opportunities
        Map<id, Task> otherDemoTasks = new Map<id, Task>([SELECT id, ActivityDate, WhatId FROM Task WHERE WhatId in: oppIds AND Type = 'Demo' AND Status = 'Completed']);  
		
		//sort results into map of Opportunity id and date of latest Demo Task
		Map<id, Date> oppDateMap = new Map<Id, Date>();

		for (Task tsk: otherDemoTasks.values()) {
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
		for (Task tsk: batchTasks.values()) {
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
		if (updateTasks.size() > 0) update updateTasks;
		
		VMTUtils.inBatch = false;  

    }
    
    global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job  
        // from Database.BatchableContext.  
        // Query the AsyncApexJob object to retrieve the current job's information.  
    
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0) {
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'jen@eustaceconsulting.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Set First Demo Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }

}