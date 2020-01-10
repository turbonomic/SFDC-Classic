public class OpportunityMethods {
  
  /*  Table of Contents - to quickly find the method you want, ctrl + F and use the below bracketed values
  *            Note: the format is the letter "O", not the number 0
  *
  *  [O1]  auto opportunity naming/amount method
  *  [O2]  exec alert email method
  *  [O3]  opportunity contact role method
  *  [O4]  Registration fill vendor status method
  *  [O5]  Opportunity update team to owner's team method
  *  [O6]  Opportunity Progress stamp method
  *  [O7]  Opportunity Close Contacts on Unqualified/Closed Lost
  *  [O8]  Opportunity fill Partner Account on the Account level if new Partner
  *  [O9]  Opportunity set First Demo Scheduled - *Depreciated* - Moved to TaskFutureMethods Class
  *  [O10]  Opportunity set first demo completed - *Depreciated* -  Moved to TaskFutureMethods Class
  *  [O11]  Email Update Stamp
  *  [O12]  *Opportunity Split* EJF Risk Projections Calculations
  *  [O13]  Set Opp Lookup Fields (Active/Closed/Maintenance Opps)
  *  [O14]  Opportunity Auto-Stage Movement 
  *  [O15]  Opportunity Stage Helper Method - Helper Method to set criteria for Automated Opportunity Stage Movements in Test Classes
  *	 [O16]  FillManualCampaignSource - Replaces the OpportunityFillManualCampaignSource trigger. Overrides Primary campaign source with the value in the manual primary campaign source field.
  *  [O17]  setCommissionAlertFlag - Set flag to alert Finance for land and expand commission elegible deals
  *	
  */
  
  

  /*
  *  [O1]
  *  auto opportunity name creation method
  *
  *
  */
  public static void oppAutoNameCreation(List<Opportunity> oList) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    for (Opportunity opp : oList) {
      if (opp.Name != 'Vartopia Default Opportunity'){
         if ((!opp.Owner_Role_Full__c.containsIgnoreCase('Global')) && (!opp.Owner_Role_Full__c.containsIgnoreCase('Alliance')) && (!opp.Cisco_Opportunity__c)) {
           if (opp.type != null) {
             if (opp.type == 'New' || opp.type == 'Upsell') {
               if (opp.stageName != null) {
                 if (opp.stageName != 'Unqualified' && opp.stageName != 'Closed Lost' && opp.stageName != 'Closed Won') {
                   if (opp.Control_Module_Only__c != null) {
                     if (!opp.Control_Module_Only__c) {
                      oppList.add(opp);
                     }
                   }
                 }
               }           
             }     
           }
         }
       }
    }
    
    /*Integer baseWorkloadPriceTermMonth = 11; Integer baseWorkloadPriceTermYear = 125; Integer baseWorkloadPricePerm = 250;
    Integer baseApplicationPriceTermMonth = 16; Integer baseApplicationPriceTermYear = 188; Integer baseApplicationPricePerm = 375;
    Integer baseCloudNativePriceTermMonth = 21; Integer baseCloudNativePriceTermYear = 250; Integer baseCloudNativePricePerm = 499;
    Integer baseWorkloadStarterPriceTermMonth = 7; Integer baseWorkloadStarterPriceTermYear = 83; Integer baseWorkloadStarterPricePerm = 165;*/
    
    for (Opportunity opp: oppList) {  
     
       /*Double calculatedAmount;
       Double oldSocketAmount;*/
       String tempName;
       
       
       //Check if there is an opp name override. If no override then use account name.
       if (opp.Opportunity_Name_Override__c != null) {
         tempName = opp.Opportunity_Name_Override__c + '-';
       }
       else tempName = opp.Account_Name__c + '-';
           
       //System.debug('Working OppName: ' + opp.name);
       //System.debug('# of sockets: ' + opp.of_CPU_Sockets__c);
       //System.debug('# of VMs: ' + opp.of_Virtual_Machines__c);
       
       //If opportunity has Core information append it to the name and calculate the opportunity amount
       if (opp.of_Virtual_Machines__c != null) {
       	 tempName += opp.of_Virtual_Machines__c + ' Wklds';
       } else if (opp.of_CPU_Sockets__c != null) {
       	 tempName += opp.of_CPU_Sockets__c + ' Sckts';
       } else if (opp.of_Cores__c != null) {
       	 tempName += opp.of_Cores__c + ' Cores';
       }
       
       //Append Product type to Opp Name
       if (opp.Product_Type__c != null) {
       		if (opp.Product_Type__c == 'Workload Starter' || opp.Product_Type__c == 'Virtualization') tempName += ' Virt-';
       		else if (opp.Product_Type__c == 'Workload') tempName += ' Wrkld-';
       		else if (opp.Product_Type__c == 'Application') tempName += ' App-';
       		else if (opp.Product_Type__c == 'Cloud Native') tempName += ' Cloud-';
       		else if (opp.Product_Type__c == 'Essentials') tempName += ' Essentials Edition-';
       		else if (opp.Product_Type__c == 'Advanced') tempName += ' Advanced Edition-';
       		else if (opp.Product_Type__c == 'Premier') tempName += ' Premier Edition-';
       } else tempName += ' -';
       
       //Append Term or SNM Length to Opp Name
       String termLength = '';
       if (opp.Term_or_SNM_Length_in_Months__c != null) {
       		if (opp.Term_or_SNM_Length_in_Months__c >= 12) {
       			Long tempMonthsToYears = system.Math.roundToLong(opp.Term_or_SNM_Length_in_Months__c/12);
       			termLength += tempMonthsToYears + ' Year ';
       		}
       		else termLength += opp.Term_or_SNM_Length_in_Months__c + ' Month ';
       }
       
       //Append Term vs. Perm
       if (opp.Term_or_Perm__c != null) {
       		if (opp.Term_or_Perm__c == 'Term') tempName += termLength + 'Term';
       		else if (opp.Term_or_Perm__c == 'Perm') {
       			if (termLength != '') {
       				tempName += 'Perm (' + termLength + 'SNM)';
       			}
       			else tempName += 'Perm';
       		}
       }
       
       
     	opp.name = tempName;
     	//System.debug('Final OppName: ' + opp.name);
     
     }
    
  }
  
  
  /*
  *  [O2]
  *   send Opportunity Changes to Exec Team
  *
  */
  public static void oppChangesEmailAlertExecTeam(Map<id,Opportunity> opps, Map<id,Opportunity> oldOpps) {
    
    Map<id, Opportunity> updateOpps = new Map<id, Opportunity>();
    Map<id, Opportunity> oldUpdateOpps = new Map<id, Opportunity>();
    Set<Opportunity> allOppsToEmail = new Set<Opportunity>();
    Map<id,List<String>> oppEmailTypeMap = new Map<id,List<String>>();
    Set<id> AccountIds = new Set<Id>(); 
    Set<id> ClosedWonOpps = new Set<Id>();
    
    
    for (Opportunity opp : opps.values()) {
    	
    	boolean isEnterprise = opp.Owner_Team_Group_Buckets__c	 == 'US Enterprise';
    	
    	if (opp.Exec_Email_Switch__c) {
      		if (opp.Type != 'Maintenance Renewal') {
	      	
	          //if new opp is created and is Upside+ or Closed Lost
	            if (opps.containsKey(opp.id) && !oldOpps.containsKey(opp.id)) {
	            	if (opp.Probability > 25 || (opp.StageName == 'Upside' && opp.Amount > 150000) || opp.StageName == 'Closed Lost') {
	                	allOppsToEmail.add(opp);
	                	if (oppEmailTypeMap.containsKey(opp.id)) {
	                    	List<String> emailRecipientTypes = oppEmailTypeMap.get(opp.id);
	                      	emailRecipientTypes.add('Exec');
	                      	oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                   	} else {
	                      	List<String> emailRecipientTypes = new List<String>();
	                      	emailRecipientTypes.add('Exec');
	                      	oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                   	}
	      
	                   	if (opp.partner_account__c != null) {
	                    	accountIds.add(opp.partner_account__c);
	                   	}
	                   	if (opp.accountId != null) {
	                    	accountIds.add(opp.AccountId);
	                   	}
	                 }       
	             } else {
	             	//if opp is moved back into Identify from Pipe+ add to updateOpps map excluding US Enterprise
	               	if ((opp.StageName == 'Identify') && (oldOpps.get(opp.id).StageName != opp.StageName) && (oldOpps.get(opp.id).Probability > 0 || oldOpps.get(opp.id).StageName == 'Pipeline') ) {
	               		if (!isEnterprise) {
	                  		updateOpps.put(opp.id,opp);
	                  		oldUpdateOpps.put(opp.id,oldOpps.get(opp.id));
	                  		allOppsToEmail.add(opp);
	                 
	                  		if (oppEmailTypeMap.containsKey(opp.id)) {
	                       		List<String> emailRecipientTypes = oppEmailTypeMap.get(opp.id);
	                       		emailRecipientTypes.add('Exec');
	                       		oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                   		} else {
	                       		List<String> emailRecipientTypes = new List<String>();
	                       		emailRecipientTypes.add('Exec');
	                       		oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                   		}
	                 
	                   		if (opp.partner_account__c != null) {
	                       		accountIds.add(opp.partner_account__c);
	                   		}
	                  		if (opp.accountId != null) {
	                       		accountIds.add(opp.AccountId);
	                  		}
	               		}
	                }
	                //if Opp Amount, Stage, Probability, or Close Date is updated and the opp is in Strong Upside+ or Closed Lost, add to updateOpps map
	                else if (((oldOpps.get(opp.id).Amount != opp.Amount) || (oldOpps.get(opp.id).StageName != opp.StageName) || (oldOpps.get(opp.id).CloseDate != opp.CloseDate) || (oldOpps.get(opp.id).Probability != opp.Probability)) && (opp.Probability > 25 || opp.StageName == 'Closed Lost')) {
	                	updateOpps.put(opp.id,opp);
	                  	oldUpdateOpps.put(opp.id,oldOpps.get(opp.id));
	                  	allOppsToEmail.add(opp);
	                 
	                  	if (oppEmailTypeMap.containsKey(opp.id)) {
	                    	List<String> emailRecipientTypes = oppEmailTypeMap.get(opp.id);
	                    	emailRecipientTypes.add('Exec');
	                       	oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                  	} else {
	                    	List<String> emailRecipientTypes = new List<String>();
	                       	emailRecipientTypes.add('Exec');
	                       	oppEmailTypeMap.put(opp.id,emailRecipientTypes);
	                  	}
	                 
	                  	if (opp.partner_account__c != null) {
	                       	accountIds.add(opp.partner_account__c);
	                  	}
	                  	if (opp.accountId != null) {
	                      	accountIds.add(opp.AccountId);
	                  	}
	                }
	                //if opp is Closed Won and has products add to ClosedWonOpps List
	                if (opp.StageName == 'Closed Won') {
	                	if (opp.Product_Count__c > 0) {
	                    	ClosedWonOpps.add(opp.id);
	                   	}
	              	}
	            }  
	      	} 
      	} 
    }
    
    List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    Map<id,Account> allAccts = new Map<id,Account>([select id, name, StateCountry__c from Account where id in: accountIds]);
     
    List<String> args = new String[]{'0','number','###,###,##0.00'};
     
    //Query for Opportunity Products for Closed Won Opps
    Map<id,OpportunityLineItem> oppProducts = new Map<id, OpportunityLineItem>([SELECT ListPrice, UnitPrice, Quantity, OpportunityId FROM OpportunityLineItem WHERE OpportunityId in: ClosedWonOpps]); 
    Map<id,Double> ListPriceMap  = new Map<id,double>();
    //Map<id,Double> SalesPriceMap = new Map<id,double>();
     
    for (OpportunityLineItem product: oppProducts.values()) {
      Double ListPriceSum;
        //Double SalesPriceSum;
       
      if(ListPriceMap.containsKey(product.OpportunityId)) {
           ListPriceSum = (product.ListPrice*product.Quantity) + ListPriceMap.get(product.OpportunityId); 
           ListPriceMap.put(product.OpportunityId,ListPriceSum);
         }
         else {
           ListPriceSum = (product.ListPrice*product.Quantity);
           ListPriceMap.put(product.OpportunityId,ListPriceSum);
         }
         /*if(SalesPriceMap.containsKey(product.OpportunityId)) {
           SalesPriceSum = product.UnitPrice + SalesPriceMap.get(product.OpportunityId);
           SalesPriceMap.put(product.OpportunityId,SalesPriceSum);
         }
         else {
           SalesPriceSum = product.UnitPrice;
           SalesPriceMap.put(product.OpportunityId,SalesPriceSum);
         } */
     }
     
     Set<id> oppOwnersList = new Set<id>();
     for (Opportunity opp: allOppsToEmail) {
       oppOwnersList.add(opp.OwnerId);
     } 
     //Grab Opp Owner's email and Manager email
     Map<id, User> oppOwnerEmailMap = new Map<id, User>([SELECT id, Email, Manager_Email__c FROM User WHERE id in: oppOwnersList]);
     
     for (Opportunity opp: allOppsToEmail) {
       //if (opp.Exec_Email_Alert_Flag__c) {
        String PriorStage = '';
        String PriorAmount = '';
        String PriorCloseDate = '';
        Double ListPriceTotal;
        //Double SalesPriceTotal;
        Double discount;
        Boolean includeDiscount = false;
        boolean isEnterprise = opp.Owner_Team_Group_Buckets__c	 == 'US Enterprise';
        boolean isAlliance = opp.Owner_Team_Group_Buckets__c == 'Global Accounts US';
        Boolean isBurnDown = false;
         
        if (updateOpps.containsKey(opp.id)) {
          if (oldUpdateOpps.get(opp.id) != null) {
              if (oldUpdateOpps.get(opp.id).stageName != null) {
              	if (oldUpdateOpps.get(opp.id).StageName != opp.StageName) PriorStage = oldUpdateOpps.get(opp.id).StageName;
              }
              if (oldUpdateOpps.get(opp.id).amount != null) {
               	if (oldUpdateOpps.get(opp.id).Amount != opp.Amount) PriorAmount += ('$' + String.format((oldUpdateOpps.get(opp.id).Amount).format(),args));
              }
              if (oldUpdateOpps.get(opp.id).closeDate != null) {
                if (oldUpdateOpps.get(opp.id).CloseDate != opp.CloseDate) PriorCloseDate = String.valueOf(oldUpdateOpps.get(opp.id).CloseDate.month()) + '/' + String.valueOf(oldUpdateOpps.get(opp.id).CloseDate.day()) + '/' +String.valueOf(oldUpdateOpps.get(opp.id).CloseDate.year());
              }
          }
        }
         
        //If Opp is Closed Won and has products, calculate List Price and Overall Discount
        if (ClosedWonOpps.contains(opp.id)) {
           
             if (ListPriceMap.containsKey(opp.id)) {
              ListPriceTotal = ListPriceMap.get(opp.id);
             }
             /*if (SalesPriceMap.ContainsKey(opp.id)) {
               SalesPriceTotal = SalesPriceMap.get(opp.id);
             }*/
             if (ListPriceTotal != null) {
               if (ListPriceTotal != 0) {
                   discount = 100-((opp.Amount/ListPriceTotal)*100);
                  includeDiscount = true;             
               } 
             }
           
        }
        
        //If Opportunity is Burn down include the VM Count
        if (opp.Type == 'Burn down' || opp.Type == 'Burn down (non-license)') isBurnDown = true;
        
        
        String emailSubject = opp.Info_for_Email_Subject_Apex__c + ' Opportunity ' + opp.Name + ' has been updated/added';
        String emailBody;
         
        emailBody = 'The Opportunity ' + opp.Name + ' for account ' + opp.Account_Name__c + ' has been updated/added. \n\n';
        emailBody += 'Changes (blanks indicate no change):' + '\n\n';
        emailBody += 'Prior Stage: ' + PriorStage + '\n';
        emailBody += 'Current Stage: ' + opp.StageName + '\n';
        //If deal is burndown, replace Amount with VM Count
        if (isBurnDown) {
        	emailBody += 'Number of licenses: '; if (opp.of_Virtual_Machines__c != null)  emailBody += opp.of_Virtual_Machines__c; emailBody += '\n';
        } else {
        	emailBody += 'Prior Amount: ' + PriorAmount + '\n';
        	emailBody += 'Current Amount: '; if (opp.Amount != null) emailBody += '$' + String.format((opp.Amount).format(),args); emailBody += '\n';
        }
        if (includeDiscount) {emailBody += 'List Price: ' + '$' + String.format(ListPriceTotal.format(),args); emailBody += '\n'; emailBody += 'Overall Discount: ' + String.format(discount.format(),args) + '%'; emailBody += '\n';}
        emailBody += 'Prior Close Date: ' +  PriorCloseDate + '\n';
        emailBody += 'Current Close Date: '; if (opp.CloseDate != null) emailBody += opp.CloseDate.month() + '/' + opp.CloseDate.day() + '/' + opp.CloseDate.year(); emailBody += '\n';
        emailBody += 'Opportunity Score: ' + opp.VMT_Opportunity_Score__c  + '\n\n';
        emailBody += 'Type: '; if(opp.type != null) emailBody += opp.Type; emailBody += '\n';
        emailBody += 'Probability: ' + opp.Probability + '\n';
        emailBody += 'Forecast Amount: '; if (opp.forecasted_bookings__c != null) emailBody += '$' + String.format(opp.Forecasted_Bookings__c.format(),args); emailBody += '\n';
        emailBody += 'Owner: ' + opp.OpportunityOwner__c + '\n';
        emailBody += 'Owner Team: '; if(opp.Owner_Team__c != null) emailBody += opp.Owner_Team__c; emailBody += '\n';
        emailBody += 'State/Country: '; if(allAccts.containsKey(opp.AccountId)) emailBody += allAccts.get(opp.AccountId).StateCountry__c; emailBody += '\n';
        emailBody += 'Identified By (Role): '; if(opp.Identified_by_name__c != null) emailBody += opp.Identified_By_Name__c; emailBody += ' ('; if (opp.Identified_By_role_Static__c != null) emailBody += opp.Identified_By_Role_Static__c; emailBody += ')\n\n';
        emailBody += 'Lead Source: ';  if (opp.LeadSource != null) emailBody += opp.LeadSource; emailBody += '\n';
        emailBody += 'Primary Campaign Source: '; if (opp.Primary_Campaign_Source_Name__c != null) emailBody += opp.Primary_Campaign_Source_Name__c; emailBody += '\n';
        emailBody += 'First Demo Date: '; if(opp.first_demo_date__c != null) emailBody += (opp.First_Demo_Date__c.month() + '/' + opp.First_Demo_Date__c.day() + '/' + opp.First_Demo_Date__c.year()); emailBody += '\n';
        emailBody += 'Eval Start Date: '; if (opp.Eval_start_Date__c != null) emailBody += (opp.Eval_Start_Date__c.month() + '/' + opp.Eval_Start_Date__c.day() + '/' + opp.Eval_Start_Date__c.year()); emailBody += '\n';
        emailBody += 'Partner: '; if(opp.Partner_Account__c != null) emailBody += allAccts.get(opp.Partner_Account__c).name; emailBody += '\n';
        emailBody += 'Lost Reason: '; if(opp.Lost_Reason__c != null) emailBody += opp.Lost_Reason__c; emailBody += '\n';
        emailBody += 'Lost Reason Detail:'; if(opp.Lost_Reason_Detail__c != null) emailBody += opp.Lost_Reason_Detail__c; emailBody += '\n\n';
        //emailBody += 'Reason for Change: '; if(opp.Reason_for_Change__c != null) emailBody += opp.Reason_for_Change__c; emailBody += '\n\n';
        emailBody += 'To view the full record follow: https://eu4.salesforce.com/' + opp.id + '\n\n\n';
         
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         
         
    	//String[] toAddresses = new String[] {'eddie.genao@vmturbo.com'};
    	String[] toAddresses;
        if (!isEnterprise) toAddresses = new String[] {'shmuel.kliger@turbonomic.com','tom.murphy@turbonomic.com','yuri.rabover@turbonomic.com','mo.garad@turbonomic.com','maurice.bedoni@turbonomic.com','ben.nye@turbonomic.com','eddie.genao@turbonomic.com', 'dicken.chaplin@turbonomic.com','mark.thurmond@turbonomic.com'};
        if (isEnterprise) toAddresses = new String[] {'shmuel.kliger@turbonomic.com','mo.garad@turbonomic.com','maurice.bedoni@turbonomic.com','eddie.genao@turbonomic.com', 'dicken.chaplin@turbonomic.com','mark.thurmond@turbonomic.com'};
        if (isAlliance) toAddresses.add('fj.gould@turbonomic.com'); //Add FJ to alliances Opp alerts
        String ownerEmail = oppOwnerEmailMap.get(opp.OwnerId).Email;
        toAddresses.add(ownerEmail); //Add Opp Owner to email
        //If Owner has manager, add to email as well
        if (oppOwnerEmailMap.get(opp.OwnerId).Manager_Email__c != null) {
           String managerEmail = oppOwnerEmailMap.get(opp.OwnerId).Manager_Email__c;
           toAddresses.add(managerEmail);
        }
         
        mail.setToAddresses(toAddresses);
        mail.setSubject(emailsubject);
        mail.setPlainTextBody(emailBody);
        mailList.add(mail);
          
          
          //opp.Exec_Email_Alert_Flag__c = false;
       //}   
     }
     
     if (mailList.size() > 0) Messaging.sendEmail(mailList);

  }
  
  
  	/*
  	*  [O3]
  	*   Opportunity Count Num Contact Roles
  	*
  	*/
	public static void oppCountContactRoles (Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
    
    	Map<id,Opportunity> oppMap = new Map<id,Opportunity>();
      	Map<id, Integer> oppCRCount = new Map<id, Integer>();
    
    	for (Opportunity opp : oList.values()) {
      		if (opp.Type != 'Quota' && opp.Type != 'Forecast') {
          		oppMap.put(opp.id,opp);
          		oppCRCount.put(opp.id,0);
        	}
    	}
    	
		if (oppMap.size() > 0) {
	    	List<OpportunityContactRole> allOppCR = new List<OpportunityContactRole>([SELECT id, OpportunityId FROM OpportunityContactRole WHERE OpportunityId =: oppMap.values() AND IsDeleted = false]);
	    
	      	if (!allOppCR.isEmpty()) {
	        	for (OpportunityContactRole oppCon: allOppCR) {
	          		oppCRCount.put(oppCon.OpportunityId, oppCRCount.get(oppCon.OpportunityId)+1);
	        	}
	      	}
	      
	      	for (Opportunity opp: oppMap.values()) {
	        
	        	//Update the Opportunity Contact Role Count
	        	if (oppCRCount.containsKey(opp.Id)) { 
	          		if (opp.Contact_Role_Count__c != oppCRCount.get(opp.Id)) {
	              		opp.Contact_Role_Count__c = oppCRCount.get(opp.Id);
	             	}
	           	}
	      	}
		}
  	}
  
  /*
  *   [O4]
  *  opportunity fill Vendor Status on approved registrations
  *
  */
  public static void oppFillRegVendorStatus (Map<id,Opportunity> oppList, Map<id,Opportunity> oldOList) { 
    Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();
    List<VartopiaDRS__Registration__c> updateRegs = new List<VartopiaDRS__Registration__c>();
    
    // determine which opps we want to process
    for (Opportunity opp : oppList.values()) {
      if (oldOList.get(opp.id).stageName != opp.StageName && (opp.StageName == 'Closed Won' || opp.stageName == 'Closed Lost' || opp.stageName == 'Unqualified')) {
        oppMap.put(opp.id,opp);
      }
    }
    
    if (oppMap.size() > 0) {
      //query all related approved registrations  
      Map<Id,VartopiaDRS__Registration__c> regMap = new Map<Id,VartopiaDRS__Registration__c>([select id, VartopiaDRS__Vendor_Status__c, VartopiaDRS__Opportunity__c from VartopiaDRS__Registration__c where VartopiaDRS__Opportunity__c in: oppMap.KeySet() and VartopiaDRS__Vendor_Status__c = 'Approved']);
      
      if (!regMap.isEmpty()) {
        //loop through the registrations - update the vendor status accordingly when opp is closed out
        for (VartopiaDRS__Registration__c vr : regMap.Values()) {
        
          Opportunity currOpp = oppMap.get(vr.VartopiaDRS__Opportunity__c);
        
          if (currOpp.StageName == 'Closed Won'){
            vr.VartopiaDRS__Vendor_Status__c = 'Closed-Won';
            updateRegs.add(vr);
          } else if (currOpp.StageName == 'Closed Lost' || currOpp.stageName == 'Unqualified') {
            vr.VartopiaDRS__Vendor_Status__c = 'Closed-Lost';
            updateRegs.add(vr);
          }
          
        
        }
      }
    }
    //commit updates
    if (updateRegs.size()>0) update updateRegs; 
  }
  
  /*
  *  [O5]
  *  Opportunity Update Owner Team to the User's team if it doesn't match
  *
  */
  public static void oppUpdateTeam (Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    Map<id,id> oppUserMap = new Map<id,id>();
        
    for (Opportunity opp : oList.values()) {
      if (opp.OwnerId != oldOList.get(opp.id).OwnerId) {
        oppList.add(opp);
        oppUserMap.put(opp.id,opp.OwnerId);
      }
    }
    
    Map<id,User> userMap = new Map<id,User>([select id, team__c from User where id in: oppUserMap.values()]);
    
    for (Opportunity opp : oppList) {
      User newOwner = userMap.get(oppUserMap.get(opp.id));
      boolean match = false;
      System.assert(newOwner != null);
      Schema.Describefieldresult options = Opportunity.Owner_Team__c.getDescribe();
      List<Schema.PicklistEntry> types = options.getPicklistValues();
      for(Schema.PicklistEntry team : types){
        if (opp.Owner_Team__c != newOwner.Team__c) {
          if (newOwner.Team__c == String.valueOf(team.getValue())){
            opp.Owner_Team__c = newOwner.Team__c;
            system.debug('### Changed Owner Team to ' + opp.Owner_Team__c);
          }
        }
      }
    } 
  }
  
  /*
  *  [O6]
  *  Opportunity progress stamp
  *
  */
  public static void oppStampProgress (Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    for (Opportunity opp : oList.values()) {
      
      if (opp.stageName != oldOList.get(opp.id).stageName) {
        oppList.add(opp);
      } else if (opp.closeDate != oldOList.get(opp.id).closeDate) {
        oppList.add(opp);
      }
    }
    
    for (Opportunity opp : oppList) {
      
      Opportunity oldOpp = oldOList.get(opp.id);
      
      if (opp.StageName != oldOpp.StageName) {
        
        if (opp.probability == 99 && oldOpp.probability < 99) {
          opp.opportunity_progression__c = 'Progression';        
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 1      
        } else if (opp.probability == 90 && oldOpp.probability < 90) {
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 2
        } else if (opp.probability == 50 && oldOpp.probability < 50){
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 3
        } else if (opp.probability == 25 && oldOpp.probability < 25){
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 4
        } else if (opp.StageName == 'Pipeline' && oldOpp.StageName == 'Identify' || oldOpp.StageName == 'Closed Lost'){
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 5
        } else if (opp.StageName == 'Identify' && oldOpp.StageName == 'Closed Lost'){
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 6
        } else if (opp.StageName == 'Closed Lost' && (oldOpp.probability >= 25 || oldOpp.StageName == 'Pipeline')){
          opp.opportunity_progression__c = 'Regression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 7
        } else if (opp.probability < oldOpp.probability){
          opp.opportunity_progression__c = 'Regression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 8
        } else if (opp.StageName == 'Identify' && (oldOpp.probability >= 25 || oldOpp.StageName == 'Pipeline')){
          opp.opportunity_progression__c = 'Regression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 11
        }
        
      } else if (opp.CloseDate != oldOpp.CloseDate) {
        
        if (opp.CloseDate > oldOpp.CloseDate) {
          opp.opportunity_progression__c = 'Regression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 12
        } else {
          opp.opportunity_progression__c = 'Progression';
          opp.Stage_Close_Date_Change_Date__c = Date.today();      // outcome 13
        }
        
      }

    } 
  }
  
  /*
  *  [O7]
  *  Opportunity Close Contacts on Unqualify/Closed Lost
  *
  */
  public static void oppCloseContacts (Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
  
    Map<id,Opportunity> oppList = new Map<id,Opportunity>();
  
    for (Opportunity opp : oList.values()){
      
      Opportunity oldOpp = oldOList.get(opp.id);
      
      if ( (opp.stagename == 'Closed Lost' || opp.stagename == 'Unqualified') && opp.stagename != oldOpp.stagename){
        oppList.put(opp.id,opp);
      }
    }
    
    Map<id,List<id>> oppToConMap = new Map<id,List<id>>();
    List<OpportunityContactRole> contactRoleList = [select id, ContactId, OpportunityId from OpportunityContactRole where OpportunityId in: oppList.KeySet()];
    Set<id> conIds = new Set<id>();
    
    for (OpportunityContactRole ocr : contactRoleList) {
      conIds.add(ocr.contactId);
      
    }
    
    Map<id,Contact> allContacts = new Map<id,Contact>([select id, contact_status__c, status_Reason__c from Contact where id in: conIds]);
    List<Contact> updateContacts = new List<Contact>();
    
    for (Id conId : conIds) {
      Contact c = allContacts.get(conId);
      
      if (c.contact_status__c != 'Closed') {
        c.contact_status__c = 'Closed';
        c.status_reason__c = 'Recently Closed/Unqualified Opportunity';
        updateContacts.add(c);
      }
    }
    
    if(updateContacts.size() > 0) update updateContacts; 
  }
  
  
  /*
  *  [O8]
  *  fill Partner Account on Account page from Opportunity
  *
  */
  public static void oppFillAcctPartners (Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
    
    Map<id,Opportunity> oppList = new Map<id,Opportunity>();
    Set<id> acctIds = new Set<id>();
    List<Account> updateAccounts = new List<Account>();
    
    for (Opportunity o : oList.values()) {
      if (oldOList.get(o.id) != null) {
        if ((o.Partner_Account__c != null && oldOList.get(o.id).Partner_Account__c == null)) {
          oppList.put(o.id,o);
          acctIds.add(o.accountId);
        }
      } else {
        if (o.Partner_Account__c != null) {
          oppList.put(o.id,o);
          acctIds.add(o.accountId);  
        }
      }
    }
    
    Map<id,Account> allAccts = new Map<id,Account>([select id, name, partner_account_1__c, partner_account_2__c, partner_account_3__c, partner_account_4__c, partner_account_5__c from Account where id in: acctIds]);
    
    for (Opportunity o : oppList.values()) {
      Account oppAccount = allAccts.get(o.accountId);
      Integer[] empty = new Integer[5]; 
      
      Integer found = 0;
      
      
      if (oppAccount != null) {
        if (oppAccount.partner_account_1__c != null) {
          empty[0] = 0;
          if (oppAccount.partner_account_1__c == o.partner_account__c) found = 1;
        } else empty[0] = 1;
        
        if (oppAccount.partner_account_2__c != null) {
          empty[1] = 0;
          if (oppAccount.partner_account_2__c == o.partner_account__c) found = 2;
        } else empty[1] = 1;
        
        if (oppAccount.partner_account_3__c != null) {
          empty[2] = 0;
          if (oppAccount.partner_account_3__c == o.partner_account__c) found = 3;
        } else empty[2] = 1;
        
        if (oppAccount.partner_account_4__c != null) {
          empty[3] = 0;
          if (oppAccount.partner_account_4__c == o.partner_account__c) found = 4;
        } else empty[3] = 1;
        
        if (oppAccount.partner_account_5__c != null) {
          empty[4] = 0;
          if (oppAccount.partner_account_5__c == o.partner_account__c) found = 5;
        } else empty[4] = 1;
        
        if (found == 0) {
          if (empty[0] == 1) {
            oppAccount.partner_account_1__c = o.partner_account__c;
            updateAccounts.add(oppAccount);
          } else if (empty[1] == 1) {
            oppAccount.partner_account_2__c = o.partner_account__c;
            updateAccounts.add(oppAccount);
          } else if (empty[2] == 1) {
            oppAccount.partner_account_3__c = o.partner_account__c;
            updateAccounts.add(oppAccount);
          } else if (empty[3] == 1) {
            oppAccount.partner_account_4__c = o.partner_account__c;
            updateAccounts.add(oppAccount);
          } else if (empty[4] == 1) {
            oppAccount.partner_account_5__c = o.partner_account__c;
            updateAccounts.add(oppAccount);
          }
        }
        
      }
    }
    
    if (updateAccounts.size() > 0) update updateAccounts;
    
  }
  
  /*
  *  [O9]
  *  Set first Demo Scheduled
  *
  *
  */
  /*@future
  public static void setFirstDemoScheduledTask (Set<Id> oppIds) {
    
    //Get all Demo Tasks associated with Opportunities
        Map<id, Task> demoTasks = new Map<id, Task>([SELECT id, subject, CreatedDate, WhatId, First_Demo_Scheduled__c FROM Task WHERE WhatId in: oppIds AND Type = 'Demo']);
    //sort results into map of Opportunity id and date of latest Demo Task
    Map<id, DateTime> oppDateMap = new Map<Id, DateTime>();

    for (Task tsk: demoTasks.values()) {
      if (oppDateMap.containsKey(tsk.WhatId)) {
        if (tsk.CreatedDate < oppDateMap.get(tsk.WhatId)) { 
          oppDateMap.put(tsk.WhatId,tsk.CreatedDate);
        }
      } else {
        oppDateMap.put(tsk.WhatId, tsk.CreatedDate);
      }
    }

    //update checkbox on batch Tasks if necessary
    List<Task> updateTasks = new List<Task>();
    for (Task tsk: demoTasks.values()) {
      Boolean updated = false;

      if (oppDateMap.containsKey(tsk.WhatId)) {
        if (tsk.CreatedDate <= oppDateMap.get(tsk.WhatId)) {
          if (!tsk.First_Demo_Scheduled__c) {
            system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
            tsk.First_Demo_Scheduled__c = true;
            updated = true;
          }
        } else {
          if (tsk.First_Demo_Scheduled__c) {
            tsk.First_Demo_Scheduled__c = false;
            updated = true;
          }
        }
      } else {
        if (!tsk.First_Demo_Scheduled__c) {
          system.debug('### making task ' + tsk.subject + ' the first demo scheduled');
          tsk.First_Demo_Scheduled__c = true;
          updated = true;
        }
      }

      if (updated) updateTasks.add(tsk);
    }
    
    //commit changes to database
    if (updateTasks.size() > 0) update updateTasks;  
  }*/
  
  /*
  *  [O10]
  *  Set first Demo Completed
  *
  *
  */
  /*@future
  public static void setFirstDemoTask (Set<Id> oppIds) {
    
    //Get all Demo Tasks associated with Opportunities
        Map<id, Task> demoTasks = new Map<id, Task>([SELECT id, ActivityDate, WhatId, First_Demo__c FROM Task WHERE WhatId in: oppIds AND Status = 'Completed' AND Type = 'Demo']);  
    
    //sort results into map of Opportunity id and date of latest Demo Task
    Map<id, Date> oppDateMap = new Map<Id, Date>();

    for (Task tsk: demoTasks.values()) {
      if (oppDateMap.containsKey(tsk.WhatId)) {
        if (tsk.ActivityDate < oppDateMap.get(tsk.WhatId)) { 
          oppDateMap.put(tsk.WhatId, tsk.ActivityDate);
        }
      } else {
        oppDateMap.put(tsk.WhatId, tsk.ActivityDate);
      }
    }

    //update checkbox on batch Tasks if necessary
    List<Task> updateTasks = new List<Task>();
    for (Task tsk: demoTasks.values()) {
      Boolean updated = false;

      if (oppDateMap.containsKey(tsk.WhatId)) {
        if (tsk.ActivityDate <= oppDateMap.get(tsk.WhatId)) {
          if (!tsk.First_Demo__c) {
            tsk.First_Demo__c = true;
            updated = true;
          }
        } else {
          if (tsk.First_Demo__c) {
            tsk.First_Demo__c = false;
            updated = true;
          }
        }
      } else {
        if (!tsk.First_Demo__c) {
          tsk.First_Demo__c = true;
          updated = true;
        }
      }

      if (updated) updateTasks.add(tsk);
    }
    
    //commit changes to database
    if (updateTasks.size() > 0) update updateTasks;  
  }*/
  
  /*
  *  [O11]
  *  Email Update Stamp
  *
  *   This method will stamp the Email Update Stamp (Apex) to 
  *   replace the "Stamp Email Update Stamp" workflow rule used in
  *   the "Info for Email Subject" field and the Exec Email Alert method
  *
  *
  */
  
  public static void EmailUpdateStamp(List<Opportunity> oList, Map<id,Opportunity> oldOList) {
    List<Opportunity> filteredOpps = new List<Opportunity>();
    
    for (Opportunity opp: oList) {
      if (oldOList.get(opp.id) != null) {
        if((opp.amount != oldOList.get(opp.id).amount) || (opp.StageName != oldOList.get(opp.id).StageName) || (opp.CloseDate != oldOList.get(opp.id).CloseDate) || opp.Email_Update_Stamp_Apex__c == 'ZZZ') {
          filteredOpps.add(opp);
        }
      }
      //If old map is null assume new record
      else {
        system.debug('Opportunity ' + opp.name + ' is inserting email stamp');
        opp.Email_Update_Stamp_Apex__c = '[new record]';
        system.debug('Email stamp for ' + opp.name + ' is ' + opp.Email_Update_Stamp_Apex__c);
      }
    }
    
    for (Opportunity opp: filteredOpps) {
      String tempEmailStamp;
      
      //system.debug('Opportunity ' + opp.name + ' is updating email stamp');
      //system.debug('Opportunity old email stamp value is ' + oldOList.get(opp.id).Email_Update_Stamp_Apex__c);
      
      if (opp.Email_Update_Stamp_Apex__c == 'ZZZ') {
        opp.Email_Update_Stamp_Apex__c = '[new record]';
      }
      else {
        //If amount changed, stamp old amount, otherwise stamp "no amount change"
        if (opp.amount != oldOList.get(opp.id).amount) {
          tempEmailStamp = oldOList.get(opp.id).amount + '<';
        }
        else {
          tempEmailStamp = '(no amount change)' + '<';
        }
          
        //If close date changed, stamp old close date, otherwise stamp "no close date change"
        if (opp.CloseDate != oldOList.get(opp.id).CloseDate) {
          tempEmailStamp += oldOList.get(opp.id).CloseDate + '>';
        }
        else {
          tempEmailStamp += '(no close date change)' + '>';
        }
          
        //If Stage changed, stamp old stage, otherwise stamp "no stage change"
        if (opp.StageName != oldOList.get(opp.id).StageName) {
          tempEmailStamp += oldOList.get(opp.id).StageName;
        }
        else {
          tempEmailStamp += '(no stage change)';
        }
          
        opp.Email_Update_Stamp_Apex__c = tempEmailStamp; 
      }
      //system.debug('Email stamp for ' + opp.name + ' is ' + opp.Email_Update_Stamp_Apex__c);
      //system.debug('Email subject calulates to: ' + opp.Info_for_Email_Subject_Apex__c);
    }
  } 
    

  
   /*
  *  [O12]
  *  *Opportunity Split* EJF Risk Projections Calculations
  *
  *   This method will calculate the EJF Risk Projections on the *Opportunity Split* object.
  *
  */
  
  public static void OppSplitEJFProjections(Map<id,Opportunity> oList, Map<id,Opportunity> oldOList) {
    
    //filter down to just the opps that have a change in stage or amount
    List<id> filteredOpps = new List<id>();
    for (Opportunity opp: oList.values()) {
      if (oldOList.get(opp.id) != null) {
        if ((opp.amount != oldOList.get(opp.id).amount) || (opp.StageName != oldOList.get(opp.id).StageName)) {
          filteredOpps.add(opp.id);
        }
      }
    }
    
    Map<id, OpportunitySplit> oppSplits = new Map<id, OpportunitySplit>([SELECT OpportunityId, Forecasted_Split_Bookings_editable__c, Split_Anchor_Realization_EJF__c, Split_Run_Rate_EJF__c FROM OpportunitySplit WHERE OpportunityId in: filteredOpps]); 
    List<OpportunitySplit> oppSplitsToUpdate = new List<OpportunitySplit>();
    
    //Calculate the EFJ fields
    for(OpportunitySplit split: oppSplits.values()) {
      if (oList.get(split.OpportunityId) != null) {
        Opportunity currOpp = oList.get(split.OpportunityId);
        System.debug('****' + currOpp.name);
        if (currOpp.StageName == 'Upside') {
          split.Split_Risk_Projection_50_EFJ__c = 0.5*(split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          split.Split_Risk_Projection_75_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
          split.Split_Risk_Projection_90_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
        }
        else if (currOpp.StageName == 'Strong Upside') {
          split.Split_Risk_Projection_50_EFJ__c = 0.5*(split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          split.Split_Risk_Projection_75_EFJ__c = 0.75*(split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          split.Split_Risk_Projection_90_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
          
          
        }
        else if ((currOpp.StageName == 'Commit') || (currOpp.StageName == 'PO received')) {
          split.Split_Risk_Projection_50_EFJ__c = (split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          split.Split_Risk_Projection_75_EFJ__c = (split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          split.Split_Risk_Projection_90_EFJ__c = (split.Forecasted_Split_Bookings_editable__c + split.Split_Anchor_Realization_EJF__c);
          
          
        }
        else {
          split.Split_Risk_Projection_50_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
          split.Split_Risk_Projection_75_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
          split.Split_Risk_Projection_90_EFJ__c = split.Forecasted_Split_Bookings_editable__c;
        }
        
      oppSplitsToUpdate.add(split);
      }
        
    }
    
    update oppSplitsToUpdate;
    
  }
  
  /*
  *  [O13]
  *  Set Opp Lookup Fields (Active/Closed/Maintenance Opps)
  *
  *
  */
  public static void setOppLookups (List<Opportunity> oList, Map<id,Opportunity> oldOList) {
  	
  	List<Opportunity> filteredOpps = new List<Opportunity>();
  	for (Opportunity opp: oList) {
  	   	if (oldOList.get(opp.id) != null) {
  	   		//if Stage or Type has been changed, add to filtered list
        	if((opp.StageName != oldOList.get(opp.id).StageName) || (opp.Type != oldOList.get(opp.id).Type)) {
          		filteredOpps.add(opp);
        	} else if (opp.AccountId != oldOList.get(opp.id).AccountId) {
        		filteredOpps.add(opp);
        	}
    	}
      	//If old map is null assume new record, add to filtered list
      	else {
        	filteredOpps.add(opp);
      	}	
  	}
  	
  	Boolean isClosed;
  	Boolean isOpenMaintenance;
  	Boolean isActive;
  	
  	for (Opportunity opp: filteredOpps) {
  		
  		isClosed = false; //True if Opportunity is Closed Won, Closed Lost, Debooked. Also True if opp is Unqualified with Close Date within the last 3 months.
  		isOpenMaintenance = false; // True if Opportunity is an Open Maintenance Renewal
  		isActive = false; // True if Opportunity if Open and not a Maintenance Renewal
  		
  		//if Opp is Closed Won or Closed Lost set the Closed Lookup 
  		if (opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost' || opp.StageName == 'Debooked') {
  			isClosed = true;
  		} else if (opp.StageName == 'Unqualified' && opp.Close_Date_adj_for_Loss__c > Date.Today().addMonths(-3)) {
  			isClosed = true;
  		} else if (opp.Type == 'Maintenance Renewal') {
  			isOpenMaintenance = true;
  		} else if (opp.StageName != 'Unqualified') {
  			isActive = true;
  		}
  		
  		//If Opp is Closed Won, Closed Lost, or Debooked, set Closed Lookup to the Account. Otherwise, clear the look up.
  		if (isClosed) opp.Closed_Lookup__c = opp.AccountId;
  		else if (opp.Closed_Lookup__c != null) opp.Closed_Lookup__c = null;
  		
  		//If Opp is an open maintenance renewal set Maintenance Lookup to the Account. Otherwise, clear the look up.
  		if (isOpenMaintenance) opp.Maintenance_Lookup__c = opp.AccountId;
  		else if (opp.Maintenance_Lookup__c != null) opp.Maintenance_Lookup__c = null;
  		
  		//If Opp is an open (non-maintenance renewal) set Active Lookup to the Account. Otherwise, clear the look up.
  		if (isActive) opp.Active_Lookup__c = opp.AccountId;
  		else if (opp.Active_Lookup__c != null) opp.Active_Lookup__c = null;
  		
  	}
  	
  }
  
  /*
  *  [O14] Set Opportunity Auto-Stage Movement
  *
  *
  */
  public static void oppStageMovement(List<Opportunity> oList) {
  	  	
  	for (Opportunity o: oList) {
  		if (!o.Cisco_Opportunity__c) {
	  		if (o.Type == 'New' && o.StageName != 'Unqualified' && o.StageName != 'Closed Lost' && o.StageName != 'PO Received' && o.StageName != 'Closed Won'  && o.StageName != 'Debooked') {
	  			if (o.Commit_Met__c) {
	  				if (o.StageName != 'Commit') o.StageName = 'Commit';
	  				if (o.Sales_Stage__c != 'Close') o.Sales_Stage__c = 'Close';
	  			}
	  			else if (o.Strong_Upside_Met__c) {
	  				if (o.StageName != 'Strong Upside') o.StageName = 'Strong Upside';
	  				if (o.Sales_Stage__c != 'Agreement') o.Sales_Stage__c = 'Agreement';
	  			}
	  			else if (o.Upside_Met__c) {
	  				if (o.StageName != 'Upside') o.StageName = 'Upside';
	  				if (o.Sales_Stage__c != 'Proof of Value') o.Sales_Stage__c = 'Proof of Value';
	  			}
	  			else if (o.Pipeline_Met__c) {
	  				if (o.StageName != 'Pipeline') o.StageName = 'Pipeline';
	  				if (o.Sales_Stage__c != 'The Pact') o.Sales_Stage__c = 'The Pact';
	  			}
	  			else {
	  				if (o.StageName != 'Identify') o.StageName = 'Identify';
	  				if (o.Sales_Stage__c != 'Business Need') o.Sales_Stage__c = 'Business Need';
	  			}
	  		}
  		}
  	}
  	
  }
  
  /*
  *  [O15] Opp Stage Helper Method
  *
  *
  *
  */
  public static void oppSetStageHelper(Opportunity o, String stageToSet) {
  		if (stageToSet == 'Commit') {
			//pipe
  			o.Exec_Sponsor_Need_Timing__c = true; o.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = true;
  			//upside
  			o.Began_Eval__c = true; o.Exec_Sponsors_Eval_Criteria_Documented__c = true; 
  			//strong upside
  			o.Tech_Win_Established__c = true; o.Eval_Period_Concluded__c = true; o.Close_Plan_Reviewed_by_Tech_Team__c = true;
  			//commit
  			o.Agreement_on_Contract_Terms__c = true; o.Exec_Buy_In_on_BIP__c = true; o.BIP_Completed__c = true;	o.CX_CoE_Introduced__c = true;	o.Funding_Approved__c = true;
		}
  		else if (stageToSet == 'Strong Upside') {
			//pipe
  			o.Exec_Sponsor_Need_Timing__c = true; o.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = true;
  			//upside
  			o.Began_Eval__c = true; o.Exec_Sponsors_Eval_Criteria_Documented__c = true; 
  			//strong upside
  			o.Tech_Win_Established__c = true; o.Eval_Period_Concluded__c = true; o.Close_Plan_Reviewed_by_Tech_Team__c = true;
  			//commit
  			o.Agreement_on_Contract_Terms__c = false; o.Exec_Buy_In_on_BIP__c = false; o.BIP_Completed__c = false;	o.CX_CoE_Introduced__c = false;	o.Funding_Approved__c = false;  		
  		}
  		else if (stageToSet == 'Upside') {
			//pipe
  			o.Exec_Sponsor_Need_Timing__c = true; o.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = true;
  			//upside
  			o.Began_Eval__c = true; o.Exec_Sponsors_Eval_Criteria_Documented__c = true; 
  			//strong upside
  			o.Tech_Win_Established__c = false; o.Eval_Period_Concluded__c = false; o.Close_Plan_Reviewed_by_Tech_Team__c = false;
  			//commit
  			o.Agreement_on_Contract_Terms__c = false; o.Exec_Buy_In_on_BIP__c = false; o.BIP_Completed__c = false;	o.CX_CoE_Introduced__c = false;	o.Funding_Approved__c = false;  		
  		}
  		else if (stageToSet == 'Pipeline') {
  		  	//pipe
  			o.Exec_Sponsor_Need_Timing__c = true; o.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = true;
  			//upside
  			o.Began_Eval__c = false; o.Exec_Sponsors_Eval_Criteria_Documented__c = false; 
  			//strong upside
  			o.Tech_Win_Established__c = false; o.Eval_Period_Concluded__c = false; o.Close_Plan_Reviewed_by_Tech_Team__c = false;
  			//commit
  			o.Agreement_on_Contract_Terms__c = false; o.Exec_Buy_In_on_BIP__c = false; o.BIP_Completed__c = false;	o.CX_CoE_Introduced__c = false;	o.Funding_Approved__c = false;
  		}
  		else if (stageToSet == 'Identify') {
  			//pipe
  			o.Exec_Sponsor_Need_Timing__c = false; o.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c = false;
  			//upside
  			o.Began_Eval__c = false; o.Exec_Sponsors_Eval_Criteria_Documented__c = false; 
  			//strong upside
  			o.Tech_Win_Established__c = false; o.Eval_Period_Concluded__c = false; o.Close_Plan_Reviewed_by_Tech_Team__c = false;
  			//commit
  			o.Agreement_on_Contract_Terms__c = false; o.Exec_Buy_In_on_BIP__c = false; o.BIP_Completed__c = false;	o.CX_CoE_Introduced__c = false;	o.Funding_Approved__c = false;
  		}
  	}
  	
  
   /*
  *  [O16] FillManualCampaignSource
  *		
  *
  *
  */
  public static void fillManualCampaignSource(List<Opportunity> oList, Map<id, Opportunity> oldMap) {
  	
  	for (Opportunity opp: oList) {
  		if (trigger.isInsert) {
	  		if (opp.Manual_Primary_Campaign_Source__c != null){
				opp.CampaignId = opp.Manual_Primary_Campaign_Source__c;
			}
  		} else if (opp.Manual_Primary_Campaign_Source__c != oldMap.get(opp.Id).Manual_Primary_Campaign_Source__c) {
  			opp.CampaignId = opp.Manual_Primary_Campaign_Source__c;
  		}
  	}
  }
  
  
  /*
  *  [O17] setCommissionAlertFlag
  *		
  *
  *
  */
  public static void setCommissionAlertFlag(List<Opportunity> oList, Map<id, Opportunity> oldMap) {
  	/*
  	List<Opportunity> filteredOpps = new List<Opportunity>();
  	Set<id> acctIds = new Set<id>();
  	Decimal commissionThreshold = 25000.00; 
  	Boolean newlyWon;
  	
  	//Filter down to opportunities that are elegible for a land and expand commission (First deal closed within last 6 months and was for under 25K)
  	for(Opportunity opp: oList) {
  		
  		newlyWon = (opp.StageName == 'Closed Won' && (trigger.isInsert || (trigger.isUpdate && oldMap.get(opp.id).StageName != 'Closed Won')));
	  	
	  	if(opp.Land_and_Expand_Commission_Eligible__c && newlyWon) {
	  		filteredOpps.add(opp);
	  		acctIds.add(opp.AccountId);
	  	}
  	}
  	
  	//If the elegible deal brings the account's total bookings over 25K set flag to alert the Finance team
  	if (filteredOpps.size() > 0) {
  		Map<id, Account> acctMap = new Map<id, Account>([SELECT id, total_Bookings__c FROM Account WHERE id in: acctIds]);
  		
  		for (Opportunity opp: filteredOpps) {
  			
  			if(opp.Amount + acctMap.get(opp.AccountId).Total_Bookings__c > commissionThreshold) {
  				opp.Commission_Alert_Flag__c = true;
  			}
  		}
  	}*/
  }
}