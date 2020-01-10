global class LeadMethods {
	
/*	
*	Index	Method Name									Method Description
*	-------------------------------------------------------------------------------------------------------------------------
*	[L1]	LeadLinkToAccount							auto link leads to accounts 
*	[L2]	LeadFillRoundRobinNumber					fill round robin number for lead assignment rules
*	[L3]	LeadOwnerUpdate								update task owner based on lead owner update
*	[L4]	LeadStampOriginalOwner						stamp original inbound SDR owner after Marketo reassigns lead
*	[L5]	LeadTriggerAssignmentRules					re-trigger assignment rules based on email change/phone number fill
*	[L6]	LeadDispositionSlaMet						mark open sla met if lead converted or dispositioned within 24 hours
*	[L7] 	reparentSLAsOnLeadMerge                		Checks if merge causes multiple open SLAs on a single record and closes all but most recent SLA if so
*	[L8] 	setLeadLookups								Set the Active Lead Lookup to Account for active Leads
*	[L9]	createCampaignMemberAfterInsert				Workaround for DupeBlocker auto-merge scenarios. Creates a CM record after insert to ensure it gets merged properly
*	[L10]    UtilLeadToAcctMatch
*/
	
	
	/*
 	*  [L1] LeadLinkToAccount Method
	*
	*/ 
	public static void LeadLinkToAccount(Map<id,Lead> leads, Map<id,Lead> oldLeads) {
		
		List<Lead> newLeadsNoAcct = new List<Lead>();
	    List<Lead> newInboundLeadNoAcct = new List<Lead>();
	    List<Lead> newLeadsWithAcct = new List<Lead>();
	    Map<id,Integer> leadToCompDOIds = new Map<id,Integer>();
	    List<Lead> discoverOrgLeads = new List<Lead>();
	    Map<id,String> leadToEmailMap = new Map<id,String>();
	    Map<id,Lead> leadEmailMap = new Map<id,Lead>();
		
		for (Lead ld : leads.values()) {
			if (ld.Ready_to_Link_to_Account__c == true && ld.lastName != 'Switchboard') {// this flag indicates that the assignment rules have already run
	        	if (ld.Account__c == null) {
	        		//process discoverorg leads
	        		if (ld.DiscoverOrg_Company_ID_VMT__c != null) {
	        			system.debug('### DiscoverOrg Lead found');
	        			leadToCompDOIds.put(ld.id,(Integer)ld.DiscoverOrg_Company_ID_VMT__c);
	        		//process other leads
	        		} else {
	        			if (ld.email != null && !ld.personal_email__c) {
	        				system.debug('### Lead with Email Found');
	        				leadToEmailMap.put(ld.id,ld.domain_for_acct_link__c);
	        				leadEmailMap.put(ld.id,ld);
	        			} else {
	        				system.debug('### Lead with cleaned account name found');
	        				newLeadsNoAcct.add(ld);
	        			}
	        		}
	        	} else {
	        		system.debug('### Lead with Account attached found');
	        		newLeadsWithAcct.add(ld);
	        	}
			}
		}
		
		Map<Id,User> usrMap;
	    if (newLeadsNoAcct.size() > 0 || newLeadsWithAcct.size() > 0 || leadToCompDOIds.size() > 0 || leadToEmailMap.size() > 0) {
	    	usrMap = new Map<Id, User>([select id, Name from User where isActive = true]);
	    }
	    
	    if (leadToCompDOIds.size() > 0) {
	    	Map<id,Account> acctMap = new Map<id,Account>([select id, name, ownerId, DiscoverOrg_ID_VMT__c from Account where DiscoverOrg_ID_VMT__c in: leadToCompDOIds.values()]);
	    	if (acctMap.size() > 0) {
		    	Map<Integer,Account> acctToDOIds = new Map<Integer,Account>();
		    	//organize accounts into mappings by DiscoverOrg ID
		    	for (Account a : acctMap.values()) {
		    		acctToDOIds.put((Integer)a.DiscoverOrg_Id_VMT__c,a);
		    	}
		    	for (Id leadId : leadToCompDOIds.keySet()) {
		    		Lead l = leads.get(leadId);
		    		if (acctToDOIds.containsKey((Integer)l.DiscoverOrg_Company_ID_VMT__c)) {
		    			l.account__c = acctToDOIds.get((Integer)l.DiscoverOrg_Company_ID_VMT__c).id;
		    			l.ownerId = acctToDOIds.get((Integer)l.DiscoverOrg_Company_ID_VMT__c).ownerId;
		    			l.Ready_to_Link_to_Account__c = false;
		    			system.debug('### matched to discoverOrg account');
		    			system.debug('### sending ' + l.name + ' to ' + acctMap.get(l.account__c).name);
		    		} else {
		    			//no Account DiscoverOrg IDs match what is in the Lead DiscoverOrg Company ID field
		    			//push the unmatched leads to the more general lead processing bucket
		    			if (l.email != null && !l.personal_email__c) {
		        			leadToEmailMap.put(l.id,l.domain_for_acct_link__c);
		        		} else {
		        			newLeadsNoAcct.add(l);
		        		}
		    		}
		    	}
	    	}
	    }
	    
	    Map<String,US_Velocity_State_Alignments__c> stateMappings = US_Velocity_State_Alignments__c.getAll();
	    Map<String,International_Alignments__c> countryMappings = International_Alignments__c.getAll();
	    
	    if (leadToEmailMap.size() > 0) {
	    	Map<id,Account> acctMap = new Map<id,Account>([select id, name, ownerId, ops_it_budget__c, Email_for_Lead_link__c, BillingState, BillingCountry from Account where Email_for_Lead_Link__c in: leadToEmailMap.values()]);
	    	if (acctMap.size() > 0) {
	    		system.debug('### found ' + acctMap.size() + ' accounts that matched email domain');
		    	Map<String,List<Account>> acctDomains = new Map<String,List<Account>>();
		    	for (Account a : acctMap.values()) {
		    		if (acctDomains.containsKey(a.Email_for_lead_link__c)) {
		    			List<Account> tempList = acctDomains.get(a.email_for_lead_link__c);
		    			tempList.add(a);
		    			acctDomains.put(a.email_for_lead_link__c,tempList);
		    		} else {
		    			List<Account> tempList = new List<Account>();
		    			tempList.add(a);
		    			acctDomains.put(a.email_for_lead_link__c,tempList);
		    		}
		    	}
		    	if (acctDomains.size() > 0) {
			    	for (Id leadId : leadToEmailMap.keySet()) {
			    		Lead l = leads.get(leadId);
			    		if (acctDomains.containsKey(l.domain_for_acct_link__c)) {
			    			List<Account> tempList = acctDomains.get(l.domain_for_acct_link__c);
			    			if (tempList.size() > 0) {
			    				if (tempList.size() == 1) {
			    					Account a = tempList.get(0);
			    					l.account__c = a.id;
			    					l.ownerId = a.ownerId;
			    					l.Ready_to_Link_to_Account__c = false;
			    					system.debug('### matched to email domain account - only email domain account match');
			    				} else {
			    					for (Integer i=0; i<tempList.size(); i++) {
			    						Account a = tempList.get(i);
			    						Integer tempResult = UtilLeadToAcctMatch(l,a);
			    						system.debug('### result from UtilLeadToAcctMatch for ' + l.firstName + ' ' + l.lastName + ' is ' + tempResult);
			    						if (tempResult == 10 || tempResult == 11) {
			    							l.account__c = a.id;
			    							l.ownerId = a.ownerId;
			    							l.ready_to_link_to_account__c = false;
			    							break;
			    						} else if (tempResult == 6 || tempResult == 5) {
			    							l.account__c = a.id;
			    							l.ownerId = a.ownerId;
			    							l.ready_to_link_to_account__c = false;
			    						}
 			    					}
 			    					if (l.account__c == null) {
 			    						l.account__c = tempList.get(0).id;
 			    						l.ownerId = tempList.get(0).ownerId;
 			    						l.Ready_to_Link_to_Account__c = false;
 			    					}
			    				}
			    			} else {
			    				system.debug('### accounts found, but no match. Passing off to account name match from email match');
			    				newLeadsNoAcct.add(l);
			    			}
			    		} else {
			    			system.debug('### no matching email domain accounts found. Passing off to account name match');
			    			newLeadsNoAcct.add(l);
			    		}
			    	}
		    	}
	    	} else {
	    		system.debug('### no account domain matches found: transferring to name match');
	    		newLeadsNoAcct.addAll(leadEmailMap.values());
	    	}
	    }
	    
	    Map<Id, Account> accountUpdates = new Map<Id, Account>();
	    
	    if (newLeadsNoAcct.size() > 0) {
	    	system.debug('### cleaned account matches has ' + newLeadsNoAcct.size() + ' leads to process');
	    	Set<String> acctNames = new Set<String>();
	    	for (Lead l : newLeadsNoAcct) {
	    		acctNames.add(l.Clean_company__c);
	    	}
	    	Map<id,Account> acctMap = new Map<id,Account>([select Id, Clean_account_name__c, ops_it_budget__c, OwnerId, Lead_source_transfer__c, AnnualRevenue, NumberOfEmployees, BillingStreet, BillingCity, 
	        			BillingPostalCode, BillingState, BillingCountry, Industry, Website from Account where Clean_account_name__c in: acctNames ]);
	        Map<String,List<Account>> acctNameMap = new Map<String,List<Account>>();
	        for (Account a : acctMap.values()) {
	        	if (acctNameMap.containsKey(a.clean_account_name__c)) {
	        		List<Account> tempList = acctNameMap.get(a.clean_account_name__c);
	        		tempList.add(a);
	        		acctNameMap.put(a.clean_account_name__c,tempList);
	        	} else {
	        		List<Account> tempList = new List<Account>();
	        		tempList.add(a);
	        		acctNameMap.put(a.clean_account_name__c,tempList);
	        	}
	        }
	        if (acctNameMap.size() > 0) {
	        	
		        for (Lead l : newLeadsNoAcct) {
		        	
		        	if (acctNameMap.containsKey(l.clean_company__c)) {
		        		List<Account> tempList = acctNameMap.get(l.clean_company__c);
		        		if (tempList.size() > 0) {
		        			if (tempList.size() == 1) {
		        				
			    				Account a = tempList.get(0);
			    				
			    				l.account__c = a.id;
			    				l.ownerId = a.ownerId;
			    				l.Ready_to_Link_to_Account__c = false;
			    				
			    			} else {
			    				for (Integer i=0; i<tempList.size(); i++) {
			    					Account a = tempList.get(i);
			    					Integer tempResult = UtilLeadToAcctMatch(l,a);
		    						if (tempResult == 10 || tempResult == 11) {
		    							l.account__c = a.id;
		    							l.ownerId = a.ownerId;
		    							l.ready_to_link_to_account__c = false;
		    							break;
		    						} else if (tempResult == 6 || tempResult == 5) {
		    							l.account__c = a.id;
		    							l.ownerId = a.ownerId;
		    							l.ready_to_link_to_account__c = false;
		    						}
 			    				} 
 			    				if (l.account__c == null) {
 			    					l.account__c = tempList.get(0).id;
 			    					l.ownerId = tempList.get(0).ownerId;
 			    					l.Ready_to_Link_to_Account__c = false;
 			    				}
			    			}
			    			
			    			if (l.account__c != null) {
				    			Boolean hasChanged = false;
				    			
				    			Account a = acctMap.get(l.account__c);
			    				
			    				if (a.Lead_source_transfer__c == null || a.Lead_source_transfer__c == '') {
				        			a.Lead_source_transfer__c = l.LeadSource;
				        			hasChanged = true;
				        		}
				        		if (a.AnnualRevenue == null) {
				        			a.AnnualRevenue = l.AnnualRevenue;
				        			hasChanged = true;
				        		}
				        		if (a.NumberOfEmployees == null) {
				        			a.NumberOfEmployees = l.NumberOfEmployees;
				        			hasChanged = true;
				        		}
				        		if (a.BillingStreet == null) {
				        			a.BillingStreet = l.Street;
				        			hasChanged = true;
				        		}
				        		if (a.BillingCity == null) {
				        			a.BillingCity = l.City;
				        			hasChanged = true;
				        		}
				        		if (a.BillingPostalCode == null) {
				        			a.BillingPostalCode = l.PostalCode;
				        			hasChanged = true;
				        		}
				        		if (a.BillingState == null) {
				        			if (l.State == null || l.State == '') a.BillingState = l.mkto71_Inferred_State_Region__c;
				        			else a.BillingState = l.State;
				        			hasChanged = true;
				        		}
				        		if (a.BillingCountry == null) {
				        			if (l.Country == null || l.Country == '') a.BillingCountry = l.mkto71_Inferred_Country__c;
				        			else a.BillingCountry = l.Country;
				        			hasChanged = true;
				        		}
				        		if (a.Industry == null) {
				        			a.Industry = l.Industry;
				        			hasChanged = true;
				        		}
				        		if (a.Website == null) {
				        			a.Website = l.Website;
				        			hasChanged = true;
				        		}
			    				
			    				if (hasChanged) {
			    					accountUpdates.put(a.id,a);
			    				}
			    			}
		        		}
		        	}
		        }
	        }
	    }
	    
	    if (newLeadsWithAcct.size() > 0) {
	    	//see if any of these companies already exist in the system & create a map of Account name to Account
	        Set<Id> acctIds = new Set<Id>();
	        for (Lead ld : newLeadsWithAcct){
	            acctIds.add(ld.Account__c);
	        }
	        Map<Id, Account> acctMap = new Map<Id, Account>([select Id, Name, OwnerId, Lead_source_transfer__c, AnnualRevenue, NumberOfEmployees, BillingStreet, BillingCity, 
	        			BillingPostalCode, BillingState, BillingCountry, Industry, Website from Account where id in: acctIds]);
	
	        for (Lead ld : newLeadsWithAcct) {
	
	        	//make sure not to assign Lead to inactive Owner
	        	if(usrMap.containsKey(acctMap.get(ld.Account__c).OwnerId)) {
	        		ld.OwnerId = acctMap.get(ld.Account__c).OwnerId;
	        	}
	        	ld.Ready_to_Link_to_Account__c = false;
	        
	            //update Account fields, if appropriate
	        	Boolean hasChanged = false;
	        	if (acctMap.get(ld.Account__c).Lead_source_transfer__c == null || acctMap.get(ld.Account__c).Lead_source_transfer__c == '') {
	        		acctMap.get(ld.Account__c).Lead_source_transfer__c = ld.LeadSource;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).AnnualRevenue == null) {
	        		acctMap.get(ld.Account__c).AnnualRevenue = ld.AnnualRevenue;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).NumberOfEmployees == null) {
	        		acctMap.get(ld.Account__c).NumberOfEmployees = ld.NumberOfEmployees;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).BillingStreet == null) {
	        		acctMap.get(ld.Account__c).BillingStreet = ld.Street;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).BillingCity == null) {
	        		acctMap.get(ld.Account__c).BillingCity = ld.City;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).BillingPostalCode == null) {
	        		acctMap.get(ld.Account__c).BillingPostalCode = ld.PostalCode;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).BillingState == null) {
	        		acctMap.get(ld.Account__c).BillingState = ld.State;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).BillingCountry == null) {
	        		acctMap.get(ld.Account__c).BillingCountry = ld.Country;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).Industry == null) {
	        		acctMap.get(ld.Account__c).Industry = ld.Industry;
	        		hasChanged = true;
	        	}
	        	if (acctMap.get(ld.Account__c).Website == null) {
	        		acctMap.get(ld.Account__c).Website = ld.Website;
	        		hasChanged = true;
	        	}
	        	if (hasChanged) accountUpdates.put(ld.Account__c, acctMap.get(ld.Account__c));
	        }
	        
	    }
	    //update existing Accounts
	    if (accountUpdates.size() > 0) update accountUpdates.values();
	    		
	}	//end of LeadLinkToAccount method
	
	
		
	/*
 	*  [L2] LeadFillRoundRobinNumber method
	*
	*/ 
	public static void LeadFillRoundRobinNumber (List<Lead> leads) {
		
		List<Lead> roundrobinLeadList = new List<Lead>();
		
		for (Lead ld : leads) {
	        if (ld.Account__c == null) {
	        	if (ld.leadSource != null){
	        		if (!ld.leadSource.contains('Prospecting')) {
	           			roundrobinLeadList.add(ld);
	        		}
	        	} else {
	        		roundrobinLeadList.add(ld);
	        	}
	        }
		}
		
		system.debug('### round robin list size is ' + roundrobinLeadList.size());
		
		if (roundrobinLeadList.size() > 0) {

			Map<String,Lead_Round_Robin__c> setMap = Lead_Round_Robin__c.getall();
			
			Map<String,Lead_Round_Robin__c> updateLeadRRValues = new Map<String,Lead_Round_Robin__c>();
			system.debug('### custom settings has ' + updateLeadRRValues.size() + ' different RR regions');
			
			for (Lead l : roundrobinLeadList) {		// loop through all leads in set
				if (setMap.size() > 0) {
					for (String s : setMap.keySet()) {		// loop through all RR options
						Lead_Round_Robin__c lrr = setMap.get(s);
						List<String> stringList = lrr.Lead_Field_Regions__c.split(';');
						for (String apiField : stringList) { 		// loop through all associated fields with that RR geo
							if (l.get(apiField) == 'Y') {
								l.Round_Robin_Number__c = lrr.Round_Robin_Number__c;
								lrr.Round_Robin_Number__c++;
								updateLeadRRValues.put(s,lrr);
								break;
							}
						}
					}
				}
			}
			
			if (updateLeadRRValues.size() > 0) update updateLeadRRValues.values();
		}
	}	//end of LeadFillRoundRobinNumber method
	
	
	
	/*
 	*  [L3] LeadOwnerUpdate method
	*
	*/ 
	public static void LeadOwnerUpdate(Map<id,Lead> leads, Map<id,Lead> oldLeads) {
		Map<Id, Id> leadToNewOwnerMap = new Map<Id, Id>();
		Map<Id, Id> leadToPrevOwnerMap = new Map<Id, Id>();
		Map<Id, Id> leadToNewAcctMap = new Map<Id, Id>();
		
		//we care about 2 scenarios - where lead owner doesn't equal old lead owner AND when the Lead is assigned to a different account (or attached to one)
		for (Lead ld : leads.values()){
			if (ld.OwnerId != oldLeads.get(ld.id).OwnerId) {
				leadToNewOwnerMap.put(ld.id, ld.OwnerId);
				leadToPrevOwnerMap.put(ld.id, oldLeads.get(ld.id).OwnerId);
			}  else if (ld.Account__c != oldLeads.get(ld.id).Account__c) {
				leadToNewAcctMap.put(ld.id, ld.Account__c);
			}
		}
		
		//update Lead Owner field if different from Account owner
		List<Lead> updateLeads = new List<Lead>();
		if (leadToNewAcctMap.keySet().size() > 0) {
			Map<Id, Account> acctMap = new Map<Id, Account>([select id, OwnerId, Name, Owner.Name from Account where id in: leadToNewAcctMap.values()]);
			Map<Id, Lead> leadMap = new Map<Id, Lead>([select id, OwnerId from Lead where id in: leadToNewAcctMap.keySet()]);
			for (Lead ld: leadMap.values()) {
				if (leadToNewAcctMap.get(ld.id) != null) {
					if (ld.OwnerId != acctMap.get(leadToNewAcctMap.get(ld.id)).OwnerId) {
						ld.OwnerId = acctMap.get(leadToNewAcctMap.get(ld.id)).OwnerId;
						updateLeads.add(ld);
					}
				}
			}
			
			if (updateLeads.size()>0) update updateLeads;	
		}
		
		
		//update owner on open tasks owned by previous owner
		List<Task> updateTasks = new List<Task>();
		List<Event> updateEvents = new List<Event>();
		if (leadToNewOwnerMap.keySet().size() > 0) {
			
			List<Task> allTasks = [select OwnerId, WhoId from Task where WhoId in: leadToNewOwnerMap.keySet() and IsClosed = false and IsRecurrence = false and (activityDate = null or activityDate > TODAY)];
			for (Task tsk : allTasks) {
				if (tsk.OwnerId == leadToPrevOwnerMap.get(tsk.WhoId)) {
					tsk.OwnerId = leadToNewOwnerMap.get(tsk.WhoId);
					updateTasks.add(tsk);
				}
			}
			
			if (updateTasks.size()>0) update updateTasks;
		}
		
	}	// end of LeadOwnerUpdate method
	
	
	
	/*
 	*  [L4] LeadStampOriginalOwner method
	*
	*/ 
	public static void LeadStampOriginalLeadOwner (Map<id,Lead> leads, Map<id,Lead> oldLeads) {
		
		List<Lead> leadList = new List<Lead>();
		
		for (Lead l : leads.values()) {
			//only process through leads who moved from Marketo to someone else
			if (oldLeads.get(l.id).OwnerId == '005D0000001x4tvIAA' && l.id != '005D0000001x4tvIAA') {
				l.Original_Inbound_Lead_Owner__c = l.OwnerId;
			}
		}
	}	// end of LeadStampOriginalLeadOwner method
	
	
	/*
 	*  [L5] LeadTriggerAssignmentRules method
	*
	*/ 
	public static void LeadTriggerAssignmentRules(Map<id,Lead> leads, Map<id,Lead> oldLeads) {
		
		Set<id> leadIds = new Set<id>();
		
		for (Lead l : oldLeads.Values()) {
			if (l.OwnerId == '005D0000004k29LIAQ' && !system.isFuture() && !system.isBatch()) {
				leadIds.add(l.id);
			}
		}
		
		if (leadIds.size()>0) MyLeadReassignmentClass.reassignLeadWithActiveRule(leadIds);
		
	}	
	
	// end of LeadTriggerAssignmentRules method
	
	
	
	/*
 	*  [L6] LeadDispositionSlaMet method
	*
	*/ 
	public static void LeadDispositionSlaMet(Map<id,Lead> leads, Map<id,Lead> oldLeads) {
	
		Set<id> convertedLeads = new Set<id>(); //Set to hold converted leads
		Map<id,id> leadToContactMap = new Map<id,id>(); //Map Leads to Converted Contact Id
		Set<id> closedLeads = new Set<id>(); //Set to hold dispostioned leads
		Map<id,Integer> leadGmtOffsetMap = new Map<id, Integer>(); //Map to hold Time Zone Offset for Leads
		
		Integer emeaOffset; Integer usOffset;
		Map<String, Time_Zone_Offset__c> gmtOffSetMap = Time_Zone_Offset__c.getall();
		// 0 during winter, 1 during British Summer Time
		if (gmtOffSetMap.containsKey('EMEA')) emeaOffset = (Integer) gmtOffSetMap.get('EMEA').GMT_Offset__c;  else emeaOffset = 1;
		//-5 during EST, -4 during EDT
    	if (gmtOffSetMap.containsKey('EMEA')) usOffset = (Integer) gmtOffSetMap.get('NORAM').GMT_Offset__c; else usOffset = -4;
		
		for (lead ld : leads.values()) {
			//If the lead is converted stamp the Contact Id and mark SLA 1 met if within 24 hours of SLA creation
			if (ld.isConverted && !oldLeads.get(ld.id).isConverted) {
				convertedLeads.add(ld.id);
				if (ld.ConvertedContactId != null) leadToContactMap.put(ld.id, ld.ConvertedContactId);
				if (ld.Inbound_SLA_Core_Market__c == 'NORAM') leadGmtOffsetMap.put(ld.id,usOffset);
				else leadGmtOffsetMap.put(ld.id,emeaOffset);
			}
			//Else if the lead is dispositioned within 24 hours of SLA creation mark SLA 1 as met
			else if (ld.status == 'Closed' && oldLeads.get(ld.id).status != 'Closed') {
				closedLeads.add(ld.id);
				if (ld.Inbound_SLA_Core_Market__c == 'NORAM') leadGmtOffsetMap.put(ld.id,usOffset);
				else leadGmtOffsetMap.put(ld.id,emeaOffset);
			}
		}
		
		//Query all open SLAs associated with the converted and closed Leads
		Map<id, SLA__C> slaMap = new Map<id, SLA__c>([SELECT id, Lead__c, Contact__c, SLA_1_Met__c, CreatedDate FROM SLA__c WHERE SLA_Status__c = 'Open' AND (Lead__c in: convertedLeads OR Lead__c in: closedLeads)]);	
		List<SLA__c> updateSLA = new List<SLA__c>();
		
		DateTime currTime = System.now();
		for (SLA__c s: slaMap.values()) {
			boolean updated = false;
			
			if (convertedLeads.contains(s.Lead__c)) {
				if (leadToContactMap.containsKey(s.Lead__c)) {
					s.Contact__c = leadToContactMap.get(s.Lead__c);
					updated = true;
				}
			}
			
			Integer offSet = 0; //default Time Zone offset to zero
			if (leadGmtOffsetMap.containsKey(s.Lead__c)) offSet = leadGmtOffsetMap.get(s.Lead__c); //If an offset was set during initial loop, grab offset 
			DateTime dateToCompare = SLAMethods.AdjustedSLATime(s.CreatedDate, offSet); //Call method to grab SLA's adjusted create time for comparison
			
			//If the disposition or the conversion is happening within 24 hours of the SLA's adjusted Create time and SLA 1 is not currently checked, mark SLA 1 as met
			if (currTime < dateToCompare.addHours(24)) {
				if (!s.SLA_1_Met__c) {
					s.SLA_1_Met__c = true;
					updated = true;
				}
			}
			
			//Close out SLA if lead is closed out
			if (closedLeads.contains(s.Lead__c)) {
				s.SLA_Status__c = 'Closed (Lead Dispositioned)';
				s.Close_Date__c = system.now();
				updated = true;
			}
			
			if (updated) updateSLA.add(s);
						
		}
		
		if (updateSLA.size() > 0) update updateSLA;
		
		
	}
	
	/*
 	*  LeadConvertOnInsertLinkToSLA method
	*
	*
	
	public static void LeadConvertOnInsertLinkToSLA(List<Lead> leads) {
		Set<id> convertedLeads = new Set<id>(); //Set to hold converted leads
		Map<id,id> leadToContactMap = new Map<id,id>(); //Map Converted Leads to Contact Id
		Map<id,id> reverseLeadToContactMap = new Map<id,id>(); //Reverse Map of Contact Ids to Converted Lead Id
		
		for (lead ld : leads) {
			//If the lead is converted stamp the Contact Id and mark SLA 1 met if within 24 hours of SLA creation
			if (ld.isConverted) {
				convertedLeads.add(ld.id);
				if (ld.ConvertedContactId != null) leadToContactMap.put(ld.id, ld.ConvertedContactId); reverseLeadToContactMap.put(ld.ConvertedContactId,ld.id);
			}
		}
		
		//Query all open SLAs associated with the converted Leads and the relevant Contacts
		Map<id, SLA__C> slaMap = new Map<id, SLA__c>([SELECT id, Lead__c, Contact__c FROM SLA__c WHERE SLA_Status__c = 'Open' AND (Lead__c in: convertedLeads OR Contact__c in: leadToContactMap.values())]);	
		List<SLA__c> updateSLA = new List<SLA__c>();
		
		DateTime currTime = System.now();
		for (SLA__c s: slaMap.values()) {
			boolean updated = false;
			
			//Close out any Open SLAs on the converted Contact
			if (s.Contact__c != null) {
				if (reverseLeadToContactMap.containsKey(s.Contact__c)) {
					s.SLA_Status__c = 'Closed (New SLA Came In)';
					s.Close_Date__c = system.now();
					updated = true;
				}
				
			}
			
			//Link Contact to the new SLA
			else if (convertedLeads.contains(s.Lead__c)) {
				if (leadToContactMap.containsKey(s.Lead__c)) {
					s.Contact__c = leadToContactMap.get(s.Lead__c);
					updated = true;
				}
			}
			
			
			
			if (updated) updateSLA.add(s);
						
		}
		
		if (updateSLA.size() > 0) update updateSLA;
		
	} */
	
	
	/*
 	*  [L7] reparentSLAsOnLeadMerge
	*
	*/ 
	public static void reparentSLAsOnLeadMerge(Map<id,Lead> deletedLeads) {
		List<id> masterLeadIds = new List<id>();
		
		for (lead ld: deletedLeads.values()) {
			if (ld.MasterRecordId != null) {
				
			}
		}
		
	}
	
	
	
	/*
 	*  [L8] setLeadLookups method
	*
	*/ 
	public static void setLeadLookups(List<Lead> leads) {
		
		for (Lead ld: leads) {
			//if Lead Account Link is blank, clear out all look ups
			if (ld.Account__c == null) {
				system.debug('Leads with no account: ' + ld.full_name__c); 
				if (ld.Inactive_Lookup__c != null) ld.Inactive_Lookup__c = null;
				if (ld.Active_Lookup__c != null) ld.Active_Lookup__c = null;
				if (ld.Do_Not_Call_Lookup__c != null) ld.Do_Not_Call_Lookup__c = null;
			}
			//If lead is Do Not Call, Set Do Not Call look up and clear any other lookups
			else if (ld.DoNotCall == true || ld.CFCR_Status_Reason__c == 'Do Not Call') {
				system.debug('Leads with DNC: ' + ld.full_name__c); 
				if (ld.Inactive_Lookup__c != null) ld.Inactive_Lookup__c = null; //Clear out inactive look up if not blank
				if (ld.Active_Lookup__c != null) ld.Active_Lookup__c = null; //Clear out Active look up if not blank
				if (ld.Do_Not_Call_Lookup__c == null) ld.Do_Not_Call_Lookup__c = ld.Account__c; //If DNC look up is blank, fill with current account
				else if (ld.Do_Not_Call_Lookup__c != ld.Account__c) ld.Do_Not_Call_Lookup__c = ld.Account__c; //if DNC lookup does not equal current account, update to current account
			}
			//If lead is Active, Set Do Not Call look up and clear any other lookups
			else if (ld.IsActive__c) {
				system.debug('Leads Active: ' + ld.full_name__c); 
				if (ld.Inactive_Lookup__c != null) ld.Inactive_Lookup__c = null; //Clear out inactive look up if not blank
				if (ld.Do_Not_Call_Lookup__c != null) ld.Do_Not_Call_Lookup__c = null; //Clear out Do Not Call look up if not blank
				if (ld.Active_Lookup__c == null) ld.Active_Lookup__c = ld.Account__c; //If active look up is blank, fill with current account
				else if (ld.Active_Lookup__c != ld.Account__c) ld.Active_Lookup__c = ld.Account__c; //if Active lookup does not equal current account, update to current account
			}
			//If lead is Inactive, Set Do Not Call look up and clear any other lookups
			else {
				system.debug('Leads Inactive: ' + ld.full_name__c); 
				if (ld.Active_Lookup__c != null) ld.Active_Lookup__c = null; //Clear out Active look up if not blank
				if (ld.Do_Not_Call_Lookup__c != null) ld.Do_Not_Call_Lookup__c = null; //Clear out Do Not Call look up if not blank
				if (ld.Inactive_Lookup__c == null) ld.Inactive_Lookup__c = ld.Account__c; //if Inactive look up is blank fill with current account
				else if (ld.Inactive_Lookup__c != ld.Account__c) ld.Inactive_Lookup__c = ld.Account__c; // Else, if the inactive look up does not equal the current acocunt, update to current account
			}
		}
	}
	
	/*
 	*  [L9] createCampaignMemberAfterInsert method
	*
	*/ 
	public static void createCampaignMemberAfterInsert(List <Lead> leads) {
		List<CampaignMember> cmInsert = new List<CampaignMember>();
		
		for (lead l: leads) {
			if (l.Campaign_Id_Marketo__c != null) {
				CampaignMember cm = new CampaignMember(CampaignId = l.Campaign_Id_Marketo__c, LeadId = l.id);
				cmInsert.add(cm);
			}
		}
		
		if (cmInsert.size() > 0) insert cmInsert;
		
	}
	
	/*
 	*  [L10] UtilLeadToAcctMatch
	*
	*/ 
	public static Integer UtilLeadToAcctMatch(Lead l, Account a) {
		
		Map<String,US_Velocity_State_Alignments__c> stateMappings = US_Velocity_State_Alignments__c.getAll();
	    Map<String,International_Alignments__c> countryMappings = International_Alignments__c.getAll();
		
		if (a.ops_it_budget__c != null) {
			if (a.ops_it_budget__c >= 14) {
				if (l.state_for_assignment_rules__c != null && a.billingState != null) {
					if (stateMappings.containsKey(l.state_for_assignment_rules__c.toUpperCase()) && stateMappings.containsKey(a.billingState.toUpperCase())) {
						return 11;
					} else {
						if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
							if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
								if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
									return 10;
								} else {
									return 0;
								}
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					}
				} else {
					if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
						if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
							if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
								return 10;
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					} else {
						return 0;
					}
				}
			} else {
				if (l.state_for_assignment_rules__c != null && a.billingState != null) {
					if (stateMappings.containsKey(l.state_for_assignment_rules__c.toUpperCase()) && stateMappings.containsKey(a.billingState.toUpperCase())) {
						return 6;
					} else {
						if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
							if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
								if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
									return 5;
								} else {
									return 0;
								}
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					}
				} else {
					if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
						if (countryMappings.containsKey(l.country_for_assignment_rules__c) && countryMappings.containsKey(a.billingCountry)) {
							if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
								if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
									return 5;
								} else {
									return 0;
								}
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					} else {
						return 0;
					}
				}
			}
		} else {
			if (l.state_for_assignment_rules__c != null && a.billingState != null) {
				if (stateMappings.containsKey(l.state_for_assignment_rules__c) && stateMappings.containsKey(a.billingState)) {
					return 6;
				} else {
					if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
						if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
							if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
								return 5;
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					} else {
						return 0;
					}
				}
			} else {
				if (l.country_for_assignment_rules__c != null && a.billingCountry != null) {
					if (countryMappings.containsKey(l.country_for_assignment_rules__c) && countryMappings.containsKey(a.billingCountry)) {
						if (countryMappings.containsKey(l.country_for_assignment_rules__c.toUpperCase()) && countryMappings.containsKey(a.billingCountry.toUpperCase())) {
							if (countryMappings.get(l.country_for_assignment_rules__c.toUpperCase()).team__c == countryMappings.get(a.billingCountry.toUpperCase()).team__c) {
								return 5;
							} else {
								return 0;
							}
						} else {
							return 0;
						}
					} else {
						return 0;
					}
				} else {
					return 0;
				}
			}
		}
	}
	
	
}