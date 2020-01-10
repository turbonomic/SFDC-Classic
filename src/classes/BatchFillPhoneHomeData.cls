global class BatchFillPhoneHomeData implements Database.Batchable<sObject>{

	public String query;
    
    //query should include all leads where isconverted = false, isdeleted = false, email != null
    
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	
    	Map<id,Lead> allLeads = new Map<id,Lead>();
    	Map<String,id> emailtoLeadIdMap = new Map<String,id>();
    	
    	for(sObject s : scope){
            Lead l = (Lead)s;
            allLeads.put(l.id,l);
            emailtoLeadIdMap.put(l.email,l.id);
    	}
    	
    	Map<id,List<id>> leadtoPHDsMap = new Map<id,List<id>>();
    	Map<id,PhoneHome_Data__c> phdMap = new Map<id,PhoneHome_Data__c>([select id, Licensee_Email__c, Last_Diag_Upload_Date__c, host_count__c, vm_count__c, license_type__c from PhoneHome_Data__c where licensee_email__c in: emailtoLeadIdMap.keySet() and Last_Diag_Upload_Date__c >= LAST_N_DAYS:180]);
    	Map<id,Turbonomic_License__c> licenseMap = new Map<id,Turbonomic_License__c>([select id, account__c, licensee_email__c, licensee_name__c, Opportunity__c, status__c, license_end_date__c, Lead__c from Turbonomic_License__c where licensee_email__c in: emailtoLeadIdMap.keySet()]);
    	
    	//process through PhoneHome data
    	if (phdMap.size() > 0) {
	    	for (PhoneHome_Data__c ph : phdMap.values()){
	    		
	    		if (emailtoLeadIdMap.containskey(ph.licensee_email__c)) {
	    			
	    			if(leadtoPHDsMap.containsKey(emailtoLeadIdMap.get(ph.licensee_email__c))) {
	    				List<id> currPHDList = leadtoPHDsMap.get(emailtoLeadIdMap.get(ph.licensee_email__c));
	    				currPHDList.add(ph.id);
	    				leadtoPHDsMap.put(emailtoLeadIdMap.get(ph.licensee_email__c),currPHDList);
	    			} else {
	    				List<id> currPHDList = new List<id>();
	    				currPHDList.add(ph.id);
	    				leadtoPHDsMap.put(emailtoLeadIdMap.get(ph.licensee_email__c),currPHDList);
	    			}
	    			
	    		}
	    	}
	    	
	    	Map<id,Lead> leadUpdate = new Map<id,Lead>();
	    	
	    	for (Id currLeadId : leadtoPHDsMap.keySet()) {
	    		
	    		Lead currLead = allLeads.get(currLeadId);
	    		List<id> currPHDList = leadtoPHDsMap.get(currLeadId);
	    		
	    		if (!currPHDList.isEmpty()) {
	    			
	    			Date latestDate = null;
	    			
	    			for (Id currPHDId : currPHDList) {
	    				
	    				PhoneHome_Data__c ph = phdMap.get(currPHDId);
	    				
	    				if (latestDate != null) {
	    					
	    					if (latestDate < ph.Last_Diag_Upload_Date__c) {
	    						
	    						latestDate = ph.Last_Diag_Upload_Date__c;
	    						
			    				if (currLead.PhoneHome_Data_Last_Refreshed__c != null) {
									if (ph.Last_Diag_Upload_Date__c > currLead.PhoneHome_Data_Last_Refreshed__c) {
										currLead.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
										currLead.phoneHome_Number_of_Hosts__c = ph.host_count__c;
										currLead.phoneHome_Number_of_VMs__c = ph.vm_count__c;
										currLead.phoneHome_License_Type__c = ph.license_type__c;
										leadUpdate.put(currLead.id,currLead);
									}
								} else {
									currLead.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
									currLead.phoneHome_Number_of_Hosts__c = ph.host_count__c;
									currLead.phoneHome_Number_of_VMs__c = ph.vm_count__c;
									currLead.phoneHome_License_Type__c = ph.license_type__c;
									leadUpdate.put(currLead.id,currLead);
								}
								
	    					}
	    				
	    				} else {
	    					
	    					latestDate = ph.Last_Diag_Upload_Date__c;
	    					
	    					if (currLead.PhoneHome_Data_Last_Refreshed__c != null) {
								if (ph.Last_Diag_Upload_Date__c > currLead.PhoneHome_Data_Last_Refreshed__c) {
									currLead.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
									currLead.phoneHome_Number_of_Hosts__c = ph.host_count__c;
									currLead.phoneHome_Number_of_VMs__c = ph.vm_count__c;
									currLead.phoneHome_License_Type__c = ph.license_type__c;
									leadUpdate.put(currLead.id,currLead);
								}
							} else {
								currLead.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
								currLead.phoneHome_Number_of_Hosts__c = ph.host_count__c;
								currLead.phoneHome_Number_of_VMs__c = ph.vm_count__c;
								currLead.phoneHome_License_Type__c = ph.license_type__c;
								leadUpdate.put(currLead.id,currLead);
							}
	    				}	
	    			}	
	    		}		
	    	}
	    	
	    	if (leadUpdate.size() > 0) update leadUpdate.values();
    	}
    	
    	// try to attach all unattached licenses
    	if (licenseMap.size() > 0) {
    		
    		List<Turbonomic_License__c> updateLicenses = new List<Turbonomic_License__c>();
    		
    		for (Turbonomic_License__c tl : licenseMap.values()) {
    			Boolean needsUpdate = false;
    			
    			if (emailtoLeadIdMap.containsKey(tl.licensee_email__c)) {
    				Lead l = allLeads.get(emailtoLeadIdMap.get(tl.licensee_email__c));
    				
    				if (l.account__c != null && tl.account__c == null) {
    					tl.account__c = l.account__c;
    					needsUpdate = true;
    				}
    				
    				if (tl.Lead__c == null)	{ 
    					tl.Lead__c = l.id;
    					needsUpdate = true;
    				}
    			}
    			
    			if (date.today() > tl.license_end_date__c && tl.status__c == 'Open') {
    				tl.status__c = 'Expired';
    				needsUpdate = true;
    			}
    			
    			if (needsUpdate) updateLicenses.add(tl);
    			
    		}
    		
    		if (updateLicenses.size() > 0) update updateLicenses;
    		
    	}
    	

    	VMTUtils.inBatch = false;
    	
    }
    
    global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job  
        // from Database.BatchableContext.  
        // Query the AsyncApexJob object to retrieve the current job's information.  
    
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0) {
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('PhoneHome/Turbonomic License Leads Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }


}