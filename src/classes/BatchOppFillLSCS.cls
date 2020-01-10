global class BatchOppFillLSCS implements Database.batchable<sObject>{
    
    public String query;
    
    
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        
        /*VMTUtils.inBatch = true;

        //collect all Opps & initialize maps
        Map<id, Opportunity> allOpps = new Map<id, Opportunity>();
        system.debug('###Num Opps in this batch: ' + scope.size());
        Map<Id,Id> oppContacts = new Map<Id,Id>();
        List<Opportunity> updateOpps = new List<Opportunity>();
        
        for(sObject s : scope){
            Opportunity opp = (Opportunity)s;
            allOpps.put(opp.id, opp);
            system.debug('###Adding Opp to allOpps Map.');
            system.debug('###Opp Name: ' + opp.Name);
            system.debug('###Opp Id: ' + opp.Id);
        }
        
        //Grab the primary contact role from the Opportunity to add to the Opportunity to Contact Map
        List<OpportunityContactRole> pocr = [select id, OpportunityId, ContactId from OpportunityContactRole where isPrimary = true and OpportunityId in: allOpps.KeySet()];
        for (OpportunityContactRole ocr : pocr){
            oppContacts.put(ocr.OpportunityId, ocr.ContactId);
        }
        
        //Grab the First Demo task associated with each opportunity
        List<Task> tskList = [select id, whoId, whatId from Task where status = 'Completed' and type = 'Demo' and first_demo__c = true and whatId in: allOpps.keySet() all rows];
    	
    	//Loop through the first demos to map the associated contact then add to the Opportunity to Contact Map
        for (Task tsk : tskList) {
            oppContacts.put(tsk.WhatId, tsk.WhoId);
        }
        
        if (oppContacts.size() > 0) {
	        Map<Id,Contact> allCons = new Map<Id,Contact>([select id, name, leadSource from Contact where Id IN :oppContacts.values()]);
	        
	        //Grab the associated campaign member records for the contacts in the Opportunity to Contact Map
	        List<CampaignMember> allCM = [select id, CampaignId, ContactId, Created_Date_Adj__c from CampaignMember where ContactId in: allCons.keySet() order by Created_Date_Adj__c asc];
	        Map<id,List<CampaignMemberWrapper>> conCMmap = new Map<id,List<CampaignMemberWrapper>>();
	        
	        //Loop through the campaign member list to populate the contact to campaign member map
	        for (CampaignMember cm : allCM) {
	        	if (conCMmap.containsKey(cm.contactId)) {
	        		List<CampaignMemberWrapper> cmList = conCMmap.get(cm.contactId);
	        		CampaignMemberWrapper cmw = New CampaignMemberWrapper(cm);
	        		cmList.add(cmw);
	        		conCMmap.put(cm.contactId,cmList);
	        	} else {
	        		List<CampaignMemberWrapper> cmList = new List<CampaignMemberWrapper>();
	        		CampaignMemberWrapper cmw = New CampaignMemberWrapper(cm);
	        		cmList.add(cmw);
	        		conCMmap.put(cm.contactId,cmList);
	        	}
	        }
	        
	        //Grab the Prospecting campaigns and assign to appropriate variables
	        Map<Id,Campaign> camp = new Map<Id,Campaign>([select id, name from Campaign where name = 'PRO: DiscoverOrg' OR name = 'PRO: RainKing' or name = 'PRO: LinkedIn' or name = 'PRO: Prospecting' or name = 'PRO: ZoomInfo']);
	        
	        Campaign DOrg;
	        Campaign RainKing;
	        Campaign LinkedIn;
	        Campaign Prospecting;
	        Campaign ZoomInfo;
	        for (Campaign currCamp : camp.values()){
	            if(currCamp.Name == 'PRO: DiscoverOrg'){
	                DOrg = currCamp;
	            } else if (currCamp.Name == 'PRO: RainKing'){
	                RainKing = currCamp;
	            } else if (currCamp.Name == 'PRO: LinkedIn'){
	                LinkedIn = currCamp;
	            } else if (currCamp.Name == 'PRO: ZoomInfo'){
	            	ZoomInfo = currCamp;
	            } else if (currCamp.Name == 'PRO: Prospecting'){
	                Prospecting = currCamp;
	            }
	        }
	        
	        //loop through the opportunities in the batch. If primary or first demo contact has a Prospecting lead source set primary campaign source on the opportunity to the 
	        //associated prospecting campaign. Otherwise set the primary campaign source to the primary or first demo contact's first campaign.
	        for (Opportunity currOpp : allOpps.values()) {
	            
	            if (oppContacts.containsKey(currOpp.id)) {
	                
	                Contact currCon = allCons.get(oppContacts.get(currOpp.id));
  
	                if (currCon.LeadSource != null) {
	                    
	                    currOpp.LeadSource = currCon.LeadSource;
	                    
	                    if (currCon.LeadSource.containsIgnoreCase('Prospecting')) {
	                        if (currCon.LeadSource.containsIgnoreCase('DiscoverOrg')) {
	                            currOpp.CampaignId = DOrg.id;
	                        } else if (currCon.LeadSource.containsIgnoreCase('RainKing')) {
	                            currOpp.CampaignId = RainKing.id;
	                        } else if (currCon.LeadSource.containsIgnoreCase('LinkedIn')) {
	                            currOpp.CampaignId = LinkedIn.id;
	                        } else if (currCon.LeadSource.containsIgnoreCase('ZoomInfo')){
	                        	currOpp.CampaignId = ZoomInfo.id;
	                        } else {
	                            currOpp.CampaignId = Prospecting.id;
	                        }
	                    } else {
	                    	if (conCMmap.containsKey(currCon.id)) {
		                    	List<CampaignMemberWrapper> cmwList = conCMmap.get(currCon.id);
		                    	
		                    	if (cmwList.size() > 0) {
		                    		cmwList.sort();
		                    		currOpp.Campaignid = cmwList[0].cMember.CampaignId;
		                    	}
	                    	}
	                    }
	                    
	                    updateOpps.add(currOpp);
	                }
                    
                }
	            
	        }
	        
	        if (!updateOpps.isEmpty()) update updateOpps;
        }
        
        VMTUtils.inBatch = false;
        
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
        */
    }
    
    global void finish(Database.BatchableContext BC){
        /*
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
            mail.setSubject('Update LeadSource and Campaign Batch Job Results: ' + a.Status);
            mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        */
    }

}