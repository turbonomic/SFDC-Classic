global class BatchFillTrainingRSEPerformed implements Database.Batchable<sObject>{
	
	public String query;
	
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
		VMTUtils.inBatch = true;
		
    	Map<Id,Account> allAccts = new Map<Id,Account>();
    	Map<Id,Boolean> acctTraining = new Map<Id,Boolean>();
    	Map<Id,Boolean> acctServices = new Map<Id,Boolean>();
    	
    	List<Account> updateAccounts = new List<Account>();
    	
    	for(sObject s : scope){
    		
    		Account acct =(Account)s;
    		allAccts.put(acct.id,acct);
    		
    	}
    	
    	List<Asset> allAssets = [select id, name, Training_Status__c, Training_Delivery_Date__c, Services_Status__c, Services_Delivery_Date__c, accountID from Asset where (AccountId in :allAccts.keySet() and (name like '%Training%' or name like '%RAPID%') )];
    	
    	for (Asset ast : allAssets) {
    		system.debug('current asset is ' + ast.name);
    		
    		
			if (ast.Training_Status__c == 'Completed' && date.today() >= ast.Training_Delivery_Date__c) {
				system.debug('$$$ training check');
				acctTraining.put(ast.AccountId,true);
			}
			
			if (ast.Services_Status__c == 'Delivered' && date.today() >= ast.Services_Delivery_Date__c) {
				system.debug('$$$ rse check');
				acctServices.put(ast.AccountId,true);
			}

    	}
    	
    	for (Account acct : allAccts.values()) {
    		
    		Boolean updated = false;
    		
    		if (acctTraining.containsKey(acct.id)) {
    			acct.Training__c = 'Yes';
    			updated = true;
    		}
    		
    		if (acctServices.containsKey(acct.id)) {
    			acct.RSE__c = 'Yes';
    			updated = true;
    		}
    		
    		if (updated) updateAccounts.add(acct);
    	}
    	
    	if (updateAccounts.size() > 0) update updateAccounts;
    	
    	
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
	        mail.setSubject('Fill customer training/RSE on Account batch: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
	
}