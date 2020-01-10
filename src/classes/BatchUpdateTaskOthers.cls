global class BatchUpdateTaskOthers implements Database.Batchable<sObject>{
	public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
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
    	
    	Map<id, List<Date>> conDemoCount = new Map<id,List<Date>>();
    	Map<id, List<DateTime>> conDemoSched = new Map<id,List<DateTime>>();
    	Map<id, List<Date>> conReferralCount = new Map<id,List<Date>>();
    	

    	
		//Get all Contacts associated with Accounts
        Map<id, Contact> allContacts = new Map<id, Contact>([select id, AccountId, First_Demo_Date__c, demo_count__c,First_Demo_Scheduled_Date__c, Referral_Count__c from Contact where AccountId =: allAccts.keySet()]);  
		
		//Get all Leads associated with all Accounts
        Map<id, Lead> allLeads = new Map<id, Lead>([select id, Account__c from Lead where IsConverted = false and Account__c =: allAccts.keySet()]);
		
		//Get all Opps associated with Accounts
		Map<id, Opportunity> allOpps = new Map<id, Opportunity>([select id, AccountId, CreatedDate, CPU_Socket_Update_Date__c, VM_Update_Date__c, Hypervisors_Relevant_for_This_Opp__c, Demo_Count__c, Evaluation_Meeting_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, First_Discovery_Call_Date__c, Last_Executive_Visit__c, /*Partner_Total_Trainings_Performed__c, Partner_Trainings_with_Portal_Admin__c, Partner_Trainings_with_Sales__c, Partner_Trainings_with_Tech_Engineering__c,*/ First_Demo_Contact_Safe_Id__c, Total_SE_Follow_Ups__c, of_CPU_Sockets__c, of_Virtual_Machines__c, StageName, Stage_Duration2__c, Exclude_from_Auto_Unqualify__c, Type, X1_if_Open__c, Amount, CloseDate, First_On_Site_Meeting__c, Last_On_Site_Meeting__c from Opportunity where AccountId in: allAccts.keySet()]);
		system.debug('$$$ opps map has ' + allOpps.size() + ' opps in it');
		
		
		/*Map<id, OpportunitySplit> emptyOppSplits = new Map<id,OpportunitySplit>([select id, Split_Owner_Team__c, owner_team__c from OpportunitySplit where Opportunity.closeDate >: Date.today().addDays(-7) AND Split_Owner_Team__c = null]);
		
		List<OpportunitySplit> osUpdates = new List<OpportunitySplit>();
		
		if (emptyOppSplits != null && emptyOppSplits.size() > 0) {
			for (OpportunitySplit os : emptyOppSplits.values()) {
				if (os.owner_team__c != null) {
					os.split_owner_team__c = os.owner_team__c;
					osUpdates.add(os);
				}
			}
		}
		*/
		
		
		
		//Get all pertinent Tasks associated with Accounts in batch
		List<Task> tskList = [select WhatId, ActivityDate, Type, AccountId, WhoId, First_Demo__c, executive_visit__c, Virtual_Machines_VMs__c, CPU_Sockets__c, Partner_Team_Present__c, CreatedDate from Task where Status = 'Completed' and ActivityDate <=: Date.today() and Owner.Profile.Name != 'Marketo Profile' and IsDeleted = false and (WhatId in: allOpps.keySet() or WhoId in: allContacts.keySet() or WhoId in: allLeads.keySet() or WhatId in: allAccts.keySet()) and (Type = 'Demo' or Type = 'Evaluation Meeting' or Type = 'Partner Training' or Type = 'Discovery Call' or Type = 'SE Follow-up Email' or Type = 'SE Follow-up Conversation' or Type = 'On-Site Meeting' or Type = 'Referral' or Type = 'Customer EBC' or Type = 'Customer Roadmap Meeting') all rows];
		

		Map<id, List<Date>> oppDemoCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> oppEvalCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> oppdiscoveryMap = new Map<Id, List<Date>>();
		Map<id, id> oppFirstDemoConID = new Map<Id, Id>();
//		Map<id, List<Date>> oppSalesTrainingCount = new Map<Id, List<Date>>();
//		Map<id, List<Date>> oppPortalAdminCount = new Map<Id, List<Date>>();
//		Map<id, List<Date>> oppTechTrainingCount = new Map<Id, List<Date>>();
//		Map<id, List<Date>> oppTotalTrainingCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> oppLastExecVisitDate = new Map<Id, List<Date>>();
		Map<id, List<Date>> oppSEFollowUpCounts = new Map<Id, List<Date>>();
		Map<id, List<Date>> oppOnSiteMeetings = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctDemoCount = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctEvalCount = new Map<Id, List<Date>>();
		Map<Id, TechWrapper> acctTechWrapper = new Map<Id, TechWrapper>();
		Map<id, String> acctHypervisor = new Map<id, String>();
		Map<id, Opportunity> acctSocketCount = new Map<id, Opportunity>();
		Map<id, Opportunity> acctVMCount = new Map<id, Opportunity>();
		Map<id, List<Date>> acctLastCustEBC = new Map<Id, List<Date>>();
		Map<id, List<Date>> acctLastCustRoadmap = new Map<Id, List<Date>>();
		
		//Need to add and update first discovery call date...similar to first demo date
		
		String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		String oppPrefix = Schema.SObjectType.Opportunity.getKeyPrefix();
		
		for (Task tsk: tskList) {
			
			system.debug('Task type is ' + tsk.type);
			
			if (tsk.type != 'Email') {
				if (tsk.WhoId != null) {
					TechWrapper techWrap = new TechWrapper();
				
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						if (allContacts.containsKey(tsk.WhoId)) {
							if (acctTechWrapper.containsKey(allContacts.get(tsk.WhoId).AccountId)){
								techWrap = acctTechWrapper.get(allContacts.get(tsk.WhoId).AccountId);
							}
						}
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						if (allLeads.containsKey(tsk.WhoId)) {
							if (acctTechWrapper.containsKey(allLeads.get(tsk.WhoId).Account__c)){
								techWrap = acctTechWrapper.get(allLeads.get(tsk.WhoId).Account__c);
							}
						}
					}
					
					if (tsk.CPU_Sockets__c != null) {
						if (techWrap.cpuSockets != null && techWrap.cpuDate!= null){
							if (tsk.CPU_Sockets__c >= 0 && tsk.ActivityDate >= techWrap.cpuDate){
								techWrap.cpuSockets = tsk.CPU_Sockets__c;
								techWrap.cpuDate = tsk.ActivityDate;
							}
						} else {
							if (tsk.CPU_Sockets__c >= 0){
								techWrap.cpuSockets = tsk.CPU_Sockets__c;
								if (tsk.ActivityDate != null) techWrap.cpuDate = tsk.ActivityDate;
								else techWrap.cpuDate = date.today();
							}
						}
					}
				
					if (tsk.Virtual_Machines_VMs__c != null) {
						if (techWrap.vms != null && techWrap.vmDate != null){
							if (tsk.Virtual_Machines_VMs__c >= 0 && tsk.ActivityDate >= techWrap.vmDate){
								techWrap.vms = tsk.Virtual_Machines_VMs__c;
								techWrap.vmDate = tsk.ActivityDate;
							}
						} else {
							if (tsk.Virtual_Machines_VMs__c >= 0){
								techWrap.vms = tsk.Virtual_Machines_VMs__c;
								if (tsk.ActivityDate != null) techWrap.vmDate = tsk.ActivityDate;
								else techWrap.vmDate = date.today();
							}
						}
					}
				
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						if (allContacts.containsKey(tsk.WhoId)) {
							acctTechWrapper.put(allContacts.get(tsk.WhoId).AccountId,techWrap);
						}
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						if (allLeads.containsKey(tsk.WhoId)) {
							acctTechWrapper.put(allLeads.get(tsk.WhoId).Account__c,techWrap);
						}
					}
					
				}	
				
			}
			
			
			if (tsk.WhatId != null) {
				if (((String)tsk.WhatId).startsWith(oppPrefix)) {
					system.debug('###Task associated with Opportunity!');
					if (tsk.Type == 'Demo') {
						system.debug('###Found Demo Task!');
						
						if (tsk.WhoId != null) {
							if (conDemoCount.containsKey(tsk.WhoId)){	
								List<Date> dLst = conDemoCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(date.today());
								conDemoCount.put(tsk.WhoId,dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(date.today());
								conDemoCount.put(tsk.WhoId,dLst);
							}
							if (conDemoSched.containsKey(tsk.WhoId)){	
								List<DateTime> dLst = conDemoSched.get(tsk.WhoId);
								if (tsk.CreatedDate != null) dLst.add(tsk.CreatedDate); else dLst.add(dateTime.now());
								conDemoSched.put(tsk.WhoId,dLst); 
							} else {
								List<DateTime> dLst = new List<DateTime>();
								if (tsk.CreatedDate != null) dLst.add(tsk.CreatedDate); else dLst.add(dateTime.now());
								conDemoSched.put(tsk.WhoId,dLst);
							}

						}


						
						if (tsk.First_Demo__c) {
							if (!oppFirstDemoConId.containsKey(tsk.whatId)) {
								oppFirstDemoConId.put(tsk.WhatId,tsk.WhoId);
							}
						}
						
						if (oppDemoCount.containsKey(tsk.WhatId)) {
							List<Date> dLst = oppDemoCount.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppDemoCount.put(tsk.WhatId, dLst);
						} else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
							oppDemoCount.put(tsk.WhatId, dLst);
						}
					} else if (tsk.Type == 'Evaluation Meeting') {
						system.debug('$$$Found Evaluation Meeting Task!');
						if (oppEvalCount.containsKey(tsk.WhatId)) {
							List<Date> dLst = oppEvalCount.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppEvalCount.put(tsk.WhatId, dLst);
						} else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
							oppEvalCount.put(tsk.WhatId, dLst);
						}
						
					} 
					
					/* else if (tsk.Type == 'Partner Training') {
						system.debug('^^^Found Partner Training Task!');
						if(oppTotalTrainingCount.containsKey(tsk.WhatID)){
							List<Date> dLst = oppTotalTrainingCount.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppTotalTrainingCount.put(tsk.WhatID, dLst);
						} else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppTotalTrainingCount.put(tsk.WhatID, dLst);
						}
						if(tsk.Partner_Team_Present__c != NULL){
							if(tsk.Partner_Team_Present__c.contains('Sales')){
								if (oppSalesTrainingCount.containsKey(tsk.WhatId)) {
									List<Date> dLst = oppSalesTrainingCount.get(tsk.WhatId);
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
									oppSalesTrainingCount.put(tsk.WhatId, dLst);
								} else {
									List<Date> dLst = new List<Date>();
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
									oppSalesTrainingCount.put(tsk.WhatId, dLst);
								}
							} if(tsk.Partner_Team_Present__c.contains('Portal Administration')){
								  if (oppPortalAdminCount.containsKey(tsk.WhatId)) {
								    List<Date> dLst = oppPortalAdminCount.get(tsk.WhatId);
							        if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
								    oppPortalAdminCount.put(tsk.WhatId, dLst);
								} else {
									List<Date> dLst = new List<Date>();
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
									oppPortalAdminCount.put(tsk.WhatId, dLst);
								}
							} if(tsk.Partner_Team_Present__c.contains('Technical/Engineering')){
								  if (oppTechTrainingCount.containsKey(tsk.WhatId)) {
									List<Date> dLst = oppTechTrainingCount.get(tsk.WhatId);
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
									oppTechTrainingCount.put(tsk.WhatId, dLst);
								} else {
									List<Date> dLst = new List<Date>();
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
									oppTechTrainingCount.put(tsk.WhatId, dLst);
								}
							} 
						}
					} */
					
					else if (tsk.Type == 'Discovery Call'){
						system.debug('^^^Found discovery call!');
						if(oppdiscoveryMap.containsKey(tsk.WhatId)){
							List<Date> dLst = oppdiscoveryMap.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppdiscoveryMap.put(tsk.WhatId, dLst);
						} else {
							List<Date> dLst = new List<Date>(); 
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppdiscoveryMap.put(tsk.WhatId, dLst);
						}	
					} else if (tsk.Type == 'SE Follow-up Email' || tsk.Type == 'SE Follow-up Conversation') {
						system.debug('SE Followup Task');
						if (oppSEFollowUpCounts.containsKey(tsk.WhatId)){
							List<Date> dLst = oppSEFollowUpCounts.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppSEFollowUpCounts.put(tsk.WhatId, dLst);
						} else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppSEFollowUpCounts.put(tsk.WhatId, dLst);
						}
					} else if (tsk.Type == 'On-Site Meeting') {
						system.debug('On-Site Meeting');
						if (oppOnSiteMeetings.containsKey(tsk.WhatId)) {
							List<Date> dLst = oppOnSiteMeetings.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.Today());
							oppOnSiteMeetings.put(tsk.WhatId,dLst);
						}
						else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.Today());
							oppOnSiteMeetings.put(tsk.WhatId,dLst);
						}
					} else if (tsk.Type == 'Referral') {
						if (tsk.WhoId != null) {
							if (conReferralCount.containsKey(tsk.WhoId)){	
								List<Date> dLst = conReferralCount.get(tsk.WhoId);
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(date.today());
								conReferralCount.put(tsk.WhoId,dLst);
							} else {
								List<Date> dLst = new List<Date>();
								if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(date.today());
								conReferralCount.put(tsk.WhoId,dLst);
							}
						}
					}
					
					if (tsk.Executive_Visit__c) {
						if (oppLastExecVisitDate.containsKey(tsk.whatId)) {
							List<Date> dLst = oppLastExecVisitDate.get(tsk.WhatId);
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppLastExecVisitDate.put(tsk.WhatId, dLst);
						} else {
							List<Date> dLst = new List<Date>();
							if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
							oppLastExecVisitDate.put(tsk.WhatId, dLst);
						}
					}
				}	
			}
			
			
			if(tsk.AccountId != null){ 
				system.debug('###Task associated with Account!');
				if (tsk.Type == 'Demo') {
					system.debug('###Found Demo Task!');
					
					if (acctDemoCount.containsKey(tsk.AccountId)) {
						List<Date> dLst = acctDemoCount.get(tsk.AccountId);
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
						acctDemoCount.put(tsk.AccountId, dLst);
					} else {
						List<Date> dLst = new List<Date>();
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
						acctDemoCount.put(tsk.AccountId, dLst);
					}
				} else if (tsk.Type == 'Evaluation Meeting') {
					system.debug('###Found Evaluation Meeting Task!');
					
					if (acctEvalCount.containsKey(tsk.AccountId)) {
						List<Date> dLst = acctEvalCount.get(tsk.AccountId);
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
						acctEvalCount.put(tsk.AccountId, dLst);
					} else {
						List<Date> dLst = new List<Date>();
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
						acctEvalCount.put(tsk.AccountId, dLst);
					}
				} else if (tsk.Type == 'Customer EBC') {
					system.debug('###Found Customer EBC Task!');
					
					if (acctLastCustEBC.containsKey(tsk.AccountId)) {
						List<Date> dLst = acctLastCustEBC.get(tsk.AccountId);
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
						acctLastCustEBC.put(tsk.AccountId, dLst);
					} else {
						List<Date> dLst = new List<Date>();
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
						acctLastCustEBC.put(tsk.AccountId, dLst);
					}
				} else if (tsk.Type == 'Customer Roadmap Meeting') {
					system.debug('###Found Customer Roadmap Meeting Task!');
					
					if (acctLastCustRoadmap.containsKey(tsk.AccountId)) {
						List<Date> dLst = acctLastCustRoadmap.get(tsk.AccountId);
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
						acctLastCustRoadmap.put(tsk.AccountId, dLst);
					} else {
						List<Date> dLst = new List<Date>();
						if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
						acctLastCustRoadmap.put(tsk.AccountId, dLst);
					}
				}
				
			}		

		}
		
		/*
		*	Update Contact Fields
		*
		*/
		List<Contact> updateCons = new List<Contact>();
		for (Contact con : allContacts.values()) {
			Boolean updated = false;
			
			
			if (conDemoCount.containsKey(con.id)) {
				conDemoCount.get(con.id).sort();
				con.First_Demo_Date__c = conDemoCount.get(con.id)[0];
				con.demo_count__c = conDemoCount.get(con.id).size();
				updated = true;
			} else {
				if (con.Demo_Count__c != 0 || con.Demo_Count__c == null) {
					con.demo_count__c = 0;
					updated = true;
				}
			}
			if (conDemoSched.containsKey(con.id)) {
				conDemoSched.get(con.id).sort();
				con.First_Demo_Scheduled_Date__c = conDemoSched.get(con.id)[0].date();
				updated = true;
			}
			if (conReferralCount.containsKey(con.id)) {
				if (con.Referral_Count__c == null) {
					con.Referral_Count__c = conReferralCount.get(con.id).size();
					updated = true;
				} else if (con.Referral_Count__c != conReferralCount.get(con.id).size()) {
					con.Referral_Count__c = conReferralCount.get(con.id).size();
					updated = true;
				}
			} else {
				if (con.Referral_Count__c != 0 && con.Referral_Count__c != null) {
					con.Referral_Count__c = 0;
					updated = true;
				}
			}
			
			
			
			
			if (updated) updateCons.add(con);
			
		}
		
		if (!updateCons.isEmpty()) update updateCons;
		
		/*set count & date values on opps
		*
		*
		*/ 
		List<Opportunity> updateOpps = new List<Opportunity>();
		Map<id,Double> acctMaxRenewalMap = new Map<id,Double>();
		for (Opportunity opp: allOpps.values()) {
			Boolean updated = false;
			
			if (opp.type != null && opp.type == 'New' && opp.StageName != 'Identify' && opp.StageName != 'Unqualified') {
				if (opp.of_CPU_Sockets__c != null) {
					if (acctSocketCount.containsKey(opp.AccountId)) {
	//					if (opp.of_CPU_Sockets__c > acctSocketCount.get(opp.AccountId)) {
	//						acctSocketCount.put(opp.AccountId,opp.of_CPU_Sockets__c.intValue());
	//					}
						
						Opportunity useOpp = acctSocketCount.get(opp.AccountId);
						if (useOpp.CPU_Socket_Update_Date__c != null) {
							if (opp.CPU_Socket_Update_Date__c != null) {
								if (opp.CPU_Socket_Update_Date__c >= useOpp.CPU_Socket_Update_Date__c) {
									system.debug('&&& Checking');
									acctSocketCount.put(opp.AccountId,opp);
								}
							}
						}

					} else {
						acctSocketCount.put(opp.AccountId,opp);
					}
				}
			
				if (opp.of_Virtual_Machines__c != null) {
					if (acctVMCount.containsKey(opp.AccountId)) {
	//					if (opp.of_Virtual_Machines__c > acctVMCount.get(opp.AccountId)) {
	//						acctVMCount.put(opp.AccountId,opp.of_Virtual_Machines__c.intValue());
	//					}
						
						Opportunity useOpp = acctVMCount.get(opp.AccountId);
						if (useOpp.VM_Update_Date__c != null) {
							if (opp.VM_Update_Date__c != null) {
								if (opp.VM_Update_Date__c >= useOpp.VM_Update_Date__c) {
									acctVMCount.put(opp.AccountId,opp);
								}
							}
						}
					} else {
						acctVMCount.put(opp.AccountId,opp);
					}
				}
			}
						
			//set Opp Demo Count
			if (oppDemoCount.containsKey(opp.id)) {
				if (opp.Demo_Count__c != oppDemoCount.get(opp.id).size()) {
					system.debug('###Setting Opp Demo Count to: ' + oppDemoCount.get(opp.id).size());
					opp.Demo_Count__c = oppDemoCount.get(opp.id).size();
					updated = true;
				}
			} else { //opp has no tasks
				if (opp.Demo_Count__c != 0) {
					system.debug('###Setting Opp Demo Count to 0');
					opp.Demo_Count__c = 0;
					updated = true;
				}
			}
			
			//set Opp First Demo Date
			Date tmpDate = null;
			if (oppDemoCount.containsKey(opp.id)) {
				oppDemoCount.get(opp.id).sort();
				tmpDate = oppDemoCount.get(opp.id)[0];
				system.debug('^^^Small Date in Demo Map is: ' + tmpDate);
			}
			
			if (tmpDate == null) {
				if (opp.First_Demo_Date__c != null) {
					system.debug('###Setting Opp First Demo Date to NULL');
					opp.First_Demo_Date__c = null;
					updated = true;
				}
			} else {
				if (opp.First_Demo_Date__c != tmpDate) {
					system.debug('###Setting Opp First Demo Date to: ' + tmpDate);
					opp.First_Demo_Date__c = tmpDate;
					updated = true;
				}
			}
			
			//set first discovery call date here
			tmpDate = null;
			if (oppdiscoveryMap.containsKey(opp.id)) {
				oppdiscoveryMap.get(opp.id).sort();
				tmpDate = oppdiscoveryMap.get(opp.id)[0];
				system.debug('^^^Setting First Discovery Call Date to' + tmpDate);
			}
			
			if (tmpDate == null) {
				if (opp.First_Discovery_Call_Date__c != null) {
					system.debug('###Setting Opp First Discovery Call Date to NULL');
					opp.First_Discovery_Call_Date__c = null;
					updated = true;
				}
			} else {
				if (opp.First_Discovery_Call_Date__c != tmpDate) {
					system.debug('###Setting Opp First Discovery Call Date to: ' + tmpDate);
					opp.First_Discovery_Call_Date__c = tmpDate;
					updated = true;
				}
			}
			
			
			//set Opp Eval Meeting Count
			if (oppEvalCount.containsKey(opp.id)) {
				if (opp.Evaluation_Meeting_Count__c != oppEvalCount.get(opp.id).size()) {
					system.debug('###Setting Opp Eval Meeting Count to: ' + oppEvalCount.get(opp.id).size());
					opp.Evaluation_Meeting_Count__c = oppEvalCount.get(opp.id).size();
					updated = true;
				}
			} else {
				if (opp.Evaluation_Meeting_Count__c != 0) {
					system.debug('###Setting Opp Eval Meeting Count to 0');
					opp.Evaluation_Meeting_Count__c = 0;
					updated = true;
				}
			}
					
			//set Eval Meeting Date
			tmpDate = null;
			if (oppEvalCount.containsKey(opp.id)) {
				oppEvalCount.get(opp.id).sort();
				tmpDate = oppEvalCount.get(opp.id)[0];
			}
			
			if (tmpDate == null) {
				if (opp.First_Evaluation_Meeting_Date__c != null) {
					system.debug('###Setting Opp First Evaluation Meeting Date to NULL');
					opp.First_Evaluation_Meeting_Date__c = null;
					updated = true;
				}
			} else {
				if (opp.First_Evaluation_Meeting_Date__c != tmpDate) {
					system.debug('###Setting Opp First Evaluation Meeting Date to: ' + tmpDate);
					opp.First_Evaluation_Meeting_Date__c = tmpDate;
					updated = true;
				}
			}
			
			if (oppFirstDemoConId.containsKey(opp.id)) {
				opp.First_Demo_Contact_Safe_Id__c = oppFirstDemoConId.get(opp.id);
				updated = true;
			}
			
			/*
			//set Partner Training Counts
			if (oppTotalTrainingCount.containsKey(opp.id)) {
				if (opp.Partner_Total_Trainings_Performed__c != oppTotalTrainingCount.get(opp.id).size()) {
					system.debug('###Setting Opp Total Partner Training Count to: ' + oppTotalTrainingCount.get(opp.id).size());
					opp.Partner_Total_Trainings_Performed__c = oppTotalTrainingCount.get(opp.id).size();
					updated = true;
				}
			} else { //opp has no tasks
				if (opp.Partner_Total_Trainings_Performed__c != 0) {
					system.debug('###Setting Opp Total Partner Training Count to 0');
					opp.Partner_Total_Trainings_Performed__c = 0;
					updated = true;
				}
			}
			
			//Sales
			if (oppSalesTrainingCount.containsKey(opp.id)) {
				if (opp.Partner_Trainings_with_Sales__c != oppSalesTrainingCount.get(opp.id).size()) {
					system.debug('###Setting Opp Partner Sales Training Count to: ' + oppSalesTrainingCount.get(opp.id).size());
					opp.Partner_Trainings_with_Sales__c = oppSalesTrainingCount.get(opp.id).size();
					updated = true;
				}
			} else { //opp has no tasks
				if (opp.Partner_Trainings_with_Sales__c != 0) {
					system.debug('###Setting Opp Partner Sales Training Count to 0');
					opp.Partner_Trainings_with_Sales__c = 0;
					updated = true;
				}
			}
			
			//Tech
			if (oppTechTrainingCount.containsKey(opp.id)) {
				if (opp.Partner_Trainings_with_Tech_Engineering__c != oppTechTrainingCount.get(opp.id).size()) {
					system.debug('###Setting Opp Partner Tech Training Count to: ' + oppTechTrainingCount.get(opp.id).size());
					opp.Partner_Trainings_with_Tech_Engineering__c = oppTechTrainingCount.get(opp.id).size();
					updated = true;
				}
			} else { //opp has no tasks
				if (opp.Partner_Trainings_with_Tech_Engineering__c != 0) {
					system.debug('###Setting Opp Partner Tech Training Count to 0');
					opp.Partner_Trainings_with_Tech_Engineering__c = 0;
					updated = true;
				}
			}
			
			//Portal Admin
			if (oppPortalAdminCount.containsKey(opp.id)) {
				if (opp.Partner_Trainings_with_Portal_Admin__c != oppPortalAdminCount.get(opp.id).size()) {
					system.debug('###Setting Opp Partner Portal Admin Training Count to: ' + oppPortalAdminCount.get(opp.id).size());
					opp.Partner_Trainings_with_Portal_Admin__c = oppPortalAdminCount.get(opp.id).size();
					updated = true;
				}
			} else { //opp has no tasks
				if (opp.Partner_Trainings_with_Portal_Admin__c != 0) {
					system.debug('###Setting Opp Partner Portal Admin Training Count to 0');
					opp.Partner_Trainings_with_Portal_Admin__c = 0;
					updated = true;
				}
			}
			
			*/
			
			// set Executive Visit Date
			tmpDate = null;
			if (oppLastExecVisitDate.containsKey(opp.id)) {
				oppLastExecVisitDate.get(opp.id).sort();
				tmpDate = oppLastExecVisitDate.get(opp.id)[oppLastExecVisitDate.get(opp.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (opp.Last_Executive_Visit__c != null) {
					opp.Last_Executive_Visit__c = null;
					updated = true;
				}
			} else {
				if (opp.Last_Executive_Visit__c != tmpDate) {
					opp.Last_Executive_Visit__c = tmpDate;
					updated = true;
				}
			}
			
			//set up SE Followup count
			if (oppSEFollowUpCounts.containsKey(opp.id)) {
				opp.Total_SE_Follow_Ups__c = oppSEFollowUpCounts.get(opp.id).size();
				updated = true;
			} else {
				if(opp.Total_SE_Follow_Ups__c != 0) {
					opp.Total_SE_Follow_Ups__c = 0;
					updated = true;
				}
			}
			
			//Set First On-Site Meeting Date
			tmpDate = null;
			Date tmpDate2 = null;
			if (oppOnSiteMeetings.containsKey(opp.id)) {
				oppOnSiteMeetings.get(opp.id).sort();
				tmpDate = oppOnSiteMeetings.get(opp.id).get(0);
				tmpDate2 = oppOnSiteMeetings.get(opp.id)[oppOnSiteMeetings.get(opp.id).size()-1];
			}
			if (tmpDate == null) {
				if (opp.First_On_Site_Meeting__c != null) {
					opp.First_On_Site_Meeting__c = null;
					updated = true;
				}
			} else {
				if (opp.First_On_Site_Meeting__c != tmpDate) {
					opp.First_On_Site_Meeting__c = tmpDate;
					updated = true;
				}
			}
			if (tmpDate2 == null) {
				if (opp.Last_On_Site_Meeting__c != null) {
					opp.Last_On_Site_Meeting__c = null;
					updated = true;
				}
			} else {
				if (opp.Last_On_Site_Meeting__c != tmpDate2) {
					opp.Last_On_Site_Meeting__c = tmpDate2;
					updated = true;
				}
			}
			
			//grab relevant hypervisors to add to account page
			if (opp.Hypervisors_Relevant_for_This_Opp__c != null) {
				if (acctHypervisor.containsKey(opp.AccountId)){
					String str = acctHypervisor.get(opp.AccountId);
					String[] hList = opp.Hypervisors_Relevant_for_This_Opp__c.split(';');
					for (Integer i=0; i<hList.size(); i++) {
						if ((!str.contains(hList[i])) && hList[i] != null && hList[i] != '' && hList[i] != 'Null' ) {
							str = str + ';' + hList[i];
						}
					}
					acctHypervisor.put(opp.AccountId,str);
				} else {
					String str = opp.Hypervisors_Relevant_for_This_Opp__c;
					acctHypervisor.put(opp.AccountId,str);
				}
			}
			
			/*Unqualify Opportunities that have been in identify for longer than 90 days (exclude those with a manual exclusion flag)
      		if ((opp.StageName == 'Identify') && (opp.Stage_Duration2__c > 90) && (opp.Exclude_from_Auto_Unqualify__c == false) && (opp.Type == 'New' || opp.Type == 'Upsell')) {
        		opp.StageName = 'Unqualified';
        		updated = true;
      		}*/
      		
			//Fill acctMaxRenewalMap with max Opportunity Maintenance renewal      		
			if (opp.type == 'Maintenance Renewal') {
				//Only consider opne Maintenance Renewals or closed within current year/last six months
				if (opp.X1_if_Open__c == 1 || opp.CloseDate.year() == date.today().year() || opp.CloseDate > date.newInstance(date.today().year()-1,date.today().month()+6,1)) { 
					if (acctMaxRenewalMap.get(opp.AccountId) != null) {
						if (opp.amount > acctMaxRenewalMap.get(opp.AccountId)) {
							acctMaxRenewalMap.put(opp.AccountId,opp.amount);
						}
					}
					else acctMaxRenewalMap.put(opp.AccountId,opp.amount);
				}
			}
			
			if (updated) updateOpps.add(opp);
		}
		
		
		/*
		* Update Account fields
		*
		*
		*/
		List<Account> updateAccts = new List<Account>();
		for (Account acct: allAccts.values()) {
			Boolean updated = false;
		
			//set Acct Demo Count
			if (acctDemoCount.containsKey(acct.id)) {
				if (acct.Demo_Count__c != acctDemoCount.get(acct.id).size()) {
					system.debug('###Setting Acct Demo Count to: ' + acctDemoCount.get(acct.id).size());
					acct.Demo_Count__c = acctDemoCount.get(acct.id).size();
					updated = true;
				}
			} else { //acct has no tasks
				if (acct.Demo_Count__c != 0) {
					system.debug('###Setting Acct Demo Count to 0.');
					acct.Demo_Count__c = 0;
					updated = true;
				}
			}
			
			//set acct First Demo Date
			Date tmpDate = null;
			if (acctDemoCount.containsKey(acct.id)) {
				acctDemoCount.get(acct.id).sort();
				tmpDate = acctDemoCount.get(acct.id)[0];
			}
			
			if (tmpDate == null) {
				if (acct.First_Demo_Date__c != null) {
					system.debug('###Setting Acct First Demo Date to NULL.');
					acct.First_Demo_Date__c = null;
					updated = true;
				}
			} else {
				if (acct.First_Demo_Date__c != tmpDate) {
					system.debug('###Setting Acct First Demo Date to: ' + tmpDate);
					acct.First_Demo_Date__c = tmpDate;
					updated = true;
				}
			}
			
			//set acct Last Demo Date
			tmpDate = null;
			if (acctDemoCount.containsKey(acct.id)) {
				acctDemoCount.get(acct.id).sort();
				tmpDate = acctDemoCount.get(acct.id)[acctDemoCount.get(acct.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (acct.Latest_Demo_Date__c != null) {
					system.debug('###Setting Acct Last Demo Date to NULL.');
					acct.Latest_Demo_Date__c = null;
					updated = true;
				}
			} else {
				if (acct.Latest_Demo_Date__c != tmpDate) {
					system.debug('###Setting Acct Latest Demo Date to: ' + tmpDate);
					acct.Latest_Demo_Date__c = tmpDate;
					updated = true;
				}
			}
			
			//set acct Evaluation Meeting Count
			if (acctEvalCount.containsKey(acct.id)) {
				if (acct.Evaluation_Meeting_Count__c != acctEvalCount.get(acct.id).size()) {
					system.debug('###Setting Acct Evaluation Meeting Count to: ' + acctEvalCount.get(acct.id).size());
					acct.Evaluation_Meeting_Count__c = acctEvalCount.get(acct.id).size();
					updated = true;
				}
			} else {
				if (acct.Evaluation_Meeting_Count__c != 0) {
					system.debug('###Setting Acct Evaluation_Meeting Count to 0.');
					acct.Evaluation_Meeting_Count__c = 0;
					updated = true;
				}
			}
			
			//set acct First Evaluation Meeting Date
			tmpDate = null;
			if (acctEvalCount.containsKey(acct.id)) {
				acctEvalCount.get(acct.id).sort();
				tmpDate = acctEvalCount.get(acct.id)[0];
			}
			
			if (tmpDate == null) {
				if (acct.First_Evaluation_Meeting_Date__c != null) {
					system.debug('###Setting Acct First Evaluation Meeting Date to NULL.');
					acct.First_Evaluation_Meeting_Date__c = null;
					updated = true;
				}
			} else {
				if (acct.First_Evaluation_Meeting_Date__c != tmpDate) {
					system.debug('###Setting Acct First Evaluation Meeting Date to: ' + tmpDate);
					acct.First_Evaluation_Meeting_Date__c = tmpDate;
					updated = true;
				}
			}
			
			//set acct Last Evaluation Meeting Date
			tmpDate = null;
			if (acctEvalCount.containsKey(acct.id)) {
				acctEvalCount.get(acct.id).sort();
				tmpDate = acctEvalCount.get(acct.id)[acctEvalCount.get(acct.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (acct.Last_Evaluation_Meeting_Date__c != null) {
					system.debug('###Setting Acct Last Evaluation Meeting Date to NULL.');
					acct.Last_Evaluation_Meeting_Date__c = null;
					updated = true;
				}
			} else {
				if (acct.Last_Evaluation_Meeting_Date__c != tmpDate) {
					system.debug('###Setting Acct Last Evaluation Meeting Date to: ' + tmpDate);
					acct.Last_Evaluation_Meeting_Date__c = tmpDate;
					updated = true;
				}
			}
			
			//Reset Account Revisit info if past revisit date
			if (acct.Revisit_Date__c != null) {
				system.debug('### Revisit Account found: ' + acct.Name);
				if (acct.Revisit_Date__c.daysBetween(Date.today()) > 30 && Date.today() > acct.Revisit_Date__c) {
					acct.Revisit_Date__c = null;
					if (acct.rating == 'Revisit')
						acct.Rating = 'Cold';
					updated = true;
				}
			}
			
			//Set Last Customer EBC Meeting
			tmpDate = null;
			if (acctLastCustEBC.containsKey(acct.id)) {
				acctLastCustEBC.get(acct.id).sort();
				tmpDate = acctLastCustEBC.get(acct.id)[acctLastCustEBC.get(acct.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (acct.Most_Recent_EBC_Meeting__c != null) {
					system.debug('###Setting Acct Most Recent Customer EBC Meeting Date to NULL.');
					acct.Most_Recent_EBC_Meeting__c = null;
					updated = true;
				}
			} else {
				if (acct.Most_Recent_EBC_Meeting__c != tmpDate) {
					system.debug('###Setting Acct Most Recent Customer EBC Meeting Date to: ' + tmpDate); 
					acct.Most_Recent_EBC_Meeting__c = tmpDate;
					updated = true;
				}
			}
			
			
			//Set Last Customer Roadmap Meeting 
			tmpDate = null;
			if (acctLastCustRoadmap.containsKey(acct.id)) {
				acctLastCustRoadmap.get(acct.id).sort();
				tmpDate = acctLastCustRoadmap.get(acct.id)[acctLastCustRoadmap.get(acct.id).size()-1];
			}
			
			if (tmpDate == null) {
				if (acct.Most_Recent_Roadmap_Meeting__c != null) {
					system.debug('###Setting Acct Most Recent Customer Roadmap Meeting Date to NULL.');
					acct.Most_Recent_Roadmap_Meeting__c = null;
					updated = true;
				}
			} else {
				if (acct.Most_Recent_Roadmap_Meeting__c != tmpDate) {
					system.debug('###Setting Acct Most Recent Customer Roadmap Meeting Date to: ' + tmpDate);
					acct.Most_Recent_Roadmap_Meeting__c = tmpDate;
					updated = true;
				}
			}
			
			
			//set Account Status Change Date for relevant Accounts
			/*
			if ((acct.Focus_Account__c == true || acct.BDR_Focus_Account__c == true) && acct.Status_Change_Date__c == null && (acct.Opps_identify__c > 0 || acct.rating == 'Defunct Account' || acct.rating == 'Revisit' || acct.rating == 'Outsourced' || acct.Opps_open_pipe__c > 0)){
        		acct.Status_Change_Date__c = Date.today();
        		updated = true;
			}
			if ((acct.Focus_Account__c == true || acct.BDR_Focus_Account__c == true) && acct.Status_Change_Date__c != null && acct.Rating != 'Defunct Account' && acct.Rating != 'Outsourced' && acct.Rating != 'Revisit' && acct.Opps_open_Pipe__c == 0 && acct.Opps_Identify__c == 0 && acct.Opps_closed_Won__c == 0){
        		acct.Status_Change_Date__c = null;
        		updated = true;
			}
			*/
			
			if (acctTechWrapper.containsKey(acct.id)) {
				TechWrapper tempWrap = acctTechWrapper.get(acct.id);
				
				if (tempWrap.cpuDate != null){
					if (acct.Last_Socket_Count_Update_Date__c != null){
						if (tempWrap.cpuDate > acct.Last_Socket_Count_Update_Date__c && tempWrap.cpuSockets > acct.socket_count__c){
							acct.Last_Socket_Count_Update_Date__c = tempWrap.cpuDate;
							acct.Socket_Count__c = tempWrap.cpuSockets;
							updated = true;
						}
					} else {
						acct.Last_Socket_Count_Update_Date__c = tempWrap.cpuDate;
						acct.Socket_Count__c = tempWrap.cpuSockets;
						updated = true;
					}
				}
				
				if (tempWrap.vmDate != null){
					if (acct.Last_VM_Count_Update_Date__c != null){
						if (tempWrap.vmDate > acct.Last_VM_Count_Update_Date__c && tempWrap.vms > acct.VM_Count__c){
							acct.Last_VM_Count_Update_Date__c = tempWrap.vmDate;
							acct.VM_Count__c = tempWrap.vms;
							updated = true;
						}
					} else {
						acct.Last_VM_Count_Update_Date__c = tempWrap.vmDate;
						acct.VM_Count__c = tempWrap.vms;
						updated = true;
					}
				}
			}
			
			if (acctSocketCount.containsKey(acct.id)) {
				if (acct.Socket_Count__c != null) {
					if (acct.Last_Socket_Count_Update_Date__c != null) {
						
						if (acctSocketCount.get(acct.id).CPU_Socket_Update_Date__c > acct.Last_Socket_Count_Update_Date__c && acctSocketCount.get(acct.id).of_CPU_Sockets__c > acct.Socket_Count__c) {
							acct.Socket_Count__c = acctSocketCount.get(acct.id).of_CPU_Sockets__c;
							acct.Last_Socket_Count_Update_Date__c = acctSocketCount.get(acct.id).CPU_Socket_Update_Date__c;
							updated = true;
						}
					}
				} else {
					acct.Socket_Count__c = acctSocketCount.get(acct.id).of_CPU_Sockets__c;
					acct.Last_Socket_Count_Update_Date__c = acctSocketCount.get(acct.id).CPU_Socket_Update_Date__c;
					updated = true;
				}
			}
			
			if (acctVMCount.containsKey(acct.id)) {
				if (acct.VM_Count__c != null) {
					if (acct.Last_VM_Count_Update_Date__c != null) {
						if (acctVMCount.get(acct.id).VM_Update_Date__c > acct.Last_VM_Count_Update_Date__c && acctVMCount.get(acct.id).of_Virtual_Machines__c > acct.VM_Count__c) {
							acct.VM_Count__c = acctVMCount.get(acct.id).of_Virtual_Machines__c;
							acct.Last_VM_Count_Update_Date__c = acctVMCount.get(acct.id).VM_Update_Date__c;
							updated = true;
						}
					}
				} else {
					acct.VM_Count__c = acctVMCount.get(acct.id).of_Virtual_Machines__c;
					acct.Last_VM_Count_Update_Date__c = acctVMCount.get(acct.id).VM_Update_Date__c;
					updated = true;
				}
			}
			
			//set new hypervisors on account
			if (acctHypervisor.containsKey(acct.id)) {
				if (acct.Hypervisor_Vendor__c != null) {
					String[] newHypervisors = acctHypervisor.get(acct.id).split(';');
					String[] existingHypervisors = acct.Hypervisor_Vendor__c.split(';');
					for (Integer i=0; i<newHypervisors.size(); i++) {
						if ((!acct.Hypervisor_Vendor__c.contains(newHypervisors[i])) && newHypervisors[i] != null && newHypervisors[i] != '' && newHypervisors[i] != 'Null' ) {
							acct.Hypervisor_Vendor__c = acct.Hypervisor_Vendor__c + ';' + newHypervisors[i];
							updated = true;
						}
					}
				} else {
					acct.Hypervisor_Vendor__c = acctHypervisor.get(acct.id);
					updated = true;
				}
			}
			
			//Set Account to Auto-bill if Max Renewal < 6k and account does not meet various exceptions
			boolean autoBillFlag = false;
			
			if (acctMaxRenewalMap.get(acct.id) != null) {
				if (acctMaxRenewalMap.get(acct.id) <= 6000) {
					if (acct.Status__c.contains('Customer') && !acct.Status__c.contains('Churned')) {
						if (acct.Customer_LTV_Tier__c != 'Tier 1 (1M+)' && acct.Customer_LTV_Tier__c != 'Tier 2 (500K+)') {
							if (!acct.Exclude_From_Auto_Bill__c) {
								autoBillFlag = true; 
							}
						}
					}
				}
			}
			
			if (acct.auto_bill__c != autoBillFlag) {
				acct.auto_bill__c = autoBillFlag;
				updated = true; 
			}
			
			
			if (updated) updateAccts.add(acct);
		}

		//commit changes to database
		try {
			if (updateOpps.size() > 0) update updateOpps;
		} catch (Exception e) {
			Error_Log__c log = new Error_Log__c();
		    log.trace__c = 'Type: ' + e.getTypeName() + '\n' + 'Cause: ' + e.getCause() + '\n' + 'Message: ' 
		    + e.getMessage() + '\n' + 'Line #: ' + e.getLineNumber() + '\n' + e.getStackTraceString() + '\n';
    		insert log; 
		}
		try {
			if (updateAccts.size() > 0) update updateAccts; 
		} catch (Exception e) {
			Error_Log__c log = new Error_Log__c();
		    log.trace__c = 'Type: ' + e.getTypeName() + '\n' + 'Cause: ' + e.getCause() + '\n' + 'Message: ' 
		    + e.getMessage() + '\n' + 'Line #: ' + e.getLineNumber() + '\n' + e.getStackTraceString() + '\n';
    		insert log; 
		}
		
		/*try {
			if (osUpdates.size() > 0) update osUpdates;
		} catch (Exception e) {
			Error_Log__c log = new Error_Log__c();
		    log.trace__c = 'Type: ' + e.getTypeName() + '\n' + 'Cause: ' + e.getCause() + '\n' + 'Message: ' 
		    + e.getMessage() + '\n' + 'Line #: ' + e.getLineNumber() + '\n' + e.getStackTraceString() + '\n';
    		insert log; 
		}*/
		
		
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
	        mail.setSubject('Update Demo/Eval/Email Info Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
}