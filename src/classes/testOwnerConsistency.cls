// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Tests: AccountOwnerUpdate.trigger, LeadOwnerUpdate.trigger, ContactOwnerUpdate.trigger, AccountMergeUpdateOwners.trigger      
@isTest
private class testOwnerConsistency {
    static testMethod void myUnitTest() {
    	//get a couple of users
    	List<User> usrList = [select id from User where UserType = 'Standard' and IsActive = true limit 4];
    	Lead_Auto_Number__c lan = new Lead_Auto_Number__c(round_robin_number__c = 0);
        insert lan;
    	
    	List<Account> acctList = new List<Account>();
    	List<Lead> leadList = new List<Lead>();
    	List<Contact> conList = new List<Contact>();
    	
    	
        //create account w/ Lead & Contact each with a couple of tasks. 
        Account acct1 = new Account(Name = 'Acme');
        acctList.add(acct1);
        //Account acct2 = new Account(Name = 'Acme2', OwnerId = usrList[2].id);
        //acctList.add(acct2);
        insert acctList;
        
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Bob', LastName = 'Jones', Company = 'Acme', LeadSource = 'Unknown');
        leadList.add(lead1);
        //Lead lead2 = new Lead(OwnerId = usrList[2].id, Account__c = acct2.id, FirstName = 'Michael', LastName = 'Brown', Company = 'Acme', LeadSource = 'Unknown');
        //leadList.add(lead2);
        insert leadList;
        
        Contact con1 = new Contact(AccountId = acct1.id, FirstName = 'Jim', LastName = 'Smith', Phone = '555-555-5555', Email = 'jimsmith@co.com');
        conList.add(con1);
        //Contact con2 = new Contact(OwnerId = usrList[2].id, AccountId = acct2.id, FirstName = 'John', LastName = 'Doe', Phone = '555-555-5555', Email = 'jd@co.com');
        //conList.add(con2);
		insert conList;
        
        List<Task> taskInserts = new List<Task>();
        //List<Event> eventInserts = new List<Event>();
        //2 open tasks, owner = me
        Task tsk1 = new Task(Status = 'Not Started', WhoId = lead1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk1);
        Task tsk2 = new Task(Status = 'Not Started', WhoId = con1.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk2);
        //2 open tasks, owner = someone else
        Task tsk3 = new Task(OwnerId = usrList[0].id, Status = 'Not Started', WhoId = lead1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk3);
        Task tsk4 = new Task(OwnerId = usrList[0].id, Status = 'Not Started', WhoId = con1.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk4);
        //2 open events, owner = me
        //Event evt1 = new Event(Subject = 'Meeting', WhoId = lead1.id, StartDateTime = DateTime.now().addDays(10), EndDateTime = DateTime.now().addDays(10).addHours(2));
        //eventInserts.add(evt1);
        //Event evt2 = new Event(Subject = 'Meeting', WhoId = con1.id, WhatId = acct1.id, StartDateTime = DateTime.now().addDays(10), EndDateTime = DateTime.now().addDays(10).addHours(2));
        //eventInserts.add(evt2);
        //2 closed events, owner = me
        //Event evt3 = new Event(Subject = 'Meeting', WhoId = lead1.id, StartDateTime = DateTime.now().addDays(-10), EndDateTime = DateTime.now().addDays(-10).addHours(2));
        //eventInserts.add(evt3);
        //Event evt4 = new Event(Subject = 'Meeting', WhoId = con1.id, WhatId = acct1.id, StartDateTime = DateTime.now().addDays(-10), EndDateTime = DateTime.now().addDays(-10).addHours(2));
        //eventInserts.add(evt4);
        insert taskInserts;
        //insert eventInserts;
        taskInserts.clear();
        //eventInserts.clear();
        
        //Change Owner of Account. Make sure owner change propagates when appropriate.
        acct1 = [select OwnerId from Account where id =: acct1.id];
        acct1.OwnerId = usrList[1].id;
        update acct1;
        
        lead1 = [select OwnerId from Lead where id =: lead1.id];
        system.assert(lead1.OwnerId == usrList[1].id);
        con1 = [select OwnerId from Contact where id =: con1.id];
        system.assert(con1.OwnerId == usrList[1].id);
        
        List<Task> tskList = [select OwnerId from Task where (id =: tsk1.id or id =: tsk2.id or id =: tsk3.id or id =: tsk4.id)];
        //List<Event> eventList = [select OwnerId from Event where (id =: evt1.id or id =: evt2.id or id =: evt3.id or id =: evt4.id)];
        
        for (Task tsk : tskList) {
        	
        	if (tsk.id == tsk1.id){
        		system.assert(tsk.OwnerId == usrList[1].id);
        	} else if (tsk.id == tsk2.id){
        		system.assert(tsk.OwnerId == usrList[1].id);
        	} else if (tsk.id == tsk3.id){
        		system.assert(tsk.OwnerId == usrList[0].id);
        	} else if (tsk.id == tsk4.id){
        		system.assert(tsk.OwnerId == usrList[0].id);
        	}
        }

		//for (Event evt : eventList) {
		//	if (evt.id == evt1.id) {
		//		system.assert(evt.ownerId == usrList[1].id);
		//	} else if (evt.id == evt2.id){
		//		system.assert(evt.OwnerId == usrList[1].id);
		//	} else if (evt.id == evt3.id){
		//		system.assert(evt.OwnerId == UserInfo.getUserId());
		//	} else if (evt.id == evt4.id){
		//		system.assert(evt.OwnerId == UserInfo.getUserId());
		//	}
		//}
		
    }
		
