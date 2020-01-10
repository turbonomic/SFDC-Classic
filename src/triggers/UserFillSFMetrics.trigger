trigger UserFillSFMetrics on User (after update) {
	
	Map<id,User> allUsers = new Map<id,User>();
	Map<id,Map<Integer,Salesforce_Metrics__c>> userToMetricsMap = new Map<id,Map<Integer,Salesforce_Metrics__c>>();
	Map<id,Talent_Management__c> userTMmap = new Map<id,Talent_Management__c>();
	
	public class hybridOpp {
    	public Id oppId;
    	public Id splitUser;
    	public String stage;
    	public Date oppIdDate;
    	public Date evalStartDate;
    	public Date evalCompDate;
    	public Double splitAmount;
    	public Date closeDate;
    	
    	public hybridOpp() {
    		oppId = null;
    		splitUser = null;
    		stage = null;
    		oppIdDate = null;
    		evalStartDate = null;
    		evalCompDate = null;
    		splitAmount = null;
    		closeDate = null;
    	}
    	
   	}
	
	for (User u: trigger.new) {
		if (u.trigger_workflow_Rules__c != trigger.oldMap.get(u.id).trigger_workflow_rules__c && (u.User_Role_name__c.contains('Corporate Account Executive') || u.User_Role_Name__c.contains('Enterprise Rep') || u.User_Role_Name__c.contains('Account Executive') || u.User_Role_Name__c.contains('Bus Driver - APAC')))
			allUsers.put(u.id,u);
		
	}
	
	//get all metrics
	Map<id,Salesforce_Metrics__c> allMetrics = new Map<id,Salesforce_Metrics__c>([select id, name, Deals_Closed__c, End_Date__c, Evals_Completed__c, Evals_Started__c, Pipeline_Added__c, Pipeline_Added_N__c, Salesforce_Metric__c, Start_Date__c, Talent_Management_File__c, Total_Bookings__c, User_Safe_Id__c, recordTypeId from Salesforce_Metrics__c where (User_Safe_Id__c in: allUsers.KeySet() and (recordtypeId = '01257000000Beiu' or recordtypeId = '01257000000Beiz' or recordtypeId = '012570000007QsV') and Talent_Management_File__r.recordTypeId = '01257000000Bekb')]);
	//system.debug('### found ' + allMetrics.size() + ' salesforce metric records');
	
	//put in a map by user and have metrics mapped by #
	for (Salesforce_Metrics__c sm : allMetrics.values()) {
		
		if(userToMetricsMap.containsKey(sm.User_Safe_Id__c)) {
			Map<Integer,Salesforce_Metrics__c> currMetricsMap = userToMetricsMap.get(sm.User_Safe_Id__c);
			if (sm.recordTypeId == '012570000007QsV') {
				currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
				userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
			} else if (sm.recordtypeId == '01257000000Beiu' || sm.recordtypeId == '01257000000Beiz') {
				currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
				userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
			}
				
		} else {
			Map<Integer,Salesforce_Metrics__c> currMetricsMap = new Map<Integer,Salesforce_Metrics__c>();
			if (sm.recordTypeId == '012570000007QsV' && sm.salesforce_metric__c != 1000 && sm.salesforce_metric__c != 2000) {
				currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
				userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
			} else if (sm.recordtypeId == '01257000000Beiu' || sm.recordtypeId == '01257000000Beiz') {
				currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
				userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
			}
		}
		
	}
	
	
	Map<id,Talent_Management__c> allFiles = new Map<id,Talent_Management__c>([select id, User_Safe_id__c from Talent_Management__c where User_Safe_Id__c in: allUsers.KeySet() and recordTypeId = '01257000000Bekb']);
	
	for (Talent_Management__c tm : allFiles.values()) {
		userTMmap.put(tm.User_Safe_id__c,tm);
	}
	
	//store all opp info and oppSplit info
	Map<id,Opportunity> allOpps = new Map<id,Opportunity>([select id, name, stageName, Opportunity_Id_Date__c, Eval_Start_date__c, Eval_Completion_Date__c, amount, closeDate from Opportunity where ownerId in: allUsers.KeySet() and stageName != 'Unqualified']);
	//system.debug('### Found ' + allOpps.size() + ' opportunities');
	
	Map<id,OpportunitySplit> allSplits = new Map<id,OpportunitySplit>([select id, splitOwnerId, splitAmount, OpportunityId from OpportunitySplit where OpportunityId in: allOpps.KeySet() and SplitPercentage > 0]);
	//system.debug('### Found ' + allSplits.size() + ' splitOpportunities');
	
	//key is user id, value is list of hybrid opps
	Map<id,List<hybridOpp>> userHybridOppMap = new Map<id,List<hybridOpp>>();
	
	for (OpportunitySplit oppSplit : allSplits.Values()) {
		
		system.debug('### opp split loop');
		
		Opportunity relatedOpp = allOpps.get(oppSplit.OpportunityId);
		system.debug('### related Opp is ' + relatedOpp.name);
		
		//created hybrid opp 
		hybridOpp currOpp = new hybridOpp();
		if (relatedOpp.id != null) currOpp.oppId = relatedOpp.id;
		if (oppSplit.splitOwnerId != null) currOpp.splitUser = oppSplit.splitOwnerId; 
		if (relatedOpp.stageName != null) currOpp.stage = relatedOpp.stageName;
		if (relatedOpp.Opportunity_Id_Date__c != null) currOpp.oppIdDate = relatedOpp.Opportunity_id_Date__c; 
		if (relatedOpp.eval_Start_Date__c != null) currOpp.evalStartDate = relatedOpp.eval_start_date__c;
		if (relatedOpp.eval_Completion_Date__c != null) currOpp.evalCompDate = relatedOpp.eval_Completion_Date__c; 
		if (oppSplit.splitAmount != null) currOpp.splitAmount = oppSplit.splitAmount; 
		if (relatedOpp.closeDate != null) currOpp.closeDate = relatedOpp.closeDate;
		
		if (userHybridOppMap.containsKey(currOpp.splitUser)) {
			List<hybridOpp> hOppList = userHybridOppMap.get(currOpp.splitUser);
			hOppList.add(currOpp);
			userHybridOppMap.put(currOpp.splitUser,hOppList);
		} else {
			List<hybridOpp> hOppList = new List<hybridOpp>();
			hOppList.add(currOpp);
			userHybridOppMap.put(currOpp.splitUser,hOppList);
		}
		
	}
	
	
	List<Salesforce_Metrics__c> insertNewMetrics = new List<Salesforce_Metrics__c>();
	List<Salesforce_Metrics__c> updateMetrics = new List<Salesforce_Metrics__c>();
	
	
	for (User u: allUsers.values()) {
		
		system.debug('User info:');
		system.debug(u.full_Name__c);
		system.debug(u.current_salesforce_metric__c);
		
		Talent_Management__c tm = userTMmap.get(u.id);
		system.debug('### current TM is ' + tm);
		
		Integer currMetricNum = (Integer)u.Current_Salesforce_Metric__c;
		
		Map<Integer,Salesforce_Metrics__c> userMetrics = userToMetricsMap.get(u.id);
		
		Integer mtdOppId = 0; 	Double mtdOppIdAmt = 0;
		Integer mtdEvalSt = 0; 	Integer mtdEvalComp = 0;
		Integer mtdDeals = 0;	Double mtdbookings = 0;
		
		Integer qtdOppId = 0;	Double qtdOppIdAmt = 0;
		Integer qtdEvalSt = 0;	Integer qtdEvalComp = 0;
		Integer qtdDeals = 0;	Double qtdbookings = 0;
		
		Integer mOppId = 0;		Double mOppIDAmt = 0;
		Integer mEvalSt = 0;	Integer mEvalComp = 0;
		Integer mDeals = 0;		Double mBookings = 0;
			
		Date mtdStart = date.today().toStartofMonth();
		Date mtdEnd = date.today().addMonths(1).toStartOfMonth().addDays(-1);
		
		Integer currMonth = date.today().Month();
		Date qtdStart;
		Date qtdEnd;
		if (currMonth == 2 || currMonth == 3 || currMonth == 4) {
			qtdStart = date.newInstance(date.today().year(),2,1); qtdEnd = date.newInstance(date.today().year(),4,30);
		} else if (currMonth == 5 || currMonth == 6 || currMonth == 7) {
			qtdStart = date.newInstance(date.today().year(),5,1); qtdEnd = date.newInstance(date.today().year(),7,31);
		} else if (currMonth == 8 || currMonth == 9 || currMonth == 10) {
			qtdStart = date.newInstance(date.today().year(),8,1); qtdEnd = date.newInstance(date.today().year(),10,31);
		} else {
			if (currMonth == 1) {
				qtdStart = date.newInstance(date.today().year()-1,11,1);
				qtdEnd = date.newInstance(date.today().year(),1,31); 
			} else { 
				qtdStart = date.newInstance(date.today().year(),11,1);
				qtdEnd = date.newInstance(date.today().year()+1,1,31); 
			}
		}
		
		if (userMetrics != null) {
			
			List<hybridOpp> relevantOpps = userHybridOppMap.get(u.id);
					
			if (userMetrics.containsKey(currMetricNum)) {
				
				Salesforce_Metrics__c currMetric = userMetrics.get(currMetricNum);
				
				system.debug('Current Salesforce Metric: ' + currMetric.name);
				system.debug('Start Date: ' + currMetric.start_date__c);
				system.debug('End Date: ' + currMetric.End_Date__c);
				
				
				
				Boolean updated = false;
				
				if (relevantOpps != null && !relevantOpps.isEmpty()) {
					for (hybridOpp currOpp : relevantOpps) {
						
						if (currOpp.oppIdDate != null) {
							system.debug('currOpp Opp ID Date is: ' + currOpp.oppIdDate);
							if (currOpp.oppIdDate >= currMetric.Start_Date__c && currOpp.oppIdDate <= currMetric.End_Date__c) {
								system.debug('Opp Id Check');
								mOppIdAmt += currOpp.splitAmount;
								mOppId++;
								updated = true;
							}
							
							if (currOpp.oppIdDate >= mtdStart && currOpp.oppIdDate <= mtdEnd) {
								mtdOppId++;
								mtdOppIdAmt += currOpp.splitAmount;
							}
							
							if (currOpp.oppIdDate >= qtdStart && currOpp.oppIdDate <= qtdEnd) {
								qtdOppId++;
								qtdOppIdAmt += currOpp.splitAmount;
							}
						}
						
						if (currOpp.evalStartDate != null) {
							if (currOpp.evalStartDate >= currMetric.Start_Date__c && currOpp.evalStartDate <= currMetric.End_Date__c) {
								mEvalSt++;
								updated = true;
							}
							
							if (currOpp.evalStartDate >= mtdStart && currOpp.evalStartDate <= mtdEnd) {
								mtdEvalSt++;
							}
							
							if (currOpp.evalStartDate >= qtdStart && currOpp.evalStartDate <= qtdEnd) {
								qtdEvalSt++;
							}
							
							
						}
						
						if (currOpp.evalCompDate != null) {
							if (currOpp.evalCompDate >= currMetric.Start_Date__c && currOpp.evalCompDate <= currMetric.End_Date__c) {
								mEvalComp++;
								updated = true;
							}
							
							if (currOpp.evalCompDate >= mtdStart && currOpp.evalCompDate <= mtdEnd) {
								mtdEvalComp++;
							}
							
							if (currOpp.evalCompDate >= qtdStart && currOpp.evalCompDate <= qtdEnd) {
								qtdEvalComp++;
							}
						}
						
						if (currOpp.Stage != null && currOpp.closeDate != null) {
							if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= currMetric.Start_Date__c && currOpp.closeDate <= currMetric.End_Date__c) {
								mBookings += currOpp.splitAmount;
								mDeals++;
								updated = true;
							}
							
							if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= mtdStart && currOpp.closeDate <= mtdEnd) {
								mtdDeals++;
								mtdBookings += currOpp.splitAmount;
							}
							
							if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= qtdStart && currOpp.closeDate <= qtdEnd) {
								qtdDeals++;
								qtdBookings += currOpp.splitAmount;
							}
							
						}
								
					}
				}
				
				if (updated) {
					currMetric.Pipeline_added__c = mOppIdAmt; 	currMetric.Pipeline_added_N__c = mOppId;
					currMetric.Evals_Started__c = mEvalSt;		currMetric.Evals_Completed__c = mEvalComp;
					currMetric.Total_Bookings__c = mBookings;	currMetric.Deals_Closed__c = mDeals;
					updateMetrics.add(currMetric);
				}
				
			} else {
				
				if (currMetricNum > 0) {
					Salesforce_Metrics__c newCurrMetric = new Salesforce_Metrics__c(name = (((currMetricNum-1)*30)+1) + '-' + (currMetricNum*30), Salesforce_Metric__c = currMetricNum, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays(((currMetricNum-1)*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays(currMetricNum*30),
																					pipeline_added__c = 0, pipeline_added_N__c = 0, evals_started__c = 0, evals_completed__c = 0, deals_closed__c = 0, total_bookings__c = 0, recordtypeId = '012570000007QsV');		
					
					if (relevantOpps != null) {
						for (hybridOpp currOpp : relevantOpps) {
						
							if (currOpp.oppIdDate != null) {
								system.debug('currOpp Opp ID Date is: ' + currOpp.oppIdDate);
								if (currOpp.oppIdDate >= newCurrMetric.Start_Date__c && currOpp.oppIdDate <= newCurrMetric.End_Date__c) {
									system.debug('Opp Id Check');
									mOppIdAmt += currOpp.splitAmount;
									mOppId++;
								}
							
								if (currOpp.oppIdDate >= mtdStart && currOpp.oppIdDate <= mtdEnd) {
									mtdOppId++;
									mtdOppIdAmt += currOpp.splitAmount;
								}
								
								if (currOpp.oppIdDate >= qtdStart && currOpp.oppIdDate <= qtdEnd) {
									qtdOppId++;
									qtdOppIdAmt += currOpp.splitAmount;
								}
							}
							
							if (currOpp.evalStartDate != null) {
								if (currOpp.evalStartDate >= newCurrMetric.Start_Date__c && currOpp.evalStartDate <= newCurrMetric.End_Date__c) {
									mEvalSt++;
								}
								
								if (currOpp.evalStartDate >= mtdStart && currOpp.evalStartDate <= mtdEnd) {
									mtdEvalSt++;
								}
								
								if (currOpp.evalStartDate >= qtdStart && currOpp.evalStartDate <= qtdEnd) {
									qtdEvalSt++;
								}
								
								
							}
							
							if (currOpp.evalCompDate != null) {
								if (currOpp.evalCompDate >= newCurrMetric.Start_Date__c && currOpp.evalCompDate <= newCurrMetric.End_Date__c) {
									mEvalComp++;
								}
								
								if (currOpp.evalCompDate >= mtdStart && currOpp.evalCompDate <= mtdEnd) {
									mtdEvalComp++;
								}
								
								if (currOpp.evalCompDate >= qtdStart && currOpp.evalCompDate <= qtdEnd) {
									qtdEvalComp++;
								}
							}
							
							if (currOpp.Stage != null && currOpp.closeDate != null) {
								if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= newCurrMetric.Start_Date__c && currOpp.closeDate <= newCurrMetric.End_Date__c) {
									mBookings += currOpp.splitAmount;
									mDeals++;
								}
								
								if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= mtdStart && currOpp.closeDate <= mtdEnd) {
									mtdDeals++;
									mtdBookings += currOpp.splitAmount;
								}
								
								if (currOpp.Stage == 'Closed Won' && currOpp.closeDate >= qtdStart && currOpp.closeDate <= qtdEnd) {
									qtdDeals++;
									qtdBookings += currOpp.splitAmount;
								}
								
							}
									
						}
					}
					
					
					newCurrMetric.Pipeline_added__c = mOppIdAmt; 	newCurrMetric.Pipeline_added_N__c = mOppId;
					newCurrMetric.Evals_Started__c = mEvalSt;		newCurrMetric.Evals_Completed__c = mEvalComp;
					newCurrMetric.Total_Bookings__c = mBookings;	newCurrMetric.Deals_Closed__c = mDeals;
					
					insertNewMetrics.add(newCurrMetric);
				}
			}
		

		
			if (!userMetrics.containsKey(1000)) {
				system.debug('Shouldn\'nt happen');
				Salesforce_Metrics__c monthToDate = new Salesforce_Metrics__c(name = 'MTD', Salesforce_Metric__c = 1000, Talent_Management_File__c = tm.id, Start_Date__c = mtdStart, End_Date__c = mtdEnd, recordtypeId = '01257000000Beiu',
														Pipeline_Added__c = mtdOppIdAmt, Pipeline_Added_N__c = mtdOppId, Evals_Started__c = mtdEvalSt, Evals_Completed__c = mtdEvalComp, Total_Bookings__c = mtdBookings, Deals_Closed__c = mtdDeals);
				insertNewMetrics.add(monthToDate);
			} else {
				system.debug('Should happen MTD');
				Salesforce_Metrics__c monthToDate = userMetrics.get(1000);
				if (monthToDate.Start_Date__c.month() != mtdStart.Month()) {
					monthToDate.Start_Date__c = mtdStart;
					monthToDate.End_Date__c = mtdEnd;
				}
				monthToDate.Pipeline_Added__c = mtdOppIdAmt;	monthToDate.Pipeline_Added_N__c = mtdOppId;
				monthToDate.Evals_Started__c = mtdEvalSt;		monthToDate.Evals_Completed__c = mtdEvalComp;
				monthToDate.Total_Bookings__c = mtdBookings;	monthToDate.Deals_Closed__c = mtdDeals;
				
				updateMetrics.add(monthToDate);
			}
		
		
		
			if (!userMetrics.containsKey(2000)) {

				Salesforce_Metrics__c quarterToDate = new Salesforce_Metrics__c(name = 'QTD', Salesforce_Metric__c = 2000, Talent_Management_File__c = tm.id, Start_Date__c = qtdStart, End_Date__c = qtdEnd, recordtypeId = '01257000000Beiz',
														Pipeline_Added__c = qtdOppIdAmt, Pipeline_Added_N__c = qtdOppId, Evals_Started__c = qtdEvalSt, Evals_Completed__c = qtdEvalComp, Total_Bookings__c = qtdBookings, Deals_Closed__c = qtdDeals);
				system.debug('@@@ qtd name: ' + quarterToDate.name);
				system.debug('@@@ qtd dates: ' + quarterToDate.start_Date__c + ' - ' + quarterToDate.End_Date__c);
				insertNewMetrics.add(quarterToDate);
			} else {
				Salesforce_Metrics__c quarterToDate = userMetrics.get(2000);

				if (quarterToDate.start_Date__c != qtdStart) {
					quarterToDate.start_Date__c = qtdStart;
					quarterToDate.end_Date__c = qtdEnd;
				}
				
				quarterToDate.Pipeline_Added__c = qtdOppIdAmt;	quarterToDate.Pipeline_Added_N__c = qtdOppId;
				quarterToDate.Evals_Started__c = qtdEvalSt;		quarterToDate.Evals_Completed__c = qtdEvalComp;
				quarterToDate.Total_Bookings__c = qtdBookings;	quarterToDate.Deals_Closed__c = qtdDeals;
				
				updateMetrics.add(quarterToDate);
				
			}
			
			if (!userMetrics.containsKey(currMetricNum + 1)) {
				Salesforce_Metrics__c newMetric = new Salesforce_Metrics__c(name = (currMetricNum*30+1) + '-' + ((currMetricNum+1)*30), Salesforce_Metric__c = currMetricNum + 1, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum+1)*30), recordtypeId = '012570000007QsV');
				system.debug('@@@ metric Name is: ' + newMetric.name);
				insertNewMetrics.add(newMetric);
			}
		} else {
			if (currMetricNum > 0) {
				Salesforce_Metrics__c newCurrMetric = new Salesforce_Metrics__c(name = (((currMetricNum-1)*30)+1) + '-' + (currMetricNum*30), Salesforce_Metric__c = currMetricNum, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays(((currMetricNum-1)*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays(currMetricNum*30), recordtypeId = '012570000007QsV');
				insertNewMetrics.add(newCurrMetric);
			}
			
			Salesforce_Metrics__c newMetric = new Salesforce_Metrics__c(name = (currMetricNum*30+1) + '-' + ((currMetricNum+1)*30), Salesforce_Metric__c = currMetricNum + 1, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum+1)*30), recordtypeId = '012570000007QsV');
			system.debug('@@@ metric Name is: ' + newMetric.name);
			insertNewMetrics.add(newMetric);
			
			Salesforce_Metrics__c monthToDate = new Salesforce_Metrics__c(name = 'MTD', Salesforce_Metric__c = 1000, Talent_Management_File__c = tm.id, Start_Date__c = mtdStart, End_Date__c = mtdEnd, recordtypeId = '01257000000Beiu');
			insertNewMetrics.add(monthToDate);
			
			Salesforce_Metrics__c quarterToDate = new Salesforce_Metrics__c(name = 'QTD', Salesforce_Metric__c = 2000, Talent_Management_File__c = tm.id, Start_Date__c = qtdStart, End_Date__c = qtdEnd, recordtypeId = '01257000000Beiz');
			insertNewMetrics.add(quarterToDate);
		}
	}
	
	
	if(!insertNewMetrics.isEmpty()) insert insertNewMetrics;
	if(!updateMetrics.isEmpty()) update updateMetrics;
	
	
}