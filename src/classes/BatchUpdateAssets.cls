global class BatchUpdateAssets implements Database.Batchable<sObject>{
	
	public String query;
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
	
	global void execute(Database.BatchableContext BC, List<sObject> scope){
		
		VMTUtils.inBatch = true;
		
		//collect all Assests & initialize maps
    	Map<id, Asset> allAssets = new Map<id, Asset>();
		system.debug('###Num Assets in this batch: ' + scope.size());
		Map<id, List<Training_Services__c>> assetToTraining = new Map<id, List<Training_Services__c>>();
		Map<id, List<Training_Services__c>> assetToServices = new Map<id, List<Training_Services__c>>();
		Map<id, List<Training_Services__c>> assetToTAMs = new Map<id, List<Training_Services__c>>();
		//Map<id, List<Training_Services__c>> assetToCompletedTS = new Map<id, List<Training_Services__c>>();
		Map<id, Double> assetToCompletedHours = new Map<id, Double>();
		Map<id, Double> assetTotalHours = new Map<id, Double>();
		
		
		List<Asset> updateAssets = new List<Asset>();
		
		for(sObject s : scope){
            Asset a = (Asset)s;
           	allAssets.put(a.id, a);
		}
		
		List<Training_Services__c> allTS = [SELECT Type__c, Asset_Safe_ID__c, Status__c, Hours__c FROM Training_Services__c WHERE Asset_Safe_ID__c =: allAssets.keySet()];
		
		for (Training_Services__c ts: allTS) {
			
			//Fill Training Map (assetToTraining)
			if (ts.Type__c == 'Training') {
				if (assetToTraining.containsKey(ts.Asset_Safe_ID__c)) {
					List<Training_Services__c> tempList = assetToTraining.get(ts.Asset_Safe_ID__c);
					tempList.add(ts);
					assetToTraining.put(ts.Asset_Safe_ID__c, tempList);
				}
				else {
					List<Training_Services__c> tempList = new List<Training_Services__c>();
					tempList.add(ts);
					assetToTraining.put(ts.Asset_Safe_ID__c, tempList);
				}
				
			}
			
			//Fill Services Map (assetToServices)
			else if (ts.Type__c == 'Services') {
				if (assetToServices.containsKey(ts.Asset_Safe_ID__c)) {
					List<Training_Services__c> tempList = assetToServices.get(ts.Asset_Safe_ID__c);
					tempList.add(ts);
					assetToServices.put(ts.Asset_Safe_ID__c, tempList);
				}
				else {
					List<Training_Services__c> tempList = new List<Training_Services__c>();
					tempList.add(ts);
					assetToServices.put(ts.Asset_Safe_ID__c, tempList);
				}
				
			}
			
			//Fill TAM Map (assetToTAMs)
			else if (ts.Type__c == 'TAM') {
				if (assetToTAMs.containsKey(ts.Asset_Safe_ID__c)) {
					List<Training_Services__c> tempList = assetToTAMs.get(ts.Asset_Safe_ID__c);
					tempList.add(ts);
					assetToTAMs.put(ts.Asset_Safe_ID__c, tempList);
				}
				else {
					List<Training_Services__c> tempList = new List<Training_Services__c>();
					tempList.add(ts);
					assetToTAMs.put(ts.Asset_Safe_ID__c, tempList);
				}
				
			}
			
			//Fill Completed T&S Hours Map (assetToCompletedHours)
			if (ts.Hours__c != null) {
				if (ts.Status__c == 'Completed') {
					if (assetToCompletedHours.containsKey(ts.Asset_Safe_ID__c)) {
						Double currTotal = assetToCompletedHours.get(ts.Asset_Safe_ID__c) + ts.Hours__c;
						assetToCompletedHours.put(ts.Asset_Safe_ID__c, currTotal);
					}
					else {
						assetToCompletedHours.put(ts.Asset_Safe_ID__c, ts.Hours__c);
					}
				
				}
			
				//Fill Total T&S Hours Map (assetTotalHours)
				if (assetTotalHours.containsKey(ts.Asset_Safe_ID__c)) {
					Double currTotal = assetTotalHours.get(ts.Asset_Safe_ID__c) + ts.Hours__c;
					assetTotalHours.put(ts.Asset_Safe_ID__c, currTotal);
				}
				else {
					assetTotalHours.put(ts.Asset_Safe_ID__c, ts.Hours__c);
				}
			}
		}
		for (Asset a: allAssets.values()) {
			Boolean updated = false;
			
			//Update # of Trainings
			if (assetToTraining.containsKey(a.id)) {
				if (a.of_Trainings__c != assetToTraining.get(a.id).size()) {
					a.of_Trainings__c = assetToTraining.get(a.id).size();
					updated = true;
				}
				
			}
			
			//If no trainings, set to zero
			else {
				if (a.of_Trainings__c != 0) a.of_Trainings__c = 0;
				updated = true;
			}
			
			//Update # of Services
			if (assetToServices.containsKey(a.id)) {
				if (a.of_Services__c != assetToServices.get(a.id).size()) {
					a.of_Services__c = assetToServices.get(a.id).size();
					updated = true;
				}
				
			}
			
			//If no services, set to zero
			else {
				if (a.of_Services__c != 0) a.of_Services__c = 0;
				updated = true;
			}
			
			//Update # of TAM
			if (assetToTAMs.containsKey(a.id)) {
				if (a.of_TAMs__c != assetToTAMs.get(a.id).size()) {
					a.of_TAMs__c = assetToTAMs.get(a.id).size();
					updated = true;
				}
				
			}
			
			//If no TAM, set to zero
			else {
				if (a.of_TAMs__c != 0) a.of_TAMs__c = 0;
				updated = true;
			}
			
			//Update Total T&S Hours 
			if (assetTotalHours.containsKey(a.id)) {
				if (a.Total_T_S_Hours__c != assetTotalHours.get(a.id)) {
					a.Total_T_S_Hours__c = assetTotalHours.get(a.id);
					updated = true;
				}
				
			}
			
			//If no T&S, set to zero
			else {
				if (a.Total_T_S_Hours__c != 0) a.Total_T_S_Hours__c = 0;
				updated = true;
			}
			
			//Update Completed TS Hours 
			if (assetToCompletedHours.containsKey(a.id)) {
				if (a.Completed_T_S_Hours__c != assetToCompletedHours.get(a.id)) {
					a.Completed_T_S_Hours__c = assetToCompletedHours.get(a.id);
					updated = true;
				}
				
			}
			
			//If no completed T&S, set to zero
			else {
				if (a.Completed_T_S_Hours__c != 0) a.Completed_T_S_Hours__c = 0;
				updated = true;
			}
			
			if (updated) updateAssets.add(a);
		}
		
		if (updateAssets.size() > 0) update updateAssets;
	
	
	
	
	
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
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com', 'eddie.genao@vmturbo.com', 'nadine.tardiff@turbonomic.com', 'charmian.mcintyre@turbonomic.com', 'SFAdmin@turbonomic.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Batch Update Assests: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    	
    }
	    
}