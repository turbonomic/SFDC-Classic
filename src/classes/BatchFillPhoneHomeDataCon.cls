global class BatchFillPhoneHomeDataCon implements Database.Batchable<sObject>{

	public String query;
    
    //query should include all contacts where isdeleted = false, email != null
    
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	
    	Map<id,Contact> allCons = new Map<id,Contact>();
    	Map<String,id> emailtoConIdMap = new Map<String,id>();
    	
    	for(sObject s : scope){
            Contact c = (Contact)s;
            allCons.put(c.id,c);
            emailtoConIdMap.put(c.email,c.id);
    	}
    	
    	Map<id,List<id>> contoPHDsMap = new Map<id,List<id>>();
    	Map<id,PhoneHome_Data__c> phdMap = new Map<id,PhoneHome_Data__c>([select id, Licensee_Email__c, Last_Diag_Upload_Date__c, host_count__c, vm_count__c, license_type__c from PhoneHome_Data__c where licensee_email__c in: emailtoConIdMap.keySet() and Last_Diag_Upload_Date__c >= LAST_N_DAYS:180]);
    	Map<id,Turbonomic_License__c> licenseMap = new Map<id,Turbonomic_License__c>([select id, Account__c, Opportunity__c, licensee_email__c, licensee_name__c, status__c, license_end_date__c from Turbonomic_License__c where licensee_email__c in: emailtoConIdMap.keySet()]);
    	
    	
    	if (phdMap.size() > 0) {
	    	for (PhoneHome_Data__c ph : phdMap.values()){
	    		
	    		if (emailtoConIdMap.containskey(ph.licensee_email__c)) {
	    			
	    			if(contoPHDsMap.containsKey(emailtoConIdMap.get(ph.licensee_email__c))) {
	    				List<id> currPHDList = contoPHDsMap.get(emailtoConIdMap.get(ph.licensee_email__c));
	    				currPHDList.add(ph.id);
	    				contoPHDsMap.put(emailtoConIdMap.get(ph.licensee_email__c),currPHDList);
	    			} else {
	    				List<id> currPHDList = new List<id>();
	    				currPHDList.add(ph.id);
	    				contoPHDsMap.put(emailtoConIdMap.get(ph.licensee_email__c),currPHDList);
	    			}
	    			
	    		}
	    	}
	    	
	    	Map<id,Contact> conUpdate = new Map<id,Contact>();
	    	
	    	for (Id currConId : contoPHDsMap.keySet()) {
	    		
	    		Contact currCon = allCons.get(currConId);
	    		List<id> currPHDList = contoPHDsMap.get(currConId);
	    		
	    		if (!currPHDList.isEmpty()) {
	    			
	    			Date latestDate = null;
	    			
	    			for (Id currPHDId : currPHDList) {
	    				
	    				PhoneHome_Data__c ph = phdMap.get(currPHDId);
	    				
	    				if (latestDate != null) {
	    					
	    					if (latestDate < ph.Last_Diag_Upload_Date__c) {
	    						
	    						latestDate = ph.Last_Diag_Upload_Date__c;
	    						
			    				if (currCon.PhoneHome_Data_Last_Refreshed__c != null) {
									if (ph.Last_Diag_Upload_Date__c > currCon.PhoneHome_Data_Last_Refreshed__c) {
										currCon.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
										currCon.phoneHome_Number_of_Hosts__c = ph.host_count__c;
										currCon.phoneHome_Number_of_VMs__c = ph.vm_count__c;
										currCon.phoneHome_License_Type__c = ph.license_type__c;
										conUpdate.put(currCon.id,currCon);
									}
								} else {
									currCon.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
									currCon.phoneHome_Number_of_Hosts__c = ph.host_count__c;
									currCon.phoneHome_Number_of_VMs__c = ph.vm_count__c;
									currCon.phoneHome_License_Type__c = ph.license_type__c;
									conUpdate.put(currCon.id,currCon);
								}
								
	    					}
	    				
	    				} else {
	    					
	    					latestDate = ph.Last_Diag_Upload_Date__c;
	    					
	    					if (currCon.PhoneHome_Data_Last_Refreshed__c != null) {
								if (ph.Last_Diag_Upload_Date__c > currCon.PhoneHome_Data_Last_Refreshed__c) {
									currCon.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
									currCon.phoneHome_Number_of_Hosts__c = ph.host_count__c;
									currCon.phoneHome_Number_of_VMs__c = ph.vm_count__c;
									currCon.phoneHome_License_Type__c = ph.license_type__c;
									conUpdate.put(currCon.id,currCon);
								}
							} else {
								currCon.phoneHome_Data_Last_Refreshed__c = ph.Last_Diag_Upload_Date__c;
								currCon.phoneHome_Number_of_Hosts__c = ph.host_count__c;
								currCon.phoneHome_Number_of_VMs__c = ph.vm_count__c;
								currCon.phoneHome_License_Type__c = ph.license_type__c;
								conUpdate.put(currCon.id,currCon);
							}
	    				}	
	    			}	
	    		}	
	    	}
	    	if (conUpdate.size() > 0) update conUpdate.values();
	    	
    	}
    	
    	if (licenseMap.size() > 0) {
    		
    		List<Turbonomic_License__c> updateLicenses = new List<Turbonomic_License__c>();
    		
    		for (Turbonomic_License__c tl : licenseMap.values()) {
    			Boolean needsUpdate = false;
    			
    			if (date.today() > tl.license_end_date__c && tl.status__c == 'Open') {
    				tl.status__c = 'Expired';
    				needsUpdate = true;
    			}
    			
    			if (emailtoConIdMap.containsKey(tl.licensee_email__c)) {
    				
    				Contact c = allCons.get(emailtoConIdMap.get(tl.licensee_email__c));
    				
    				if (c.accountId != null) tl.account__c = c.accountId;
    				
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
	        mail.setSubject('PhoneHome/License Contacts Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
	
}