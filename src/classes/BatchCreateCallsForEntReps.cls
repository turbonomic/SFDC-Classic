global class BatchCreateCallsForEntReps implements Database.Batchable<sObject> {
	
	public String query;
  
  	global database.querylocator start(Database.BatchableContext BC) {
    	return Database.getQueryLocator(query);
  	}
  	
  	
  	global void execute(Database.BatchableContext BC,List<sObject> scope) {
    
    	List<User> entReps = new List<User>();
    	List<Task> dailyCalls = new List<Task>();
    	
    	for (sObject s: scope) {
      		User u = (User)s;
      		entReps.add(u);
      		system.debug('@@@ user is ' + u.name);
    	}
    	
    	
    	for (User currRep : entReps){	
    		for (integer i=0; i<30; i++){
    			Task t = new Task( OwnerId=currRep.Id, ActivityDate=Date.Today(), Type='Call', Call_Disposition__c='No Answer', Subject='Call', Status='Completed');
    			dailyCalls.add(t);
    		}
    	}
    	
    	if (dailyCalls.size()>0) insert dailyCalls;
    	
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
          String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com'};
          mail.setToAddresses(toAddresses);
          mail.setSubject('Batch Create Calls: ' + a.Status);
          mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
          Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
	
}