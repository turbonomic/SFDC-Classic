global class BatchFillCorporateSFMetrics implements Database.Batchable<sObject>{

		
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	
    	Map<id,User> allUsers = new Map<id,User>();
    	
    	//store users in map
    	for(sObject s : scope){
    		
    		User u = (User)s;
    		allUsers.put(u.id,u);
    		
    	}
    	
		Map<id,Talent_Management__c> allTM = new Map<id,Talent_Management__c>([select id, user_Safe_id__c from Talent_Management__c where user_Safe_id__c in : allUsers.KeySet()]);
    	
    	Map<id,Talent_Management__c> userToTM = new Map<id,Talent_Management__c>();
    	
		List<Talent_Management__c> insertTMs = new List<Talent_Management__c>();
		List<User> updateUsers = new List<User>();
		
		for (Talent_Management__c tm : allTM.values()) {
			userToTM.put(tm.user_safe_id__c,tm);
		}
		
		for (User u : allusers.values()) {
			if (!userToTM.containsKey(u.id)) {
				Talent_Management__c newTM = new Talent_Management__c(ownerId = u.id, name = u.full_name__c);
				insertTMs.add(newTM);
				u.has_talent_management_file__c = true;
				updateUsers.add(u);
			} else {
				if (!u.has_talent_Management_File__c) {
					u.has_talent_management_file__c = true;
				}
				if (u.trigger_workflow_rules__c == 'A') {
					u.trigger_workflow_rules__c = 'B';
					updateUsers.add(u);
				} else {
					u.trigger_workflow_rules__c = 'A';
					updateUsers.add(u);
				}
			}
		}
		
		
		
    	if (!insertTMs.isEmpty()) insert insertTMs;
    	if (!updateUsers.isEmpty()) update updateUsers;
    	
    	
    	VMTUtils.inBatch = false;
    }
    
    
    global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job  
        // from Database.BatchableContext.  
        // Query the AsyncApexJob object to retrieve the current job's information.  
    
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Update User SF Metrics Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
	
	
	
	

}