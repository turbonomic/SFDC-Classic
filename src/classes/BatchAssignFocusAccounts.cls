global class BatchAssignFocusAccounts implements Database.Batchable<sObject> {
  
  public String query;
  
  global database.querylocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator(query);
  }
  
  global void execute(Database.BatchableContext BC,List<sObject> scope) {
/*    
    VMTutils.inBatch = true;
    
    Map<Id,User> territoryOwners = new Map<Id,User>();
    Map<Id,String> territoryNames = new Map<Id,String>();
    List<Account> updateAccounts = new List<Account>();
   	Map<String,List<AccountWrapper>> acctLists = new Map<String,List<AccountWrapper>>();
    
    
    for (sObject s: scope) {
      User u = (User)s;
      territoryOwners.put(u.id,u);
      territoryNames.put(u.id,u.name);
      system.debug('@@@ user is ' + u.name);
    }
    
    for (String username : territoryNames.Values()){
    	List<AccountWrapper> acctList = new List<AccountWrapper>();
    	acctLists.put(username,acctList);
    }
    
    
	Map<Id,Account> allAccts = new Map<Id,Account>([select id, name, Territory_Owner_Display__c, VMT_Account_Score__c, Focus_Account__c, Focus_Account_Date_Stamp__c from Account
					where (Territory_Owner_Display__c IN :territoryNames.values() and Include_In_Focus_Accounts__c = true and Remove_From_Focus_Accounts__c = false
					and (Status__c != 'Identify Opportunity' and Status__c != 'Active Opportunity' and Status__c != 'Customer (Active)' and Status__c != 'Customer With Upsell Opp' 
					and Status__c != 'Customer (Churned)' and Status__c != 'Revisit Account' and Status__c != 'Outsourced Account' and Status__c != 'Account Unqualified' and Status__c != 'Defunct Account')) 
					order by VMT_Account_Score__c desc limit 5000]);
	
	for (Account currAcct : allAccts.values()){
		
		List<AccountWrapper> currList = acctLists.get(currAcct.Territory_Owner_Display__c);
		
		AccountWrapper aw = new AccountWrapper(currAcct);
		currList.add(aw);
		
		acctLists.put(currAcct.Territory_Owner_Display__c,currList);
		
	}
	
	for (String currUsername : acctLists.keySet()){
		
		List<AccountWrapper> currAcctList = acctLists.get(currUsername);
		
		currAcctList.sort();
		
		for(integer i=0; i<currAcctList.size(); i++) {
			Account currAcct = currAcctList.get(i).acct;
			
			if ( i < 15 ) {
				if (!currAcct.Focus_Account__c){
					currAcct.Focus_Account__c = true;
					currAcct.Focus_Account_Date_Stamp__c = date.today();
					updateAccounts.add(currAcct);
				}
			} else {
				if (currAcct.Focus_Account__c){
					currAcct.Focus_Account__c = false;
					updateAccounts.add(currAcct);
				}
			}
			
			system.debug('### i is ' + i + '. account name is ' + currAcct.name + ' and focus account = ' + currAcct.Focus_Account__c + ' and vmt account score is ' + currAcct.VMT_Account_Score__c);
			
			
		}
		
	}
	
	

    
    
/**    
    for (User currUser : territoryOwners) {
      // grab top 15 VMT Account score accounts for the current Territory Owner
/*
      Integer numFocusAccts = [select count() from Account where Territory_Owner_Display__c = :currUser.Name and Focus_Account__c = true and status_change_date__c = null 
      				and (status__c =: 'No Traction' or status__c =: 'Dial in Last 45 Days' or status__c =: 'Connect in Last 45 Days' 
                    or status__c =: 'Conversation in Last 45 Days' or status__c =: 'Needs Sourcing' or status__c =: 'Opportunity Unqualified' or status__c =: 'Opportunity Lost')];
      system.debug('### Query got ' + numFocusAccts + ' accounts');
      if (numFocusAccts < 15){
      	Integer numAcctsNeeded = 15 - numFocusAccts;
      	List<Account> topAccts = [select id, name, Focus_Account_Date_Stamp__c, status_change_date__c, Focus_Account__c from Account
                    where (Territory_Owner_Display__c =: currUser.Name and status_change_date__c =: null and (Focus_Account__c =: False or Focus_Account__c =: null) and Include_in_Focus_Accounts__c = true  
                    and (status__c =: 'No Traction' or status__c =: 'Dial in Last 45 Days' or status__c =: 'Connect in Last 45 Days' 
                    or status__c =: 'Conversation in Last 45 Days' or status__c =: 'Needs Sourcing' or status__c =: 'Opportunity Unqualified' or status__c =: 'Opportunity Lost')) 
                    order by VMT_Account_Score__c desc nulls last limit :numAcctsNeeded];
      	system.debug('### topAccts size is ' + topAccts.size());
*/

/**		
		Map<Id,Account> topAccts = new Map<Id,Account>([select id, name, Focus_Account_Date_Stamp__c, Status_Change_Date__c, Focus_Account__c from Account
					where (Territory_Owner_Display__c =: currUser.Name and status_change_date__c =: null and Include_In_Focus_Accounts__c = true and Remove_from_Focus_Accounts__c = false
					and (Status__c =: 'No Traction' or Status__c =: 'Dial in Last 45 Days' or Status__c =: 'Connect in Last 45 Days' or Status__c =: 'Conversation in Last 45 Days'
					or Status__c =: 'Needs Sourcing' or Status__c =: 'Opportunity Unqualified' or Status__c =: 'Opportunity Lost'))
					order by VMT_Account_Score__c desc nulls last limit 15]);

      	
      	// cycle through the top 15              
      	for (Account currAcct : topAccts.values()) {
      	  // flag the account as a focus account if they are not a focus account yet
      	  system.debug('### ' + currAcct.name + ' is now a focus account');
      	  currAcct.Focus_Account__c = true;
      	  currAcct.Focus_Account_Date_Stamp__c = Date.today();
      	  
      	  updateAccounts.add(currAcct);
      	}
      	
      	// remove dispositioned focus accounts
      	Map<Id,Account> removeFromList = new Map<Id,Account>([select id, name, Focus_Account_Date_Stamp__c, Status_Change_Date__c, Focus_Account__c from Account
      				where (Territory_Owner_Display__c =: currUser.Name and  (NOT(ID IN :topAccts.keySet())) and (Remove_From_Focus_Accounts__c = true 
      				or Status__c =: 'Defunct Account' or Status__c =: 'Outsourced Account' or Status__c =: 'Language Barrier' or Status__c =: 'Account Unqualified' or Status__c =: 'No Traction'
      				or Status__c =: 'Dial in Last 45 Days' or Status__c =: 'Connect in Last 45 Days' or Status__c =: 'Conversation in Last 45 Days' or Status__c =: 'Needs Sourcing'
      				or Status__c =: 'Opportunity Unqualified' or Status__c =: 'Oppportunity Lost')) ]);
      				
      	for (Account currAcct : removeFromList.values()) {
      		system.debug('### removing ' + currAcct.name + ' from focus accounts');
      		currAcct.Focus_Account__c = false;
      		updateAccounts.add(currAcct);
      	}
    }
    
    if (updateAccounts.size() > 0) update updateAccounts;
    
    VMTutils.inBatch = false;
*/    
  }
  
  global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job  
        // from Database.BatchableContext.  
        // Query the AsyncApexJob object to retrieve the current job's information.  
/*    
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com'};
          mail.setToAddresses(toAddresses);
          mail.setSubject('Batch Update Focus Accounts: ' + a.Status);
          mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
          Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
*/        
    }
}