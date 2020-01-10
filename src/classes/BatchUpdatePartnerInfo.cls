global class BatchUpdatePartnerInfo implements Database.batchable<sObject>{

	public String query;
	
	//query should return all partner accounts where recordtype = partner
	global database.querylocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

	global void execute(Database.BatchableContext BC,List<sObject> scope) {
		
		VMTUtils.inBatch = true;
		
		Map<id,Account> allAccts = new Map<id,Account>();
		
		// ACCOUNT TO PARTNER OFFICE MAP
		//num of Partner offices per account mapping
		Map<id,Integer> acctPOCount = new Map<id,Integer>();
		
		// ACCOUNT TO APPROVED REG MAPS
		//num of Approved Regs in last 365 days per account mapping
		Map<id,Integer> acctToRegActivePartnerList = new Map<id,Integer>();
		//num of Approved Regs in last 180 days per account mapping
		Map<id,Integer> acctToRegActivePartner6List = new Map<id,Integer>();
		
		Map<id,Double> acctToTotalBookings12 = new Map<id,Double>();
		Map<id,Double> acctToTotalBookings6 = new Map<id,Double>();
		
		Map<id,Double> acctToIncrementalBookings12 = new Map<id,Double>();
		Map<id,Double> acctToIncrementalBookings6 = new Map<id,Double>();
		
		Map<id,Double> acctToTotalPipe12 = new Map<id,Double>();
		Map<id,Double> acctToTotalPipe6 = new Map<id,Double>();
		
		Map<id,Double> acctToIncrementalPipe12 = new Map<id,Double>();
		Map<id,DOuble> acctToIncrementalPipe6 = new Map<id,Double>();
		
		
		//all reg to account mapping
		Map<id,List<VartopiaDRS__Registration__c>> acctToAllRegList = new Map<id,List<VartopiaDRS__Registration__c>>();
		//all booked reg to account mapping
		Map<id,List<VartopiaDRS__Registration__c>> acctToBookedRegList = new Map<id,List<VartopiaDRS__Registration__c>>();
		
		// OPP TO REG MAPS
		//num of Approved Regs to Opportunity mapping
		Map<id,List<VartopiaDRS__Registration__c>> oppToApprovedRegList = new Map<id,List<VartopiaDRS__Registration__c>>();
		
		// ACCOUNT TO CONTACT MAPS
		//all contacts with C or above to account mapping
		Map<id,Integer> acctConCGradeMap = new Map<id,Integer>();
		//all Sales contacts with A or B grading to account mapping
		Map<id,Integer> acctConSalesMap = new Map<id,Integer>();
		//all tech contacts with A or B grading to account mapping
		Map<id,Integer> acctConTechMap = new Map<id,Integer>();
		//all ace certified contacts to account mapping
		Map<id,Integer> acctConACEMap = new Map<id,Integer>();
		
		Map<id,Integer> acctMappedCount = new Map<id,Integer>();
				
		List<Account> accountUpdate = new List<Account>();
		List<Opportunity> oppUpdate = new List<Opportunity>();
		
		for (sObject s: scope) {
			Account a = (Account)s;
			allAccts.put(a.id,a);
			acctPOCount.put(a.id,0);
			acctConCGradeMap.put(a.id,0);
			acctConSalesMap.put(a.id,0);
			acctConTechMap.put(a.id,0);
			acctConACEMap.put(a.id,0);
			acctToTotalBookings12.put(a.id,0);
			acctToTotalBookings6.put(a.id,0);
			acctToIncrementalBookings12.put(a.id,0);
			acctToIncrementalBookings6.put(a.id,0);
			acctToTotalPipe12.put(a.id,0);
			acctToTotalPipe6.put(a.id,0);
			acctToIncrementalPipe12.put(a.id,0);
			acctToIncrementalPipe6.put(a.id,0);
			acctMappedCount.put(a.id,0);
			acctToRegActivePartnerList.put(a.id,0);
			acctToRegActivePartner6List.put(a.id,0);
			List<VartopiaDRS__Registration__c> regList = new List<VartopiaDRS__Registration__c>();
			acctToAllRegList.put(a.id,regList);
		}
		
		
		
		//queries for Partner Offices and registrations
		Map<id,VartopiaDRS__Registration__c> allRegs = new Map<id,VartopiaDRS__Registration__c>([select id, VartopiaDRS__Vendor_Status__c, VartopiaDRS__Opportunity__c, Deal_Type__c, VartopiaDRS__Partner_Account__c, VartopiaDRS__Date_Submitted__c, VartopiaDRS__Approved_Date__c from VartopiaDRS__Registration__c where VartopiaDRS__Partner_Account__c in: allAccts.KeySet()]);
		Map<id,Partner_Office__c> allOffices = new Map<id,Partner_Office__c>([select id, Parent_Partner_Account__c from Partner_Office__c where Parent_Partner_Account__c in: allAccts.KeySet()]);
		Map<id,Contact> allContacts = new Map<id,Contact>([select id, accountId, partner_contact_department__c, partner_Contact__c, ace_certification__c from Contact where accountId in: allAccts.KeySet() and (partner_contact__c = 'C' or Partner_contact__c = 'B' or partner_contact__c = 'A') ]);
		Map<id,Account> allMappedAccts = new Map<id,Account>([select id, name, Partner_Account_1__c from Account where Partner_Account_1__c in: allAccts.KeySet()]);
		
		
		for (Contact c : allContacts.values()) {
			
			// map C graded partners to accounts
			if (acctConCGradeMap.containsKey(c.accountId)) {
				Integer i = acctConCGradeMap.get(c.AccountId);
				i++;
				acctConCGradeMap.put(c.AccountId,i);
			}
			
			// map A & B Sales contacts
			if (acctConSalesMap.containsKey(c.AccountId)) {
				if (c.partner_contact_department__c != null) {
					if (c.partner_contact_department__c == 'Sales' && (c.Partner_Contact__c == 'A' || c.Partner_Contact__c == 'B')) {
						Integer i = acctConSalesMap.get(c.AccountId);
						i++;
						acctConSalesMap.put(c.AccountId,i);
					}
				}
			}
			
			// map A & B Tech contacts
			if (acctConTechMap.containsKey(c.AccountId)) {
				if (c.partner_contact_department__c != null) {
					if (c.partner_contact_department__c == 'Technical' && (c.Partner_Contact__c == 'A' || c.Partner_Contact__c == 'B')) {
						Integer i = acctConTechMap.get(c.AccountId);
						i++;
						acctConTechMap.put(c.AccountId,i);
					}
				}
			}
			
			// map ACE certified contacts
			if (acctConACEMap.containsKey(c.AccountId)) {
				if (c.Ace_certification__c != null) {
					Integer i = acctConACEMap.get(c.AccountId);
					i++;
					acctConACEMap.put(c.AccountId,i);
				}
			}
			
		}
		
		// map all accounts whose Partner Account 1 is in current set of partner accounts
		for (Account a : allMappedAccts.values()) {
			if (acctMappedCount.containsKey(a.partner_account_1__c)) {
				Integer i = acctMappedCount.get(a.partner_account_1__c);
				i++;
				acctMappedCount.put(a.partner_account_1__c,i);
			}
		}
		
		
		Set<id> oppIdSet = new Set<id>();
		for (VartopiaDRS__Registration__c reg : allRegs.values()) {
			if (reg.VartopiaDRS__Opportunity__c != null && reg.VartopiaDRS__Opportunity__c != '006D000000GvUcfIAF') {
				oppIdSet.add(reg.VartopiaDRS__Opportunity__c);
			}
		}
		
		//query for opportunities on Regs
		Map<id,Opportunity> allOpps = new Map<id,Opportunity>([select id, stageName, opportunity_id_date__c, amount, deal_type__c, closeDate, number_of_approved_registrations__c from Opportunity where id in: oppIdSet]);
		
		//throw all partner offices into mapping
		for (Partner_Office__c po : allOffices.values()) {
			if (acctPOCount.containsKey(po.parent_partner_account__c)) {
				Integer i = acctPOCount.get(po.parent_partner_account__c);
				i++;
				acctPOCount.put(po.parent_partner_account__c,i);
			}
		}
		
		for (VartopiaDRS__Registration__c currReg : allRegs.values()) {
			//throw all regs into mapping
			if (acctToAllRegList.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
				List<VartopiaDRS__Registration__c> regList = acctToAllRegList.get(currReg.VartopiaDRS__Partner_Account__c);
				regList.add(currReg);
				acctToAllRegList.put(currReg.VartopiaDRS__Partner_Account__c,regList);
			}
		
			
			if (allOpps.containskey(currReg.VartopiaDRS__Opportunity__c)) {
				Opportunity o = allOpps.get(currReg.VartopiaDRS__Opportunity__c);
				
				if ((o.Deal_Type__c == 'Incremental' || currReg.Deal_Type__c == 'Incremental') && currReg.VartopiaDRS__Approved_Date__c != null) {
					if (o.opportunity_id_date__c != null) {
						if (o.opportunity_id_date__c.daysBetween(date.today()) <= 365) {
							if (acctToIncrementalPipe12.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToIncrementalPipe12.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToIncrementalPipe12.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
						if (o.opportunity_id_date__c.daysBetween(date.today()) <= 182) {
							if (acctToIncrementalPipe6.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToIncrementalPipe6.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToIncrementalPipe6.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
					}
					
					
					if (o.stageName == 'Closed Won') {
						if (o.closeDate.daysBetween(date.today()) <= 365 ) {
							if (acctToIncrementalBookings12.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToIncrementalBookings12.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToIncrementalBookings12.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
						if (o.closeDate.daysBetween(date.today()) <= 182) {
							if (acctToIncrementalBookings6.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToIncrementalBookings6.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToIncrementalBookings6.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
					}
				}
				
				
				
				
				if (currReg.VartopiaDRS__Approved_Date__c != null) {
					
					if (o.opportunity_id_date__c != null) {
						if (o.opportunity_id_date__c.daysBetween(date.today()) <= 365) {
							if (acctToTotalPipe12.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToTotalPipe12.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToTotalPipe12.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
						if (o.opportunity_id_date__c.daysBetween(date.today()) <= 182) {
							if (acctToTotalPipe6.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToTotalPipe6.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToTotalPipe6.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
					}
					
					if (o.stageName == 'Closed Won') {
						if (o.closeDate.daysBetween(date.today()) <= 365 ) {
							if (acctToTotalBookings12.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToTotalBookings12.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToTotalBookings12.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
						if (o.closeDate.daysBetween(date.today()) <= 182) {
							if (acctToTotalBookings6.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
								Double currAmt = acctToTotalBookings6.get(currReg.VartopiaDRS__Partner_Account__c);
								currAmt += o.amount;
								acctToTotalBookings6.put(currReg.VartopiaDRS__Partner_Account__c,currAmt);
							}
						}
					}
					
					
					//throw approved regs into opp mapping
					if (oppToApprovedRegList.containsKey(o.id)) {
						List<VartopiaDRS__Registration__c> regList = oppToApprovedRegList.get(o.id);
						regList.add(currReg);
						oppToApprovedRegList.put(o.id,regList);
					} else {
						List<VartopiaDRS__Registration__c> regList = new List<VartopiaDRS__Registration__c>();
						regList.add(currReg);
						oppToApprovedRegList.put(o.id,regList);
					}
					
				}
				
				//throw regs with closed won opps into acct mapping
				if (o.stageName == 'Closed Won') {
					if (acctToBookedRegList.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
						List<VartopiaDRS__Registration__c> regList = acctToBookedRegList.get(currReg.VartopiaDRS__Partner_Account__c);
						regList.add(currReg);
						acctToBookedRegList.put(currReg.VartopiaDRS__Partner_Account__c,regList);
					} else {
						List<VartopiaDRS__Registration__c> regList = new List<VartopiaDRS__Registration__c>();
						regList.add(currReg);
						acctToBookedRegList.put(currReg.VartopiaDRS__Partner_Account__c,regList);
					}
				}
			}
			
			//throw regs that are approved within last 180/365 days into mapping
			if (currReg.VartopiaDRS__Approved_Date__c != null) {
				//365 day mapping
				if ( currReg.VartopiaDRS__Approved_Date__c.daysBetween(date.today()) <= 365) {
					if (acctToRegActivePartnerList.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
						Integer i = acctToRegActivePartnerList.get(currReg.VartopiaDRS__Partner_Account__c);
						i++;
						acctToRegActivePartnerList.put(currReg.VartopiaDRS__Partner_Account__c,i);
					}
				}
				//180 day mapping
				if ( currReg.VartopiaDRS__Approved_Date__c.daysBetween(date.today()) <= 182) {
					if (acctToRegActivePartner6List.containsKey(currReg.VartopiaDRS__Partner_Account__c)) {
						Integer i = acctToRegActivePartner6List.get(currReg.VartopiaDRS__Partner_Account__c);
						i++;
						acctToRegActivePartner6List.put(currReg.VartopiaDRS__Partner_Account__c,i);
					}
				}	
			}
		}
		
		
		Boolean updated = false;
		for (Opportunity o : allOpps.values()) {
			updated = false;
			
			if (oppToApprovedRegList.containsKey(o.id)) {
				List<VartopiaDRS__Registration__c> regList = oppToApprovedRegList.get(o.id);
				if (o.Number_of_Approved_Registrations__c != regList.size()) {
					o.Number_of_Approved_Registrations__c =  regList.size();
					updated = true;
				}
			} else {
				if (o.Number_of_Approved_Registrations__c != 0) {
					o.Number_of_Approved_Registrations__c = 0;
					updated = true;
				}
			}
			
			if(updated) oppUpdate.add(o);
		}
		
		for (Account a : allAccts.values()) {
			updated = false;
			
			//set number of C+ graded partner contacts
			if (acctConCGradeMap.containsKey(a.id)) {
				if (a.Graded_Partners_C_and_Above__c == null || (a.Graded_Partners_C_and_Above__c == 0 && a.NGPC_Score__c == null) ||a.Graded_Partners_C_and_Above__c != acctConCGradeMap.get(a.id)) {
					a.Graded_Partners_C_and_Above__c = acctConCGradeMap.get(a.id);
					if (a.Graded_Partners_C_and_Above__c >= 50) {
						a.NGPC_Score__c = 5;
					} else if (a.Graded_Partners_C_and_Above__c >= 40) {
						a.NGPC_Score__c = 4;
					} else if (a.Graded_Partners_C_and_Above__c >= 30) {
						a.NGPC_Score__c = 3;
					} else if (a.Graded_Partners_C_and_Above__c >= 20) {
						a.NGPC_Score__c = 2;
					} else if (a.Graded_Partners_C_and_Above__c >= 10) {
						a.NGPC_Score__c = 1;
					} else {
						a.NGPC_Score__c = 0;
					}
					updated = true;
				}
			}
			
			//set number of A & B sales contacts
			if (acctConSalesMap.containsKey(a.id)) {
				if (a.A_and_B_Graded_Sales_Partners__c == null || (a.A_and_B_Graded_Sales_Partners__c == 0 && a.NAS_Score__c == null) ||a.A_and_B_Graded_Sales_Partners__c != acctConSalesMap.get(a.id)) {
					a.A_and_B_Graded_Sales_Partners__c = acctConSalesMap.get(a.id);
					if (a.A_and_B_Graded_Sales_Partners__c >= 25) {
						a.NAS_Score__c = 5;
					} else if (a.A_and_B_Graded_Sales_Partners__c >= 20) {
						a.NAS_Score__c = 4;
					} else if (a.A_and_B_Graded_Sales_Partners__c >= 15) {
						a.NAS_Score__c = 3;
					} else if (a.A_and_B_Graded_Sales_Partners__c >= 10) {
						a.NAS_Score__c = 2;
					} else if (a.A_and_B_Graded_Sales_Partners__c >= 5) {
						a.NAS_Score__c = 1;
					} else {
						a.NAS_Score__c = 0;
					}
					updated = true;
				}
			}
			
			//set number of A & B tech contacts
			if (acctConTechMap.containsKey(a.id)) {
				if (a.A_and_B_Graded_Tech_Partners__c == null || (a.A_and_B_Graded_Tech_Partners__c == 0 && a.NAT_Score__c == null) ||a.A_and_B_Graded_Tech_Partners__c != acctConTechMap.get(a.id)) {
					a.A_and_B_Graded_Tech_Partners__c = acctConTechMap.get(a.id);
					if (a.A_and_B_Graded_Tech_Partners__c >= 15) {
						a.NAT_Score__c = 5;
					} else if (a.A_and_B_Graded_Tech_Partners__c >= 12) {
						a.NAT_Score__c = 4;
					} else if (a.A_and_B_Graded_Tech_Partners__c >= 9) {
						a.NAT_Score__c = 3;
					} else if (a.A_and_B_Graded_Tech_Partners__c >= 6) {
						a.NAT_Score__c = 2;
					} else if (a.A_and_B_Graded_Tech_Partners__c >= 3) {
						a.NAT_Score__c = 1;
					} else {
						a.NAT_Score__c = 0;
					}
					updated = true;
				}
			}
			
			//set number of ace certified contacts
			if (acctConACEMap.containsKey(a.id)) {
				if (a.Number_of_ACE_Certified_Contacts__c == null || (a.Number_of_ACE_Certified_Contacts__c == 0 && a.NAC_Score__c == null) ||a.Number_of_ACE_Certified_Contacts__c != acctConACEMap.get(a.id)) {
					a.Number_of_ACE_Certified_Contacts__c = acctConACEMap.get(a.id);
					if (a.Number_of_ACE_Certified_Contacts__c >= 10) {
						a.NAC_Score__c = 5;
					} else if (a.Number_of_ACE_Certified_Contacts__c >= 8) {
						a.NAC_Score__c = 4;
					} else if (a.Number_of_ACE_Certified_Contacts__c >= 6) {
						a.NAC_Score__c = 3;
					} else if (a.Number_of_ACE_Certified_Contacts__c >= 4) {
						a.NAC_Score__c = 2;
					} else if (a.Number_of_ACE_Certified_Contacts__c >= 2) {
						a.NAC_Score__c = 1;
					} else {
						a.NAC_Score__c = 0;
					}
					updated = true;
				}
			}
			
			//set number of partner offices - don't need an else
			if (acctPOCount.containsKey(a.id)) {
				a.Number_Of_Partner_Offices__c = acctPOCount.get(a.id);
				system.debug('### acct ' + a.name);
				if (a.Number_Of_Partner_Offices__c >= 10) {
					a.NPO_Score__c = 5;
				} else if (a.Number_Of_Partner_Offices__c >= 8) {
					a.NPO_Score__c = 4;
				} else if (a.Number_Of_Partner_Offices__c >= 6) {
					a.NPO_Score__c = 3;
				} else if (a.Number_Of_Partner_Offices__c >= 4) {
					a.NPO_Score__c = 2;
				} else if (a.Number_Of_Partner_Offices__c >= 2) {
					a.NPO_Score__c = 1;
				} else {
					a.NPO_Score__c = 0;
				}
				updated = true;
			}
			
			//set number of mapped accounts to partner account 1
			if (acctMappedCount.containsKey(a.id)) {
				if (a.number_of_mapped_sales_accounts__c == null || (a.number_of_mapped_sales_accounts__c == 0 && a.NMA_Score__c == null) || a.number_of_mapped_sales_accounts__c != acctMappedCount.get(a.id)) {
					a.number_of_mapped_sales_accounts__c = acctMappedCount.get(a.id);
					if (a.number_of_mapped_sales_accounts__c >= 50) {
						a.NMA_Score__c = 5;
					} else if (a.number_of_mapped_sales_accounts__c >= 40) {
						a.NMA_Score__c = 4;
					} else if (a.number_of_mapped_sales_accounts__c >= 30) {
						a.NMA_Score__c = 3;
					} else if (a.number_of_mapped_sales_accounts__c >= 20) {
						a.NMA_Score__c = 2;
					} else if (a.number_of_mapped_sales_accounts__c >= 10) {
						a.NMA_Score__c = 1;
					} else {
						a.NMA_Score__c = 0;
					}
					updated = true;
				}
			}
			
			//set number of booked regs tied to this partner - need an else
			if (acctToBookedRegList.containsKey(a.id)) {
				List<VartopiaDRS__Registration__c> regList = acctToBookedRegList.get(a.id);
				if(a.number_of_booked_registrations__c != null && a.number_of_booked_registrations__c != regList.size()) {
					a.number_of_booked_registrations__c = regList.size();
					updated = true;
				} else {
					a.number_of_booked_registrations__c = regList.size();
					updated = true;
				}
			} else {
				if (a.Number_of_booked_registrations__c != 0) {
					a.number_of_booked_registrations__c = 0;
					updated = true;
				}
			}
			
			//determine first/last registration date based on submit date
			if (acctToAllRegList.containsKey(a.id)) {
				List<VartopiaDRS__Registration__c> regList = acctToAllRegList.get(a.id);
				system.debug('### ' + regList.size());
				
				if (!regList.isEmpty()) {
					
					List<RegistrationWrapper> regWrapList = new List<RegistrationWrapper>();
					for (VartopiaDRS__Registration__c reg : regList) {
						regWrapList.add(new RegistrationWrapper(reg));
					}
					regWrapList.sort();
					
					if (a.first_registration_date__c != regWrapList.get(0).thisReg.VartopiaDRS__Date_Submitted__c) {
						a.first_registration_date__c = regWrapList.get(0).thisReg.VartopiaDRS__Date_Submitted__c;
						updated = true;	
					}
					if (a.last_registration_date__c != regWrapList.get(regWrapList.size()-1).thisReg.VartopiaDRS__Date_Submitted__c) {
						a.last_registration_date__c = regWrapList.get(regList.size()-1).thisReg.VartopiaDRS__Date_Submitted__c;
						updated = true;
					}
					if (a.number_of_registrations__c != regList.size()) {
						a.number_of_registrations__c = regList.size();
						updated = true;
					}
				} else {
					if (a.first_registration_date__c != null || a.last_registration_date__c != null || a.number_of_registrations__c != 0 || a.number_of_registrations__c != null) {
						a.first_registration_date__c = null;
						a.last_registration_date__c = null;
						a.number_of_registrations__c = 0;
						updated = true;
					}
				}
			}
			
			if (acctToTotalBookings12.containsKey(a.id)) {
				if (a.registered_bookings_last_12_months__c == null || (a.registered_bookings_last_12_months__c == 0 && a.TR12_Score__c == null) ||a.registered_bookings_last_12_months__c != acctToTotalBookings12.get(a.id)) {
					a.registered_bookings_last_12_months__c = acctToTotalBookings12.get(a.id);
					if (a.registered_bookings_last_12_months__c >= 500000) {
						a.TR12_Score__c = 5;
					} else if (a.registered_bookings_last_12_months__c >= 400000) {
						a.TR12_Score__c = 4;
					} else if (a.registered_bookings_last_12_months__c >= 300000) {
						a.TR12_Score__c = 3;
					} else if (a.registered_bookings_last_12_months__c >= 200000) {
						a.TR12_Score__c = 2;
					} else if (a.registered_bookings_last_12_months__c >= 100000) {
						a.TR12_Score__c = 1;
					} else {
						a.TR12_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToTotalBookings6.containsKey(a.id)) {
				if (a.registered_bookings_last_6_months__c == null || (a.registered_bookings_last_6_months__c == 0 && a.TR6_Score__c == null) || a.registered_bookings_last_6_months__c != acctToTotalBookings6.get(a.id)) {
					a.registered_bookings_last_6_months__c = acctToTotalBookings6.get(a.id);
					if (a.registered_bookings_last_6_months__c >= 250000) {
						a.TR6_Score__c = 5;
					} else if (a.registered_bookings_last_6_months__c >= 200000) {
						a.TR6_Score__c = 4;
					} else if (a.registered_bookings_last_6_months__c >= 150000) {
						a.TR6_Score__c = 3;
					} else if (a.registered_bookings_last_6_months__c >= 100000) {
						a.TR6_Score__c = 2;
					} else if (a.registered_bookings_last_6_months__c >= 50000) {
						a.TR6_Score__c = 1;
					} else {
						a.TR6_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToIncrementalBookings12.containsKey(a.id)) {
				if (a.incremental_bookings_last_12_months__c == null || (a.incremental_bookings_last_12_months__c == 0 && a.IR12_Score__c == null) || a.incremental_bookings_last_12_months__c != acctToIncrementalBookings12.get(a.id)) {
					a.incremental_bookings_last_12_months__c = acctToIncrementalBookings12.get(a.id);
					if (a.incremental_bookings_last_12_months__c >= 250000) {
						a.IR12_Score__c = 5;
					} else if (a.incremental_bookings_last_12_months__c >= 200000) {
						a.IR12_Score__c = 4;
					} else if (a.incremental_bookings_last_12_months__c >= 150000) {
						a.IR12_Score__c = 3;
					} else if (a.incremental_bookings_last_12_months__c >= 100000) {
						a.IR12_Score__c = 2;
					} else if (a.incremental_bookings_last_12_months__c >= 50000) {
						a.IR12_Score__c = 1;
					} else {
						a.IR12_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToIncrementalBookings6.containsKey(a.id)) {
				if (a.incremental_bookings_last_6_months__c == null || (a.incremental_bookings_last_6_months__c == 0 && a.IR6_Score__c == null) || a.incremental_bookings_last_6_months__c != acctToIncrementalBookings6.get(a.id)) {
					a.incremental_bookings_last_6_months__c = acctToIncrementalBookings6.get(a.id);
					if (a.incremental_bookings_last_6_months__c >= 125000) {
						a.IR6_Score__c = 5;
					} else if (a.incremental_bookings_last_6_months__c >= 100000) {
						a.IR6_Score__c = 4;
					} else if (a.incremental_bookings_last_6_months__c >= 75000) {
						a.IR6_Score__c = 3;
					} else if (a.incremental_bookings_last_6_months__c >= 50000) {
						a.IR6_Score__c = 2;
					} else if (a.incremental_bookings_last_6_months__c >= 25000) {
						a.IR6_Score__c = 1;
					} else {
						a.IR6_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToIncrementalPipe12.containsKey(a.id)) {
				if (a.incremental_pipe_adds_last_12_months__c == null || (a.incremental_pipe_adds_last_12_months__c == 0 && a.IP12_Score__c == null) ||a.incremental_pipe_adds_last_12_months__c != acctToIncrementalPipe12.get(a.id)) {
					a.incremental_pipe_adds_last_12_months__c = acctToIncrementalPipe12.get(a.id);
					if (a.incremental_pipe_adds_last_12_months__c >= 1000000) {
						a.IP12_Score__c = 5;
					} else if (a.incremental_pipe_adds_last_12_months__c >= 800000) {
						a.IP12_Score__c = 4;
					} else if (a.incremental_pipe_adds_last_12_months__c >= 600000) {
						a.IP12_Score__c = 3;
					} else if (a.incremental_pipe_adds_last_12_months__c >= 400000) {
						a.IP12_Score__c = 2;
					} else if (a.incremental_pipe_adds_last_12_months__c >= 200000) {
						a.IP12_Score__c = 1;
					} else {
						a.IP12_Score__c = 0;
					}
					updated = true;
				} 
			}
			
			if (acctToIncrementalPipe6.containsKey(a.id)) {
				if (a.incremental_pipe_adds_last_6_months__c == null || (a.incremental_pipe_adds_last_6_months__c == 0 && a.IP6_Score__c == null) || a.incremental_pipe_adds_last_6_months__c != acctToIncrementalPipe6.get(a.id)) {
					a.incremental_pipe_adds_last_6_months__c = acctToIncrementalPipe6.get(a.id);
					if (a.incremental_pipe_adds_last_6_months__c >= 500000) {
						a.IP6_Score__c = 5;
					} else if (a.incremental_pipe_adds_last_6_months__c >= 400000) {
						a.IP6_Score__c = 4;
					} else if (a.incremental_pipe_adds_last_6_months__c >= 300000) {
						a.IP6_Score__c = 3;
					} else if (a.incremental_pipe_adds_last_6_months__c >= 200000) {
						a.IP6_Score__c = 2;
					} else if (a.incremental_pipe_adds_last_6_months__c >= 100000) {
						a.IP6_Score__c = 1;
					} else {
						a.IP6_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToTotalPipe12.containsKey(a.id)) {
				if (a.registered_pipe_adds_last_12_months__c == null || (a.registered_pipe_adds_last_12_months__c == 0 && a.TP12_Score__c == null) || a.registered_pipe_adds_last_12_months__c != acctToTotalPipe12.get(a.id)) {
					a.registered_pipe_adds_last_12_months__c = acctToTotalPipe12.get(a.id);
					if (a.registered_pipe_adds_last_12_months__c >= 2000000) {
						a.TP12_Score__c = 5;
					} else if (a.registered_pipe_adds_last_12_months__c >= 1600000) {
						a.TP12_Score__c = 4;
					} else if (a.registered_pipe_adds_last_12_months__c >= 1200000) {
						a.TP12_Score__c = 3;
					} else if (a.registered_pipe_adds_last_12_months__c >= 800000) {
						a.TP12_Score__c = 2;
					} else if (a.registered_pipe_adds_last_12_months__c >= 400000) {
						a.TP12_Score__c = 1;
					} else {
						a.TP12_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToTotalPipe6.containsKey(a.id)) {
				if (a.registered_pipe_adds_last_6_months__c == null || (a.registered_pipe_adds_last_6_months__c == 0 && a.TP6_Score__c == null) ||a.registered_pipe_adds_last_6_months__c != acctToTotalPipe6.get(a.id)) {
					a.registered_pipe_adds_last_6_months__c = acctToTotalPipe6.get(a.id);
					if (a.registered_pipe_adds_last_6_months__c >= 1000000) {
						a.TP6_Score__c = 5;
					} else if (a.registered_pipe_adds_last_6_months__c >= 800000) {
						a.TP6_Score__c = 4;
					} else if (a.registered_pipe_adds_last_6_months__c >= 600000) {
						a.TP6_Score__c = 3;
					} else if (a.registered_pipe_adds_last_6_months__c >= 400000) {
						a.TP6_Score__c = 2;
					} else if (a.registered_pipe_adds_last_6_months__c >= 200000) {
						a.TP6_Score__c = 1;
					} else {
						a.TP6_Score__c = 0;
					}
					updated = true;
				}
			}			
			
			
			
			if (acctToRegActivePartnerList.containsKey(a.id)) {
				//set whether this partner should be labeled an active partner
				if (acctToRegActivePartnerList.get(a.id) > 0 && a.Active_Partner__c == false) {
					a.Active_Partner__c = true;
					updated = true;
				} else if (a.Active_Partner__c == true && acctToRegActivePartnerList.get(a.id) == 0) {
					a.Active_Partner__c = false;
					updated = true;
				}
				
				//set number of approved regs in last 12 months
				if (a.approved_registrations_last_12_months__c == null || (a.approved_registrations_last_12_months__c == 0 && a.AR12_Score__c == null) ||a.approved_registrations_last_12_months__c != acctToRegActivePartnerList.get(a.id)) {
					a.approved_registrations_last_12_months__c = acctToRegActivePartnerList.get(a.id);
					if (a.approved_registrations_last_12_months__c >= 50) {
						a.AR12_Score__c = 5;
					} else if (a.approved_registrations_last_12_months__c >= 40) {
						a.AR12_Score__c = 4;
					} else if (a.approved_registrations_last_12_months__c >= 30) {
						a.AR12_Score__c = 3;
					} else if (a.approved_registrations_last_12_months__c >= 20) {
						a.AR12_Score__c = 2;
					} else if (a.approved_registrations_last_12_months__c >= 10) {
						a.AR12_Score__c = 1;
					} else {
						a.AR12_Score__c = 0;
					}
					updated = true;
				}
			}
			
			if (acctToRegActivePartner6List.containsKey(a.id)) {
				//set number of approved regs in last 6 months
				if (a.approved_registrations_last_6_months__c == null || (a.approved_registrations_last_6_months__c == 0 && a.AR6_Score__c == null) || a.approved_registrations_last_6_months__c != acctToRegActivePartner6List.get(a.id)) {
					a.approved_registrations_last_6_months__c = acctToRegActivePartner6List.get(a.id);
					if (a.approved_registrations_last_6_months__c >= 25) {
						a.AR6_Score__c = 5;
					} else if (a.approved_registrations_last_6_months__c >= 20) {
						a.AR6_Score__c = 4;
					} else if (a.approved_registrations_last_6_months__c >= 15) {
						a.AR6_Score__c = 3;
					} else if (a.approved_registrations_last_6_months__c >= 10) {
						a.AR6_Score__c = 2;
					} else if (a.approved_registrations_last_6_months__c >= 5) {
						a.AR6_Score__c = 1;
					} else {
						a.AR6_Score__c = 0;
					}
					updated = true;
				} 
			}
			
			if (updated) accountUpdate.add(a);
		}
		
		
		if (!oppUpdate.isEmpty()) update oppUpdate;
		if (!accountUpdate.isEmpty()) update accountUpdate;
		
		VMTUtils.inBatch = false;
		
	}
	
	global void finish(Database.BatchableContext BC){
		
		AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
		if (a.NumberOfErrors > 0 && !(a.ExtendedStatus.contains('UNABLE_TO_LOCK_ROW'))) {
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
			String[] toAddresses = new String[] {a.CreatedBy.Email, 'justin.chang@vmturbo.com', 'nadine.tardiff@turbonomic.com', 'charmian.mcintyre@turbonomic.com', 'SFAdmin@turbonomic.com'};
			mail.setToAddresses(toAddresses);
			mail.setSubject('Batch Update Partner Account Info: ' + a.Status);
			mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		}
		
		
	}


}