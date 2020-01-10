/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestDemoStreamline {

    static testMethod void myUnitTest() {
       /* Test Class for Demo Task Auto-Creation
*
*
*/

        //Disable Full Circle validation
        //FCRM.FCR_supportAPI.disableApplicationForContext();

        //Create Test Account
        Account acct1 = new Account(Name = 'acct1');
        insert acct1;
        Account acct2 = new Account(Name = 'acct2');
        insert acct2;
        Account acct3 = new Account(Name = 'acct3');
        insert acct3;

        //Create Test Cases
        List<Opportunity> oppInsert = new List<Opportunity>();

        Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Type='New',amount=90000,closedate=date.Today().addDays(30),stageName='Identify',name='opp2',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=1000,of_CPU_Sockets__c=70);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Type='New',amount=80000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp3',accountId=acct3.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=600,of_CPU_Sockets__c=90);
        oppInsert.add(opp3);
        Opportunity opp4 = new Opportunity(Type='New',amount=70000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp4',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=750,of_CPU_Sockets__c=30);
        oppInsert.add(opp4);
        Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today().addDays(30),stageName='Identify',name='opp5',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=45);
        oppInsert.add(opp5);
        Opportunity opp6 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Identify',name='opp6',accountId=acct3.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=75);
        oppInsert.add(opp6);

        insert oppInsert;
        
        //Create test contact
        List<Contact> contactInsert = new List<Contact>();
        Contact person1 = new Contact(FirstName = 'Eddie', LastName = 'G', LeadSource = 'Prospecting-Other', Demo_Assigned_To__c = '005D0000003fAyAIAU', VM_Count__c = 800, Socket_Count__c = 80, Host_Count__c = 40, Core_Count__c = 640, Demo_Date__c = date.Today().addDays(15),Demo_Notes__c = 'This is a test Demo', Sales_Engineer_for_Demo__c = 'Bosheng Song', Related_Opportunity__c = opp1.Id,AccountId = acct1.id);
        contactInsert.add(person1);
        Contact person2 = new Contact(FirstName = 'Bob', LastName = 'Dole', LeadSource = 'Prospecting-Other', Demo_Assigned_To__c = '005D0000003fAyAIAU', VM_Count__c = 900, Socket_Count__c = 60, Host_Count__c = 30, Core_Count__c = 480, Demo_Date__c = date.Today().addDays(15),Demo_Notes__c = 'This is a test Demo2', Sales_Engineer_for_Demo__c = 'Bosheng Song', Related_Opportunity__c = opp2.Id,AccountId = acct2.id);
        contactInsert.add(person2);
        Contact person3 = new Contact(FirstName = 'Kanye', LastName = 'West', LeadSource = 'Prospecting-Other', Demo_Assigned_To__c = '005D0000003fAyAIAU', VM_Count__c = 600, Socket_Count__c = 75, Host_Count__c = 35, Core_Count__c = 600, Demo_Date__c = date.Today().addDays(15),Demo_Notes__c = 'This is a test Demo3', Sales_Engineer_for_Demo__c = 'Bosheng Song', Related_Opportunity__c = opp3.Id,AccountId = acct3.id);
        contactInsert.add(person3);
        Contact person4 = new Contact(FirstName = 'Evan', LastName = 'Fox', LeadSource = 'Prospecting-Other', Demo_Assigned_To__c = '005D0000003fAyAIAU', VM_Count__c = 700, Socket_Count__c = 120, Host_Count__c = 50, Core_Count__c = 960, Demo_Date__c = date.Today().addDays(15),Demo_Notes__c = 'This is a test Demo4', Sales_Engineer_for_Demo__c = 'Bosheng Song', Related_Opportunity__c = opp4.Id,AccountId = acct2.id);
        contactInsert.add(person4);

        insert contactInsert;
        
        for (Contact bob : contactInsert) {
            bob.Scheduled_Demo__c = True;
        }
        
        update contactInsert;
        
        //Test scheduling a second demo with Contacts already used to ensure proper resetting
        for (Contact personDupe : contactInsert) {
            if (personDupe.id == person2.id) {
                person2.Demo_Assigned_To__c = '005D0000005sEzl'; person2.VM_Count__c = 120; person2.Socket_Count__c = 12; person2.Host_Count__c = 6; person2.Core_Count__c = 96; person2.Demo_Date__c = date.Today().addDays(20); person2.Demo_Notes__c = 'This is a test Demo5'; person2.Sales_Engineer_for_Demo__c = 'Bosheng Song'; person2.Related_Opportunity__c = opp5.Id;
            }
            if (personDupe.id == person3.id) {
                person3.Demo_Assigned_To__c = '005D0000003eYoR'; person3.VM_Count__c = 400; person3.Socket_Count__c = 55; person3.Host_Count__c = 25; person3.Core_Count__c = 440; person3.Demo_Date__c = date.Today().addDays(20); person3.Demo_Notes__c = 'This is a test Demo6'; person3.Sales_Engineer_for_Demo__c = 'Bosheng Song'; person3.Related_Opportunity__c = opp6.Id;
            }
        }
        
        List<Contact> conUpdate = new List<Contact>();
        conUpdate.add(person2); conUpdate.add(person3);
  		update conUpdate;
        
        //System.debug('Here is the Contact List: ' + contactInsert);
        Map<id,Task> demoMap = new Map<id,Task>([SELECT id, ActivityDate, CPU_Sockets__c, Hosts__c, Virtual_Machines_VMs__c, Cores__c, Priority,Status, whoId, whatId, OwnerId, Engineer__c, Description FROM Task WHERE whoId in: contactInsert]);

        //Id person1id = person1.id;
        
        system.debug('Here is the demo map: ' + demoMap);

        for (Task tsk : demoMap.values()) {
            if (tsk.whoId == person1.id) {
                system.assertEquals(80,tsk.CPU_Sockets__c);
                system.assertEquals(800,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(40,tsk.Hosts__c);
                system.assertEquals(640,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                system.assertEquals(opp1.id,tsk.whatid);
                system.assertEquals('005D0000003fAyAIAU',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo',tsk.Description);
                system.assertEquals(date.Today().addDays(15),tsk.ActivityDate);
                
            }
            if (tsk.whoId == person2.id && tsk.whatId == opp2.id) {
                system.assertEquals(60,tsk.CPU_Sockets__c);
                system.assertEquals(900,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(30,tsk.Hosts__c);
                system.assertEquals(480,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                //system.assertEquals(opp1.id,tsk.whatid);
                system.assertEquals('005D0000003fAyAIAU',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo2',tsk.Description);
                system.assertEquals(date.Today().addDays(15),tsk.ActivityDate);
                
            }
            if (tsk.whoId == person2.id && tsk.whatId == opp5.id) {
                system.assertEquals(12,tsk.CPU_Sockets__c);
                system.assertEquals(120,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(6,tsk.Hosts__c);
                system.assertEquals(96,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                //system.assertEquals(opp1.id,tsk.whatid);
                system.assertEquals('005D0000005sEzl',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo5',tsk.Description);
                system.assertEquals(date.Today().addDays(20),tsk.ActivityDate);
            }
            if (tsk.whoId == person3.id && tsk.whatId == opp3.id) {
                system.assertEquals(75,tsk.CPU_Sockets__c);
                system.assertEquals(600,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(35,tsk.Hosts__c);
                system.assertEquals(600,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                //system.assertEquals(opp1.id,tsk.whatid);
                system.assertEquals('005D0000003fAyAIAU',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo3',tsk.Description);
                system.assertEquals(date.Today().addDays(15),tsk.ActivityDate);
                
            }
            if (tsk.whoId == person3.id && tsk.whatId == opp6.id) {
                system.assertEquals(55,tsk.CPU_Sockets__c);
                system.assertEquals(400,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(25,tsk.Hosts__c);
                system.assertEquals(440,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                //system.assertEquals(opp1.id,tsk.whatid);
                system.assertEquals('005D0000003eYoR',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo6',tsk.Description);
                system.assertEquals(date.Today().addDays(20),tsk.ActivityDate);
                
            }
            
            if (tsk.whoId == person4.id) {
                system.assertEquals(120,tsk.CPU_Sockets__c);
                system.assertEquals(700,tsk.Virtual_Machines_VMs__c);
                system.assertEquals(50,tsk.Hosts__c);
                system.assertEquals(960,tsk.Cores__c);
                system.assertEquals('Normal',tsk.Priority);
                system.assertEquals('Not Started',tsk.status);
                system.assertEquals(opp4.id,tsk.whatid);
                system.assertEquals('005D0000003fAyAIAU',tsk.OwnerId);
                system.assertEquals('Bosheng Song',tsk.Engineer__c);
                system.assertEquals('This is a test Demo4',tsk.Description);
                system.assertEquals(date.Today().addDays(15),tsk.ActivityDate);
                
            }
        }
        
        
        /*for (Contact person : contactInsert) {
            //system.debug('The demo flag is for ' + person.firstName + ' is ' + person.Scheduled_Demo__c);
            system.assertEquals(False,person.Scheduled_Demo__c);
            system.assertEquals(null,person.Socket_Count__c);
            system.assertEquals(null,person.VM_Count__c);
            system.assertEquals(null,person.Host_Count__c);
            system.assertEquals(null,person.Demo_Date__c);
            system.assertEquals(null,person.Demo_Notes__c);
            system.assertEquals(null,person.Related_Opportunity__c);
            system.assertEquals(null,person.Sales_Engineer_for_Demo__c);
        } */
        
    }
}