    static testMethod void myUnitTest2() {
    	
    	
    	List<User> usrList = [select id from User where UserType = 'Standard' and IsActive = true limit 4];
    	Lead_Auto_Number__c lan = new Lead_Auto_Number__c(round_robin_number__c = 0);
        insert lan;
    	
    	List<Account> acctList = new List<Account>();
    	List<Lead> leadList = new List<Lead>();
    	List<Contact> conList = new List<Contact>();
    	
    	
        //create account w/ Lead & Contact each with a couple of tasks. 
        Account acct1 = new Account(Name = 'Acme', OwnerId = usrList[1].id);
        acctList.add(acct1);
        Account acct2 = new Account(Name = 'Acme2', OwnerId = usrList[2].id);
        acctList.add(acct2);
        insert acctList;
        
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Bob', LastName = 'Jones', Company = 'Acme', LeadSource = 'Unknown');
        leadList.add(lead1);
        Lead lead2 = new Lead(OwnerId = usrList[2].id, Account__c = acct2.id, FirstName = 'Michael', LastName = 'Brown', Company = 'Acme', LeadSource = 'Unknown');
        leadList.add(lead2);
        insert leadList;
        
        Contact con1 = new Contact(AccountId = acct1.id, FirstName = 'Jim', LastName = 'Smith', Phone = '555-555-5555', Email = 'jimsmith@co.com');
        conList.add(con1);
        Contact con2 = new Contact(OwnerId = usrList[2].id, AccountId = acct2.id, FirstName = 'John', LastName = 'Doe', Phone = '555-555-5555', Email = 'jd@co.com');
        conList.add(con2);
		insert conList;
        
        List<Task> taskInserts = new List<Task>();
        //List<Event> eventInserts = new List<Event>();
        //2 open tasks, owner = me
        Task tsk1 = new Task(Status = 'Not Started', WhoId = lead1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk1);
        Task tsk2 = new Task(Status = 'Not Started', WhoId = con1.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk2);
        //2 open tasks, owner = someone else
        Task tsk3 = new Task(OwnerId = usrList[0].id, Status = 'Not Started', WhoId = lead1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk3);
        Task tsk4 = new Task(OwnerId = usrList[0].id, Status = 'Not Started', WhoId = con1.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk4);
        insert taskInserts;
        taskInserts.clear();
    	
        //create another account (different owner) with a Lead & Contact w/ Tasks. 
        
        Task tsk5 = new Task(OwnerId = usrList[2].id, Status = 'Not Started', WhoId = lead2.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk5);
        Task tsk6 = new Task(OwnerId = usrList[2].id, Status = 'Not Started', WhoId = con2.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(30), Subject = 'Follow Up');
        taskInserts.add(tsk6);
        Task tsk7 = new Task(OwnerId = usrList[2].id, Status = 'Completed', WhoId = lead1.id, ActivityDate = Date.today().addDays(-1), Subject = 'Follow Up');
        taskInserts.add(tsk7);
        Task tsk8 = new Task(OwnerId = usrList[2].id, Status = 'Completed', WhoId = con1.id, WhatId = acct1.id, ActivityDate = Date.today().addDays(-1), Subject = 'Follow Up');
        taskInserts.add(tsk8);
        insert taskInserts;
        
        //Merge the 2 Accounts. Make sure owner change propagates.
        Map<id,account> accts2merge = new Map<id,account>([SELECT Id, Name FROM Account WHERE id =: acct1.id OR id =: acct2.id]);
        Account masterAcct = accts2merge.get(acct1.id);
		Account mergeAcct = accts2merge.get(acct2.id);
        //Account masterAcct = [SELECT Id, Name FROM Account WHERE id =: acct1.id];
		//Account mergeAcct = [SELECT Id, Name FROM Account WHERE id =: acct2.id];
		merge masterAcct mergeAcct;
		
		lead2 = [select OwnerId from Lead where id =: lead2.id];
        system.assert(lead2.OwnerId == usrList[1].id);
        con2 = [select OwnerId from Contact where id =: con2.id];
        system.assert(con2.OwnerId == usrList[1].id);
        
        List<Task> tskList2 = [select OwnerId from Task where (id =: tsk5.id or id =: tsk6.id or id =: tsk7.id or id =: tsk8.id)];
        for (Task tsk : tskList2) {
        	if (tsk.id == tsk5.id){
        		system.assert(tsk.OwnerId == usrList[1].id);
        	} else if (tsk.id == tsk6.id){
        		system.assert(tsk.OwnerId == usrList[1].id);
        	} else if (tsk.id == tsk7.id){
        		system.assert(tsk.OwnerId == usrList[2].id);
        	} else if (tsk.id == tsk8.id){
        		system.assert(tsk.OwnerId == usrList[2].id);
        	}
        }
        
        //create another account (different owner) with a Lead & Contact w/ Tasks. 
        //Account acct3 = new Account(Name = 'Acme3', OwnerId = usrList[3].id);
        //insert acct3;
        
        //change Account of Lead1
        //lead1 = [select Account__c from Lead where id =: lead1.id];
        //lead1.Account__c = acct3.id;
        //update lead1;
        
        //change Account of Con1
        //con1 = [select AccountId from Contact where id =: con1.id];
        //con1.AccountId = acct3.id;
        //update con1;
        
        //make sure owner change propagates
        //lead1 = [select OwnerId from Lead where id =: lead1.id];
        //system.assert(lead1.OwnerId == usrList[3].id);
        //con1 = [select OwnerId from Contact where id =: con1.id];
        //system.assert(con1.OwnerId == usrList[3].id);
        //tsk1 = [select OwnerId from Task where id =: tsk1.id];
        //system.assert(tsk1.OwnerId == usrList[3].id);
        //tsk2 = [select OwnerId from Task where id =: tsk2.id];
        //system.assert(tsk2.OwnerId == usrList[3].id);
        //tsk3 = [select OwnerId from Task where id =: tsk3.id];
        //system.assert(tsk3.OwnerId == usrList[0].id);
        //tsk4 = [select OwnerId from Task where id =: tsk4.id];
        //system.assert(tsk4.OwnerId == usrList[0].id);
        //evt1 = [select OwnerId from Event where id =: evt1.id];
        //system.assert(evt1.OwnerId == usrList[3].id);

        
    }
}