global class BatchDeleteTaskLogs implements Schedulable, Database.Batchable<sObject>{
	
	DateTime datebound = datetime.now().addDays(-90);
	public String query = 'SELECT id from ClickToDialTaskLog__c where createdDate < :datebound';
	
	global void execute(SchedulableContext sc) { 
		Id jobId = Database.executeBatch(new BatchDeleteTaskLogs(), 1000);
	}
	
	global database.querylocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC,List<sObject> scope) {
		
		List<ClickToDialTaskLog__c> historicalLogs = new List<ClickToDialTaskLog__c>();
		
		for (sObject s : scope) {
			ClickToDialTaskLog__c cdtl = (ClickToDialTaskLog__c)s;
			historicalLogs.add(cdtl);
		}
		
		if (historicalLogs.size() > 0) delete historicalLogs;
		
	}
	
	global void finish(Database.BatchableContext BC){
		AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
        	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          	String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com', 'nadine.tardiff@turbonomic.com', 'charmian.mcintyre@turbonomic.com', 'SFAdmin@turbonomic.com'};
          	mail.setToAddresses(toAddresses);
          	mail.setSubject('Delete Historical Click to Call Logs batch: ' + a.Status);
          	mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
          	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
	}

}