global class BatchCountOppContactRoles implements Database.Batchable<sObject>{
	
	public String query;
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
/*    	
    	    VMTUtils.inBatch = true;
    	    
    	    //collect all Opps & initialize maps
    		Map<id, Opportunity> allOpps = new Map<id, Opportunity>();
    		system.debug('###Num Opps in this batch: ' + scope.size());
    		Map<id, Integer> oppToCR = new Map<id, Integer>(); //map to store total opportunity contact role count with opportunity id
    		List<Opportunity> updateOpps = new List<Opportunity>();
    		
    		
    		for(sObject s : scope){
            	Opportunity opp = (Opportunity)s;
           		allOpps.put(opp.id, opp);
           		oppToCR.put(opp.id,0);
            	//system.debug('###Adding Opp to allOpps Map.');
            	//system.debug('###Opp Name: ' + opp.Name);
            	//system.debug('###Opp Id: ' + opp.Id);
    		}
    		
    		//Get all pertinent demos associated with Opps in Batch
    		List<Task> allDemos = [SELECT id, WhatId, WhoId, Type, AccountId, First_Demo__c, CreatedDate, ActivityDate,First_Demo_Scheduled__c FROM Task WHERE Type = 'Demo' and WhatId =: allOpps.keyset()];
    		
    	
    		//All opportunity contact roles
    		List<OpportunityContactRole> allOppCR = new List<OpportunityContactRole>([SELECT id, OpportunityId, IsDeleted FROM OpportunityContactRole WHERE OpportunityId =: allOpps.keyset() AND IsDeleted = false]);
    		
    	
    		 //update total contact role count for each opportunity
       		 for (OpportunityContactRole oppCR : allOppCR) {
        		oppToCR.put(oppCR.OpportunityId, oppToCR.get(oppCR.OpportunityId)+1);
       		 }
       		 
       		 //Map for the Contact ID of the first Demo scheduled
    		 Map<id, id> oppFirstDemoConID = new Map<Id, Id>();
    		
    		for (Task tsk: allDemos) {
				if (tsk.First_Demo_Scheduled__c) {
			 		if (!oppFirstDemoConId.containsKey(tsk.whatId)) {
						oppFirstDemoConId.put(tsk.WhatId,tsk.WhoId);
					}
				}
    		}
       		 
       		 //Loop through all opportunities and update as needed
       		 for (Opportunity opp : allOpps.values()) {
       		 	
       		 	Boolean updated = false;
       		 	
       		 	//If the contact role count is null, set to zero
       		 	if (opp.Contact_Role_Count__c == null) {
       		 		opp.Contact_Role_Count__c = 0;
       		 		updated = true;
       		 	}
       		 	
       		 	//Update the Opportunity Contact Role Count
       		 	if (oppToCR.containsKey(opp.ID)) { 
	       		 	if (opp.Contact_Role_Count__c != oppToCR.get(opp.ID)) {
	       		 		opp.Contact_Role_Count__c = oppToCR.get(opp.ID);
	       		 		updated = true;
	       		 	}
       		 	}
       		 	
       		 	//Update the Opp First Demo Contact ID if it is not already filled
       		 	if (oppFirstDemoConId.containsKey(opp.id)) {
       		 		if (opp.First_Demo_Contact_Safe_Id__c == null) {
						opp.First_Demo_Contact_Safe_Id__c = oppFirstDemoConId.get(opp.id);
						updated = true;
       		 		}
				}
       		 	
       		 	if (updated) updateOpps.add(opp);	
       		 }    
    	    
    	    
    	    if (updateOpps.size() > 0) update updateOpps;
    	    
		*/    	    
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
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com', 'eddie.genao@vmturbo.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Update Contact Role Count on Opportunities: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    	
    }
    
}