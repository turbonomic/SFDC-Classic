/*************************************************************************************************
*	Table of Contents
*		[T1] TaskAfterInsertUpdate
*		[T2] TaskSetActivityType
*		[T3] TaskSetFirstDemo
*		[T4] TaskSetLastEngagement
*		[T5] TaskSetOpenFlagOnLeadContact
*		[T6] TaskStatusProgression
*		[T7] TaskStampWarmAccount
*		[T8] TaskSetLatestOutcome
*		[T9] TaskSetOppReferralCompleted
*		[T10] UpdateLastAcctOutcomeDate
*		[T11] CopyCallDisposition
*		[T12] allTaskQueries
*
*
**************************************************************************************************/

global class TaskMethods {
	
	
	public static Map<id,Contact> allConMap = new Map<id, Contact>(); //Stores Contacts from all task Query in allTaskQueries Method
	public static Map<id,Lead> allLeadMap = new Map<id, Lead>(); //Stores Leads from all task Query in allTaskQueries Method
	public static Map<id,Account> allAcctMap = new Map<id, Account>(); //Stores Accounts from all task Query in allTaskQueries Method
	
	
 
	/*
    * [T1] TaskAfterInsertUpdate
	* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
	* Description: 
	*   1. When a Task of Type "Call" is completed, update Last Dial Date and increment Dial Count fields on Contact, Lead & Account. 
	*      Set Last Dial Date to Task Due Date unless Due Date is null, then set to today. If Last Dial Date is > today, then set to today.
	*   2. When a "tech" Task is completed, if tech fields are set, update the corresponding Tech fields on the related Account.
	*/
	public static void TaskAfterInsertUpdate(List<Task> tasks, Map<id,Task> oldTasks) {
		List<Task> tskList = new List<Task>();
	
		//collect pertinent Tasks
		for (Task tsk: tasks) {
			if (tsk.Type != null && tsk.Type != 'Email') {
				if (!oldTasks.containsKey(tsk.id)) { 
					if (tsk.Status == 'Completed') {
						system.debug('###Insert Task found!');
						tskList.add(tsk);
					}
				} else { 
					if (oldTasks.get(tsk.id).Status != 'Completed' && tsk.Status == 'Completed') {
						system.debug('###Update Task found!');
						tskList.add(tsk);
					}
				}
			}
		}
		
		if (tskList.size() > 0) {
			Map<id, List<Date>> conDialCount = new Map<Id, List<Date>>();
			Map<id, List<Date>> leadDialCount = new Map<Id, List<Date>>();
			Map<id, List<Date>> acctDialCount = new Map<Id, List<Date>>();
			Map<id, Date> conLEDate = new Map<id,Date>();
			Map<id, Date> leadLEDate = new Map<id,Date>();
			Map<id, Date> acctLEDate = new Map<id,Date>();
			Map<Id, TechWrapper> acctTechMap = new Map<Id, TechWrapper>();
			Map<id, Boolean> conConvoMap = new Map<Id,Boolean>();
			Map<Id, Boolean> ldConvoMap = new Map<Id,Boolean>();
			Map<id, Contact> conMap;
			Map<id, Lead> leadMap;
			Map<Id, Account> acctMap;
			Set<Id> conIds = new Set<Id>();
			Set<Id> ldIds = new Set<Id>();
			String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
			String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
			List<Contact> updateContacts = new List<Contact>();
			List<Lead> updateLeads = new List<Lead>();
			MAP<Id, Account> updateAcctsMap = new Map<Id, Account>();
			
			Map<Id, User> mktoUsers = new Map<Id, User>([select id from User where Profile.Name = 'Marketo Profile']);
			
			//keep track of Task dates for each Lead and Contact
			for (Task tsk: tskList) {
				if (!mktoUsers.containsKey(tsk.OwnerId)) {
					if (tsk.WhoId != null) {
						if(((String)tsk.WhoId).startsWith(conPrefix)){ 
							conIds.add(tsk.WhoId);
							if (tsk.Type == 'Call' || tsk.Type == 'Connect' || tsk.Type == 'Connect & Conversation') {
								system.debug('###Dial Task associated with Contact!');
								
								if (tsk.Call_Disposition__c == 'Conversation' || tsk.Call_Disposition__c == 'Connect'){
									if (!conConvoMap.containsKey(tsk.WhoId)) {
										conConvoMap.put(tsk.WhoId,true);
									}
								}
								
								if (conDialCount.containsKey(tsk.WhoId)) {
									List<Date> dLst = conDialCount.get(tsk.WhoId);
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
									conDialCount.put(tsk.WhoId, dLst);
								} else {
									List<Date> dLst = new List<Date>();
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today()); 
									conDialCount.put(tsk.WhoId, dLst);
								}
							}
							
							if (tsk.Engagement_Activity__c) {
								system.debug('### engagement activity associated with Contact');
								if (conLEDate.containsKey(tsk.WhoId)) {
									if (tsk.activityDate != null && tsk.activityDate > conLEDate.get(tsk.WhoId)) {
										conLEDate.put(tsk.WhoId, tsk.activityDate);
									}
								} else {
									if (tsk.activityDate != null) {
										conLEDate.put(tsk.WhoId, tsk.ActivityDate);
									}
								}
							}
							
						} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
							ldIds.add(tsk.WhoId);
							if (tsk.Type == 'Call' || tsk.Type == 'Connect' || tsk.Type == 'Connect & Conversation') {
								system.debug('###Dial Task associated with Lead!');
								
								if (tsk.Call_Disposition__c == 'Conversation' || tsk.Call_Disposition__c == 'Connect') {
									if (!ldConvoMap.containsKey(tsk.WhoId)) {
										ldConvoMap.put(tsk.WhoId,true);
									}
								}
								
								if (leadDialCount.containsKey(tsk.WhoId)) {
									List<Date> dLst = leadDialCount.get(tsk.WhoId);
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
									leadDialCount.put(tsk.WhoId, dLst);
								} else {
									List<Date> dLst = new List<Date>();
									if (tsk.ActivityDate != null) dLst.add(tsk.ActivityDate); else dLst.add(Date.today());
									leadDialCount.put(tsk.WhoId, dLst);
								}
							}
							
							if (tsk.Engagement_Activity__c) {
								system.debug('### Engagement Activity associated with Lead');
								if (leadLEDate.containsKey(tsk.WhoId)) {
									if (tsk.activityDate != null && tsk.activityDate > leadLEDate.get(tsk.WhoId)) {
										leadLEDate.put(tsk.WhoId,tsk.activityDate);
									}
								} else {
									if (tsk.activityDate != null) {
										system.debug('### entering new lead map value');
										leadLEDate.put(tsk.WhoId, tsk.activityDate);
									}
								}
							}
							
						}
					}
				}
			}
			
			//get Contact records and update dial info
			if (conIds.size() > 0) {
				//conMap = new Map<id, Contact>([select Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, AccountId, Concierge_Routing_Reason__c from Contact where id in: conIds]);
				conMap = new Map<id, Contact>();
				for (Contact con: allConMap.values()) {
					if (conIds.contains(con.id)) conMap.put(con.id, con);
				}
				
				for (Contact con: conMap.values()) {
					
					Boolean updated = false;
					
					
					if (conDialCount.containsKey(con.id)) {
						
						//keep track of Task Dates for Account
						if (acctDialCount.containsKey(con.AccountId)) {
							List<Date> dLst = acctDialCount.get(con.AccountId);
							dLst.addAll(conDialCount.get(con.id));
							acctDialCount.put(con.AccountId, dLst);
						} else {
							List<Date> dLst = conDialCount.get(con.id);
							acctDialCount.put(con.AccountId, dLst);
						}
						
						//set Contact Dial Count
						if (con.Dial_Count__c != null) {
							con.Dial_Count__c = con.Dial_Count__c + conDialCount.get(con.id).size();
							updated = true;
						} else {
							con.Dial_Count__c = conDialCount.get(con.id).size();
							updated = true;
						}
						
						//set Contact Last Dial Date
						conDialCount.get(con.id).sort();
						if (con.Last_Dial_Date__c != null) {
							if (conDialCount.get(con.id)[conDialCount.get(con.id).size()-1] > con.Last_Dial_Date__c) {
								con.Last_Dial_Date__c = conDialCount.get(con.id)[conDialCount.get(con.id).size()-1];
								if (con.Last_Dial_Date__c > Date.today()) con.Last_Dial_Date__c = Date.today();
								updated = true;
							}
						} else {
							con.Last_Dial_Date__c = conDialCount.get(con.id)[conDialCount.get(con.id).size()-1];
							if (con.Last_Dial_Date__c > Date.today()) con.Last_Dial_Date__c = Date.today();
							updated = true;
						}
						
						if (con.Concierge_Routing_Reason__c != null) {
							if (conConvoMap.containsKey(con.id)){
								con.Concierge_Routing_Reason__c = null;
								updated = true;
							}
						}
					}
					
					if (conLEDate.containsKey(con.id)) {
						
						if (acctLEDate.containsKey(con.accountId)) {
							if (conLEDate.get(con.id) > acctLEDate.get(con.accountId)) {
								acctLEDate.put(con.accountId,conLEDate.get(con.id));
							}
						} else {
							acctLEDate.put(con.accountId,conLEDate.get(con.id));
						}
						
						if (con.last_engagement_date__c != null) {
							if (conLEDate.get(con.id) > con.last_engagement_date__c) {
								con.last_engagement_date__c = conLEDate.get(con.id);
								updated = true;
							}
						} else {
							con.last_engagement_date__c = conLEDate.get(con.id);
							updated = true;
						}
						
					}
					
						//queue for update
					if (updated)updateContacts.add(con);
					
				}
			}
			
			//get Lead records and update dial info
			if (ldIds.size() > 0) {
				 //leadMap = new Map<id, Lead>([select Name, Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, Account__c, Status_Change_Date__c, Dial_Count_Since_Last_Status_Change__c, isConverted, Concierge_Routing_Reason__c from Lead where id in: ldIds]);
				 
				 leadMap = new Map<id, Lead>();
				 for (Lead ld: allLeadMap.values()) {
				 	if (ldIds.contains(ld.id)) leadMap.put(ld.id, ld);
				 }
				 
				 for (Lead ld: leadMap.values()) {
				 	if (!ld.isConverted) {
				 		
				 		Boolean updated = false;
				 		
				 		if (leadDialCount.containsKey(ld.id)) {
				 			
					 		system.debug('Lead Name is ' + ld.Name + ' and status change date is ' + ld.Status_Change_Date__c);
					 		
						 	//keep track of Task dates for Account
							if (acctDialCount.containsKey(ld.Account__c)) {
								List<Date> dLst = acctDialCount.get(ld.Account__c);
								dLst.addAll(leadDialCount.get(ld.id));
								acctDialCount.put(ld.Account__c, dLst);
							} else {
								List<Date> dLst = leadDialCount.get(ld.id);
								acctDialCount.put(ld.Account__c, dLst);
							}
							
							//set Lead Dial Count
							if (ld.Dial_Count__c != null) {
								ld.Dial_Count__c = ld.Dial_Count__c + leadDialCount.get(ld.id).size();
								updated = true;
							} else {
								ld.Dial_Count__c = leadDialCount.get(ld.id).size();
								updated = true;
							}
							
							Integer dialCount = 0;
							List<Date> dLst = leadDialCount.get(ld.id);
							for(Integer i=0; i<dLst.size(); i++){
								if( ld.Status_Change_Date__c != null) {
									system.debug('Comparing task date iteration ' + i + ' of date ' + dLst.get(i) + ' and status change date ' + ld.Status_Change_Date__c);
									if(dLst.get(i) > ld.Status_Change_Date__c) {
										system.debug('check');
										dialCount++;
									}
								} else {
									dialCount++;
								}
							}
							if (ld.Dial_Count_Since_Last_Status_Change__c != null) {
								ld.Dial_Count_Since_Last_Status_Change__c = ld.Dial_Count_Since_Last_Status_Change__c + dialCount;
								updated = true;
							} else {
								ld.Dial_Count_Since_Last_Status_Change__c = dialCount;
								updated = true;
							}
							
							//set Lead Last Dial Date
							leadDialCount.get(ld.id).sort();
							if (ld.Last_Dial_Date__c != null) {
								if (leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1] > ld.Last_Dial_Date__c) {
									ld.Last_Dial_Date__c = leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1];
									if (ld.Last_Dial_Date__c > Date.today()) ld.Last_Dial_Date__c = Date.today();
									updated = true;
								}
							} else {
								ld.Last_Dial_Date__c = leadDialCount.get(ld.id)[leadDialCount.get(ld.id).size()-1];
								if (ld.Last_Dial_Date__c > Date.today()) ld.Last_Dial_Date__c = Date.today();
								updated = true;
							}
							
							if (ld.Concierge_Routing_Reason__c != null) {
								if (ldConvoMap.containsKey(ld.id)){
									ld.Concierge_Routing_Reason__c = null;
									updated = true;
								}
							}
				 		}
				 		
				 		if (leadLEDate.containsKey(ld.id)) {
				 			
				 			if (ld.account__c != null) {
					 			if (acctLEDate.containsKey(ld.account__c)) {
					 				if (leadLEDate.get(ld.id) > acctLEDate.get(ld.account__c)) {
					 					acctLEDate.put(ld.account__c,leadLEDate.get(ld.id));
					 				}
					 			} else {
					 				acctLEDate.put(ld.account__c,leadLEDate.get(ld.id));
					 			}
				 			}
				 			
				 			system.debug('### last engagement mapping entered for Lead');
				 			if (ld.last_engagement_date__c != null) {
				 				if (leadLEDate.get(ld.id) > ld.last_engagement_date__c) {
				 					ld.last_engagement_date__c = leadLEDate.get(ld.id);
				 					updated = true;
				 				}
				 			} else {
				 				system.debug('### setting new last engagement date on lead');
				 				ld.last_engagement_date__c = leadLEDate.get(ld.id);
				 				updated = true;
				 			}
				 			
				 		}
							
						
						if (updated) updateLeads.add(ld);
				 	}
				}
			}
			
			//save latest technology field values into map by accountId
			for (Task tsk : tskList) {
				
				if (!mktoUsers.containsKey(tsk.OwnerId)) {
					
					Boolean updateTech = false;
					TechWrapper tempWrap = new TechWrapper();
					
					if (tsk.WhoId != null) {
						if (((String)tsk.WhoId).startsWith(conPrefix)) {
							system.debug('###Tech Task on Contact!');
							if (conMap.containsKey(tsk.WhoId)) {
								updateTech = true;
								if (acctTechMap.containsKey(conMap.get(tsk.WhoId).AccountId)) {
									tempWrap = acctTechMap.get(conMap.get(tsk.WhoId).AccountId);
								}
							} 
							
						} else {
							system.debug('###Tech Task on Lead!');
							if (leadMap.containsKey(tsk.WhoId)) {
								updateTech = true;
								if (acctTechMap.containsKey(leadMap.get(tsk.WhoId).Account__c)) {
									tempWrap = acctTechMap.get(LeadMap.get(tsk.WhoId).Account__c);
								}
							}
						}
						
						if (updateTech) {
							updateTech = false;
							if (tsk.CPU_Sockets__c != null && tsk.CPU_Sockets__c > 0) {
								if (tempWrap.cpuDate == null || tsk.ActivityDate > tempWrap.cpuDate) {
									tempWrap.cpuDate = tsk.ActivityDate;
								    tempWrap.cpuSockets = tsk.CPU_Sockets__c;
									system.debug('###Set CPU Sockets to ' + tempWrap.cpuSockets);
									updateTech = true;
								}	
							}
							
							if (tsk.Virtual_Machines_VMs__c != null && tsk.Virtual_Machines_VMs__c > 0) {
								if (tempWrap.vmDate == null || tsk.ActivityDate > tempWrap.vmDate) {
									tempWrap.vmDate = tsk.ActivityDate;
								    tempWrap.vms = tsk.Virtual_Machines_VMs__c;
									system.debug('###Set VMs to ' + tempWrap.vms);
									updateTech = true;
								}	
							}
							
							if (tsk.cores__c != null && tsk.cores__c > 0) {
								if (tempWrap.coreDate == null || tsk.ActivityDate > tempWrap.coreDate) {
									tempWrap.coreDate = tsk.ActivityDate;
								    tempWrap.cores = tsk.cores__c;
									system.debug('###Set Cores to ' + tempWrap.cores);
									updateTech = true;
								}	
							}
							
							if (tsk.Hardware_Vendor__c != null) {
		
							    String[] tskString = tsk.Hardware_Vendor__c.split(';');
		
								for (integer i=0; i<tskString.size(); i++){
								    if(tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
								    	if(tempWrap.hwVendor != null) {
									      	if(!(tempWrap.hwVendor.contains(tskString[i]))) {
										      	tempWrap.hwVendor = tempWrap.hwVendor + ';' + tskString[i];	
									      	}
								    	} else {
								    		tempWrap.hwVendor = tskString[i];
								    	}
								    	
								    	system.debug('###Set hwVendor to ' + tempWrap.hwVendor);
										updateTech = true;
								    }
								}
						    }
						    
						    if (tsk.Hypervisor_Vendor__c != null) {
		
							    String[] tskString = tsk.Hypervisor_Vendor__c.split(';');
		
								for (integer i=0; i<tskString.size(); i++){
								    if(tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
								    	if(tempWrap.hvVendor != null) {
									      	if(!(tempWrap.hvVendor.contains(tskString[i]))) {
										      	tempWrap.hvVendor = tempWrap.hvVendor + ';' + tskString[i];	
									      	}
								    	} else {
								    		tempWrap.hvVendor = tskString[i];
								    	}
								    	system.debug('###Set hvVendor to ' + tempWrap.hvVendor);
										updateTech = true;
								    }
								}
						    }
						    
						    if (tsk.Storage_Vendor__c != null) {
								system.debug('###Storage Vendor on Task is ' + tsk.Storage_Vendor__c);
								
							    String[] tskString = tsk.Storage_Vendor__c.split(';');
		
							  	for (integer i=0; i<tskString.size(); i++) {
							    	if(tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
							    		system.debug('###tskString[i] is ' + tskString[i]);
							    		if (tempWrap.stVendor != null) {
							    			system.debug('###tempWrap.stVendor IS NOT null');
							    			if(!(tempWrap.stVendor.contains(tskString[i]))) {
							    				tempWrap.stVendor = tempWrap.stVendor + ';' + tskString[i];
							    			}
							    		} else {
							    			system.debug('###tempWrap.stVendor IS NOT null');
							    			tempWrap.stVendor = tskString[i];
							    		}
							    		system.debug('###Set stVendor to ' + tempWrap.stVendor);
									    updateTech = true;
							    	}
							  	}
						    }
						}
						
						if (updateTech) {
							updateTech = false;
							if (((String)tsk.WhoId).startsWith(conPrefix)) {
								if (conMap.containsKey(tsk.WhoId)) {
									acctTechMap.put(conMap.get(tsk.WhoId).AccountId, tempWrap);
								}
							} else {
								if (leadMap.containsKey(tsk.WhoId)) {
									acctTechMap.put(leadMap.get(tsk.WhoId).Account__c, tempWrap);
								}
							} 	
						}
					}
				}
			}
					
			
			
			//get Account records & update them with dial info and/or tech info
			if (acctDialCount.keySet().size() > 0 || acctTechMap.keySet().size() > 0 || acctLEDate.keySet().size() > 0) {
				//acctMap = new Map<id, Account>([select id, Last_Engagement_Date__c, Dial_Count__c, Last_Dial_Date__c, Core_Count__c, Last_Core_Count_Update_Date__c, Socket_Count__c, Last_Socket_Count_Update_Date__c, VM_Count__c, Last_VM_Count_Update_Date__c, Hardware_Vendor__c, Hypervisor_Vendor__c, Storage_Vendor__c from Account where id in: acctDialCount.keySet() or id in: acctTechMap.keySet()]);
				
				acctMap = new Map<id, Account>();
				for(Account acct: allAcctMap.values()) {
					if (acctDialCount.containsKey(acct.id) || acctTechMap.containsKey(acct.id)) acctMap.put(acct.id, acct);
				}
				
				for (Account acct: acctMap.values()) {
					
					Account tempAcct = acct;
					
					if (acctDialCount.containsKey(acct.id)) {
						
						if (updateAcctsMap.containsKey(acct.id)) {
							tempAcct = updateAcctsMap.get(acct.id);
						}
						
						//set Account Dial Count
						if (tempAcct.Dial_Count__c != null) {
							tempAcct.Dial_Count__c = tempAcct.Dial_Count__c + acctDialCount.get(tempAcct.id).size();
						} else {
							tempAcct.Dial_Count__c = acctDialCount.get(tempAcct.id).size();
						}
						
						//set Account Last Dial Date
						acctDialCount.get(tempAcct.id).sort();
						if (tempAcct.Last_Dial_Date__c != null) {
							if (acctDialCount.get(tempAcct.id)[acctDialCount.get(tempAcct.id).size()-1] > tempAcct.Last_Dial_Date__c) {
								tempAcct.Last_Dial_Date__c = acctDialCount.get(tempAcct.id)[acctDialCount.get(tempAcct.id).size()-1];
								if (tempAcct.Last_Dial_Date__c > Date.today()) tempAcct.Last_Dial_Date__c = Date.today();
							}
						} else {
							tempAcct.Last_Dial_Date__c = acctDialCount.get(tempAcct.id)[acctDialCount.get(tempAcct.id).size()-1];
							if (tempAcct.Last_Dial_Date__c > Date.today()) tempAcct.Last_Dial_Date__c = Date.today();
						}
						
						updateAcctsMap.put(tempAcct.id, tempAcct);
					}
					
					if (acctLEDate.containsKey(acct.id)) {
						
						if (updateAcctsMap.containsKey(acct.id)) {
							tempAcct = updateAcctsMap.get(acct.id);
						}
						
						if (tempAcct.last_engagement_date__c != null) {
							if (acctLEDate.get(tempAcct.id) > tempAcct.last_engagement_date__c) {
								tempAcct.last_engagement_date__c = acctLEDate.get(tempAcct.id);
							}
						} else {
							tempAcct.last_engagement_date__c = acctLEDate.get(tempAcct.id);
						}
						
						updateAcctsMap.put(tempAcct.id,tempAcct);
					}
					
					if (acctTechMap.containsKey(acct.id)) {
						
						if (updateAcctsMap.containsKey(acct.id)) {
							tempAcct = updateAcctsMap.get(acct.id);
						}
						
						if (acctTechMap.get(tempAcct.id).cpuSockets != null && acctTechMap.get(tempAcct.id).cpuSockets > 0 && acctTechMap.get(tempAcct.id).cpuDate != null) {
							if (tempAcct.Last_Socket_Count_Update_Date__c != null) {
								if (acctTechMap.get(tempAcct.id).cpuDate > tempAcct.Last_Socket_Count_Update_Date__c) {
									if (tempAcct.Socket_Count__c != null) {
										if (tempAcct.Socket_Count__c > 0 && acctTechMap.get(tempAcct.id).cpuSockets > tempAcct.Socket_Count__c) {
											tempAcct.Socket_Count__c = acctTechMap.get(tempAcct.id).cpuSockets;
											tempAcct.Last_Socket_Count_Update_Date__c = acctTechMap.get(tempAcct.id).cpuDate;
										}
									} else {
										tempAcct.Socket_Count__c = acctTechMap.get(tempAcct.id).cpuSockets;
										tempAcct.Last_Socket_Count_Update_Date__c = acctTechMap.get(tempAcct.id).cpuDate;
									}
								}
							} else {
								if (tempAcct.Socket_Count__c != null) {
									if (tempAcct.Socket_Count__c > 0 && acctTechMap.get(tempAcct.id).cpuSockets > tempAcct.Socket_Count__c) {
										tempAcct.Socket_Count__c = acctTechMap.get(tempAcct.id).cpuSockets;
										tempAcct.Last_Socket_Count_Update_Date__c = acctTechMap.get(tempAcct.id).cpuDate;
									}
								} else {
									tempAcct.Socket_Count__c = acctTechMap.get(tempAcct.id).cpuSockets;
									tempAcct.Last_Socket_Count_Update_Date__c = acctTechMap.get(tempAcct.id).cpuDate;
								}
							}
	//						tempAcct.Socket_Count__c = acctTechMap.get(tempAcct.id).cpuSockets;
							system.debug('### setting Socket Count to ' + acctTechMap.get(tempAcct.id).cpuSockets);
						}
						if (acctTechMap.get(tempAcct.id).vms != null && acctTechMap.get(tempAcct.id).vms > 0 && acctTechMap.get(tempAcct.id).vmDate != null) {
							if (tempAcct.Last_VM_Count_Update_Date__c != null) {
								if (acctTechMap.get(tempAcct.id).vmDate > tempAcct.Last_VM_Count_Update_Date__c) {
									if (tempAcct.VM_Count__c != null) {
										if (tempAcct.VM_Count__c > 0 && acctTechMap.get(tempAcct.id).vms > tempAcct.VM_Count__c) {
											tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
											tempAcct.Last_VM_Count_Update_Date__c = acctTechMap.get(tempAcct.id).vmDate;
										}
									} else {
										tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
										tempAcct.Last_VM_Count_Update_Date__c = acctTechMap.get(tempAcct.id).vmDate;
									}
								}
							} else {
								if (tempAcct.VM_Count__c != null) {
									if (tempAcct.VM_Count__c > 0 && acctTechMap.get(tempAcct.id).vms > tempAcct.VM_Count__c) {
										tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
										tempAcct.Last_VM_Count_Update_Date__c = acctTechMap.get(tempAcct.id).vmDate;
									}
								} else {
									tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
									tempAcct.Last_VM_Count_Update_Date__c = acctTechMap.get(tempAcct.id).vmDate;
								}
							}
	//						tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
							system.debug('### setting VM Count to ' + acctTechMap.get(tempAcct.id).vms);
						}
						if (acctTechMap.get(tempAcct.id).cores != null && acctTechMap.get(tempAcct.id).cores > 0 && acctTechMap.get(tempAcct.id).coreDate != null) {
							if (tempAcct.Last_Core_Count_Update_Date__c != null) {
								if (acctTechMap.get(tempAcct.id).coreDate > tempAcct.Last_Core_Count_Update_Date__c) {
									if (tempAcct.core_count__c != null) {
										if (tempAcct.Core_Count__c > 0 && acctTechMap.get(tempAcct.id).cores > tempAcct.Core_Count__c) {
											tempAcct.Core_Count__c = acctTechMap.get(tempAcct.id).cores;
											tempAcct.Last_Core_Count_Update_Date__c = acctTechMap.get(tempAcct.id).coreDate;
										}
									} else {
										tempAcct.Core_Count__c = acctTechMap.get(tempAcct.id).cores;
										tempAcct.Last_Core_Count_Update_Date__c = acctTechMap.get(tempAcct.id).coreDate;
									}
								}
							} else {
								if (tempAcct.Core_Count__c != null) {
									if (tempAcct.Core_Count__c > 0 && acctTechMap.get(tempAcct.id).cores > tempAcct.Core_Count__c) {
										tempAcct.Core_Count__c = acctTechMap.get(tempAcct.id).cores;
										tempAcct.Last_Core_Count_Update_Date__c = acctTechMap.get(tempAcct.id).coreDate;
									}
								} else {
									tempAcct.Core_Count__c = acctTechMap.get(tempAcct.id).cores;
									tempAcct.Last_Core_Count_Update_Date__c = acctTechMap.get(tempAcct.id).coreDate;
								}
							}
	//						tempAcct.VM_Count__c = acctTechMap.get(tempAcct.id).vms;
							system.debug('### setting Core Count to ' + acctTechMap.get(tempAcct.id).cores);
						}
						
						if (acctTechMap.get(tempAcct.id).hwVendor != null){
							String[] tskString = acctTechMap.get(tempAcct.id).hwVendor.split(';');
							for (integer i=0; i<tskString.size(); i++) {
								if(tempAcct.Hardware_Vendor__c != null) {
									if(!(tempAcct.Hardware_Vendor__c.contains(tskString[i])) && tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
										tempAcct.Hardware_Vendor__c = tempAcct.Hardware_Vendor__c + ';' + tskString[i];
										system.debug('###Set Hardware Vendor to ' + tempAcct.Hardware_Vendor__c);
									}
								} else {
									tempAcct.Hardware_Vendor__c = acctTechMap.get(tempAcct.id).hwVendor;
								}
							}
						}
						if (acctTechMap.get(tempAcct.id).hvVendor != null){
							String[] tskString = acctTechMap.get(tempAcct.id).hvVendor.split(';');
							for (integer i=0; i<tskString.size(); i++) {
								if(tempAcct.Hypervisor_Vendor__c != null) {
									if(!(tempAcct.Hypervisor_Vendor__c.contains(tskString[i])) && tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
										tempAcct.Hypervisor_Vendor__c = tempAcct.Hypervisor_Vendor__c + ';' + tskString[i];
										system.debug('###Set Hypervisor Vendor to ' + tempAcct.Hypervisor_Vendor__c);
									}
								} else {
									tempAcct.Hypervisor_Vendor__c = acctTechMap.get(tempAcct.id).hvVendor;
								}
							}
						}
						if (acctTechMap.get(tempAcct.id).stVendor != null){
							String[] tskString = acctTechMap.get(tempAcct.id).stVendor.split(';');
							for (integer i=0; i<tskString.size(); i++) {
								if (tempAcct.Storage_Vendor__c != null) {
									if(!(tempAcct.Storage_Vendor__c.contains(tskString[i])) && tskString[i] != null && tskString[i] != '' && tskString[i] != 'null') {
										tempAcct.Storage_Vendor__c = tempAcct.Storage_Vendor__c + ';' + tskString[i];
										system.debug('###Set Storage Vendor to ' + tempAcct.Storage_Vendor__c);
									}
								} else {
									tempAcct.Storage_Vendor__c = acctTechMap.get(tempAcct.id).stVendor;
								}
							}
						}
						updateAcctsMap.put(tempAcct.id, tempAcct);
					}
				}
			}
			
			//commit changes to db
			if (updateContacts.size() > 0) update updateContacts;
			if (updateLeads.size() > 0) update updateLeads;
			if (updateAcctsMap.values().size() > 0) update updateAcctsMap.values();
		}
		
	}
	/*	[T2] TaskSetActivityType
	* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
    * Trigger: TaskSetActivityTypeText.trigger      
    * Description: Any time a Task is inserted or updated, set the "Activity Type (workflow)" text field to be used for
    * reporting. For some strange reason, a WFR to do this doesn't work for email Tasks.
	*/
	public static void TaskSetActivityType(List<Task> tasks) {
		for (Task tsk: tasks) {
			tsk.Activity_type_workflow__c = tsk.Type;
		}
		
	}	// end of TaskSetActivityType method
		
	/* 
	* [T3] TaskSetFirstDemo
	* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
	* Description: When a Task is created, updated or deleted and is a completed "Demo" Task under an Opportunity, call future class to set 
	* the "First Demo" checkbox on the appropriate Task under Opportunities related to the Tasks in the context of this Trigger.
	*/
	public static void TaskSetFirstDemo(List<Task> tasks, Map<id,Task> oldTasks) {
		
		String oppPrefix = Schema.SObjectType.Opportunity.getKeyPrefix();
		Set<Id> allOppIds = new Set<Id>();
		Set<Id> oppIds = new Set<Id>();
		Set<Id> oppIds2 = new Set<Id>();
		Set<Id> oppsId3 = new Set<Id>();
		
		if (!VMTUtils.inBatch) { //do not run this trigger if we are within a batch method because a batch class cannot call a future method
			if (trigger.IsInsert || trigger.IsUpdate) {
				for (Task t : tasks) {
					if (t.Type == 'Demo' && t.WhatId != null) {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppIds2.add(t.WhatId);
							allOppIds.add(t.WhatId);
						}
					}
					
					if (t.Type == 'Demo' && t.WhatId != null && t.Status == 'Completed') {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppIds.add(t.WhatId);
							allOppIds.add(t.WhatId);
						}
					}
					
					if (t.WhatId != null && (t.Type == 'Demo' || t.Type == 'First Meeting' || t.Type == 'Key Globals Exec Meeting' || t.Type == 'Discovery Call')) {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppsId3.add(t.WhatId);
							allOppIds.add(t.WhatId);
						}
					}
				}
			} else {
				for (Task t : oldTasks.values()) {
					if (t.Type == 'Demo' && t.WhatId != null) {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppIds2.add(t.whatId);
							allOppIds.add(t.WhatId);
						}
					}
					
					if (t.Type == 'Demo' && t.WhatId != null && t.Status == 'Completed') {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppIds.add(t.WhatId);
							allOppIds.add(t.WhatId);
						}
					}
					
					if (t.WhatId != null && (t.Type == 'Demo' || t.Type == 'First Meeting' || t.Type == 'Key Globals Exec Meeting' || t.Type == 'Discovery Call')) {
						if (((String)t.WhatId).startsWith(oppPrefix)) {
							oppsId3.add(t.WhatId);
							allOppIds.add(t.WhatId);
						}
					}
				}
			}
			
			if(allOppIds.size() > 0 && !System.isFuture() && !System.isBatch()) {
				if (oppIds.size() > 0) TaskFutureMethods.setFirstDemoTask(oppIds);
				if (oppIds2.size() > 0) TaskFutureMethods.setFirstDemoScheduledTask(oppIds2);
				if (oppsId3.size() > 0) TaskFutureMethods.setFirstMeeting(oppsId3);
				//TaskFutureMethods.allFutureTaskQuery(allOppIds, oppIds, oppIds2, oppsId3);
			}
		}
	}	// end of TaskSetFirstDemo method
		
	/** 
	* [T4] TaskSetLastEngagement
	* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
	* Description: When a Task is created, updated or deleted, update the Last Engagement Date on the Lead or Contact and the related Account, if appropriate.
	*/
	public static void TaskSetLastEngagement(Map<id,Task> oldTasks) {
		
		//collections to sort data
		Set<Id> conIdSet = new Set<Id>();
		Set<Id> ldIdSet = new Set<Id>();
		Map<Id, Date> conToDate = new Map<Id, Date>();
		Map<Id, Contact> conMap = new Map<Id, Contact>();
		Map<Id, Contact> conUpdateMap = new Map<Id, Contact>();
		Map<Id, Date> ldToDate = new Map<Id, Date>();
		Map<Id, Lead> ldMap = new Map<Id, Lead>();
		Map<Id, Lead> ldUpdateMap = new Map<Id, Lead>();
		Map<Id, Date> acctToDate = new Map<Id, Date>();
		Map<Id, Account> acctMap = new Map<Id, Account>();
		Map<Id, Account> acctUpdateMap = new Map<Id, Account>();
		Set<Id> allAcctIds = new Set<Id>();
		
		String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		
		if (trigger.isDelete) { //if delete trigger
			for (Task tsk: oldTasks.values()) {
				
				//collect pertinent records into collections
				if (tsk.Status=='Completed' && tsk.WhoId != null && tsk.Engagement_Activity__c && tsk.ActivityDate != null) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						conIdSet.add(tsk.WhoId);
						system.debug('###Deleted Engagement Activity on Contact!');
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						ldIdSet.add(tsk.WhoId);
						system.debug('###Deleted Engagement Activity on Lead!');
					}
				}
			}
	
		} /*else { //if insert or update trigger
			for (Task tsk: trigger.new) {
				
				//if insert - set collections for contacts & Leads
				if (trigger.isInsert && tsk.Engagement_Activity__c && tsk.Status == 'Completed' && tsk.WhoId != null & tsk.ActivityDate != null) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						system.debug('###New Engagement Activity on Contact!');
						conIdSet.add(tsk.WhoId);
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						system.debug('###New Engagement Activity on Lead!');
						ldIdSet.add(tsk.WhoId);
					}
				//if update trigger - set collects for contacts & leads
				} else if (trigger.isUpdate && tsk.Engagement_Activity__c && tsk.WhoId != null && tsk.Status == 'Completed' && tsk.ActivityDate != null && (trigger.oldMap.get(tsk.id).Status != 'Completed' || tsk.ActivityDate != trigger.oldMap.get(tsk.id).ActivityDate || trigger.oldMap.get(tsk.id).Engagement_Activity__c == false)) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						system.debug('###Updated Engagement Activity on Contact!');
						conIdSet.add(tsk.WhoId);
						
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						system.debug('###Updated Engagement Activity on Lead!');
						ldIdSet.add(tsk.WhoId);
					}
				}
			}
		} */
		
		//use collection to figure out which contacts to update
		if (conIdSet.size() > 0) {
			
			system.debug('###Contacts have new/updated/deleted Engagement Activities');
			
			//query for remaining tasks on Contacts & Contact records themselves
			List<Task> tskConList = new List<Task>();
			tskConList = [SELECT ActivityDate, WhoId, AccountId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND WhoId in :conIdSet AND Engagement_Activity__c = true and ActivityDate != null all rows];
			//conMap = new Map<Id, Contact>([select id, AccountId, Last_Engagement_Date__c from Contact where id in: conIdSet and AccountId != null]);
			conMap = new Map<Id, Contact>();
			for (Contact con: allConMap.values()) {
				if (conIdSet.contains(con.id) && con.AccountId != null) conMap.put(con.id,con);
			}
			
			conToDate = new Map<Id, Date>();
			
			for (Contact c : conMap.values()) {
				allAcctIds.add(c.AccountId);
			}
			
			//set latest date collection for contact
			if (!tskConList.isEmpty()) {
				for (Task tsk : tskConList)  {
					if (conToDate.containsKey(tsk.WhoId)) {
						if (conToDate.get(tsk.WhoId) < tsk.ActivityDate) {
							system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Contact id ' + tsk.WhoId);
							conToDate.put(tsk.WhoId, tsk.ActivityDate);
						}
					} else {
						system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Contact id ' + tsk.WhoId);
						conToDate.put(tsk.WhoId, tsk.ActivityDate);
					}
				}
			}
		
			//set contacts to update
			for (Id cid : conMap.keySet()) {
				
				if (conToDate.containsKey(cid)) {
					if (conMap.get(cid).Last_Engagement_Date__c != conToDate.get(cid)) {
						system.debug('###Updating Contact Last Engagement Date to ' + conToDate.get(cid));
						Contact con = new Contact (id=cid, Last_Engagement_Date__c=conToDate.get(cid));
						conUpdateMap.put(con.id, con);
					}
				} else {
					system.debug('###Setting Contact Last Engagement Date to null');
					Contact con = new Contact(id=cid, Last_Engagement_Date__c=null);
					conUpdateMap.put(con.id, con);
				}
			}
			
			//commit changes to Contacts
			if (conUpdateMap.keySet().size() > 0) {
				update conUpdateMap.values();
			}	
		}
		
		//use collection to figure out which leads to update
		if (ldIdSet.size() > 0) {
	
			//query for remaining tasks on leads & lead records themselves
			List<Task> tskLdList = new List<Task>();
			tskLdList = [SELECT ActivityDate, WhoId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND WhoId in :ldIdSet AND Engagement_Activity__c = true and ActivityDate != null all rows];
			//ldMap = new Map<Id, Lead>([select id, Account__c, Last_Engagement_Date__c from Lead where id in: ldIdSet and Account__c != null]);
			ldMap = new Map<Id, Lead>();
			
			for (lead ld: allLeadMap.values()) {
				if (ldIdSet.contains(ld.id) && ld.Account__c != null) {
					ldMap.put(ld.id,ld);
				}
			}
			
			ldToDate = new Map<Id, Date>();
			
			for (Lead l : ldMap.values()) {
				allAcctIds.add(l.Account__c);
			}
			
			//set latest date collection for leads
			if (!tskLdList.isEmpty()) {
				for (Task tsk : tskLdList)  {
					if (ldToDate.containsKey(tsk.WhoId)) {
						if (ldToDate.get(tsk.WhoId) < tsk.ActivityDate) {
							system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Lead id ' + tsk.WhoId);
							ldToDate.put(tsk.WhoId, tsk.ActivityDate);
						}
					} else {
						system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Lead id ' + tsk.WhoId);
						ldToDate.put(tsk.WhoId, tsk.ActivityDate);
					}
				}
			}
			
			//set leads to update
			for (Id lid : ldMap.keySet()) {
				
				if (ldToDate.containsKey(lid)) {
					if (ldMap.get(lid).Last_Engagement_Date__c != ldToDate.get(lid)) {
						system.debug('###Updating Lead Last Engagement Date to ' + ldToDate.get(lid));
						Lead ld = new Lead (id=lid, Last_Engagement_Date__c=ldToDate.get(lid));
						ldUpdateMap.put(ld.id, ld);
					}
				} else {
					system.debug('###Setting Lead Last Engagement Date to null');
					Lead ld = new Lead(id=lid, Last_Engagement_Date__c=null);
					ldUpdateMap.put(ld.id, ld);
				}
			}
			
			//commit changes to Leads
			if (ldUpdateMap.keySet().size() > 0) {
				update ldUpdateMap.values();
			}
		
		}
		
		//use collections to figure out which accounts to update
		if (conMap.keyset().size() > 0 || ldMap.keyset().size() > 0) {
			
			Map<Id, Contact> fullConMap = new Map<Id, Contact>([select id, AccountId from Contact where AccountId in: allAcctIds]);
			Map<Id, Lead> fullLdMap = new Map<Id, Lead>([select id, Account__c from Lead where Account__c in: allAcctIds]);
		
			//query for remaining tasks on Accounts
			List<Task> tskAcctList = new List<Task>();
			tskAcctList = [SELECT ActivityDate, WhoId FROM Task WHERE IsDeleted = false and Status = 'Completed' AND (WhoId in :fullConMap.keySet() or WhoId in :fullLdMap.keySet()) AND Engagement_Activity__c = true and ActivityDate != null all rows];
	
			//set latest date collection for account
			if (!tskAcctList.isEmpty()) {
				for (Task tsk : tskAcctList)  {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						if (acctToDate.containsKey(fullConMap.get(tsk.WhoId).AccountId)) {
							if (acctToDate.get(fullConMap.get(tsk.WhoId).AccountId) < tsk.ActivityDate) {
								system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Account id ' + fullConMap.get(tsk.WhoId).AccountId);
								acctToDate.put(fullConMap.get(tsk.WhoId).AccountId, tsk.ActivityDate);
							}
						} else {
							system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Account id ' + fullConMap.get(tsk.WhoId).AccountId);
							acctToDate.put(fullConMap.get(tsk.WhoId).AccountId, tsk.ActivityDate);
						}
					} else {
						if (fullLdMap.containsKey(tsk.WhoId)) {
							if (acctToDate.containsKey(fullLdMap.get(tsk.WhoId).Account__c)) {
								if (acctToDate.get(fullLdMap.get(tsk.WhoId).Account__c) < tsk.ActivityDate) {
									system.debug('###Updating Date ' + tsk.ActivityDate + ' to map for Account id ' + fullLdMap.get(tsk.WhoId).Account__c);
									acctToDate.put(fullLdMap.get(tsk.WhoId).Account__c, tsk.ActivityDate);
								}
							} else {
								system.debug('###Adding Date ' + tsk.ActivityDate + ' to map for Account id ' + fullLdMap.get(tsk.WhoId).Account__c);
								acctToDate.put(fullLdMap.get(tsk.WhoId).Account__c, tsk.ActivityDate);
							}
						}
					}
				}
			}
			
			if (allAcctIds.size() > 0) {
				
				//query account records
				acctMap = new Map<Id, Account>([select id, Last_Engagement_Date__c from Account where id in: allAcctIds]);
		
				//set accounts to update
				for (Id aid : acctMap.keySet()) {
					
					if (acctToDate.containsKey(aid)) {
						if (acctMap.get(aid).Last_Engagement_Date__c != null) {
							if (acctMap.get(aid).Last_Engagement_Date__c != acctToDate.get(aid)) {
								system.debug('###Updating Account Last Engagement Date to ' + acctToDate.get(aid));
								Account acct = new Account (id=aid, Last_Engagement_Date__c=acctToDate.get(aid));
								acctUpdateMap.put(acct.id, acct);
							}
						} else {
							system.debug('###Setting Account Last Engagement Date to ' + acctToDate.get(aid));
							Account acct = new Account (id=aid, Last_Engagement_Date__c=acctToDate.get(aid));
							acctUpdateMap.put(acct.id, acct);
						}
					} else {
						if (acctMap.get(aid).Last_Engagement_Date__c != null) {
							system.debug('###Updating Account Last Engagement Date to null.');
							Account acct = new Account(id = aid, Last_Engagement_Date__c = null);
							acctUpdateMap.put(acct.id, acct);
						}
					}
				}
				
				//commit changes to Accounts
				if (acctUpdateMap.keySet().size() > 0) {
					update acctUpdateMap.values();
				}
			}
			
		}

	}	// end of TaskSetLastEngagement method
	
	
	/** 
	*	[T5] TaskSetOpenFlagOnLeadContact
	*
	* 	Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
	* 	Description: When a Task is opened on a Lead or Contact, update the "Open Task" checkbox on that person's record.
	*		When a Task is closed or deleted on a Lead or Contact, check to see if there are any more open Tasks
	*		under that person and update the "Open Task" checkbox if warranted. 
	*/
	public static void TaskSetOpenFlagOnLeadContact(List<Task> tasks, Map<id,Task> oldTasks) {
		Set<Id> openConIds = new Set<Id>();
		Set<Id> openLdIds = new Set<Id>();
		Set<Id> closedConIds = new Set<Id>();
		Set<Id> closedLdIds = new Set<Id>();
		String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
		String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
		
		if (trigger.isDelete) {
			for (Task tsk: oldTasks.values()) {
				if (tsk.IsClosed == false && tsk.WhoId != null) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						closedConIds.add(tsk.WhoId);
						system.debug('###Deleted Task on Contact!');
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						closedLdIds.add(tsk.WhoId);
						system.debug('###Deleted Task on Lead!');
					}
				}
			}
		} else {
			for (Task tsk: tasks) {
				if (tsk.WhoId != null) {
					if (trigger.isInsert && tsk.IsClosed == false) {
						if (((String)tsk.WhoId).startsWith(conPrefix)) {
							openConIds.add(tsk.WhoId);
							system.debug('###Open Task on Contact!');
						} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
							openLdIds.add(tsk.WhoId);
							system.debug('###Open Task on Lead!');
						}
					} else if (trigger.isUpdate && oldTasks.get(tsk.id).IsClosed == true && tsk.IsClosed == false) {
						if (((String)tsk.WhoId).startsWith(conPrefix)) {
							openConIds.add(tsk.WhoId);
							system.debug('###Open Task on Contact!');
						} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
							openLdIds.add(tsk.WhoId);
							system.debug('###Open Task on Lead!');
						}
					} else if (trigger.IsUpdate && oldTasks.get(tsk.id).IsClosed == false && tsk.IsClosed == true) {
						if (((String)tsk.WhoId).startsWith(conPrefix)) {
							closedConIds.add(tsk.WhoId);
							system.debug('###Closed Task on Contact!');
						} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
							closedLdIds.add(tsk.WhoId);
							system.debug('###Closed Task on Lead!');
						}
					}
				}
			}
		}
			
			if (openConIds.size() > 0) {
				//List<Contact> conUpdateList = [select Open_Task__c,Scheduled_Demo__c, Demo_Date__c, Demo_Assigned_To__c, Related_Opportunity__c, VM_Count__c, Host_Count__c, Socket_Count__c, Sales_Engineer_for_Demo__c, Demo_Notes__c from Contact where id in: openConIds];
				List<Contact> conUpdateList = new List<Contact>();
				for (Contact con: allConMap.values()) {
					if (openConIds.contains(con.id)) conUpdateList.add(con);
				}
				
				for (Contact con: conUpdateList) {
					con.Open_Task__c = true;
					
					//Reset contact fields from Auto Demo Creation
					con.Scheduled_Demo__c = False;
					con.Demo_Date__c = null;
					con.Demo_Assigned_To__c = null;
					con.Related_Opportunity__c = null;
					con.VM_Count__c = null;
					con.Host_Count__c = null;
					con.Socket_Count__c = null;
					con.Sales_Engineer_for_Demo__c = null;
					con.Demo_Notes__c = null; 
				}
				update conUpdateList;
				
			}
			
			if (openLdIds.size() > 0) {
				//List<Lead> ldUpdateList = [select Open_Task__c from Lead where id in: openLdIds];
				List<Lead> ldUpdateList = new List<Lead>();
				
				for (Lead ld: allLeadMap.values()) {
					if (openLdIds.contains(ld.id)) ldUpdateList.add(ld);
				}
				
				for (Lead ld: ldUpdateList) {
					ld.Open_Task__c = true;
				}
				update ldUpdateList;
				
			}
			
			if (closedConIds.size() > 0) {
				
				AggregateResult[] groupedResults = [SELECT WhoId, COUNT(Id) numOpenTasks FROM Task WHERE IsClosed = false AND WhoId in :closedConIds GROUP BY WhoId];
				
				//Create map to hold contact ID & number of open tasks, prime it with 0
			  	Map<Id, Double> conMap = new Map<Id, Double>(); 
			  	for (ID cid : closedConIds) {
			  		conMap.put(cid, 0);
			  	}
			  	
				if (!groupedResults.isEmpty()) {
				  	for (AggregateResult ar : groupedResults)  {
				    	If (ar.get('WhoId') != null){
				    		//store results of query in map
				    		system.debug('###Contact ID: ' + (Id)ar.get('WhoId'));
				    		system.debug('###Count of open Tasks: ' + (Double)ar.get('numOpenTasks'));
				    		conMap.put((Id)ar.get('WhoId'), (Decimal)ar.get('numOpenTasks'));
				    	}
					}
			  	}
			  	
				List<Contact> conUpdateList = [select Open_Task__c from Contact where id in: closedConIds];
				for (Contact con: conUpdateList) {
					if (conMap.get(con.id) == 0) con.Open_Task__c = false;
					else con.Open_Task__c = true;
				}
				update conUpdateList;
			}
			
			if (closedLdIds.size() > 0) {
				AggregateResult[] groupedResults = [SELECT WhoId, COUNT(Id) numOpenTasks FROM Task WHERE IsClosed = false AND WhoId in :closedLdIds GROUP BY WhoId];
				
				//Create map to hold lead ID & number of open tasks, prime it with 0
			  	Map<Id, Double> ldMap = new Map<Id, Double>(); 
			  	for (ID lid : closedLdIds) {
			  		ldMap.put(lid, 0);
			  	}
			  	
				if (!groupedResults.isEmpty()) {
				  	for (AggregateResult ar : groupedResults)  {
				    	If (ar.get('WhoId') != null){
				    		//store results of query in map
				    		system.debug('###Lead ID: ' + (Id)ar.get('WhoId'));
				    		system.debug('###Count of open Tasks: ' + (Double)ar.get('numOpenTasks'));
				    		ldMap.put((Id)ar.get('WhoId'), (Decimal)ar.get('numOpenTasks'));
				    	}
					}
			  	}
			  	
				List<Lead> ldUpdateList = [select Open_Task__c from Lead where id in: closedLdIds and isConverted = false];
				for (Lead ld: ldUpdateList) {
					if (ldMap.get(ld.id) == 0) ld.Open_Task__c = false;
					else ld.Open_Task__c = true;
				}
				update ldUpdateList;
			}
		
	}	// end of TaskSetOpenFlagOnLeadContact method
	
	//	[T6]
	public static void TaskStatusProgression(List<Task> tasks, Map<id,Task> oldTasks) {
		list<Task> initialList = new List<Task>();
		list<Task> conTaskList = new List<Task>();
		List<Task> leadTaskList = new List<Task>();
		
		for (Task tsk : tasks) {
			if (UserInfo.getUserId() != '00557000006761TAAQ') {
				if (!oldTasks.containsKey(tsk.id)) {
					if (tsk.isClosed && tsk.call_disposition__c != null && tsk.WhoId != null) {
						initialList.add(tsk);
					}
				}
				else if (!oldTasks.get(tsk.id).isClosed && tsk.call_disposition__c != null && tsk.whoId != null && tsk.isClosed) {
					initialList.add(tsk);
				}
			}
		}
		
		system.debug('### tsk trigger has ' + initialList.size() + ' elements');
		
		if (initialList.size() > 0) {
			Set<Id> conIdSet = new Set<Id>();
			Set<Id> leadIdSet = new Set<Id>();
			
			//divide into contact and lead task lists
			for (Task tsk : initialList) {
				if (tsk.whoId.getSobjectType() == Schema.Contact.sObjectType) {
					conIdSet.add(tsk.WhoId);
					conTaskList.add(tsk);
				}
				if (tsk.whoId.getSobjectType() == Schema.Lead.sObjectType) {
					leadIdSet.add(tsk.WhoId);
					leadTaskList.add(tsk);
				}
			}
			
			//Map<id,Contact> contactMap = new Map<id,Contact>([select id, contact_status__c, status_reason__c, owner.UserRole.Name from Contact where id in: conIdSet]);
			//Map<id,Lead> leadMap = new Map<id,Lead>([select id, status, CFCR_Status_Reason__c, Owner.UserRole.Name from Lead where id in: leadIdSet]);
			
			Map<id,Contact> contactMap = new Map<id,Contact>();
			Map<id,Lead> leadMap = new Map<id,Lead>();
			
			for (Contact con: allConMap.values()) {
				if (conIdSet.contains(con.id)) contactMap.put(con.id,con);
			}
			
			for (Lead ld: allLeadMap.values()) {
				if (leadIdSet.contains(ld.id)) leadMap.put(ld.id,ld);
			}
			
			
			system.debug('### contactMap has ' + contactMap.size() + ' Contacts');
			system.debug('### leadMap has ' + leadMap.size() + ' Leads');
			
			List<Contact> conUpdate = new List<Contact>();
			List<Lead> leadUpdate = new List<Lead>();
			
			for (Task tsk : conTaskList) {
				if (tsk.call_disposition__c == 'Connect' || tsk.call_disposition__c == 'Conversation') {
					Contact currCon = contactMap.get(tsk.whoId);
					if (currCon.Contact_Status__c == 'New' || currCon.Contact_Status__c == 'Suspect') {
						currCon.Contact_Status__c = 'Working';
						conUpdate.add(currCon);
					}
				}
			}
			
			for (Task tsk : leadTaskList) {
				if (tsk.call_disposition__c == 'Connect' || tsk.call_disposition__c == 'Conversation') {
					Lead currLead = leadMap.get(tsk.whoId);
					if (currLead.status == 'New' || currLead.status == 'Suspect') {
						currLead.status = 'Working';
						leadUpdate.add(currLead);
					}
				}
			}
			
			if (conUpdate.size() > 0) update conUpdate;
			if (leadUpdate.size() > 0) update leadUpdate;
		}
		
	}	// end of TaskStatusProgression method
	
	/*
	*	[T7] TaskStampWarmAccount
	*	Stamps the account warm status at time of task create.
	*
	*/
	public static void TaskStampWarmAccount(List<Task> tskList) {
		Set<id> ConSet = new Set<id>();
		Set<id> LeadSet = new Set<id>();
		Set<id> AcctSet = new Set<id>();
		Map<id,id> TaskToAccountMap = new Map<id,id>();
		Map<id,id> WhoToAcctMap = new Map<id,id>();
		
		//Loop through tasks and collect the associated WhoId into the appropriate Set
		for (Task tsk: tskList) {
			if (tsk.WhoId != null) {
				if (tsk.WhoId.getSObjectType() == Contact.sObjectType) {
					ConSet.add(tsk.WhoId);
				}
				else if (tsk.WhoId.getSObjectType() == Lead.sObjectType) {
					LeadSet.add(tsk.WhoId);
				}
			}
		}
		
		//If the associated set is not empty, query the appropriate object for their associated Account and insert into the Account Set
		if (!ConSet.isEmpty()) {
			//Map<id,Contact> conMap = new Map<id,Contact>([SELECT id, AccountId FROM Contact WHERE id in: conSet]);
			Map<id,Contact> conMap = new Map<id,Contact>();
			
			for (Contact con: allConMap.values()) {
				if (ConSet.contains(con.id)) conMap.put(con.id,con);
			}
			
			for (Contact con: conMap.values()) {
				if (con.AccountId != null) {
					AcctSet.add(con.AccountId);
					WhoToAcctMap.put(con.id,con.AccountId);
				}
			}
		}
		
		if (!LeadSet.isEmpty()) {
			//Map<id,Lead> LeadMap = new Map<id,Lead>([SELECT id, Account__c FROM Lead WHERE id in: LeadSet]);
			Map<id,Lead> LeadMap = new Map<id,Lead>();
			
			for (Lead ld: allLeadMap.values()) {
				if (LeadSet.contains(ld.id)) LeadMap.put(ld.id,ld);
			}
			
			for (Lead ld: LeadMap.values()) {
				if (ld.Account__c != null) {
					AcctSet.add(ld.Account__c);
					WhoToAcctMap.put(ld.id,ld.Account__c);
				}
			}
		}
		
		
		if (!AcctSet.isEmpty()) {
			 //Map<id,Account> AccountMap = new Map<id,Account>([SELECT id, Warm_Account__c FROM Account WHERE id in: AcctSet]);
			 Map<id,Account> AccountMap = new Map<id,Account>();
			 
			 for (Account acct: allAcctMap.values()) {
			 	if (AcctSet.contains(acct.id)) AccountMap.put(acct.id, acct);
			 }
			 
			 for (Task tsk: tskList) {
				if (tsk.WhoId != null) {
					if (WhoToAcctMap.keySet().contains(tsk.WhoId)) {
						if (AccountMap.keySet().contains(WhoToAcctMap.get(tsk.WhoId))) { 
							tsk.Warm_Account_Stamp__c = AccountMap.get(WhoToAcctMap.get(tsk.WhoId)).Warm_Account__c;
						}
					}
				}
			}
		}
	}	// end of TaskStampWarmAccount method
	
	
	/*
	*	[T8] TaskSetLatestOutcome
	*	This method will stamp the task comments on the Opportunity most recent outcome/change field 
	*	for the related opportunity once a task is completed.
	*
	*	Calls setOppMostRecentOutcomeChange method on Task Future Methods class
	*
	*/
	public static void TaskSetOppLatestOutcome(List<Task> tskList) {
	
		Map<id,Task> taskOppMap = new Map<id,Task>();
		
		if (!VMTUtils.inBatch) { //do not run this trigger if we are within a batch method because a batch class cannot call a future method
		
			for (Task tsk: tskList) {
				if (tsk.Status == 'Completed' && tsk.Description != null && tsk.Type != 'Email') {
					if (tsk.WhatId != null) {
						if (tsk.WhatId.getSObjectType() == Opportunity.sObjectType) {
							taskOppMap.put(tsk.Whatid,tsk);
						}
					}
				}
			}
			
			if (taskOppMap.size() > 0) {
				TaskFutureMethods.setOppMostRecentOutcomeChange(taskOppMap);
			}
		}
	}
	
	
	/*
	*	[T9] TaskSetOppReferralCompleted
	*	Sets Customer Referral Completed Flag to true on associated Opportunity for
	*	completed Referral Tasks
	*/
	public static void TaskSetOppReferralCompleted(List<Task> tskList) {
		List<id> oppIds = new List<id>();
		
		if (!VMTUtils.inBatch) { //do not run this trigger if we are within a batch method because a batch class cannot call a future method
			for (Task tsk: tskList) {
				if (tsk.Type == 'Referral' && tsk.Status == 'Completed') {
					if (tsk.WhatId != null) {
						oppIds.add(tsk.WhatId);
					}
				}
			}
			
			if (oppIds.size() > 0) TaskFutureMethods.setOppReferralMet(oppIds);
		}
	}


	/*
	*	[T10] UpdateLastAcctOutcomeDate
	*	Replacement method for BatchUpdateLastAcctOutcomeDate. 
	*	Updates the Last outcome date on the related account.
	*
	*/
	public static void updateLastAcctOutcomeDate(List<Task> tskList) {
    	String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
    	Map<Id, Date> acctLastActOutcomeDate = new Map<Id, Date>();

    	for (Task tsk: tskList) {
    		if (tsk.Status == 'Completed' && tsk.Outcomes__c != null && tsk.Owner.Profile.Name != 'Marketo Profile' && tsk.IsDeleted == false && tsk.ActivityDate != null) {
    			
				if(tsk.AccountId != null){ 
					system.debug('###Task associated with Account!');

					if (allAcctMap.containsKey(tsk.AccountId)) {
						if (allAcctMap.get(tsk.AccountId).Last_Activity_With_Outcome_Date__c == null || tsk.ActivityDate > allAcctMap.get(tsk.AccountId).Last_Activity_With_Outcome_Date__c) {
						
							if (acctLastActOutcomeDate.containsKey(tsk.AccountId)) {
								if (tsk.ActivityDate > acctLastActOutcomeDate.get(tsk.AccountId)) {
									acctLastActOutcomeDate.put(tsk.AccountId, tsk.ActivityDate);
								}
							} else {
								acctLastActOutcomeDate.put(tsk.AccountId, tsk.ActivityDate);
							}
						}
					}
				}
					
				if (tsk.WhoId != null) {
					if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						if (allLeadMap.containsKey(tsk.WhoId)) {
							if(allLeadMap.get(tsk.WhoId).Account__c != null) {
								if (allAcctMap.get(allLeadMap.get(tsk.WhoId).Account__c).Last_Activity_With_Outcome_Date__c == null || tsk.ActivityDate > allAcctMap.get(allLeadMap.get(tsk.WhoId).Account__c).Last_Activity_With_Outcome_Date__c) {
									if (acctLastActOutcomeDate.containsKey(allLeadMap.get(tsk.WhoId).Account__c)) {
										if (tsk.ActivityDate > acctLastActOutcomeDate.get(allLeadMap.get(tsk.WhoId).Account__c)) {
											acctLastActOutcomeDate.put(allLeadMap.get(tsk.WhoId).Account__c, tsk.ActivityDate); 
										}
									} else {
										acctLastActOutcomeDate.put(allLeadMap.get(tsk.WhoId).Account__c, tsk.ActivityDate);
									}
								}
							}
						}
					}
				}
			}
    	}

    	Map<id, Account> filteredAccts = new Map<id, Account>();
		for (id acctId: acctLastActOutcomeDate.KeySet()) {
			filteredAccts.put(acctId,allAcctMap.get(acctId));
		}

		List<Account> updateAccts = new List<Account>();
		for (Account acct: filteredAccts.values()) {
			Boolean updated = false;
			if (acctLastActOutcomeDate.containsKey(acct.id)) {
				if (acct.Last_Activity_With_Outcome_Date__c != acctLastActOutcomeDate.get(acct.id)) {
					acct.Last_Activity_With_Outcome_Date__c = acctLastActOutcomeDate.get(acct.id);
					updated = true;
				}
			}
			
			if (acct.last_customer_touchPoint__c != null) {

				Integer days = acct.last_customer_touchpoint__c.date().daysBetween(Date.today());
			
				if (days > 120) {

					if (acct.Customer_Attention_Reason_NEW__c != null) {
							
					} else {
						acct.Customer_Attention_Reason_NEW__c = 'No interaction in 4+ months';
						updated = true;
					}

					
				}
			}
			
			if (updated) updateAccts.add(acct);
		}
		if (updateAccts.size() > 0) update updateAccts;


    }
    
	/*
	*	[T11] CopyCallDisposition
	*	Copies the Call Disposition onto a custom field
	*
	*/
	public static void CopyCallDisposition(List<Task> tskList) {
		
		for (Task tsk: tskList) {
			if (tsk.CallDisposition != null) tsk.Call_Disposition__c = tsk.CallDisposition;
		}
	}
	
	
	
	/*
	*	[T12] allTaskQueries
	*	Utility Method for the Task Trigger. Consolidates all Lead, Contact, and Account queries related to tasks
	*	into associated maps to be used across all Task Trigger Methods.
	*
	*/
	public static void allTaskQueries(List<Task> tskList) {
		Set<id> conIds = new Set<id>();
		Set<id> ldIds = new Set<id>();
		Set<id> AcctIds = new Set<id>();
		
		for (Task tsk: tskList) {
			if (tsk.WhoId != null) {
				if (tsk.WhoId.getSObjectType() == Contact.sObjectType) {
					conIds.add(tsk.WhoId);
				}
				else if (tsk.WhoId.getSObjectType() == Lead.sObjectType) {
					ldIds.add(tsk.WhoId);
				}
			}
			if (tsk.AccountId != null) {
				AcctIds.add(tsk.AccountId);
			}
		}
		
		
		if (conIds.size() > 0) {
			allConMap = new Map<id, Contact>([select Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, AccountId, Concierge_Routing_Reason__c, contact_status__c, status_reason__c, owner.UserRole.Name, Open_Task__c,Scheduled_Demo__c, Demo_Date__c, Demo_Assigned_To__c, Related_Opportunity__c, VM_Count__c, Host_Count__c, Socket_Count__c, Sales_Engineer_for_Demo__c, Demo_Notes__c from Contact where id in: conIds]);
		} else allConMap = new Map<id, Contact>();
		if (ldIds.size() > 0) {
			allLeadMap = new Map<id, Lead>([select Name, Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, Account__c, Status_Change_Date__c, Dial_Count_Since_Last_Status_Change__c, isConverted, Concierge_Routing_Reason__c, status, CFCR_Status_Reason__c, Owner.UserRole.Name, Open_Task__c from Lead where id in: ldIds]);
		} else allLeadMap = new Map<id, Lead>();
		
		//If the associated set is not empty, query the appropriate object for their associated Account and insert into the Account Set
		if (allConMap.size() > 0) {
			for (Contact con: allConMap.values()) {
				if (con.AccountId != null) {
					AcctIds.add(con.AccountId);
				}
			}
		}
		
		if (allLeadMap.size() > 0) {
			for (Lead ld: allLeadMap.values()) {
				if (ld.Account__c != null) {
					AcctIds.add(ld.Account__c);
				}
			}
		}
		
		if (AcctIds.size() > 0) {
			allAcctMap = new Map<id, Account>([select id, Last_Engagement_Date__c, Dial_Count__c, Last_Dial_Date__c, Core_Count__c, Last_Core_Count_Update_Date__c, Socket_Count__c, Last_Socket_Count_Update_Date__c, VM_Count__c, Last_VM_Count_Update_Date__c, Hardware_Vendor__c, Hypervisor_Vendor__c, Storage_Vendor__c, Warm_Account__c, Last_Activity_With_Outcome_Date__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c from Account where id in: AcctIds]);
		} else allAcctMap = new Map<id, Account>();
	}

}