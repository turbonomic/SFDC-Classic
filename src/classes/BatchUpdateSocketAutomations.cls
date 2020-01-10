global class BatchUpdateSocketAutomations implements Database.Batchable<sObject>{
	public String query;
    
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	VMTUtils.inBatch = true;
    	
    	Map<id, Opportunity> allOpps = new Map<id, Opportunity>();

    	system.debug('###Num Opps in this batch: ' + scope.size());

    	Map<id, List<Date>> saDates = new Map<id, List<Date>>();
    	
    	for(sObject s : scope){
            Opportunity opp = (Opportunity)s;
            allOpps.put(opp.id, opp);
            system.debug('###Adding Opp to allOpps Map.');
            system.debug('###Opp Name: ' + opp.Name);
            system.debug('###Opp Id: ' + opp.Id);
    	}
    	
        Map<id, Socket_Automation__c> automationDates = new Map<id, Socket_Automation__c>([select opportunity__c, date_of_automation__c from socket_automation__c where opportunity__c in :allOpps.keyset()]);
        Map<id, List<Date>> opp2Dates = new Map<id, List<Date>>();
        
        List<Opportunity> updateOpps = new List<Opportunity>();
        
        for(Socket_Automation__c sa : automationDates.values()){
        	Id currId = sa.opportunity__c;
        	Opportunity opp = allOpps.get(currId);
        	List<Date> tempList = new List<Date>();

           	
           	if(opp2Dates.get(sa.opportunity__c) != NULL){
           		tempList = opp2Dates.get(currId);
           	}
           	
           	if(opp.first_socket_automation_date__c != NULL){
           		tempList.add(opp.first_socket_automation_date__c);
           	}
           	
           	tempList.add(sa.date_of_automation__c);
           	opp2Dates.put(currId, tempList);
 
        }
        
        for(Id currId : opp2Dates.keyset()){
        	Opportunity opp = allOpps.get(currId);
        	if(opp2Dates.get(currId) != NULL){
        		List<Date> tempList = opp2Dates.get(currId);
        		tempList.sort();
        		if(opp.First_Socket_Automation_Date__c != tempList[0]){
        			opp.First_Socket_Automation_Date__c = tempList[0];
        			updateOpps.add(opp);
        		}
        	}
        }

        update updateOpps;
    	
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
	        mail.setSubject('Set First Demo Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}