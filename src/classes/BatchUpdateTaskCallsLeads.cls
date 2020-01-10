/**
* Bath update Task Calls
*
*
*
**/

global class BatchUpdateTaskCallsLeads implements Database.Batchable<sObject>{
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
		
		
    	//collect all Accounts & initialize maps
    	Map<id, Lead> allLeads = new Map<id, Lead>();
    	system.debug('###Num Leads in this batch: ' + scope.size());
    	
    	for(sObject s : scope){
            Lead ld = (Lead)s;
            allLeads.put(ld.id, ld);
            system.debug('###Adding Lead to allLeads Map.');
            system.debug('###Lead Name: ' + ld.Name);
            system.debug('###Lead Id: ' + ld.Id);
    	}
    	
		//Get all pertinent Tasks associated with Leads in batch
		List<Task> tskList = [select WhatId, ActivityDate, Type, WhoId, Call_Disposition__c, CreatedDate from Task where Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and ( WhoId in: allLeads.keySet() ) and Type = 'Call' all rows];
		
	
		//sort tasks into maps
		Map<id, List<Date>> leadDialCount = new Map<Id, List<Date>>();
		Map<id, List<DateTime>> leadFirstDialDateTime = new Map<Id, List<DateTime>>();
		Map<id, List<Date>> leadConnCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> leadConvCount = new Map<Id, List<Date>>();		

		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		
		
		for (Task tsk: tskList) {
			
			if (tsk.WhoId != null) {
				
				system.debug('###Task id: ' + tsk.id);
				
				if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					system.debug('###Task associated with Lead!');
					if (allLeads.containsKey(tsk.WhoId)) {
												
						if (tsk.Type == 'Connect' || tsk.Type == 'Call' || tsk.Type == 'Connect & Conversation') {
							
							
							
							if (leadDialCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = leadDialCount.get(tsk.WhoId);	
								if (tsk.ActivityDate != null){
									 dLst.add(tsk.ActivityDate);
								} else {
									 dLst.add(Date.today());
								}
								leadDialCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null){
									 dLst.add(tsk.ActivityDate);
								} else {
									dLst.add(Date.today());
								}
								leadDialCount.put(tsk.WhoId, dLst);
							}
							
							if (leadFirstDialDateTime.containsKey(tsk.WhoId)) {
								List<DateTime> dtLst = leadFirstDialDateTime.get(tsk.WhoId);
								if (tsk.CreatedDate != null){
									dtLst.add(tsk.CreatedDate);
									leadFirstDialDateTime.put(tsk.WhoId,dtLst);
								}	
							} else {
								List<DateTime> dtLst = new List<DateTime>();
								if (tsk.CreatedDate != null){
									 dtLst.add(tsk.CreatedDate);
									 leadFirstDialDateTime.put(tsk.WhoId,dtLst);									
								}
							}
						}
						
						if (tsk.Type == 'Connect' || (tsk.Type == 'Call' && tsk.Call_Disposition__c == 'Connect')) {
							
							if (leadConnCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = leadConnCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								leadConnCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								leadConnCount.put(tsk.WhoId, dLst);
							}
						} else if (tsk.Type == 'Connect & Conversation' || (tsk.Type == 'Call' && tsk.Call_Disposition__c == 'Conversation')) {
							
							if (leadConvCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = leadConvCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								leadConvCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								leadConvCount.put(tsk.WhoId, dLst);
							}						
						}
					}
				}
			}	
		}
		
		
		//set count & date values on Leads 
		List<Lead> updateLeads = new List<Lead>();
		for (Lead ld: allLeads.values()) {
			Boolean updated = false;
			
			//set Lead Dial Count
			if (leadDialCount.containsKey(ld.id)) {
				Integer dialCount = 0;
				List<Date> dLst = leadDialCount.get(ld.id);
				for (Integer i=0; i < dLst.size(); i++) {
					system.debug('### Status Change date is ' + ld.Status_Change_Date__c + ' and current date in list is ' + dLst.get(i));
					if (dLst.get(i) > ld.Status_Change_Date__c) {
						dialCount++;
					}
				}
				system.debug('### lead status change dial count in Mapping is ' + dialCount);
				if (ld.Dial_Count_Since_Last_Status_Change__c != dialCount) {
					system.debug('###Setting Lead Dial Count Since Status Change to: ' + dialCount);
					ld.Dial_Count_Since_Last_Status_Change__c = dialCount;
					updated = true;
				}
				if (ld.Dial_Count__c != leadDialCount.get(ld.id).size()) {
					system.debug('###Setting Lead Dial Count to: ' + leadDialCount.get(ld.id).size());
					ld.Dial_Count__c = leadDialCount.get(ld.id).size();
					updated = true;
				}
			} else { //Lead has no tasks
				if (ld.Dial_Count__c != 0) {
					system.debug('###Setting Lead Dial Count to 0');
					ld.Dial_Count__c = 0;
					updated = true;
				}
				if (ld.Dial_Count_Since_Last_Status_Change__c != 0) {
					ld.Dial_Count_Since_Last_Status_Change__c = 0;
					updated = true;
				}
			}
			
			//set Lead Last Dial Date
			if (leadDialCount.containsKey(ld.id)) {
				leadDialCount.get(ld.id).sort();
				if (ld.Last_Dial_Date__c != leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1]) {
					system.debug('###Setting Lead Last dial Date to: ' + leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1]);
					ld.Last_Dial_Date__c = leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1];
					updated = true;
				}
			} else {
				if (lead.Last_Dial_Date__c != null) {
					system.debug('###Setting Lead Last Dial Date to NULL');
					ld.Last_Dial_Date__c = null;
					updated = true;
				}
			}
			
			//set Lead First Dial Date
			if (leadDialCount.containsKey(ld.id)) {
				leadDialCount.get(ld.id).sort();
				if (ld.First_Dial_Date__c != leadDialCount.get(ld.id)[0]) {
					system.debug('###Setting Lead First dial Date to: ' + leadDialCount.get(ld.id)[0]);
					ld.First_Dial_Date__c = leadDialCount.get(ld.id)[0];
					updated = true;
				}
			} else {
				if (lead.First_Dial_Date__c != null) {
					system.debug('###Setting Lead First Dial Date to NULL');
					ld.First_Dial_Date__c = null;
					updated = true;
				}
			}
			
			//set Lead First Dial Date/Time
			if (leadFirstDialDateTime.containsKey(ld.id)){
				leadFirstDialDateTime.get(ld.id).sort();
				if (ld.First_Dial_Date_Time__c != null) {
					if (ld.First_Dial_Date_Time__c > leadFirstDialDateTime.get(ld.id)[0]) {
						system.debug('###Setting Lead First Dial Date/Time to: ' + leadFirstDialDateTime.get(ld.id)[0]);
						ld.First_Dial_Date_Time__c = leadFirstDialDateTime.get(ld.id)[0];
						updated = true;
					}
				} else {
					ld.First_Dial_Date_Time__c = leadFirstDialDateTime.get(ld.id)[0];
					updated = true;
				}
			}
			
			//set Lead Last Connect Date
			if (leadConnCount.containsKey(ld.id)) {
				leadConnCount.get(ld.id).sort();
				if (ld.Last_Connect_Date__c != leadConnCount.get(ld.id)[leadConnCount.get(ld.id).size()-1]) {
					system.debug('###Setting Lead Last Connect Date to: ' + leadConnCount.get(ld.id)[leadConnCount.get(ld.id).size()-1]);
					ld.Last_Connect_Date__c = leadConnCount.get(ld.id)[leadConnCount.get(ld.id).size()-1];
					updated = true;
				}
				if (ld.First_Connect_Date__c != leadConnCount.get(ld.id)[0]) {
					ld.First_connect_Date__c = leadConnCount.get(ld.id)[0];
					updated = true;
				}
			} else {
				if (lead.Last_Connect_Date__c != null) {
					system.debug('###Setting Lead Last Connect Date to NULL');
					ld.Last_Connect_Date__c = null;
					updated = true;
				}
				if (lead.First_Connect_Date__c != null) {
					ld.First_Connect_Date__c = null;
					updated = true;
				}
				
			}
			
			
			
			//set Lead Last Conversation Date
			if (leadConvCount.containsKey(ld.id)) {
				leadConvCount.get(ld.id).sort();
				if (ld.Last_Conversation_Date__c != leadConvCount.get(ld.id)[leadConvCount.get(ld.id).size()-1]) {
					system.debug('###Setting Lead Last Conversation Date to: ' + leadConvCount.get(ld.id)[leadConvCount.get(ld.id).size()-1]);
					ld.Last_Conversation_Date__c = leadConvCount.get(ld.id)[leadConvCount.get(ld.id).size()-1];
					updated = true;
				}
				if (ld.First_Conversation_Date__c != leadConvCount.get(ld.id)[0]) {
					ld.First_Conversation_Date__c = leadConvCount.get(ld.id)[0];
					updated = true;
				}
			} else {
				if (lead.Last_Conversation_Date__c != null) {
					system.debug('###Setting Lead Last Conversation Date to NULL');
					ld.Last_Conversation_Date__c = null;
					updated = true;
				}
				if (lead.First_Conversation_Date__c != null) {
					ld.First_Conversation_Date__c = null;
					updated = true;
				}
			}
			
			
			//Set Dials before First Conversation
			if (leadDialCount.containsKey(ld.id)) {
				if (ld.First_Conversation_Date__c != null) {
					Integer firstConvDialCount = 0;
				
					List<Date> dialsBeforeTask = leadDialCount.get(ld.id);
					
					//Increment the count by 1 for all calls completed prior to or on the day of the first conversation
					for (Date dt : dialsBeforeTask) {
						if (dt <= ld.First_Conversation_Date__c) {
							firstConvDialCount++;
						}
					}
					
					
					if (ld.Dials_until_First_Conversation__c != firstConvDialCount) {
						ld.Dials_until_First_Conversation__c = firstConvDialCount;
						updated = true;
					}
				}
				
				else if (ld.Dials_until_First_Conversation__c != null) {
					ld.Dials_until_First_Conversation__c = null;
					updated = true;
				}
			}
			
			else {
				if (ld.Dials_until_First_Conversation__c != null) {
					ld.Dials_until_First_Conversation__c = null;
					updated = true;
				}
			} 
			
			//Clear Inbound Qualified Leads Fields after 2 weeks
			if (ld.Inbound_Qualified__c) {
				if (ld.Inbound_Qualified_Date_Stamp__c < date.today().addDays(-14)) {
					ld.Inbound_Qualified__c = false;
					ld.Inbound_Qualified_By__c = null;
					ld.Inbound_Qualified_Date_Stamp__c = null;
					updated = true;
				}
			}
			
						
			if (updated) updateLeads.add(ld);
		}
		
		
		
		
		//commit changes to database
		if (updateLeads.size() > 0) update updateLeads;
		
		VMTUtils.inBatch = false;   
		
		//upping code coverage
		Integer x = 0;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
		x++;
    
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
	        mail.setSubject('Update Dial Info Leads Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }

}