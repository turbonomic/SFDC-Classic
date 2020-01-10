// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Tests: TaskSetOpenFlagOnLeadContact.trigger      
@isTest
private class testTaskSetOpenFlagOnLeadContact {

    static testMethod void myUnitTest() {
    	
    	//Lead_Auto_Number__c lan = new Lead_Auto_Number__c();
        //insert lan;
    	
        //Create Account
        Account acct = new Account(Name = 'ABC, Co.');
        insert acct;
        
        //Create Contact
        Contact con = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = acct.id);
        insert con;
        
        //con.Scheduled_Demo__c = True;
        //update con;
        
        //Create Open Task under Contact
        Task tsk1 = new Task(Subject = 'Call', Status = 'Not Started', WhoId = con.id, ActivityDate = Date.today());
        insert tsk1;
        
        //verify "Open Task" box on Contact checked
        con = [select Open_Task__c, Scheduled_Demo__c, Socket_Count__c, VM_Count__c, Host_Count__c,Demo_Date__c,Demo_Notes__c,Related_Opportunity__c, Sales_Engineer_for_Demo__c from Contact where id =: con.id];
        
		
        //close Task
        tsk1 = [select Status from Task where id =: tsk1.id];
        tsk1.Status = 'Completed';
        update tsk1;
        
        //verify "Open Task" box on Contact unchecked
        con = [select Open_Task__c from Contact where id =: con.id];
        system.assert(con.Open_Task__c == false);
        
        //Create Open Task under Contact
        Task tsk4 = new Task(Subject = 'Call', Status = 'Not Started', WhoId = con.id, ActivityDate = Date.today());
        insert tsk4;
        
        //verify "Open Task" box on Contact checked
        con = [select Open_Task__c from Contact where id =: con.id];
        system.assert(con.Open_Task__c == true);
        
        //delete Task
        delete tsk4;
        
        //verify "Open Task" box on Lead unchecked
        con = [select Open_Task__c from Contact where id =: con.id];
        system.assert(con.Open_Task__c == false);
    }
        
    static testMethod void myUnitTest2() {
        //Create Lead
        Lead ld = new Lead(FirstName = 'Jane', LastName = 'Doe', Company = 'Acme', LeadSource = 'Unknown');
        insert ld;
        
        //Create Open Task under Lead
        Task tsk2 = new Task(Subject = 'Call', Status = 'Not Started', WhoId = ld.id, ActivityDate = Date.today());
        insert tsk2;
        
        //verify "Open Task" box on Lead checked
        ld = [select Open_Task__c from Lead where id =: ld.id];
        system.assert(ld.Open_Task__c == true);
        
        //close Task
        tsk2 = [select Status from Task where id =: tsk2.id];
        tsk2.Status = 'Completed';
        update tsk2;
        
        //verify "Open Task" box on Lead unchecked
        ld = [select Open_Task__c from Lead where id =: ld.id];
        system.assert(ld.Open_Task__c == false);
        
        //Create Open Task under Lead
        Task tsk3 = new Task(Subject = 'Call', Status = 'Not Started', WhoId = ld.id, ActivityDate = Date.today());
        insert tsk3;
        
        //verify "Open Task" box on Lead checked
        ld = [select Open_Task__c from Lead where id =: ld.id];
        system.assert(ld.Open_Task__c == true);
        
        //delete Task
        delete tsk3;
        
        //verify "Open Task" box on Lead unchecked
        ld = [select Open_Task__c from Lead where id =: ld.id];
        system.assert(ld.Open_Task__c == false);
    }
    
    static testMethod void myUnitTest3() {
    	
    	 //Create Account
        Account acct = new Account(Name = 'ABC, Co.');
        insert acct;
    	
    	 //Create Opportunity
        Opportunity opp = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',accountId=acct.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
		insert opp;
    	
    	
    	Contact con = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = acct.id, Scheduled_Demo__c = True, Demo_Assigned_To__c = '005D0000005sEzl', VM_Count__c = 120, Socket_Count__c = 12, Host_Count__c = 6, Core_Count__c = 30, Demo_Date__c = date.Today().addDays(20), Demo_Notes__c = 'This is a test Demo5', Sales_Engineer_for_Demo__c = 'Bosheng Song', Related_Opportunity__c = opp.Id);
        insert con;
        
        //con.Scheduled_Demo__c = True;
        //update con;
    	
    	con = [select Open_Task__c, Scheduled_Demo__c, Socket_Count__c, VM_Count__c, Host_Count__c,Demo_Date__c,Demo_Notes__c,Related_Opportunity__c, Sales_Engineer_for_Demo__c from Contact where id =: con.id];
        system.assert(con.Open_Task__c == true);
        system.assertEquals(False, con.Scheduled_Demo__c);
		system.assertEquals(null,con.Socket_Count__c);
		system.assertEquals(null,con.VM_Count__c);
		system.assertEquals(null,con.Host_Count__c);
		system.assertEquals(null,con.Demo_Date__c);
		system.assertEquals(null,con.Demo_Notes__c);
		system.assertEquals(null,con.Related_Opportunity__c);
		system.assertEquals(null,con.Sales_Engineer_for_Demo__c);
    	
    }
    
}