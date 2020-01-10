/* 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: 
*   1. When a Task of Type "Call" is completed, update Last Dial Date and increment Dial Count fields on Contact, Lead & Account. 
*      Set Last Dial Date to Task Due Date unless Due Date is null, then set to today. If Last Dial Date is > today, then set to today.
*   2. When a "tech" Task is completed, if tech fields are set, update the corresponding Tech fields on the related Account.
*/
trigger TaskAfterInsertUpdate on Task (after insert, after update) {
	/*
	List<Task> tskList = new List<Task>();
	
	//collect pertinent Tasks
	for (Task tsk: trigger.new) {
		if (tsk.Type != null && tsk.Type != 'Email') {
			if (trigger.isInsert && tsk.Status == 'Completed') {
				system.debug('###Insert Task found!');
				tskList.add(tsk);
			} else if (trigger.isUpdate && trigger.oldMap.get(tsk.id).Status != 'Completed' && tsk.Status == 'Completed') {
				system.debug('###Update Task found!');
				tskList.add(tsk);
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
			conMap = new Map<id, Contact>([select Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, AccountId, Concierge_Routing_Reason__c from Contact where id in: conIds]);
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
			 leadMap = new Map<id, Lead>([select Name, Dial_Count__c, Last_Dial_Date__c, Last_Engagement_Date__c, Account__c, Status_Change_Date__c, Dial_Count_Since_Last_Status_Change__c, isConverted, Concierge_Routing_Reason__c from Lead where id in: ldIds]);
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
			acctMap = new Map<id, Account>([select id, Last_Engagement_Date__c, Dial_Count__c, Last_Dial_Date__c, Core_Count__c, Last_Core_Count_Update_Date__c, Socket_Count__c, Last_Socket_Count_Update_Date__c, VM_Count__c, Last_VM_Count_Update_Date__c, Hardware_Vendor__c, Hypervisor_Vendor__c, Storage_Vendor__c from Account where id in: acctDialCount.keySet() or id in: acctTechMap.keySet()]);
			
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
	*/
}