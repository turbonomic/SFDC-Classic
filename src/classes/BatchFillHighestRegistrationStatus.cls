global class BatchFillHighestRegistrationStatus implements Database.Batchable<sObject>{
	
	public String query;
	
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	

    	VMTUtils.inBatch = true;

    	//collect all Opps & initialize maps
//    	List<Account> updateAccounts = new List<Account>();
    	Map<id, Opportunity> allOpps = new Map<id, Opportunity>();
    	Map<Id,List<Id>> oppToReg = new Map<Id,List<Id>>(); 
    	Map<id, Integer> oppToCR = new Map<id, Integer>();
    	system.debug('###Num Opps in this batch: ' + scope.size());
//   	    List<Recruiting_Candidate__c> updateRecruits = new List<Recruiting_Candidate__c>();

    	List<Opportunity> updateOpps = new List<Opportunity>();
    	
    	for(sObject s : scope){
            Opportunity opp = (Opportunity)s;
            allOpps.put(opp.id, opp);
            oppToCR.put(opp.id,0);
            system.debug('###Adding Opp to allOpps Map.');
            system.debug('###Opp Name: ' + opp.Name);
            system.debug('###Opp Id: ' + opp.Id);
    	}
    	
    	
    	Map<Id,VartopiaDRS__Registration__c> allRegs = new Map<Id,VartopiaDRS__Registration__c>([select id, VartopiaDRS__Vendor_Status__c, VartopiaDRS__Opportunity__c, Partner_Manager__c from VartopiaDRS__Registration__c where VartopiaDRS__Opportunity__c in :allOpps.keyset()]);
    	system.debug('*** ' + allRegs.size() + ' ***');
    	
    	//Get all pertinent demos associated with Opps in Batch
    	List<Task> allDemos = [SELECT id, WhatId, WhoId, Type, AccountId, First_Demo__c, CreatedDate, ActivityDate,First_Demo_Scheduled__c FROM Task WHERE Type = 'Demo' and WhatId =: allOpps.keyset()];
    		
    	//All opportunity contact roles
    	List<OpportunityContactRole> allOppCR = new List<OpportunityContactRole>([SELECT id, OpportunityId, IsDeleted FROM OpportunityContactRole WHERE OpportunityId =: allOpps.keyset() AND IsDeleted = false]);
    		
    	
    	//update total contact role count for each opportunity
       	for (OpportunityContactRole oppCR : allOppCR) {
        	oppToCR.put(oppCR.OpportunityId, oppToCR.get(oppCR.OpportunityId)+1);
       	}
       	
   	 	Map<id, id> oppFirstDemoConID = new Map<Id, Id>();
		
		for (Task tsk: allDemos) {
			if (tsk.First_Demo_Scheduled__c) {
		 		if (!oppFirstDemoConId.containsKey(tsk.whatId)) {
					oppFirstDemoConId.put(tsk.WhatId,tsk.WhoId);
				}
			}
		}
    	
    	for (Opportunity opp : allOpps.values()){
    		
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
    		
    		
			for (VartopiaDRS__Registration__c vrc : allRegs.values()) {
				
				if (vrc.VartopiaDRS__Opportunity__c == opp.id) {
				
					system.debug('*** matched registration to opportunity ***');
					
					if (opp.highest_vendor_status__c != null) {
						if (opp.highest_vendor_status__c == 'Closed-Won'){
							updated = true;
							break;
						} else if (opp.highest_vendor_status__c == 'Approved'){
							if (vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Won'){
								opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
								updated = true;
							}
						} else if (opp.highest_vendor_status__c == 'Closed-Lost'){
							if (vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Won' || vrc.VartopiaDRS__Vendor_Status__c == 'Approved'){
								opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
								updated = true;
							}
						} else if (opp.highest_vendor_status__c == 'Expired' || opp.highest_vendor_status__c == 'Closed-Expired'){
							if (vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Won' || vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Lost' || vrc.VartopiaDRS__Vendor_status__c == 'Approved'){
								opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
								updated = true;
							}
						} else if (opp.highest_vendor_status__c == 'Submitted'){
							if (vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Won' || vrc.VartopiaDRS__Vendor_Status__c == 'Closed-Lost' || vrc.VartopiaDRS__Vendor_status__c == 'Approved' || vrc.VartopiaDRS__Vendor_status__c == 'Expired'){
								opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
								updated = true;
							}
						} else {
							opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
							updated = true;
						}

					} else {
						opp.highest_vendor_status__c = vrc.VartopiaDRS__Vendor_Status__c;
						updated = true;
					}	
				}
			}
			if(updated) updateOpps.add(opp);
    	}
		if (updateOpps.size() > 0) update updateOpps;
    	
    	//code to update Recruiting Candidates to Non-Responsive if they haven't been updated in 30+ days
/*
    	List<Recruiting_Candidate__c> rcs = [select id, Last_Modified_Date_adj__c, Status__c, Anticipated_Start__c from Recruiting_Candidate__c where Status__c like '1%' or Status__c like '2%' or Status__c like '3%' or Status__c like '4%' or Status__c like '5%' ];
    
    	for (Recruiting_Candidate__c currCandidate : rcs) {
    		if ((currCandidate.Last_Modified_Date_adj__c.date()).daysBetween(Date.today()) > 30 && (currCandidate.Anticipated_Start__c == null || currCandidate.Anticipated_Start__c == '')) {
    			currCandidate.Status__c = 'Non-Responsive';
    			updateRecruits.add(currCandidate);
    		}
    	}
    
    if (updateRecruits.size() > 0) update updateRecruits;
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
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com', 'nadine.tardiff@turbonomic.com', 'charmian.mcintyre@turbonomic.com', 'SFAdmin@turbonomic.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Update Registration Status and Opp Contact Roles on Opps batch: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
}