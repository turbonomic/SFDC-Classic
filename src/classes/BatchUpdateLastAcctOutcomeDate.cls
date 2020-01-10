global class BatchUpdateLastAcctOutcomeDate implements Database.Batchable<sObject>{
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	
     	//collect all Accounts & initialize maps
    	Map<id, Account> allAccts = new Map<id, Account>();
    	system.debug('###Num Accts in this batch: ' + scope.size());
    	
    	for(sObject s : scope){
            Account acct = (Account)s;
            allAccts.put(acct.id, acct);
            system.debug('###Adding Acct to allAccts Map.');
            system.debug('###Acct Name: ' + acct.Name);
            system.debug('###Acct Id: ' + acct.Id);
    	}
    	
    	//Get all Contacts associated with Accounts
        Map<id, Contact> allContacts = new Map<id, Contact>([select id, AccountId, Last_Email_Date__c from Contact where AccountId =: allAccts.keySet()]);  
		
		//Get all Leads associated with all Accounts
        Map<id, Lead> allLeads = new Map<id, Lead>([select id, Account__c, Status, Status_Change_Date__c, Marked_Non_Responsive_No_Interest__c, Last_Email_Date__c, Was_Prospect__c from Lead where IsConverted = false and Account__c =: allAccts.keySet()]);
		
		//Get all pertinent Tasks associated with Accounts in batch...should a discovery call be considered an outcome? probably not, right?
		List<Task> tskList = [select WhatId, ActivityDate, Type, AccountId, WhoId, Call_Disposition__c, executive_visit__c, Outcomes__c, Virtual_Machines_VMs__c, CPU_Sockets__c, Partner_Team_Present__c from Task where (Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and (WhoId in: allContacts.keySet() or WhoId in: allLeads.keySet() or WhatId in: allAccts.keySet()) and Outcomes__c != null)];
		
		Map<Id, Date> acctLastActOutcomeDate = new Map<Id, Date>();
		
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		
		for (Task tsk: tskList) {
			if(tsk.AccountId != null){ 
				system.debug('###Task associated with Account!');
				
				if (tsk.Outcomes__c != null) {
					if (acctLastActOutcomeDate.containsKey(tsk.AccountId)) {
						if (tsk.ActivityDate > acctLastActOutcomeDate.get(tsk.AccountId)) {
							acctLastActOutcomeDate.put(tsk.AccountId, tsk.ActivityDate);
						}
					} else {
						acctLastActOutcomeDate.put(tsk.AccountId, tsk.ActivityDate);
					}
				}
			}
			
			if (tsk.WhoId != null) {
				if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					if (tsk.Outcomes__c != null) {
							if (acctLastActOutcomeDate.containsKey(allLeads.get(tsk.WhoId).Account__c)) {
								if (tsk.ActivityDate > acctLastActOutcomeDate.get(allLeads.get(tsk.WhoId).Account__c)) {
									acctLastActOutcomeDate.put(allLeads.get(tsk.WhoId).Account__c, tsk.ActivityDate);
								}
							} else {
								acctLastActOutcomeDate.put(allLeads.get(tsk.WhoId).Account__c, tsk.ActivityDate);
							}
					}
				}
			}
		}
		List<Account> updateAccts = new List<Account>();
		for (Account acct: allAccts.values()) {
			Boolean updated = false;
			if (acctLastActOutcomeDate.containsKey(acct.id)) {
				if (acct.Last_Activity_With_Outcome_Date__c != acctLastActOutcomeDate.get(acct.id)) {
					acct.Last_Activity_With_Outcome_Date__c = acctLastActOutcomeDate.get(acct.id);
					updated = true;
				}
			}
			
			if (acct.last_customer_touchPoint__c != null) {

				Integer days = acct.last_customer_touchpoint__c.date().daysBetween(Date.today());
			
				if (days > 120) {

					if (acct.Customer_Attention_Reason_NEW__c != null) {
   						
					} else {
						acct.Customer_Attention_Reason_NEW__c = 'No interaction in 4+ months';
						updated = true;
					}

					
				}
    		}
			
			if (updated) updateAccts.add(acct);
		}
		if (updateAccts.size() > 0) update updateAccts; 
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
	        mail.setSubject('Update Last Account Outcome Date Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}