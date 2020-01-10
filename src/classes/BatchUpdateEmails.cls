global class BatchUpdateEmails implements Database.Batchable<sObject>{
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
/*    	
    	VMTUtils.inBatch = true;
    	
    	//collect all Accounts & initialize maps
    	Map<id, Account> allAccts = new Map<id, Account>();
    	system.debug('###Num Accts in this batch: ' + scope.size());
    	
    	for(sObject s : scope){
            Account acct = (Account)s;
            allAccts.put(acct.id, acct);
            system.debug('###Adding Acct to allAccts Map.');
            system.debug('###Acct Name: ' + acct.Name);
            system.debug('###Acct Id: ' + acct.Id);
    	}
    	
    	//Get all Contacts associated with Accounts
        Map<id, Contact> allContacts = new Map<id, Contact>([select id, AccountId, Last_Email_Date__c from Contact where AccountId =: allAccts.keySet()]);  
		
		//Get all Leads associated with all Accounts
        Map<id, Lead> allLeads = new Map<id, Lead>([select id, Account__c, Last_Email_Date__c from Lead where IsConverted = false and Account__c =: allAccts.keySet()]);
		
		//Get all pertinent Tasks associated with Accounts in batch
		List<Task> tskList = [select WhatId, ActivityDate, Type, AccountId, WhoId from Task where Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and (WhoId in: allContacts.keySet() or WhoId in: allLeads.keySet() or WhatId in: allAccts.keySet()) and Type = 'Email' all rows];
		
    	
    	
    	Map<id, List<Date>> conEmailCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> leadEmailCount = new Map<Id, List<Date>>();
		Map<Id, List<Date>> acctEmailCount = new Map<Id, List<Date>>();
    	
    	String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();

		
		for (Task tsk: tskList) {
			
			if (tsk.WhoId != null) {
				
				system.debug('###Task id: ' + tsk.id);
				
				if(((String)tsk.WhoId).startsWith(conPrefix)){ 
					system.debug('###Task associated with Contact!');
					if (allContacts.containsKey(tsk.WhoId)) {
						
						if (tsk.Type == 'Email') {

							if (conEmailCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = conEmailCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								conEmailCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								conEmailCount.put(tsk.WhoId, dLst);
							}
							if (acctEmailCount.containsKey(allContacts.get(tsk.WhoId).AccountId)) {
								List<Date> dLst = acctEmailCount.get(allContacts.get(tsk.WhoId).AccountId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctEmailCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								acctEmailCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							}							
						}
					}
					
				} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
					system.debug('###Task associated with Lead!');
					if (allLeads.containsKey(tsk.WhoId)) {
						
						if (tsk.Type == 'Email') {
							if (leadEmailCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = leadEmailCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								leadEmailCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								leadEmailCount.put(tsk.WhoId, dLst);
							}
							if (acctEmailCount.containsKey(allLeads.get(tsk.WhoId).Account__c)) {
								List<Date> dLst = acctEmailCount.get(allLeads.get(tsk.WhoId).Account__c);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctEmailCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								acctEmailCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							}							
						}					
					}
				}
			}
		}
		
		List<Contact> updateContacts = new List<Contact>();
		for (Contact con: allContacts.values()) {
			Boolean updated = false;
			
			//set Contact Last Email Date
			if (conEmailCount.containsKey(con.id)) {
				conEmailCount.get(con.id).sort();
				if (con.Last_Email_Date__c != conEmailCount.get(con.id)[conEmailCount.get(con.id).size()-1]) {
					system.debug('###Setting Contact Last Email Date to: ' + conEmailCount.get(con.id)[conEmailCount.get(con.id).size()-1]);
					con.Last_Email_Date__c = conEmailCount.get(con.id)[conEmailCount.get(con.id).size()-1];
					updated = true;
				}
			} else {
				if (con.Last_Email_Date__c != null) {
					system.debug('###Setting Contact Last Email Date to NULL');
					con.Last_Email_Date__c = null;
					updated = true;
				}
			}
			
			if (updated) updateContacts.add(con);		
		}
		
		List<Lead> updateLeads = new List<Lead>();
		for (Lead ld: allLeads.values()) {
			Boolean updated = false;
			
			//set Lead Last Email Date
			if (leadEmailCount.containsKey(ld.id)) {
				leadEmailCount.get(ld.id).sort();
				if (ld.Last_Email_Date__c != leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1]) {
					system.debug('###Setting Lead Last Email Date to: ' + leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1]);
					ld.Last_Email_Date__c = leadEmailCount.get(ld.id)[leadEmailCount.get(ld.id).size()-1];
					updated = true;
				}
			} else {
				if (ld.Last_Email_Date__c != null) {
					system.debug('###Setting Lead Last Email Date to NULL');
					ld.Last_Email_Date__c = null;
					updated = true;
				}
			}
	
			if (updated) updateLeads.add(ld);
		}
    	
    	List<Account> updateAccts = new List<Account>();
		for (Account acct: allAccts.values()) {
			Boolean updated = false;
			
			//set Acct Email Count
			if (acctEmailCount.containsKey(acct.id)) {
				if (acct.Email_Count__c != acctEmailCount.get(acct.id).size()) {
					system.debug('###Setting Acct Email Count to: ' + acctEmailCount.get(acct.id).size());
					acct.Email_Count__c = acctEmailCount.get(acct.id).size();
					updated = true;
				}
			} else { //acct has no tasks
				if (acct.Email_Count__c != 0) {
					system.debug('###Setting Acct Email Count to 0.');
					acct.Email_Count__c = 0;
					updated = true;
				}
			}
			
			//set Acct Last Email Date
			if (acctEmailCount.containsKey(acct.id)) {
				acctEmailCount.get(acct.id).sort();
				if (acct.Last_Email_Date__c != acctEmailCount.get(acct.id)[acctEmailCount.get(acct.id).size()-1]) {
					system.debug('###Setting Account Last Email Date to: ' + acctEmailCount.get(acct.id)[acctEmailCount.get(acct.id).size()-1]);
					acct.Last_Email_Date__c = acctEmailCount.get(acct.id)[acctEmailCount.get(acct.id).size()-1];
					updated = true;
				}
			} else {
				if (acct.Last_Email_Date__c != null) {
					system.debug('###Setting Account Latest Email Date to NULL');
					acct.Last_Email_Date__c = null;
					updated = true;
				}
			}
			
			//calculate Emails in Last 30/60/90 Days
			if (acctEmailCount.containsKey(acct.id)) {
				integer count30 = 0;
				integer count60 = 0;
				integer count90 = 0;
				for (Date dt : acctEmailCount.get(acct.id)) {
					if (dt >= Date.today().addDays(-30)) {
						count30++;
					}
					if (dt >= Date.today().addDays(-60)) {
						count60++;
					}
					if (dt >= Date.today().addDays(-90)) {
						count90++;
					}
				}
				if (acct.Emails_in_Last_30_Days__c != count30) {
					acct.Emails_in_Last_30_Days__c = count30;
					updated = true;
				}
				if (acct.Emails_in_Last_60_Days__c != count60) {
					acct.Emails_in_Last_60_Days__c = count60;
					updated = true;
				}
				if (acct.Emails_in_Last_90_Days__c != count90) {
					acct.Emails_in_Last_90_Days__c = count90;
					updated = true;
				}
			} else { //no emails
				if (acct.Emails_in_Last_30_Days__c != 0) {
					acct.Emails_in_Last_30_Days__c = 0;
					updated = true;
				}
				if (acct.Emails_in_Last_60_Days__c != 0) {
					acct.Emails_in_Last_60_Days__c = 0;
					updated = true;
				}
				if (acct.Emails_in_Last_90_Days__c != 0) {
					acct.Emails_in_Last_90_Days__c = 0;
					updated = true;
				}
			}
			
			if (updated) updateAccts.add(acct);
		}
		
		//commit changes to database
		if (updateContacts.size() > 0) update updateContacts;
		if (updateLeads.size() > 0) update updateLeads;
		if (updateAccts.size() > 0) update updateAccts; 
    	
    	
    	VMTUtils.inBatch = false;
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
	        String[] toAddresses = new String[] {a.CreatedBy.Email};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('Update Email Info Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
    
    
}