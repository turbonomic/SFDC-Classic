/** 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: When a Task is opened on a Lead or Contact, update the "Open Task" checkbox on that person's record.
*	When a Task is closed or deleted on a Lead or Contact, check to see if there are any more open Tasks
*	under that person and update the "Open Task" checkbox if warranted. 
*/
trigger TaskSetOpenFlagOnLeadContact on Task (after insert, after update, after delete) {
	/*
	Set<Id> openConIds = new Set<Id>();
	Set<Id> openLdIds = new Set<Id>();
	Set<Id> closedConIds = new Set<Id>();
	Set<Id> closedLdIds = new Set<Id>();
	String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
	String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
	
	if (trigger.isDelete) {
		for (Task tsk: trigger.old) {
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
		for (Task tsk: trigger.new) {
			if (tsk.WhoId != null) {
				if (trigger.isInsert && tsk.IsClosed == false) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						openConIds.add(tsk.WhoId);
						system.debug('###Open Task on Contact!');
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						openLdIds.add(tsk.WhoId);
						system.debug('###Open Task on Lead!');
					}
				} else if (trigger.isUpdate && trigger.oldMap.get(tsk.id).IsClosed == true && tsk.IsClosed == false) {
					if (((String)tsk.WhoId).startsWith(conPrefix)) {
						openConIds.add(tsk.WhoId);
						system.debug('###Open Task on Contact!');
					} else if (((String)tsk.WhoId).startsWith(leadPrefix)) {
						openLdIds.add(tsk.WhoId);
						system.debug('###Open Task on Lead!');
					}
				} else if (trigger.IsUpdate && trigger.oldMap.get(tsk.id).IsClosed == false && tsk.IsClosed == true) {
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
			List<Contact> conUpdateList = [select Open_Task__c,Scheduled_Demo__c, Demo_Date__c, Demo_Assigned_To__c, Related_Opportunity__c, VM_Count__c, Host_Count__c, Socket_Count__c, Sales_Engineer_for_Demo__c, Demo_Notes__c from Contact where id in: openConIds];
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
			List<Lead> ldUpdateList = [select Open_Task__c from Lead where id in: openLdIds];
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
	*/
}