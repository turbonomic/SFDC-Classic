global class BatchOpportunityMarketingAttribution implements Database.Batchable<sObject> {

	public String query;
	
	
	global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
	
	global void execute(Database.BatchableContext bc, List<sObject> scope) {
		
		VMTUtils.inBatch = true;
		
		Map<id,Opportunity> allOpps = new Map<id,Opportunity>();
		Map<id,List<Opportunity>> acctOppMap = new Map<id,List<Opportunity>>();
		DateTime earliestDate = DateTime.now();
		DateTime latestDate;
		
		system.debug('### ' + scope.size() + ' Opps in this batch');
		
		for (sObject s : scope) {
			Opportunity o = (Opportunity)s;
			allOpps.put(o.id,o);
			
			if (o.createdDate < earliestDate) {
				earliestDate = o.createdDate;
			}
			
			if (latestDate == null) {
				latestDate = o.createdDate;
			}
			else if (o.createdDate > latestDate) {
				latestDate = o.createdDate;
			}
			
			
			if (acctOppMap.containsKey(o.AccountId)) {
				List<Opportunity> associatedOpps = acctOppMap.get(o.accountId);
				associatedOpps.add(o);
				acctOppMap.put(o.accountId,associatedOpps);
			} else {
				List<Opportunity> associatedOpps = new List<Opportunity>();
				associatedOpps.add(o);
				acctOppMap.put(o.accountId,associatedOpps);
			}
			
		}

		earliestDate = earliestDate.addDays(-90);
		system.debug('### earliest date for touchpoint query: ' + earliestDate);
		
		//List<bizible2__Bizible_Touchpoint__c> allTouchPoints = [select id, Account_ID__c, bizible2__Touchpoint_Date__c from bizible2__Bizible_Touchpoint__c where Account_ID__c in: acctOppMap.keySet() and bizible2__Touchpoint_Date__c >=: earliestDate AND bizible2__Touchpoint_Date__c <=: latestDate];
		Map<id,List<bizible2__Bizible_Touchpoint__c>> attributionMap = new Map<id,List<bizible2__Bizible_Touchpoint__c>>();
		//system.debug('### touchpoint query returned ' + allTouchPoints.size() + ' results');
		
		List<Marketing_Attribution__c> insertMarketingAttributions = new List<Marketing_Attribution__c>();
		List<Opportunity> oppsToUpdate = new List<Opportunity>();
		
		//for (bizible2__Bizible_Touchpoint__c bt : allTouchPoints){
		for (bizible2__Bizible_Touchpoint__c bt : [select id, Account_ID__c, bizible2__Touchpoint_Date__c from bizible2__Bizible_Touchpoint__c where Account_ID__c in: acctOppMap.keySet() and bizible2__Touchpoint_Date__c >=: earliestDate AND bizible2__Touchpoint_Date__c <=: latestDate]){
			Id acctId = bt.Account_ID__c;
			if (acctId != null) {
				system.debug('### check');
				if (acctOppMap.containsKey(acctId)) {
					List<Opportunity> associatedOpps = acctOppMap.get(acctId);
					
					if (associatedOpps.size() > 0) {
						for (Opportunity o : associatedOpps) {
							if (bt.bizible2__Touchpoint_Date__c >= (o.createdDate.addDays(-90)) && bt.bizible2__Touchpoint_Date__c <= o.createdDate) {
								Marketing_Attribution__c newAttribution = new Marketing_Attribution__c(Bizible_Touchpoint__c = bt.id, Opportunity__c = o.id);
								insertMarketingAttributions.add(newAttribution);
								if (!o.Marketing_Attribution_Calculated__c) {
									o.Marketing_Attribution_Calculated__c = true;
									oppsToUpdate.add(o);
								}
							}
						}
					}
				}
			}
		}
		
		//Mark Opps older then 6 months as calculated to reduce clutter and processing load
		for (Opportunity o: allOpps.values()) {
			if (o.createdDate < date.today().addMonths(-6)) {
				if (!o.Marketing_Attribution_Calculated__c) {
					o.Marketing_Attribution_Calculated__c = true;
					oppsToUpdate.add(o);
				}
			}
			
		}
		
		if (insertMarketingAttributions.size() > 0) insert insertMarketingAttributions;
		if (oppsToUpdate.size() > 0) update oppsToUpdate;
		
		VMTUtils.inBatch = false;
	}
	
	global void finish(Database.BatchableContext BC) {
		AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
		if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email, 'eddie.genao@turbonomic.com', 'nadine.tardiff@turbonomic.com', 'charmian.mcintyre@turbonomic.com', 'SFAdmin@turbonomic.com'};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Bizible Marketing Attribution batch: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		}
	}

}