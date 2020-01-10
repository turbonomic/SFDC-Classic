/*******************************************************************************************************************
*
*   Notes: create Mapping of SLA to SLA# to Task List then run through task loop as main loop to avoid nested loop
*			Also create mapping of person --> SLA and SLA --> DateTime to Compare
*		
*   To do:
*		- Demo should satisfy SLA 1 and 2
*		
*
*
*	Dependencies:
*		- LeadMethods.LeadDispositionSlaMet() to check SLA 1 for Closed/Converted Leads
*		- ContactMethods.ContactDispositionSlaMet() to check SLA 1 for Closed Contacts
*		- SLAMethods.AdjustedSLATime() to calculate the adjusted comparison date if the SLA came in after hours
*
*
********************************************************************************************************************/


global class BatchUpdateSLATracking implements Database.Batchable<sObject>{
    public String query;
	
    global database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	
    	Map<id, SLA__c> allSLAs = new Map<id, SLA__c>();
    	List<id> allConIds = new List<id>();
    	List<id> allLeadIds = new List<id>();
    	Map<id,Map<String,List<DateTime>>> slaToTskMap = new Map<id, Map<String,List<DateTime>>>();
    	Map<id,Task> slaToDemoMap = new Map<id, Task>();
    	Map<id,SLA__c> personToOpenSlaMap = new Map<id, SLA__c>();
    	Map<id,SLA__c> personToRecentSlaMap = new Map<id, SLA__c>();
    	Map<id,SLA__c> filteredSlas = new Map<id, SLA__c>(); 
    	Map<SLA__c,DateTime> slaDtMap = new Map<SLA__c,DateTime>();  
    	
    	for(sObject s : scope){
            SLA__c sla = (SLA__c)s;
            allSLAs.put(sla.id, sla);
            List<DateTime> newList1 = new List<DateTime>(); List<DateTime> newList2 = new List<DateTime>(); List<DateTime> newList3 = new List<DateTime>(); List<DateTime> newList4 = new List<DateTime>(); List<DateTime> newList5 = new List<DateTime>(); List<DateTime> newList6 = new List<DateTime>(); List<DateTime> newList7 = new List<DateTime>();
            Map<String,List<DateTime>> newMap = new MAp<String, List<DateTime>>(); 
            newMap.put('SLA1',newList1); newMap.put('SLA2',newList2); newMap.put('SLA3',newList3); newMap.put('Demos',newList4); newMap.put('Connects',newList5); newMap.put('Conversations',newList6); newMap.put('Meetings',newList7);
            slaToTskMap.put(sla.id,newMap);
            Id personId;
            if (sla.Contact__c != null) { allConIds.add(sla.Contact__c); personId = sla.Contact__c; }
            else if (sla.lead__c != null) { allLeadIds.add(sla.Lead__c); personId = sla.Lead__c; }
            Map<id, SLA__c> newMap3;
            if (personId != null) {
            	if (sla.SLA_Status__c == 'Open') { 
            		personToOpenSlaMap.put(personId,sla); 
            		filteredSlas.put(sla.id,sla);
            		}
            	else {
            		if (personToRecentSlaMap.containsKey(personId)) {
            			SLA__c tempSLA = personToRecentSlaMap.get(personId);
            			if (sla.CreatedDate > tempSLA.CreatedDate) {
            				personToRecentSlaMap.put(personId,sla);
            				filteredSlas.remove(tempSLA.id);
            				filteredSlas.put(sla.id,sla);
            			}
            		}
            		else {
            			personToRecentSlaMap.put(personId,sla);
            			filteredSlas.put(sla.id,sla);
            		}
            	}
            }    
    	} 
    	
    	Map<id,Contact> allCons = new Map<id,Contact>([SELECT id, Inbound_SLA_Core_Market__c FROM Contact WHERE id in: allConIds]);
    	Map<id,Lead> allLeads = new Map<id, Lead>([SELECT id, Inbound_SLA_Core_Market__c FROM Lead WHERE id in: allLeadIds]);
    	List<Task> allTasks = new List<Task>([SELECT id, createdDate, WhoId, Type, Status, Call_Disposition__c FROM Task WHERE (WhoId in: allconIds OR WhoId in: allLeadIds) AND (Type = 'Call' OR Type = 'Demo' OR Type = 'Discovery Call' OR Type = 'First Meeting' OR Type = 'Key Globals Exec Meeting' OR Type = 'Other Call/Meeting') AND (CreatedDate >=: Date.today().addDays(-70))]);
    	
    	Map<String, Time_Zone_Offset__c> gmtOffSetMap = Time_Zone_Offset__c.getall();
    	Integer emeaOffset = (Integer) gmtOffSetMap.get('EMEA').GMT_Offset__c; // 0 during winter, 1 during British Summer Time
    	Integer usOffset = (Integer) gmtOffSetMap.get('NORAM').GMT_Offset__c; //-5 during EST, -4 during EDT
    	
    	for (SLA__c sla : filteredSlas.values()) {
    		DateTime dt = sla.CreatedDate;
    		//Integer gmtOffset = 0; //Integer gmtOffset = 1; //British Summer Time
    		Integer gmtOffset = emeaOffset;
    		
    		if (sla.Contact__c != null) {
    			if (allCons.containsKey(sla.Contact__c)) {
    				if (allCons.get(sla.Contact__c).Inbound_SLA_Core_Market__c == 'NORAM') gmtOffset = usOffset; //gmtOffset = -4;
    			}
    		}
    		else if (sla.Lead__c != null) {
    			if (allLeads.containsKey(sla.Lead__c)) {
    				if (allLeads.get(sla.Lead__c).Inbound_SLA_Core_Market__c == 'NORAM') gmtOffset = usOffset; //gmtOffset = -4;
    			}
    		}
    		
    		DateTime adjDt = SLAMethods.AdjustedSLATime(dt,gmtOffset); 
    		slaDtMap.put(sla,adjDt);
    	}
    	
    	for (Task tsk: allTasks) {
    		if (tsk.WhoId != null) { 
	    		Id personId = tsk.WhoId;
	    		DateTime tskDate = tsk.CreatedDate;
	    		
	    		//Attribute tasks for any open SLAs
	    		if (personToOpenSlaMap.containsKey(personId)) {
    				SLA__c openSla = personToOpenSlaMap.get(personId);
    				DateTime dateToCompare = slaDtMap.get(openSla);
    				
		    		if (tsk.Type == 'Call') {
			    		if (tsk.Status == 'Completed') {
		    				//SLA #1 - Dials within 24 hours
		    				if (tskDate > openSla.createdDate.addHours(-4) && tskDate < dateToCompare.addHours(24)) {
		    					Map<String,List<DateTime>> tempMap1 = slaToTskMap.get(openSla.id);
		    					List<DateTime> tempList1 = tempMap1.get('SLA1');
		    					tempList1.add(tskDate);
		    					tempMap1.put('SLA1',tempList1);
		    					slaToTskMap.put(openSla.id,tempMap1);
		    				}
		    				//SLA #2 - Dials within 2 hours
		    				if (tskDate > openSla.createdDate.addHours(-4) && tskDate < dateToCompare.addHours(2)) {
		    					Map<String,List<DateTime>> tempMap2 = slaToTskMap.get(openSla.id);
		    					List<DateTime> tempList2 = tempMap2.get('SLA2');
		    					tempList2.add(tskDate);
		    					tempMap2.put('SLA2',tempList2);
		    					slaToTskMap.put(openSla.id,tempMap2);
		    				}
		    				//SLA #3 - 7 Dials within 30 days
		    				if (tskDate > openSla.createdDate.addHours(-4) && tskDate < dateToCompare.addDays(30)) { 
		    					Map<String,List<DateTime>> tempMap3 = slaToTskMap.get(openSla.id);
		    					List<DateTime> tempList3 = tempMap3.get('SLA3');
		    					tempList3.add(tskDate);
		    					tempMap3.put('SLA3',tempList3);
		    					slaToTskMap.put(openSla.id,tempMap3);
		    					
		    					//Fill Connects and Conversations Maps
		    					if (tsk.Call_Disposition__c == 'Connect') {
		    						Map<String,List<DateTime>> tempMap4 = slaToTskMap.get(openSla.id);
			    					List<DateTime> tempList4 = tempMap4.get('Connects');
			    					tempList4.add(tskDate);
			    					tempMap4.put('Connects',tempList4);
			    					slaToTskMap.put(openSla.id,tempMap4);
		    					}
		    					if (tsk.Call_Disposition__c == 'Conversation') {
		    						Map<String,List<DateTime>> tempMap5 = slaToTskMap.get(openSla.id);
			    					List<DateTime> tempList5 = tempMap5.get('Conversations');
			    					tempList5.add(tskDate);
			    					tempMap5.put('Conversations',tempList5);
			    					slaToTskMap.put(openSla.id,tempMap5);
		    					}
		    				}
			    		}
		    		}
		    		if (tsk.Type == 'Demo') {
		    			if (tskDate > openSla.createdDate && tskDate < openSla.Expiration_Date__c) {
		    				Map<String,List<DateTime>> tempMap6 = slaToTskMap.get(openSla.id);
	    					List<DateTime> tempList6 = tempMap6.get('Demos');
	    					tempList6.add(tskDate);
	    					tempMap6.put('Demos',tempList6);
	    					slaToTskMap.put(openSla.id,tempMap6);
	    					
	    					
	    					if (slaToDemoMap.containsKey(openSla.id)) {
	    						if (slaToDemoMap.get(openSla.id).CreatedDate > tskDate) slaToDemoMap.put(openSla.id,tsk); 
	    					}
	    					else slaToDemoMap.put(openSla.id,tsk);
		    			} 
	    			}
	    			if (tsk.Type == 'Discovery Call' || tsk.Type == 'First Meeting' || tsk.Type == 'Key Globals Exec Meeting' || tsk.Type == 'Other Call/Meeting') {
		    			if (tskDate > openSla.createdDate && tskDate < openSla.Expiration_Date__c) {
		    				Map<String,List<DateTime>> tempMap7 = slaToTskMap.get(openSla.id);
	    					List<DateTime> tempList7 = tempMap7.get('Meetings');
	    					tempList7.add(tskDate);
	    					tempMap7.put('Meetings',tempList7);
	    					slaToTskMap.put(openSla.id,tempMap7);
	    					
		    			} 
	    			}
	    		}
	    		
	    		//Attribute tasks for any recent closed SLAs
	    		if (personToRecentSlaMap.containsKey(personId)) {
	    			SLA__c recentSla = personToRecentSlaMap.get(personId);
	    			DateTime dateToCompare = slaDtMap.get(recentSla);
    				
    				DateTime dateToCompareMax1 = dateToCompare.addHours(24); //24 Hour Cap for SLA1 (Default)
    				DateTime dateToCompareMax2 = dateToCompare.addHours(2); //2 Hour Cap for SLA2 (Default)
    				DateTime dateToCompareMax3;  //Cap for SLA3
    				if (recentSla.Close_Date__c != null) dateToCompareMax3 = recentSla.Close_Date__c; else dateToCompareMax3 = recentSla.Expiration_Date__c;
    				DateTime dateToCompareMaxDemo = dateToCompareMax3; //Cap for Demo
    				
    				//if sla was closed due to a new open sla, cap the comparison dates at the create date of the open sla (with 4 hour adjustment to avoid overlap)
    				if (personToOpenSlaMap.containsKey(personId)) { 
    					SLA__c tempSla = personToOpenSlaMap.get(personId);
    					DateTime openSlaStartTime;
    					openSlaStartTime = slaDtMap.get(tempSla).addHours(-4); //Adjusted Created Time for Open SLA 
    					
    					if (openSlaStartTime < dateToCompareMax1) dateToCompareMax1 = openSlaStartTime;
    					if (openSlaStartTime < dateToCompareMax2) dateToCompareMax2 =  openSlaStartTime;
    					if (openSlaStartTime < dateToCompareMax3) dateToCompareMax3 =  openSlaStartTime;
    					if (openSlaStartTime.addHours(4) < dateToCompareMaxDemo) dateToCompareMaxDemo =  openSlaStartTime.addHours(4); //Demo should be compared to actual Created time for the Open SLA (adjustment cancelled out)
    					
    				}
    				
		    		if (tsk.Type == 'Call') {
	    				//SLA #1 - Dials within 24 hours
	    				if (tskDate > recentSla.CreatedDate.addHours(-4) && tskDate < dateToCompareMax1) {
	    					Map<String,List<DateTime>> tempMap8 = slaToTskMap.get(recentSla.id);
	    					List<DateTime> tempList8 = tempMap8.get('SLA1');
	    					tempList8.add(tskDate);
	    					tempMap8.put('SLA1',tempList8);
	    					slaToTskMap.put(recentSla.id,tempMap8);
	    				}
	    				//SLA #2 - Dials within 2 hours
	    				if (tskDate > recentSla.CreatedDate.addHours(-4) && tskDate < dateToCompareMax2) {
	    					Map<String,List<DateTime>> tempMap9 = slaToTskMap.get(recentSla.id);
	    					List<DateTime> tempList9 = tempMap9.get('SLA2');
	    					tempList9.add(tskDate);
	    					tempMap9.put('SLA2',tempList9);
	    					slaToTskMap.put(recentSla.id,tempMap9);
	    				}
	    				//SLA #3 - Dials within Open Range
	    				if (tskDate > recentSla.CreatedDate.addHours(-4) && tskDate < dateToCompareMax3) { 
	    					Map<String,List<DateTime>> tempMap10 = slaToTskMap.get(recentSla.id);
	    					List<DateTime> tempList10 = tempMap10.get('SLA3');
	    					tempList10.add(tskDate);
	    					tempMap10.put('SLA3',tempList10);
	    					slaToTskMap.put(recentSla.id,tempMap10);
	    					
	    					//Fill Connects and Conversations Maps
	    					if (tsk.Call_Disposition__c == 'Connect') {
	    						Map<String,List<DateTime>> tempMap11 = slaToTskMap.get(recentSla.id);
		    					List<DateTime> tempList11 = tempMap11.get('Connects');
		    					tempList11.add(tskDate);
		    					tempMap11.put('Connects',tempList11);
		    					slaToTskMap.put(recentSla.id,tempMap11);
	    					}
	    					if (tsk.Call_Disposition__c == 'Conversation') {
	    						Map<String,List<DateTime>> tempMap12 = slaToTskMap.get(recentSla.id);
		    					List<DateTime> tempList12 = tempMap12.get('Conversations');
		    					tempList12.add(tskDate);
		    					tempMap12.put('Conversations',tempList12);
		    					slaToTskMap.put(recentSla.id,tempMap12);
	    					}
	    				}
		    		}
		    		if (tsk.Type == 'Demo') {
		    			if (tskDate > recentSla.CreatedDate && tskDate < dateToCompareMaxDemo) {
		    				Map<String,List<DateTime>> tempMap13 = slaToTskMap.get(recentSla.id);
	    					List<DateTime> tempList13 = tempMap13.get('Demos');
	    					tempList13.add(tskDate);
	    					tempMap13.put('Demos',tempList13);
	    					slaToTskMap.put(recentSla.id,tempMap13);
	    					
	    					/*if (slaToDemoMap.containsKey(recentSla.id)) {
	    						if (slaToDemoMap.get(recentSla.id).CreatedDate > tskDate) slaToDemoMap.put(recentSla.id,tsk); 
	    					}
	    					else slaToDemoMap.put(recentSla.id,tsk);*/
		    			}
	    			}
	    			if (tsk.Type == 'Discovery Call' || tsk.Type == 'First Meeting' || tsk.Type == 'Key Globals Exec Meeting' || tsk.Type == 'Other Call/Meeting') {
		    			if (tskDate > recentSla.CreatedDate && tskDate < dateToCompareMaxDemo) {
		    				Map<String,List<DateTime>> tempMap14 = slaToTskMap.get(recentSla.id);
	    					List<DateTime> tempList14 = tempMap14.get('Meetings');
	    					tempList14.add(tskDate);
	    					tempMap14.put('Meetings',tempList14);
	    					slaToTskMap.put(recentSla.id,tempMap14);
		    			}
	    			}
	    		}
    		}
    	}
    	
    	List<SLA__c> updateSlaList = new List<SLA__c>();
    	
    	for (SLA__c sla : filteredSlas.values()) {
    		Boolean updateSla = false;
    		Boolean metSla1; Boolean metSla2; Boolean metSla3; Boolean hasDemo; Boolean hasMeeting;
    		
    		List<DateTime> tempListSla1 = new List<DateTime>();
    		List<DateTime> tempListSla2 = new List<DateTime>();
    		List<DateTime> tempListSla3 = new List<DateTime>();
    		List<DateTime> tempListDemos = new List<DateTime>();
    		List<DateTime> tempListConnects = new List<DateTime>();
    		List<DateTime> tempListConvos = new List<DateTime>();
    		List<DateTime> tempListMeetings = new List<DateTime>();
    		
    		
    		tempListSla1 = slaToTskMap.get(sla.Id).get('SLA1');
    		tempListSla2 = slaToTskMap.get(sla.Id).get('SLA2');
    		tempListSla3 = slaToTskMap.get(sla.Id).get('SLA3');
    		tempListConnects = slaToTskMap.get(sla.Id).get('Connects');
    		tempListConvos = slaToTskMap.get(sla.Id).get('Conversations');
    		
    		tempListDemos = slaToTskMap.get(sla.Id).get('Demos');
    		tempListMeetings = slaToTskMap.get(sla.Id).get('Meetings');
    		tempListDemos.sort();  tempListMeetings.sort();
    		
    		DateTime slaAdjDt = slaDtMap.get(sla);
    		
    		//Check if SLA #1 has been met
    		metSla1 = false;
    		if (tempListSla1.size() > 0) metSla1 = true; 
    		else if (tempListDemos.size() > 0 ) {
    			if (tempListDemos.get(0) < slaAdjDt.addHours(24)) metSla1 = true;
    		}
    		else if (tempListMeetings.size() > 0 ) {
    			if (tempListMeetings.get(0) < slaAdjDt.addHours(24)) metSla1 = true;
    		}
    		
    		//If SLA is manually dispositioned within 24 Hours (adj) then mark SLA 1 as met
    		if (sla.SLA_Status__c == 'Closed (Manually Dispositioned)') {
    			DateTime dateMax = slaDtMap.get(sla);
    			if (sla.Close_Date__c != null) {
    				if (sla.Close_Date__c < dateMax.addHours(24)) {
    					metSla1 = true;
    				}
    			}
    			
    		}
    		
    		if (metSla1) {
				sla.SLA_1_Met__c = metSla1;
				updateSla = true;
    		}
    		
    		//Check if SLA #2 has been met
    		metSla2 = false;
    		if (tempListSla2.size() > 0) metSla2 = true;
    		else if (tempListDemos.size() > 0) {
    			if (tempListDemos.get(0) < slaAdjDt.addHours(2)) metSla2 = true;
    		}
    		else if (tempListMeetings.size() > 0) {
    			if (tempListMeetings.get(0) < slaAdjDt.addHours(2)) metSla2 = true;
    		}
    		
    		if (metSla2) {
				sla.SLA_2_Met__c = metSla2;
				updateSla = true;
    		}
    		
    		//Check if SLA #3 has been met
    		if (tempListSla3.size() > 6) metSla3 = true; else metSla3 = false;
    		if (tempListDemos.size() > 0) hasDemo = true; else hasDemo = false;
    		if (tempListMeetings.size() > 0) hasMeeting = true; else hasMeeting = false;
    		
    		//Set SLA Dial/Connect/Conversation Counts 
    		if (tempListSla3.size() > 0)  {
    			if (sla.SLA_Dial_Count__c != tempListSla3.size()) {
    				sla.SLA_Dial_Count__c = tempListSla3.size(); 
    				updateSla = true;
    			}
    		} else if (sla.SLA_Dial_Count__c != 0) {
    			sla.SLA_Dial_Count__c = 0; 
    			updateSla = true;
    		}
    		
    		if (tempListConnects.size() > 0) {
    		  	if (sla.SLA_Connect_Count__c != tempListConnects.size()) {
    		  		sla.SLA_Connect_Count__c = tempListConnects.size();
    		  		updateSla = true;
    		  	}
    		} else if (sla.SLA_Connect_Count__c != 0) {
    			sla.SLA_Connect_Count__c = 0;
    			updateSla = true;
    		}
    		if (tempListConvos.size() > 0)  {
    			if (sla.SLA_Conversation_Count__c != tempListConvos.size()) { 
    				sla.SLA_Conversation_Count__c = tempListConvos.size(); 
    				updateSla = true; 
    			}
    		} else if (sla.SLA_Conversation_Count__c != 0) {
    			sla.SLA_Conversation_Count__c = 0; 
    			updateSla = true; 
    		}
    		//Check Close Conditions
    		if (sla.SLA_Status__c == 'Open') {
    			//If a Demo has been scheduled during an SLA's lifetime, close SLA and update close Date if Close Date is still in the future
	    		if (hasDemo) {
					sla.SLA_3_Met__c = hasDemo;
					sla.SLA_Status__c = 'Closed (Demo Scheduled)';
					if (sla.Close_Date__c == null) sla.Close_Date__c = slaToDemoMap.get(sla.id).CreatedDate;
					else if (sla.Close_Date__c > system.now()) sla.Close_Date__c = slaToDemoMap.get(sla.id).CreatedDate;
					sla.Demo__c = slaToDemoMap.get(sla.id).id; 
					updateSla = true;
	    		}
	    		//If a Meeting has been scheduled during an SLA's lifetime, close SLA and update close Date if Close Date is still in the future
	    		else if (hasMeeting) {
					sla.SLA_3_Met__c = hasMeeting;
					sla.SLA_Status__c = 'Closed (Meeting Set)';
					if (sla.Close_Date__c == null) sla.Close_Date__c = System.Now();
					else if (sla.Close_Date__c > system.now()) sla.Close_Date__c = System.Now();
					updateSla = true;
	    		}
	    		
	    		//If SLA #3 is met, close out the SLA
	    		else if (metSla3) {
	    			sla.SLA_3_Met__c = metSla3;
					sla.SLA_Status__c = 'Closed (SLA Met)';
					if (sla.Close_Date__c == null) sla.Close_Date__c = System.Now();
					else if (sla.Close_Date__c > system.now()) sla.Close_Date__c = System.Now();
					updateSla = true;
	    		}
	    		
	    		//Close out SLAs older than 30 days
    			else if (sla.Expiration_Date__c < System.now()) {
    				sla.SLA_Status__c = 'Closed (Expired)';
    				sla.Close_Date__c = sla.Expiration_Date__c;
    				updateSla = true;
    			}
    		}
    		
    		
    		
    	
    		if (updateSla) updateSlaList.add(sla);
    		
    	}
    	
    	if (updateSlaList.size() > 0) update updateSlaList;
    	
    	
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
	        mail.setSubject('Update SLA Tracking Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}