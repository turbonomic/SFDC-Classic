/*********************************************************************************************************************************
* Description:
* 	This trigger is intended to streamline the Demo Creation process. 
*
* 	The trigger is activated once a "Scheduled Demo" checkbox is selected on a contact page. The trigger then pulls all of the associated
* 	information from the Contact (including a new Demo subsection) and creates a new task record. The task record is then linked to the appropriate
* 	Contact and Opportunity.
*
* 	A new subsection for this Demo on the contact page will be created to accompany the trigger. Additionally a new validation rule will
* 	be implemented to ensure all of the required Task fields are filled in in order to properly create the demo.
*
* 	Once the demo task is created, all of the fields in the Demo subsection, including the "Scheduled Demo" checkbox will be cleared  
* 	in order to allow for future Demos with the same Contact to be created using this same method. The resetting of the fields is 
* 	accomplished through an update made through the TaskSetOpenFlagOnLeadContact trigger.
*  
* Dependencies: 
*	TaskSetOpenFlagOnLeadContact.trigger
*
*
*
*
*
*********************************************************************************************************************************/




trigger DemoAutoCreation on Contact (after update) {
	
	//Find all contacts that are marked with a scheduled demo
	List<Contact> contactList = new List<Contact>();
	
 	for (Contact person : Trigger.new) {
		if (person.Scheduled_Demo__c != null) {
			if (person.Scheduled_Demo__c == True) {
					contactList.add(person);
				}
			}
		}
 	
	
	List<Task> demosToInsert = new List<Task>();
	List<Contact> contactToUpdate = new List<Contact>();
	Map<id,id> contactToAcct = new Map<id,id>();
	for (Contact person: contactList) {
		contactToAcct.put(person.id,person.Account_Safe_ID__c);
	}

	Map<id,Account> accountMap = new Map<id,Account>([SELECT id, name FROM Account WHERE id in: contactToAcct.values()]);


	//Create a new Demo for each contact in the Contact List
	for (Contact person : contactList) {
		//If (person.Scheduled_Demo__c != null && person.Demo_Date__c != null && person.Demo_Assigned_To__c != null && person.Related_Opportunity__c != null && person.VM_Count__c != null && person.Host_Count__c != null && person.Socket_Count__c != null && person.Sales_Engineer_for_Demo__c != null && person.Demo_Notes__c != null && person.Core_Count__c != null) {
		If (person.Scheduled_Demo__c != null && person.Ready_to_Schedule__c == true) { 		
			//system.debug('This person is legit ' + person.firstName + '     ' + contactList);
			String demoSubject = 'Demo with ' + accountMap.get(person.AccountId).name;
			//system.debug('Contacts account id is' + person.AccountId);
			system.debug('The demo subject string is ' + demoSubject);
			Task newDemo = new Task(Subject = demoSubject, Type = 'Demo', ActivityDate = person.Demo_Date__c, OwnerId = person.Demo_Assigned_To__c, WhatId = person.Related_Opportunity__c, Status = 'Not Started', Priority = 'Normal', whoId = person.id, Virtual_Machines_VMs__c = person.VM_Count__c, Hosts__c = person.Host_Count__c, Cores__c = person.Core_Count__c,CPU_Sockets__c = person.Socket_Count__c, Engineer__c = person.Sales_Engineer_for_Demo__c, Description = person.Demo_Notes__c ); //
			demosToInsert.add(newDemo);
			
			system.debug('The newly created demo is ' + newDemo);
			
			contactToUpdate.add(person);
		}
	}

	insert demosToInsert;

	
	
    
}