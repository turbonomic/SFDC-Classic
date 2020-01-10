/* 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: test class for TaskAfterInsertUpdate.trigger
*
*/
@isTest
private class testTaskAfterInsertUpdate {

    static testMethod void testDialComplete() {
        List<Task> tskList = new List<Task>();
    	
    	//Create Account
        Account acct1 = new Account(Name = 'Innitech');
        insert acct1;
        
        //Create Lead
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Bob', LastName = 'Jones', Company = 'Innitech', LeadSource = 'Unknown', Status_Change_Date__c = Date.today().addDays(-15), Concierge_Routing_Reason__c = 'VHM Download');
        insert lead1;
        Lead lead2 = new Lead(Account__c = acct1.id, FirstName = 'Chris', LastName = 'Johnson', Company = 'Innitech', LeadSource = 'Unknown', Status_Change_Date__c = Date.today().addDays(-15), Concierge_Routing_Reason__c = 'VHM Download', Dial_Count_Since_Last_Status_Change__c = 2);
		insert lead2;
        //Create completed Task under Lead
        Task tsk1 = new Task(Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today().addDays(-10), WhoId=lead1.id);
        insert tsk1;
        Task tsk2 = new Task(Status='Completed', Subject ='Call', ActivityDate=Date.Today().addDays(-10), WhoId=lead2.id);
        tskList.add(tsk2);
        Task tsk3 = new Task(Status='Completed', Subject ='Call', ActivityDate=Date.Today().addDays(-12), WhoId=lead2.id);
        tskList.add(tsk3);
        insert tskList;
		
        
        //Verify fields on Lead & Account were updated
        acct1 = [select Dial_Count__c, Last_Dial_Date__c from Account where id =: acct1.id];
        lead1 = [select Dial_Count__c, Last_Dial_Date__c, Dial_Count_Since_Last_Status_Change__c, Concierge_Routing_Reason__c from Lead where id =: lead1.id];
        lead2 = [select Dial_Count_Since_Last_Status_Change__c, Concierge_Routing_Reason__c from Lead where id =: lead2.id];
        system.assert(acct1.Dial_Count__c ==3);
        system.assert(acct1.Last_Dial_Date__c == Date.today().addDays(-10));
        system.assert(lead1.Dial_Count__c ==1);
        system.assert(lead1.Last_Dial_Date__c == Date.today().addDays(-10));
        system.assertEquals(lead1.Dial_Count_Since_Last_Status_Change__c, 1);
        system.assertEquals(lead2.Dial_Count_Since_Last_Status_Change__c, 4);
        system.assert(lead1.Concierge_Routing_Reason__c == null);
        system.assert(lead2.Concierge_Routing_Reason__c == 'VHM Download');
        
        //Create Contact
        Contact con1 = new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = acct1.id, Concierge_Routing_Reason__c = 'Trial Download');
        insert con1;
        
        //Create completed Task under Lead
        Task tsk4 = new Task(Status='Completed', Subject ='Call', Call_Disposition__c = 'Connect', ActivityDate=Date.Today(), WhoId=con1.id);
        insert tsk4;
        
        //verify fields on Contact & Account were updated
        acct1 = [select Dial_Count__c, Last_Dial_Date__c from Account where id =: acct1.id];
        con1 = [select Dial_Count__c, Last_Dial_Date__c, Concierge_Routing_Reason__c from Contact where id =: con1.id];
        system.assert(acct1.Dial_Count__c ==4);
        system.assert(acct1.Last_Dial_Date__c == Date.today());
        system.assert(con1.Dial_Count__c ==1);
        system.assert(con1.Last_Dial_Date__c == Date.today());
        system.assert(con1.Concierge_Routing_Reason__c == null);
    }
    
    static testMethod void testTechTaskComplete() {
    	
        //Create Account
        Account acct1 = new Account(Name = 'Innitech');
        insert acct1;
        
        //Create Lead
        Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Bob', LastName = 'Jones', Company = 'Innitech', LeadSource = 'Unknown');
        insert lead1;
        
        //Create completed Task under Lead
        Task tsk1 = new Task(Status='Completed', Type = 'Call', Call_Disposition__c = 'Connect', Subject ='Call', ActivityDate=Date.Today().addDays(-10), WhoId=lead1.id, 
          CPU_Sockets__c=10, Virtual_Machines_VMs__c=100, Cores__c = 80, Hardware_Vendor__c='Cisco', Hypervisor_Vendor__c='VMware', Storage_Vendor__c='NetApp');
        insert tsk1;
        
        //Verify fields on Account were updated
        acct1 = [select Socket_Count__c, VM_Count__c, Core_Count__c, Last_Core_Count_Update_Date__c, Hardware_Vendor__c, Hypervisor_Vendor__c, Storage_Vendor__c from Account where id =: acct1.id];
        system.assertEquals(acct1.Socket_Count__c,10);
        system.assertEquals(acct1.VM_Count__c,100);
        system.assertEquals(acct1.Core_Count__c,80);
        system.assertEquals(acct1.Last_Core_Count_Update_Date__c,date.today().addDays(-10));
        system.assertEquals(acct1.Hardware_Vendor__c,'Cisco');
        system.assertEquals(acct1.Hypervisor_Vendor__c,'VMware');
        system.assertEquals(acct1.Storage_Vendor__c,'NetApp');
        
        //Create Contact
        Contact con1 = new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = acct1.id);
        insert con1;
        
        //Create completed Task under Lead
        Task tsk2 = new Task(Status='Completed', Subject ='Call', ActivityDate=Date.Today(), WhoId=con1.id, 
          CPU_Sockets__c=30, Virtual_Machines_VMs__c=250, Cores__c = 240, Hardware_Vendor__c='Cisco;HP', Hypervisor_Vendor__c='VMware;Hyper-V (Microsoft)', Storage_Vendor__c='NetApp;EMC (VNX)');
       insert tsk2;
       //insert new List<Task>{tsk1,tsk2}; 
        
        //verify fields on Contact & Account were updated
        acct1 = [select Socket_Count__c, VM_Count__c, Core_count__c, Last_Core_Count_Update_Date__c, Hardware_Vendor__c, Hypervisor_Vendor__c, Storage_Vendor__c from Account where id =: acct1.id];
        system.assertEquals(acct1.Socket_Count__c,30);
        system.assertEquals(acct1.Core_Count__c, 240);
        system.assertEquals(acct1.Last_Core_Count_update_date__c,date.today());
        system.assertEquals(acct1.VM_Count__c,250);
        system.assertEquals(acct1.Hardware_Vendor__c,'Cisco;HP');
        system.assertEquals(acct1.Hypervisor_Vendor__c,'VMware;Hyper-V (Microsoft)');
        system.assertEquals(acct1.Storage_Vendor__c,'NetApp;EMC (VNX)');
    }
}