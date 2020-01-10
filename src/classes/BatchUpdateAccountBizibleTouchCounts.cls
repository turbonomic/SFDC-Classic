global class BatchUpdateAccountBizibleTouchCounts implements Database.Batchable<sObject>{
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
            //system.debug('###Adding Acct to allAccts Map.');
            //system.debug('###Acct Name: ' + acct.Name);
            //system.debug('###Acct Id: ' + acct.Id);
    	}
    	
    	Map<id,List<DateTime>> tpLast30Days = new Map<id,List<DateTime>>();
    	Map<id,List<DateTime>> tpLast60Days = new Map<id,List<DateTime>>();
    	Map<id,List<DateTime>> tpLast90Days = new Map<id,List<DateTime>>();
    	Map<id,List<DateTime>> allAcctTouches = new Map<id,List<DateTime>>();
    	
    	Map<id, bizible2__Bizible_Touchpoint__c> touchpointMap = new Map<id,bizible2__Bizible_Touchpoint__c>([SELECT id, bizible2__Touchpoint_Date__c, Account__c FROM bizible2__Bizible_Touchpoint__c WHERE Account__c in: allAccts.values()]);
    	
    	for (bizible2__Bizible_Touchpoint__c tp: touchpointMap.values()) {
    		if (tp.bizible2__Touchpoint_Date__c != null) {
    			Date tpDate = tp.bizible2__Touchpoint_Date__c.Date();
    			
    			//Bizible touches within last 30 Days
    			if(tp.bizible2__Touchpoint_Date__c >= System.now().addDays(-30)) {
    				List<DateTime> tempList1;
    				//if List already exists for Account, grab List, else create new list and insert into map
    				if (tpLast30Days.containsKey(tp.Account__c)) tempList1 = tpLast30Days.get(tp.Account__c); 
    				else tempList1 = new List<DateTime>();
    				tempList1.add(tp.bizible2__Touchpoint_Date__c); //Add datetime to List
    				tpLast30Days.put(tp.Account__c,tempList1); //Add list into Map
    			}
    			//Bizible touches within last 60 Days
    			if(tpDate >= Date.Today().addDays(-60)) {
    				List<DateTime> tempList2;
    				//if List already exists for Account, grab List, else create new list and insert into map
    				if (tpLast60Days.containsKey(tp.Account__c)) tempList2 = tpLast60Days.get(tp.Account__c); 
    				else tempList2 = new List<DateTime>();
    				tempList2.add(tp.bizible2__Touchpoint_Date__c); //Add datetime to List
    				tpLast60Days.put(tp.Account__c,tempList2); //Add list into Map
    			}
    			//Bizible touches within last 90 Days
    			if(tpDate >= Date.Today().addDays(-90)) {
    				List<DateTime> tempList3;
    				//if List already exists for Account, grab List, else create new list and insert into map
    				if (tpLast90Days.containsKey(tp.Account__c)) tempList3 = tpLast90Days.get(tp.Account__c); 
    				else tempList3 = new List<DateTime>();
    				tempList3.add(tp.bizible2__Touchpoint_Date__c); //Add datetime to List
    				tpLast90Days.put(tp.Account__c,tempList3); //Add list into Map
    			}
    			
    			//All Bizible Touches
    			List<DateTime> tempList4;
    			//if List already exists for Account, grab List, else create new list and insert into map
    			if (allAcctTouches.containsKey(tp.Account__c)) tempList4 = allAcctTouches.get(tp.Account__c); 
    			else tempList4 = new List<DateTime>();
    			tempList4.add(tp.bizible2__Touchpoint_Date__c); //Add datetime to List
    			allAcctTouches.put(tp.Account__c,tempList4); //Add list into Map
    		}
    	}
    	
    	List<Account> updateAccts = new List<Account>();
    	
    	for (Account acct: allAccts.values()) {
    		Boolean updated = false;
    		
    		if (tpLast30Days.containsKey(acct.id)) {
   				if (acct.MQI_Last_30_Days__c != tpLast30Days.get(acct.id).size()) {
   					acct.MQI_Last_30_Days__c = tpLast30Days.get(acct.id).size();
   					updated = true;
   				}
    		} else if (acct.MQI_Last_30_Days__c != 0) {acct.MQI_Last_30_Days__c = 0; updated = true;}
    		
    		if (tpLast60Days.containsKey(acct.id)) {
   				if (acct.MQI_Last_60_Days__c != tpLast60Days.get(acct.id).size()) {
   					acct.MQI_Last_60_Days__c = tpLast60Days.get(acct.id).size();
   					updated = true;
   				}
    		} else if (acct.MQI_Last_60_Days__c != 0) {acct.MQI_Last_60_Days__c = 0; updated = true;}
    		
    		if (tpLast90Days.containsKey(acct.id)) {
   				if (acct.MQI_Last_90_Days__c != tpLast90Days.get(acct.id).size()) {
   					acct.MQI_Last_90_Days__c = tpLast90Days.get(acct.id).size();
   					updated = true;
   				}
    		} else if (acct.MQI_Last_90_Days__c != 0) {acct.MQI_Last_90_Days__c = 0; updated = true;}
    		
    		if (allAcctTouches.containsKey(acct.id)) {
    			allAcctTouches.get(acct.id).sort();
    			List<DateTime> tempList5 = allAcctTouches.get(acct.id);
   				if (acct.MQI_Total__c != tempList5.size()) {
   					acct.MQI_Total__c = tempList5.size();
   					updated = true;
   				}
   				if (tempList5.size() > 0) {
	   				DateTime lastInteraction = tempList5.get(tempList5.size()-1);
	   				if (acct.Last_Marketing_Interaction__c != lastInteraction)  {
	   					acct.Last_Marketing_Interaction__c = lastInteraction;
	   					updated = true;  
	   				}
   				}
    		} else if (acct.MQI_Total__c != 0) {acct.MQI_Total__c = 0; updated = true;}
    		
    		if (updated) updateAccts.add(acct);
    	}
    	
    	if (updateAccts.size() > 0) update updateAccts;
    	
    	
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
	        mail.setSubject('Update Demo/Eval/Email Info Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
}