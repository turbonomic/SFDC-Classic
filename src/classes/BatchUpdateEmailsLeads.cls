global class BatchUpdateEmailsLeads implements Database.Batchable<sObject>{

	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

	global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	
    	Map<id,Lead> allLeads = new Map<id,Lead>();
    	
    	for(sObject s : scope){
    		Lead ld = (Lead)s;
    		allLeads.put(ld.id,ld);
    	}
    	
    	//Get all pertinent Tasks associated with Accounts in batch
		List<Task> tskList = [select ActivityDate, Type, WhoId from Task where Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and WhoId in: allLeads.keySet() and Type = 'Email' all rows];
    	system.debug('TskList has ' + tskList.size() + ' Tasks');
    	
    	
    	Map<id, List<Date>> leadEmailCount = new Map<Id, List<Date>>();
    	
    	String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
    	
    	
    	for (Task tsk: tskList) {
			
			if (tsk.WhoId != null) {
    	
    			if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					system.debug('###Task associated with Lead!');
					if (allLeads.containsKey(tsk.WhoId)) {
						
						if (tsk.Type == 'Email') {
							if (leadEmailCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = leadEmailCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								leadEmailCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								leadEmailCount.put(tsk.WhoId, dLst);
							}
					
						}					
					}
    			}
			}
    	}
    	
    	List<Lead> updateLeads = new List<Lead>();
		for (Lead ld: allLeads.values()) {
			Boolean updated = false;
			
			//set Lead Last Email Date
			if (leadEmailCount.containsKey(ld.id)) {
				leadEmailCount.get(ld.id).sort();
				if (ld.Last_Email_Date__c != leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1]) {
					system.debug('###Setting Lead Last Email Date to: ' + leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1]);
					ld.Last_Email_Date__c = leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1];
					updated = true;
				}
			} else {
				if (ld.Last_Email_Date__c != null) {
					system.debug('###Setting Lead Last Email Date to NULL');
					ld.Last_Email_Date__c = null;
					updated = true;
				}
			}
	
			if (updated) updateLeads.add(ld);
		}
    	
    	if (!updateLeads.isEmpty()) update updateLeads;
    	
    	
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
	        mail.setSubject('Update Email Info Leads Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }

}