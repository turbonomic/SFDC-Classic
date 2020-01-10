/*************************************************************************************************
*	Table of Contents
*		[A1] AccountFillLastLinkedInFillDate
*		[A2] AccountIndustryUpdate
*		[A3] AccountMergeUpdateOwners
*		[A4] AccountOwnerUpdate
*		[A5] AcctLookupLatLongByZip
*		[A6] AcctLookupMSAByZip
*		[A7] AssignTerritoryOwner
*		[A8] AccountVeloTeamUpdate
*
*
**************************************************************************************************/



global class AccountMethods {
	
	
	//	[A1]
	public static void AccountFillLastLinkedInFillDate (Map<id,Account> accts, Map<id,Account> oldAccts) {
		
		for (id acctId : accts.keySet()) {
			Account a = accts.get(acctId);
			Account oldA = oldAccts.get(acctId);
			
			if (a.VMware_Hits__c != null) {
				if (oldA.VMware_Hits__c != null) {
					if (a.VMware_Hits__c != oldA.VMware_Hits__c) {
						a.Last_LinkedIn_Update_Date_Time__c = DateTime.now();
					}
				} else {
					a.Last_LinkedIn_Update_Date_Time__c = DateTime.now();
				}
			}
		}
		
	}	// end of AccountFillLastLInkedInFillDate method
	
	//	[A2]
	public static void AccountIndustryUpdate (Map<id,Account> accts, Map<id,Account> oldAccts) {
		
		Set<Id> acctIds = new Set<Id>();
		for (Account acct: accts.values()) {
			if (acct.Industry_clean_text__c != acct.Industry_clean__c) {
				system.debug('@@@AccountIndustryUpdate.trigger: Industry mismatch!');
				system.debug('@@@AccountIndustryUpdate.trigger: Industry_clean__c = ' + acct.Industry_clean__c);
				system.debug('@@@AccountIndustryUpdate.trigger: Industry_clean_text__c = ' + acct.Industry_clean_text__c);
				acctIds.add(acct.id);
			}
		}
		
		if (acctIds.size() > 0 && VMTUtils.inBatch == false) {
			//call future method that runs after workflow rules are complete
			IndustrySetter.setIndustryOnAcct(acctIds);
		}
		
	}	// end of AccountIndustryUpdate method
	
	//	[A3]
	public static void AccountMergeUpdateOwners (Map<id,Account> oldAccts) {
		Set<Id> masterIds = new Set<Id>();
		Map<Id, Id> masterIdToNewOwnerMap = new Map<Id, Id>();
		for (Account acct : oldAccts.values()) {
			if (acct.MasterRecordId != null) {
				masterIds.add(acct.MasterRecordId);
			}
		}
		
		List<Lead> updateLeads = new List<Lead>();
		List<Contact> updateContacts = new List<Contact>();
		
		if (masterIds.size() > 0) {	
			
			List<Account> masterAccts = [select Id, OwnerId from Account where id in: masterIds];
			for (Account acct : masterAccts) {
				masterIdToNewOwnerMap.put(acct.Id, acct.OwnerId);
			}
			
			List<Lead> allLeads = [select OwnerId, Account__c from Lead where Account__c in: masterIds and IsConverted = false];
			for (Lead ld : allLeads) {
				if (ld.OwnerId != masterIdToNewOwnerMap.get(ld.Account__c)) {
					ld.OwnerId = masterIdToNewOwnerMap.get(ld.Account__c);
					updateLeads.add(ld);
				}
			}
			
			List<Contact> allContacts = [select OwnerId, AccountId from Contact where AccountId in: masterIds];
			for (Contact con : allContacts) {
				if (con.OwnerId != masterIdToNewOwnerMap.get(con.AccountId)) {
					con.OwnerId = masterIdToNewOwnerMap.get(con.AccountId);
					updateContacts.add(con);
				}
			}
			
			if (updateLeads.size()>0) update updateLeads;
			if (updateContacts.size()>0) update updateContacts;
		}
	}	// end of AccountMergedUpdateOwners method
	
	//	[A4]
	public static void AccountOwnerUpdate (Map<id,Account> accts, Map<id,Account> oldAccts) {
		
		Map<Id, Id> acctToOwnerMap = new Map<Id, Id>();
		for (Account acct : accts.values()){
			if (acct.OwnerId != oldAccts.get(acct.id).OwnerId && acct.id != '001D000000v5q5N') {
				acctToOwnerMap.put(acct.id, acct.OwnerId);
			}
		}
		
		List<Lead> updateLeads = new List<Lead>();
		List<Contact> updateContacts = new List<Contact>();
		if (acctToOwnerMap.keySet().size() > 0) {
			
			List<Lead> allLeads = [select OwnerId, Account__c from Lead where Account__c in: acctToOwnerMap.keySet() and IsConverted = false];
			for (Lead ld : allLeads) {
				if (ld.OwnerId != acctToOwnerMap.get(ld.Account__c)) {
					ld.OwnerId = acctToOwnerMap.get(ld.Account__c);
					updateLeads.add(ld);
				}
			}
			
			List<Contact> allContacts = [select OwnerId, AccountId from Contact where AccountId in: acctToOwnerMap.keySet()];
			for (Contact con : allContacts) {
				if (con.OwnerId != acctToOwnerMap.get(con.AccountId)) {
					con.OwnerId = acctToOwnerMap.get(con.AccountId);
					updateContacts.add(con);
				}
			}
			
			
			if (updateContacts.size()>0) update updateContacts;
			if (updateLeads.size()>0) update updateLeads;
			
		}
		
	}	// end of AccountOwnerUpdate method
	
	//	[A5]
	public static void AcctLookupLatLongByZip (Map<id,Account> accts, Map<id,Account> oldAccts, List<Account> acctInsert) {
		
		Set<String> zipCodes = new Set<String>();
	    Set<Account> acctSet = new Set<Account>();
	    
	    system.debug('### insert list has ' + acctInsert.size() + ' accounts');
	    system.debug('### update map has ' + accts.size() + ' accounts');
	    
	    if (acctInsert.size() > 0) {
	    	for(Account acct: acctInsert) {
				if(acct.BillingPostalCode != '' && acct.BillingPostalCode != null) {
					zipCodes.add(acct.Billing_Zip_Cleaned__c);
		            acctSet.add(acct);
					system.debug('Insert trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
				}
			}
	    } else {
	    	for(Account acct: accts.values()) {
				if (oldAccts.get(acct.id) != null && ((acct.Latitude_Longitude__c == null && acct.BillingPostalCode != null) || (oldAccts.get(acct.id).BillingPostalCode != acct.BillingPostalCode))) {
					zipCodes.add(acct.Billing_Zip_Cleaned__c);
		            acctSet.add(acct);
					system.debug('Update trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
				}
			}
	    }
		
		
		
		if (zipCodes.size() > 0) {
			
			List<Account_Coordinates__c> coordList = [select id, Latitude_Longitude__c, Zip_Code__c from Account_Coordinates__c where Zip_Code__c in: zipCodes];
			
			Map<String, Account_Coordinates__c> coordMap = new Map<String, Account_Coordinates__c>();  //map to store coordinate record with zip code string
			
			//populate the map
			for (Account_Coordinates__c coord: coordList) {
				coordMap.put(coord.Zip_Code__c, coord);
			}
			
			for(Account acct: acctSet) {
                if(coordMap.containsKey(acct.Billing_Zip_Cleaned__c)) {
                    acct.Latitude_Longitude__c = coordMap.get(acct.Billing_Zip_Cleaned__c).Latitude_Longitude__c;
                } else {
                    acct.Latitude_Longitude__c = null;
                }
			}
		}	
	}	// end of AcctLookupLatLongbyZip method
	
	//	[A6]
	public static void AcctLookupMSAByZip(Map<id,Account> accts, Map<id,Account> oldAccts, List<Account> acctInsert) {
		Set<String> zipCodes = new Set<String>();
		Set<Account> accountSet = new Set<Account>();
		
		if (acctInsert.size() > 0) {
			for (Account acct : acctInsert) {
				if (acct.BillingPostalCode != null) {
					zipCodes.add(acct.Billing_Zip_Cleaned__c);
					system.debug('Currently adding account ' + acct.name + ' to acct msa set for update');
		            accountSet.add(acct);
					system.debug('MSA Update trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
				} 
			}
		} else {
			for(Account acct: accts.values()) {
				if (oldAccts.get(acct.id) != null && (acct.MSA_Update_Flag__c == true) && (((acct.Metropolitan_Statistical_Area__c == null || acct.MSA_Number__c == null) && acct.BillingPostalCode != null) || (oldAccts.get(acct.id).BillingPostalCode != acct.BillingPostalCode))) {
					zipCodes.add(acct.Billing_Zip_Cleaned__c);
					system.debug('Currently adding account ' + acct.name + ' to acct msa set for update');
		            accountSet.add(acct);
					system.debug('MSA Update trigger. Added ' + acct.Billing_Zip_Cleaned__c + ' to set!');
				} 
			}
		}
		
	    
		if (zipCodes.size() > 0) {

			List<Account_MSA__c> msaList = [SELECT Zip_Code__c, Metropolitan_Statistical_Area__c, MSA_Number__c FROM Account_MSA__c WHERE Zip_Code__c in: zipCodes];
			System.debug('******************The MSA List size is ' + msaList.size());			
			
			Map<String, Account_MSA__c> msaMap = new Map<String, Account_MSA__c>();  //map to store MSA record with zip code string
			
			//populate the map
			for (Account_MSA__c msa: msaList) {
				msaMap.put(msa.Zip_Code__c, msa);
			}
			
			system.debug('The account map is of size ' + accountSet.size());
			for (Account acct: accountSet) {
				system.debug('Currently checking account msa for ' + acct.name);
				if(msaMap.containsKey(acct.Billing_Zip_Cleaned__c) && acct.BillingCountry == 'United States') {
					System.debug('Setting account MSA to ' + msaMap.get(acct.Billing_Zip_Cleaned__c).Metropolitan_Statistical_Area__c);
					System.debug('Setting account MSA # to ' + msaMap.get(acct.Billing_Zip_Cleaned__c).MSA_Number__c);
	                acct.Metropolitan_Statistical_Area__c = msaMap.get(acct.Billing_Zip_Cleaned__c).Metropolitan_Statistical_Area__c;
	                acct.MSA_Number__c = msaMap.get(acct.Billing_Zip_Cleaned__c).MSA_Number__c;
	                //acct.Update_MSA__c = false;
	            } else {
	            	System.debug('Clearing account MSA for ' + acct.name);
	            	if (acct.Metropolitan_Statistical_Area__c != null) acct.Metropolitan_Statistical_Area__c = null;
	            	if (acct.MSA_Number__c != null) acct.MSA_Number__c = null;
	            	//acct.Update_MSA__c = false;
	            	
	            }
			} 
		}
	}
	
//	[A7]
/*
	public static void AssignTerritoryOwner (Map<id,Account> accts, Map<id,Account> oldAccts) {
		Map<id,Account> acctMap = new Map<id,Account>();
		
		for (Account a : accts.values()) {
			System.debug('Account going through A7: ' + a.name);
			if (a.AE_Rep__c == null && a.account_level__c == null) {
				acctMap.put(a.id,a);
			} else if (a.AE_Rep__c == null && (!a.account_level__c.containsIgnoreCase('SMB'))) {
				acctMap.put(a.id,a);
			}
		}
		
		
		if (acctMap.size() > 0) {
		
			List<Territory__c> allTerritories = [select id, rep__c, rep_team__c, state__c, round_robin_number__c, country__c, city__c, max_latitude__c, min_latitude__c, max_longitude__c, min_longitude__c, city_defined__c,
												latitude_longitude_defined__c, round_robin_defined__c, territory_geo__c, sort_order__c, name from Territory__c where isDeleted = false];
			
			system.debug('### allTerritories size is ' + allTerritories.size());
						
			Map<id,Territory__c> acctToTerritoryMap = new map<id,Territory__c>();
			Map<String,Territory_Round_Robin__c> roundRobinMap = Territory_Round_Robin__c.getAll();
			
			Map<String,List<Account>> velocityTeamMap = new Map<String,List<Account>>();
			Map<String,Map<String,List<Territory__c>>> teamTerritoryMap = new Map<String,Map<String,List<Territory__c>>>();
			
			for (Territory__c t : allTerritories) {
				if (teamTerritoryMap.containsKey(t.rep_team__c)) {
					Map<String,List<Territory__c>> territories = teamTerritoryMap.get(t.rep_team__c);
					if (t.territory_geo__c != 'US') {
						if (territories.containsKey(t.country__c)) {
							List<Territory__c> territoryList = territories.get(t.country__c);
							territoryList.add(t);
							territories.put(t.country__c,territoryList);
						} else {
							List<Territory__c> territoryList = new List<Territory__c>();
							territoryList.add(t);
							territories.put(t.country__c,territoryList);
						}
					} else {
						if (territories.containsKey(t.state__c)) {
							List<Territory__c> territoryList = territories.get(t.state__c);
							territoryList.add(t);
							territories.put(t.state__c,territoryList);
						} else {
							List<Territory__c> territoryList = new List<Territory__c>();
							territoryList.add(t);
							territories.put(t.state__c,territoryList);
						}
					}
					teamTerritoryMap.put(t.rep_team__c,territories);
				} else {
					Map<String,List<Territory__c>> territories = new Map<String,List<Territory__c>>();
					if (t.territory_geo__c != 'US') {
						List<Territory__c> territoryList = new List<Territory__c>();
						territoryList.add(t);
						territories.put(t.country__c,territoryList);
					} else {
						List<Territory__c> territoryList = new List<Territory__c>();
						territoryList.add(t);
						territories.put(t.state__c,territoryList);
					}
					teamTerritoryMap.put(t.rep_team__c,territories);
				}
			}
			
			for (Account a : acctMap.values()) {
				Integer maxNum = 0;
				if (a.billingCity != null) {
					if (roundRobinMap.containsKey(a.billingCity)) {
						maxNum = (Integer)roundRobinMap.get(a.billingCity).RR_Number__c;	//get the mod for the state
					} else if (roundRobinMap.containsKey(a.billingState)) {
						maxNum = (Integer)roundRobinMap.get(a.billingState).RR_Number__c;
					} else if (roundRobinMap.containsKey(a.billingCountry)) {
						maxNum = (Integer)roundRobinMap.get(a.billingCountry).RR_Number__c;
					}
				} else {
					if (roundRobinMap.containsKey(a.billingState)) {
						maxNum = (Integer)roundRobinMap.get(a.billingState).RR_Number__c;
					} else if (roundRobinMap.containsKey(a.billingCountry)) {
						maxNum = (Integer)roundRobinMap.get(a.billingCountry).RR_Number__c;
					}
				}
				Integer rr = (Integer) Math.Floor(Math.Random() * maxNum);	//get the RR number beforehand to compare against territory number
				if (a.territory_team__c != null) {
					if (a.Velocity_Territory_Owner_Team_Bucketed__c == 'US') {
								
						if (teamTerritoryMap.containsKey(a.Territory_Team__c)) {
							Map<String,List<Territory__c>> territories = teamTerritoryMap.get(a.Territory_Team__c);
							if (territories != null && territories.size() > 0) {
								if (territories.containsKey(a.billingState)) {
									List<Territory__c> territoryList = territories.get(a.billingState);
									if (territoryList.size() == 1) {										// only single rep aligned to state
										a.AE_Rep__c = territoryList.get(0).rep__c;
									} else {
										List<TerritoryWrapper> sortTerritoryList = new List<TerritoryWrapper>();
										for (Territory__c t : territoryList) {
											system.debug('Territory Name: ' + t.name); 
											TerritoryWrapper tw = new TerritoryWrapper(t);
											sortTerritoryList.add(tw);
										}
										sortTerritoryList.sort();	//sort by reverse sort order (based on sort_order__c field on territory object)
										for (TerritoryWrapper sortedTerritory : sortTerritoryList) {
											system.debug('Sorted Territory Name: ' + sortedTerritory.territory.name); 
											Boolean match = true;
											if (sortedTerritory.territory.sort_order__c == 9) {		// Latitude/Longitude + Round Robin Territory by state
												
												if (sortedTerritory.territory.Max_Latitude__c != null) {
													if (a.latitude__c == null) {	
														match = false;
													} else if (sortedTerritory.territory.Max_Latitude__c < a.Latitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Min_Latitude__c != null) {
													if (a.latitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Min_latitude__c > a.Latitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Max_Longitude__c != null) {
													if (a.longitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Max_longitude__c < a.Longitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Min_Longitude__c != null) {
													if (a.longitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Min_Longitude__c > a.Longitude__c) {
														match = false;
													}
												}
												if ( rr != sortedTerritory.territory.Round_Robin_Number__c) {
													match = false;
												} 
												
											} else if (sortedTerritory.territory.sort_order__c == 7) {		// City + Round Robin Territory by state
												if (a.billingCity != null) {
													if (!a.billingCity.equalsIgnoreCase(sortedTerritory.territory.city__c)) {
														match = false;
													}
												}
												if ( rr != sortedTerritory.territory.Round_Robin_Number__c) {
													match = false;
												} 
												
												
											} else if (sortedTerritory.territory.sort_order__c == 6) {		// Latitude/Longitude Only Territory by state
												
												if (sortedTerritory.territory.Max_Latitude__c != null) {
													if (a.latitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Max_Latitude__c < a.Latitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Min_Latitude__c != null) {
													if (a.latitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Min_latitude__c > a.Latitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Max_Longitude__c != null) {
													if (a.longitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Max_longitude__c < a.Longitude__c) {
														match = false;
													}
												}
												if (sortedTerritory.territory.Min_Longitude__c != null) {
													if (a.longitude__c == null) {
														match = false;
													} else if (sortedTerritory.territory.Min_Longitude__c > a.Longitude__c) {
														match = false;
													}
												}
											} else if (sortedTerritory.territory.sort_order__c == 4) {	// city only Territory by state
												if (a.billingCity == null) {
													match = false;
												}
												else if (!a.billingCity.equalsIgnoreCase(sortedTerritory.territory.city__c)) {
													match = false;
												}
												
											} else if (sortedTerritory.territory.sort_order__c == 3) {		// Round Robin Only Territory by state
											
												if ( rr != sortedTerritory.territory.Round_Robin_Number__c) {
													match = false;
												}
											}
											
											if(match) {
												system.debug('Sort order for ' + a.name + ' is ' + sortedTerritory.territory.sort_order__c);
												system.debug('Sorted Territory Rep: ' + sortedTerritory.territory.rep__c);
												a.AE_Rep__c = sortedTerritory.territory.rep__c;
												break;
											}	
										}
									}
								}
							}
						}
					} else {
						if (a.Velocity_Territory_Owner_Team_Bucketed__c == 'EMEA') {
							Map<String,List<Territory__c>> territories = teamTerritoryMap.get(a.territory_team__c);
							if (territories != null && territories.size() > 0 ) {
								if (a.billingCountry != null) {
									if (territories.containsKey(a.billingCountry)) {
										List<Territory__c> territoryList = territories.get(a.billingCountry);
										if (territoryList.size() == 1) {										// only single rep aligned to state
											a.AE_Rep__c = territoryList.get(0).rep__c;
										} else {
											List<TerritoryWrapper> sortTerritoryList = new List<TerritoryWrapper>();
											for (Territory__c t : territoryList) {
												TerritoryWrapper tw = new TerritoryWrapper(t);
												sortTerritoryList.add(tw);
											}
											sortTerritoryList.sort();	//sort by reverse sort order (based on sort_order__c field on territory object)
											for (TerritoryWrapper sortedTerritory : sortTerritoryList) {
												
												Boolean match = true;
												if (sortedTerritory.territory.sort_order__c == 3) {		// Round Robin Only Territory by state
													
													if ( rr != sortedTerritory.territory.Round_Robin_Number__c) {
														match = false;
													}
													
												}
												 				
												if(match) {
													a.AE_Rep__c = sortedTerritory.territory.rep__c;
													break;
												}
											}
										}
									}
								}
							}
						} else if (a.Velocity_Territory_Owner_Team_Bucketed__c == 'APAC' || a.Velocity_Territory_Owner_Team_Bucketed__c == 'LATAM') {
							Map<String,List<Territory__c>> territories = teamTerritoryMap.get(a.territory_team__c);
							if (territories.containsKey(a.billingCountry)) {
								List<Territory__c> territoryList = territories.get(a.billingCountry);
								if (territoryList.size() == 1) {										// only single rep aligned to state
									a.AE_Rep__c = territoryList.get(0).rep__c;
								}
							} 
						}
					}
				}
			}
		}
	}	// end of AssignTerritoryOwner method
	
	//	[A8]
	public static void AccountVeloTeamUpdate(Map<id,Account> accts, Map<id,Account> oldAccts, List<Account> insertAccts) {
		
		Set<Account> acctUpdates = new Set<Account>();
		
		if (insertAccts.size() > 0) {
			for (Account a : insertAccts) {
				if (a.billingCountry != null || a.billingState != null) {
					acctUpdates.add(a);
				}
			}
		} else {
			for (Account a : accts.values()) {
				if (a.billingCountry != null) {
					if (oldAccts.get(a.id).billingCountry != null) {
						if (a.billingCountry != oldAccts.get(a.id).billingCountry) {
							acctUpdates.add(a);
						}
					} else {
						acctUpdates.add(a);
					}
				} 
				if (a.billingState != null) {
					if (oldAccts.get(a.id).billingState != null) {
						if (a.billingState != oldAccts.get(a.id).billingState) {
							acctUpdates.add(a);
						}
					} else {
						acctUpdates.add(a);
					}
				} 
				if (a.billingCountry == null && a.billingState == null) {
					if (oldAccts.get(a.id).billingCountry != null || oldAccts.get(a.id).billingState != null) {
						a.territory_team__c = null;
					}
				}
			}
		}
		
		for (Account a : acctUpdates) {
			boolean stateMapped = false;
			if (a.billingState != null) {
				Map<String,US_Velocity_State_Alignments__c> stateMappings = US_Velocity_State_Alignments__c.getAll();
				system.debug('US Velo State mappings size: ' + stateMappings.size()); 
				if (stateMappings.containsKey(a.billingState.toUpperCase())) {
					System.debug('Acct for Velo Team Update: ' + a.name);
					a.territory_team__c = stateMappings.get(a.billingState.toUpperCase()).team__c;
					stateMapped = true;
				}
			}
			if (a.billingCountry != null) {
				if (!stateMapped) {
					Map<String,International_Alignments__c> countryMappings = International_Alignments__c.getAll();
					if (countryMappings.containsKey(a.billingCountry.toUpperCase())) {
						System.debug('Acct for Country Team Update: ' + a.name);
						a.territory_team__c = countryMappings.get(a.billingCountry.toUpperCase()).team__c;
						system.debug('### ' + a.name + ' \'s velocity territory owner team is ' + a.territory_team__c );
					}
				}
			}
		}
		
	}	// end of AccountVeloTeamUpdate method
*/

	
}