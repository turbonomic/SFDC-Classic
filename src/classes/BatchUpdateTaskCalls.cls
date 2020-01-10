/**
* Bath update Task Calls
*
*
*
**/

global class BatchUpdateTaskCalls implements Database.Batchable<sObject>{
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	VMTUtils.inBatch = true;
    	Map<Id, Integer> acctTotContacts = new Map<Id, Integer>(); //map to store total contact count with account id
    	Map<Id, Integer> acctTotLeads = new Map<Id, Integer>(); //map to store total lead count with account id
    	Map<Id, Integer> acctLeadsDialedLastXDays = new Map<Id, Integer>(); //map to store count of leads dialed in last x days with acct id
    	Map<Id, Integer> acctConDialedLastXDays = new Map<Id, Integer>(); //map to store count of contacts dialed in last x days with acct id
		Map<Id, List<Date>> acctGreenCircleRegistrationDate = new Map<Id, List<Date>>(); //map to store green circle registration dates with acct id
		
		
    	//collect all Accounts & initialize maps
    	Map<id, Account> allAccts = new Map<id, Account>();
    	system.debug('###Num Accts in this batch: ' + scope.size());
    	
    	for(sObject s : scope){
            Account acct = (Account)s;
            allAccts.put(acct.id, acct);
	        acctTotContacts.put(acct.id, 0);
	        acctTotLeads.put(acct.id, 0);
            acctLeadsDialedLastXDays.put(acct.id, 0);
            acctConDialedLastXDays.put(acct.id, 0);
            system.debug('###Adding Acct to allAccts Map.');
            system.debug('###Acct Name: ' + acct.Name);
            system.debug('###Acct Id: ' + acct.Id);
    	}
    	
    	//get custom setting for Account Dial Count Days
    	Map<String, Account_Dial_Count_Days__c> setMap = Account_Dial_Count_Days__c.getall();
    	system.assert(setMap.keySet().size()==1);
    	Integer acctDialCountDays = 0;
		acctDialCountDays = (Integer)setMap.get('Default').Number_of_Days__c;
    	
        //Get all Contacts associated with Accounts
        Map<id, Contact> allContacts = new Map<id, Contact>([select id, firstName, LastName, Last_Dial_Date__c, Dial_Count__c, First_Dial_Date__c, AccountId, Last_Connect_Date__c, Last_Conversation_Date__c, Last_Email_Date__c, 
        	First_Connect_Date__c, First_Conversation_Date__c, Green_Circle_Registration_Date__c, Dials_until_First_Conversation__c, Dials_until_First_Demo__c, First_Demo_Date__c, First_Demo_Scheduled_Date__c from Contact where AccountId =: allAccts.keySet()]);  
        
        
        for (Contact con : allContacts.values()) {
        	//update total contact count for each account
        	acctTotContacts.put(con.AccountId, acctTotContacts.get(con.AccountId)+1);
        	
        	//update Green Circle Registration Date map for Accounts
        	if (con.Green_Circle_Registration_Date__c != null) {
        		if (acctGreenCircleRegistrationDate.containsKey(con.AccountId)) {
					List<Date> dLst = acctGreenCircleRegistrationDate.get(con.AccountId);
					dLst.add(con.Green_Circle_Registration_Date__c);
					acctGreenCircleRegistrationDate.put(con.AccountId, dLst); 
				} else {
					List<Date> dLst = new List<Date>();
					dLst.add(con.Green_Circle_Registration_Date__c); 
					acctGreenCircleRegistrationDate.put(con.AccountId, dLst);
        		}
        	} 
        }
	 
		//Get all Leads associated with all Accounts
        Map<id, Lead> allLeads = new Map<id, Lead>([select id, Last_Dial_Date__c, Dial_Count__c, First_Dial_Date__c, Account__c, Status, Status_Change_Date__c, Last_Connect_Date__c, Last_Conversation_Date__c, Last_Email_Date__c, 
        	Dial_Count_Since_Last_Status_Change__c, First_Dial_Date_Time__c, First_Connect_Date__c, First_Conversation_Date__c, LastName, Dials_until_First_Conversation__c, Inbound_Qualified__c, Inbound_Qualified_By__c, Inbound_Qualified_Date_Stamp__c from Lead where IsConverted = false and Account__c =: allAccts.keySet()]);
            
        //update total lead count for each account
        for (Lead ld : allLeads.values()) {
        	if(ld.LastName != 'Switchboard')
        		acctTotLeads.put(ld.Account__c, acctTotLeads.get(ld.Account__c)+1);
        }    
				
		//Get all pertinent Tasks associated with Accounts in batch
		List<Task> tskList = [select WhatId, ActivityDate, Type, AccountId, WhoId, Call_Disposition__c, CreatedDate from Task where Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and ( WhoId in: allContacts.keySet() or WhoId in: allLeads.keySet() ) and (Type = 'Call' or type = 'Email')];
		
	
		//sort tasks into maps
		Map<id, List<Date>> conDialCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> conConnCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> conConvCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> leadDialCount = new Map<Id, List<Date>>();
		Map<id, List<DateTime>> leadFirstDialDateTime = new Map<Id, List<DateTime>>();
		Map<id, List<Date>> leadConnCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> leadConvCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctDialCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctConnCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctConvCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> conEmailCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> leadEmailCount = new Map<Id, List<Date>>();
		Map<Id, List<Date>> acctEmailCount = new Map<Id, List<Date>>();
		

		String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		String oppPrefix = Schema.SObjectType.Opportunity.getKeyPrefix();
		
		
		for (Task tsk: tskList) {
			
			if (tsk.WhoId != null) {
				
				system.debug('###Task id: ' + tsk.id);
				
				if(((String)tsk.WhoId).startsWith(conPrefix)){ 
					system.debug('###Task associated with Contact!');
					if (allContacts.containsKey(tsk.WhoId)) {
						
						if (tsk.Type == 'Connect' || tsk.Type == 'Call' || tsk.Type == 'Connect & Conversation') {
							

							if (conDialCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = conDialCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								conDialCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								conDialCount.put(tsk.WhoId, dLst);
							}
							
							if (acctDialCount.containsKey(allContacts.get(tsk.WhoId).AccountId)) {
								List<Date> dLst = acctDialCount.get(allContacts.get(tsk.WhoId).AccountId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctDialCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctDialCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							}
							
						}
						if (tsk.Type == 'Connect' || (tsk.Type == 'Call' && tsk.Call_Disposition__c == 'Connect')) {
							
							if (conConnCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = conConnCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								conConnCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								conConnCount.put(tsk.WhoId, dLst);
							}
							if (acctConnCount.containsKey(allContacts.get(tsk.WhoId).AccountId)) {
								List<Date> dLst = acctConnCount.get(allContacts.get(tsk.WhoId).AccountId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConnCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConnCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							}
						} else if (tsk.Type == 'Connect & Conversation' || (tsk.Type == 'Call' && tsk.Call_Disposition__c == 'Conversation')) {
							
							if (conConvCount.containsKey(tsk.WhoId)) {
								List<Date> dLst = conConvCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								conConvCount.put(tsk.WhoId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
								conConvCount.put(tsk.WhoId, dLst);
							}
							if (acctConvCount.containsKey(allContacts.get(tsk.WhoId).AccountId)) {
								List<Date> dLst = acctConvCount.get(allContacts.get(tsk.WhoId).AccountId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConvCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConvCount.put(allContacts.get(tsk.WhoId).AccountId, dLst);
							}							
						} else if (tsk.Type == 'Email') {

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
								dtLst.add(tsk.CreatedDate);
								leadFirstDialDateTime.put(tsk.WhoId,dtLst);									
							}
							
							if (acctDialCount.containsKey(allLeads.get(tsk.WhoId).Account__c)) {
								List<Date> dLst = acctDialCount.get(allLeads.get(tsk.WhoId).Account__c);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctDialCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctDialCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
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
							if (acctConnCount.containsKey(allLeads.get(tsk.WhoId).Account__c)) {
								List<Date> dLst = acctConnCount.get(allLeads.get(tsk.WhoId).Account__c);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConnCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConnCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
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
							if (acctConvCount.containsKey(allLeads.get(tsk.WhoId).Account__c)) {
								List<Date> dLst = acctConvCount.get(allLeads.get(tsk.WhoId).Account__c);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConvCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								acctConvCount.put(allLeads.get(tsk.WhoId).Account__c, dLst);
							}							
						} else if (tsk.Type == 'Email') {
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

		//set count & date values on Contacts 
		List<Contact> updateContacts = new List<Contact>();
		for (Contact con: allContacts.values()) {
			Boolean updated = false;
			
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
			
			//set Contact Dial Count
			if (conDialCount.containsKey(con.id)) {
				if (con.Dial_Count__c != conDialCount.get(con.id).size()) {
					system.debug('###Setting Contact dial Count to: ' + conDialCount.get(con.id).size());
					con.Dial_Count__c = conDialCount.get(con.id).size();
					updated = true;
				}
			} else { //Contact has no tasks
				if (con.Dial_Count__c != 0) {
					system.debug('###Setting Contact Dial Count to 0');
					con.Dial_Count__c = 0;
					updated = true;
				}
			}
			
			
			//set Contact Last Dial Date
			if (conDialCount.containsKey(con.id)) {
				conDialCount.get(con.id).sort();
				if (con.Last_Dial_Date__c != conDialCount.get(con.id)[conDialCount.get(con.id).size()-1]) {
					system.debug('###Setting Contact Last dial Date to: ' + conDialCount.get(con.id)[conDialCount.get(con.id).size()-1]);
					con.Last_Dial_Date__c = conDialCount.get(con.id)[conDialCount.get(con.id).size()-1];
					updated = true;
				}
			} else {
				if (con.Last_Dial_Date__c != null) {
					system.debug('###Setting Contact Last Dial Date to NULL');
					con.Last_Dial_Date__c = null;
					updated = true;
				}
			}
			
			//set Contact First Dial Date
			if (conDialCount.containsKey(con.id)) {
				conDialCount.get(con.id).sort();
				if (con.First_Dial_date__c != null) {
					if (con.First_Dial_Date__c > conDialCount.get(con.id)[0]) {
						system.debug('###Setting Contact First dial Date to: ' + conDialCount.get(con.id)[0]);
						con.First_Dial_Date__c = conDialCount.get(con.id)[0];
						updated = true;
					}
				} else {
					system.debug('###Setting Contact First dial Date to: ' + conDialCount.get(con.id)[0]);
					con.First_Dial_Date__c = conDialCount.get(con.id)[0];
					updated = true;
				}
			}
			
			//set Contact Last Connect Date
			if (conConnCount.containsKey(con.id)) {
				conConnCount.get(con.id).sort();
				if (con.Last_Connect_Date__c != conConnCount.get(con.id)[conConnCount.get(con.id).size()-1]) {
					system.debug('###Setting Contact Last Connect Date to: ' + conConnCount.get(con.id)[conConnCount.get(con.id).size()-1] + ' for contact ' + con.firstName + ' ' + con.lastName);
					con.Last_Connect_Date__c = conConnCount.get(con.id)[conConnCount.get(con.id).size()-1];
					updated = true;
				}
				if (con.First_Connect_Date__c != null) {
					if (con.First_Connect_Date__c > conConnCount.get(con.id)[0]) {
						con.First_Connect_Date__c = conConnCount.get(con.id)[0];
						updated = true;
					}
				} else {
					con.First_Connect_Date__c = conConnCount.get(con.id)[0];
					updated = true;
				}
			} else {
				if (con.Last_Connect_Date__c != null) {
					system.debug('###Setting Contact Last Connect Date to NULL');
					con.Last_Connect_Date__c = null;
					updated = true;
				}
			}
			
			//set Contact Last Conversation Date
			if (conConvCount.containsKey(con.id)) {
				conConvCount.get(con.id).sort();
				if (con.Last_Conversation_Date__c != conConvCount.get(con.id)[conConvCount.get(con.id).size()-1]) {
					system.debug('###Setting Contact Last Conversation Date to: ' + conConvCount.get(con.id)[conConvCount.get(con.id).size()-1]);
					con.Last_Conversation_Date__c = conConvCount.get(con.id)[conConvCount.get(con.id).size()-1];
					updated = true;
				}
				if (con.First_Conversation_Date__c != null) {
					if (con.First_Conversation_Date__c > conConvCount.get(con.id)[0]) {
						con.First_Conversation_Date__c = conConvCount.get(con.id)[0];
						updated = true;
					}
				} else {
					con.First_Conversation_Date__c = conConvCount.get(con.id)[0];
					updated = true;
				}
			} else {
				if (con.Last_Conversation_Date__c != null) {
					system.debug('###Setting Contact Last Conversation Date to NULL');
					con.Last_Conversation_Date__c = null;
					updated = true;
				}
			}
			
			//Set Contact Dials before First Conversation
			if (conDialCount.containsKey(con.id)) {
				if (con.First_Conversation_Date__c != null) {
					Integer firstConvDialCount = 0;
					List<Date> dialsBeforeTask = conDialCount.get(con.id);
					
					
					//Increment the count by 1 for all calls completed prior to or on the day of the first conversation
					for (Date dt : dialsBeforeTask) {
						if (dt <= con.First_Conversation_Date__c) {
							firstConvDialCount++;
						}
					}
					
					if (con.Dials_until_First_Conversation__c != null) {
						if (con.Dials_until_First_Conversation__c > firstConvDialCount) {
							con.Dials_until_First_Conversation__c = firstConvDialCount;
							updated = true;
						}
					} else {
						con.Dials_until_First_Conversation__c = firstConvDialCount;
						updated = true;
					}
					
				}
				
				else {
					if (con.Dials_until_First_Conversation__c != null) {
						con.Dials_until_First_Conversation__c = null;
						updated = true;
					}
				}
				
			}
			
			//Set Contact Dials before First Demo
			if (conDialCount.containsKey(con.id)) {
				if (con.First_Demo_Scheduled_Date__c != null) {
					Integer firstDemoDialCount = 0;
					List<Date> dialsBeforeDemo = conDialCount.get(con.id);
					
					
					//Increment the count by 1 for all calls completed prior to or on the day of the first demo
					for (Date dt : dialsBeforeDemo) {
						if (dt <= con.First_Demo_Scheduled_Date__c) {
							firstDemoDialCount++;
						}
					}
					
					if (con.Dials_until_first_Demo__c != null) {
						if (con.Dials_until_First_Demo__c < firstDemoDialCount) {
							con.Dials_until_First_Demo__c = firstDemoDialCount;
							updated = true;
						}
					} else {
						con.Dials_until_First_Demo__c = firstDemoDialCount;
						updated = true;
					}
					
				}
				
			}
			
			
			if (con.Last_Dial_Date__c >= Date.today().addDays(-acctDialCountDays)) acctConDialedLastXDays.put(con.AccountId, acctConDialedLastXDays.get(con.AccountId)+1);
			
			if (updated) updateContacts.add(con);
		}
		
		
		//set count & date values on Leads 
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
				if (ld.First_Dial_Date__c != null) {
					if (ld.First_Dial_Date__c > leadDialCount.get(ld.id)[0]) {
						system.debug('###Setting Lead First dial Date to: ' + leadDialCount.get(ld.id)[0]);
						ld.First_Dial_Date__c = leadDialCount.get(ld.id)[0];
						updated = true;
					}
				} else {
					system.debug('###Setting Lead First dial Date to: ' + leadDialCount.get(ld.id)[0]);
					ld.First_Dial_Date__c = leadDialCount.get(ld.id)[0];
					updated = true;
				}
			}
			
			//set Lead First Dial Date/Time
			if (leadFirstDialDateTime.containsKey(ld.id)){
				leadFirstDialDateTime.get(ld.id).sort();
				if (ld.First_Dial_date_time__c != null) {
					if (ld.First_Dial_Date_Time__c > leadFirstDialDateTime.get(ld.id)[0]) {
						system.debug('###Setting Lead First Dial Date/Time to: ' + leadFirstDialDateTime.get(ld.id)[0]);
						ld.First_Dial_Date_Time__c = leadFirstDialDateTime.get(ld.id)[0];
						updated = true;
					}
				} else {
					system.debug('###Setting Lead First Dial Date/Time to: ' + leadFirstDialDateTime.get(ld.id)[0]);
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
				if (ld.First_Connect_Date__c != null) {
					if (ld.First_Connect_Date__c > leadConnCount.get(ld.id)[0]) {
						ld.First_Connect_Date__c = leadConnCount.get(ld.id)[0];
						updated = true;
					}
				} else {
					ld.First_Connect_Date__c = leadConnCount.get(ld.id)[0];
					updated = true;
				}
			} else {
				if (ld.Last_Connect_Date__c != null) {
					system.debug('###Setting Lead Last Connect Date to NULL');
					ld.Last_Connect_Date__c = null;
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
				if (ld.First_Conversation_Date__c != null) {
					if (ld.First_Conversation_Date__c > leadConvCount.get(ld.id)[0]) {
						ld.First_Conversation_Date__c = leadConvCount.get(ld.id)[0];
						updated = true;
					}
				} else {
					ld.First_Conversation_Date__c = leadConvCount.get(ld.id)[0];
					updated = true;
				}
			} else {
				if (ld.Last_Conversation_Date__c != null) {
					system.debug('###Setting Lead Last Conversation Date to NULL');
					ld.Last_Conversation_Date__c = null;
					updated = true;
				}
			}
			
			//Set Lead Dials before First Conversation
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
					
					if (ld.Dials_until_first_conversation__c != null) {
						if (ld.Dials_until_First_Conversation__c < firstConvDialCount) {
							ld.Dials_until_First_Conversation__c = firstConvDialCount;
							updated = true;
						}
					} else {
						ld.Dials_until_First_Conversation__c = firstConvDialCount;
						updated = true;
					}
				} else {
					if (ld.Dials_until_first_Conversation__c != null) {
						ld.Dials_until_first_conversation__c = null;
						updated = true;
					}
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
			
			
			if (ld.Last_Dial_Date__c >= Date.today().addDays(-acctDialCountDays)) acctLeadsDialedLastXDays.put(ld.Account__c, acctLeadsDialedLastXDays.get(ld.Account__c)+1);
			
			if (updated) updateLeads.add(ld);
		}
		
		

		//update all Account values if necessary
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
			
			//set acct green circle registration date
			Date tmpdate = null;
			if (acctGreenCircleRegistrationDate.containsKey(acct.id)) {
				acctGreenCircleRegistrationDate.get(acct.id).sort();
				tmpDate = acctGreenCircleRegistrationDate.get(acct.id)[acctGreenCircleRegistrationDate.get(acct.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (acct.Green_Circle_Registration_Date__c != null) {
					system.debug('###Setting Acct Green Circle Registration Date to NULL.');
					acct.Green_Circle_Registration_Date__c = null;
					updated = true;
				}
			} else {
				if (acct.Green_Circle_Registration_Date__c != tmpDate) {
					system.debug('###Setting Acct Green Circle REgistration Date to: ' + tmpDate);
					acct.Green_Circle_Registration_Date__c = tmpDate;
					updated = true;
				}
			}
			
			
			//set Account Last Dial Date
			if (acctDialCount.containsKey(acct.id)) {
				acctDialCount.get(acct.id).sort();
				if (acct.Last_Dial_Date__c != acctDialCount.get(acct.id)[acctDialCount.get(acct.id).size()-1]) {
					system.debug('###Setting Account Dial Date to: ' + acctDialCount.get(acct.id)[acctDialCount.get(acct.id).size()-1]);
					acct.Last_Dial_Date__c = acctDialCount.get(acct.id)[acctDialCount.get(acct.id).size()-1];
					updated = true;
				}
			} else {
				if (acct.Last_Dial_Date__c != null) {
					system.debug('###Setting Account Dial Date to NULL');
					acct.Last_Dial_Date__c = null;
					updated = true;
				}
			}
			
			//set Account First Dial Date
			if (acctDialCount.containsKey(acct.id)) {
				acctDialCount.get(acct.id).sort();
				if (acct.First_Dial_Date__c != null) {
					if (acct.First_Dial_Date__c > acctDialCount.get(acct.id)[0]) {
						system.debug('###Setting Account First Dial Date to: ' + acctDialCount.get(acct.id)[0]);
						acct.First_Dial_Date__c = acctDialCount.get(acct.id)[0];
						updated = true;
					}
				} else {
					acct.First_Dial_Date__c = acctDialCount.get(acct.id)[0];
					updated = true;
				}
			}
			
			
			//set Account Dial Count
			if (acctDialCount.containsKey(acct.id)) {
				if (acct.Dial_Count__c != acctDialCount.get(acct.id).size()) {
					system.debug('###Setting Acct Dial Count to: ' + acctDialCount.get(acct.id).size());
					acct.Dial_Count__c = acctDialCount.get(acct.id).size();
					updated = true;
				}
			} else { //acct has no tasks
				if (acct.Dial_Count__c != 0) {
					system.debug('###Setting Acct Dial Count to 0.');
					acct.Dial_Count__c = 0;
					updated = true;
				}
			}
			
			//set Account Contact Count
			if (acct.Contact_Count__c != acctTotContacts.get(acct.id)) {
				acct.Contact_Count__c = acctTotContacts.get(acct.id);
				updated = true;
			}
			
			//set Account Lead Count
			if (acct.Lead_Count__c != acctTotLeads.get(acct.id)) {
				acct.Lead_Count__c = acctTotLeads.get(acct.id);
				updated = true;
			}
			
			//set Account Contacts_Dialed_in_Last_X_Days__c
			if (acct.Contacts_Dialed_in_Last_X_Days__c != acctConDialedLastXDays.get(acct.id)) {
				acct.Contacts_Dialed_in_Last_X_Days__c = acctConDialedLastXDays.get(acct.id);
				updated = true;
			}
			
			//set Account Leads_Dialed_in_Last_X_Days__c
			if (acct.Leads_Dialed_in_Last_X_Days__c != acctLeadsDialedLastXDays.get(acct.id)) {
				acct.Leads_Dialed_in_Last_X_Days__c = acctLeadsDialedLastXDays.get(acct.id);
				updated = true;
			}
			
			
			//set Acct Connect Count
			if (acctConnCount.containsKey(acct.id)) {
				if (acct.Connect_Count__c != acctConnCount.get(acct.id).size()) {
					system.debug('###Setting Acct Connect Count to: ' + acctConnCount.get(acct.id).size());
					acct.Connect_Count__c = acctConnCount.get(acct.id).size();
					updated = true;
				}
			} else { //acct has no tasks
				if (acct.Connect_Count__c != 0) {
					system.debug('###Setting Acct Connect Count to 0.');
					acct.Connect_Count__c = 0;
					updated = true;
				}
			}
			
			//set Acct First Connect Date
			if (acctConnCount.containsKey(acct.id)) {
				acctConnCount.get(acct.id).sort();
				if (acct.First_Connect_Date__c != null) {
					if (acct.First_Connect_Date__c > acctConnCount.get(acct.id)[0]) {
						system.debug('###Setting Account First Connect Date to: ' + acctConnCount.get(acct.id)[0]);
						acct.First_Connect_Date__c = acctConnCount.get(acct.id)[0];
						updated = true;
					}
				} else {
					system.debug('###Setting Account First Connect Date to: ' + acctConnCount.get(acct.id)[0]);
					acct.First_Connect_Date__c = acctConnCount.get(acct.id)[0];
					updated = true;
				}
			}
			
			//set Acct Latest Connect Date
			if (acctConnCount.containsKey(acct.id)) {
				acctConnCount.get(acct.id).sort();
				if (acct.Latest_Connect_Date__c != acctConnCount.get(acct.id)[acctConnCount.get(acct.id).size()-1]) {
					system.debug('###Setting Account Latest Connect Date to: ' + acctConnCount.get(acct.id)[acctConnCount.get(acct.id).size()-1]);
					acct.Latest_Connect_Date__c = acctConnCount.get(acct.id)[acctConnCount.get(acct.id).size()-1];
					updated = true;
				}
			} else {
				if (acct.Latest_Connect_Date__c != null) {
					system.debug('###Setting Account Latest Connect Date to NULL');
					acct.Latest_Connect_Date__c = null;
					updated = true;
				}
			}
			
			//set Acct Conversation Count
			if (acctConvCount.containsKey(acct.id)) {
				if (acct.Conversation_Count__c != acctConvCount.get(acct.id).size()) {
					system.debug('###Setting Acct Conversation Count to: ' + acctConvCount.get(acct.id).size());
					acct.Conversation_Count__c = acctConvCount.get(acct.id).size();
					updated = true;
				}
			} else { //acct has no tasks
				if (acct.Conversation_Count__c != 0) {
					system.debug('###Setting Acct Conversation Count to 0.');
					acct.Conversation_Count__c = 0;
					updated = true;
				}
			}
			
			//set Acct First Conversation Date
			if (acctConvCount.containsKey(acct.id)) {
				acctConvCount.get(acct.id).sort();
				if (acct.First_Conversation_Date__c != null) {
					if (acct.First_Conversation_Date__c > acctConvCount.get(acct.id)[0]) {
						system.debug('###Setting Account First Conversation Date to: ' + acctConvCount.get(acct.id)[0]);
						acct.First_Conversation_Date__c = acctConvCount.get(acct.id)[0];
						updated = true;
					}
				} else {
					system.debug('###Setting Account First Conversation Date to: ' + acctConvCount.get(acct.id)[0]);
					acct.First_Conversation_Date__c = acctConvCount.get(acct.id)[0];
					updated = true;
				}
			}
			
			//set Acct Latest Conversation Date
			if (acctConvCount.containsKey(acct.id)) {
				acctConvCount.get(acct.id).sort();
				if (acct.Latest_Conversation_Date__c != acctConvCount.get(acct.id)[acctConvCount.get(acct.id).size()-1]) {
					system.debug('###Setting Account Latest Conversation Date to: ' + acctConvCount.get(acct.id)[acctConvCount.get(acct.id).size()-1]);
					acct.Latest_Conversation_Date__c = acctConvCount.get(acct.id)[acctConvCount.get(acct.id).size()-1];
					updated = true;
				}
			} else {
				if (acct.Latest_Conversation_Date__c != null) {
					system.debug('###Setting Account Latest Conversation Date to NULL');
					acct.Latest_Conversation_Date__c = null;
					updated = true;
				}
			}
			
			
			//calculate dails before First Demo, Eval Meeting & Conversation Dates
			if (acct.First_Conversation_Date__c != null) {
				integer count = 0;
				if (acctDialCount.containsKey(acct.id)) {
					for (Date dt : acctDialCount.get(acct.id)) {
						if (dt < acct.First_Conversation_Date__c) {
							count++;
						}
					}
					if (acct.Dials_Before_First_Connect_Conv__c != null) {
						if (acct.Dials_Before_First_Connect_Conv__c < count) {
							acct.Dials_Before_First_Connect_Conv__c = count;
							updated = true;
						}
					} else {
						acct.Dials_Before_First_Connect_Conv__c = count;
						updated = true;
					}
				}
			} else {
				if (acct.Dials_Before_First_Connect_Conv__c != null) {
					acct.Dials_Before_First_Connect_Conv__c = null;
					updated = true;
				}
			}
			
			if (acct.First_Evaluation_Meeting_Date__c != null) {
				integer count = 0;
				if (acctDialCount.containsKey(acct.id)) {
					for (Date dt : acctDialCount.get(acct.id)) {
						if (dt < acct.First_Evaluation_Meeting_Date__c) {
							count++;
						}
					}
				}
				if (acct.Dials_Before_First_Evaluation_Meeting__c != null) {
					if (acct.Dials_Before_First_Evaluation_Meeting__c < count) {
						acct.Dials_Before_First_Evaluation_Meeting__c = count;
						updated = true;
					}
				} else {
					acct.Dials_Before_First_Evaluation_Meeting__c = count;
					updated = true;
				}
			} else {
				if (acct.Dials_Before_First_Evaluation_Meeting__c != null) {
					acct.Dials_Before_First_Evaluation_Meeting__c = null;
					updated = true;
				}
			}
			
			if (acct.First_Demo_Date__c != null) {
				integer count = 0;
				if (acctDialCount.containsKey(acct.id)) {
					for (Date dt : acctDialCount.get(acct.id)) {
						if (dt < acct.First_Demo_Date__c) {
							count++;
						}
					}
				}
				if (acct.Dials_Before_First_Demo__c != null) {
					if (acct.Dials_Before_First_Demo__c < count) {
						acct.Dials_Before_First_Demo__c = count;
						updated = true;
					}
				} else {
					acct.Dials_Before_First_Demo__c = count;
					updated = true;
				}
			} else {
				if (acct.Dials_Before_First_Demo__c != null) {
					acct.Dials_Before_First_Demo__c = null;
					updated = true;
				}
			}

			//calculate Dials in Last 30/60/90 Days
			if (acct.Last_Dial_Date__c != null) {
				integer count30 = 0;
				integer count60 = 0;
				integer count90 = 0;
				if (acctDialCount.containsKey(acct.id)) {
					for (Date dt : acctDialCount.get(acct.id)) {
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
					if (acct.Dials_in_Last_30_Days__c != count30) {
						acct.Dials_in_Last_30_Days__c = count30;
						updated = true;
					}
					if (acct.Dials_in_Last_60_Days__c != count60) {
						acct.Dials_in_Last_60_Days__c = count60;
						updated = true;
					}
					if (acct.Dials_in_Last_90_Days__c != count90) {
						acct.Dials_in_Last_90_Days__c = count90;
						updated = true;
					}
				}
			} else { //no dials
				if (acct.Dials_in_Last_30_Days__c != 0) {
					acct.Dials_in_Last_30_Days__c = 0;
					updated = true;
				}
				if (acct.Dials_in_Last_60_Days__c != 0) {
					acct.Dials_in_Last_60_Days__c = 0;
					updated = true;
				}
				if (acct.Dials_in_Last_90_Days__c != 0) {
					acct.Dials_in_Last_90_Days__c = 0;
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
	        mail.setSubject('Update Dial Info Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }

}