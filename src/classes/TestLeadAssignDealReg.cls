@isTest(SeeAllData=false)
public class TestLeadAssignDealReg {
    static testMethod void myUnitTest(){
        Test.startTest();
        LeadAssignDealRegCL[] leadassigndealreg = new List<LeadAssignDealRegCL>();
        LeadAssignDealRegCL.LeadAssignFunc1();
        LeadAssignDealRegCL.LeadAssignFunc2();
        LeadAssignDealRegCL.LeadAssignFunc3();
        LeadAssignDealRegCL.LeadAssignFunc4();
        LeadAssignDealRegCL.LeadAssignFunc5();
        LeadAssignDealRegCL.LeadAssignFunc6();
        LeadAssignDealRegCL.LeadAssignFunc7();
        LeadAssignDealRegCL.LeadAssignFunc8();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        UserRole ur1 = new UserRole(Name = 'Customer Account Manager');
        UserRole ur2 = new UserRole(Name = 'Sales Engineer');
        insert ur1;
        insert ur2;
        
        User user1 = new User(Alias = 'standt1', Email='standarduser1@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing1', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser12@testor.com', UserRoleId = ur1.Id);
        
        User user2 = new User(Alias = 'standt2', Email='standarduser2@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing2', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser123@testor.com', UserRoleId = ur2.Id);     
       
        System.runAs(user1) {      
        List<Lead> leadList = new List<Lead>();
        List<Account> acctInsert = new List<Account>(); 
        List<Opportunity> oppList = new List<Opportunity>();
        Map<id,Opportunity> oppMap = new Map<id,Opportunity>();
         
        Account a1 = new Account(name = 'Test Acct 1',Website='http://www.testcompany1.com',AE_Rep__c=user1.id,wi__Share_to_WI__c=true);
        acctInsert.add(a1);
        Account a2 = new Account(name = 'Test Acct 2',Website='http://www.testcompany2.com',AE_Rep__c=user2.id);
        acctInsert.add(a2); 
        Account a3 = new Account(name = 'Test Acct 3',Website='http://www.testcompany3.com');
        acctInsert.add(a3);
        insert acctInsert;

        List<Account> accLst = [select id,name from Account where id=:a1.Id or id=:a2.Id];  
                    
        Opportunity opp1 = new Opportunity(name = 'test opp 1',amount = 10000, type = 'New',of_CPU_Sockets__c= 2,of_Virtual_Machines__c=2,closeDate = date.today().addDays(30), StageName = 'New', Cisco_Opportunity__c=False,Stage_Change_Date__c=Date.valueof('2018-02-12'),AccountId = a2.Id);
        //insert opp1;
        Opportunity opp2 = new Opportunity(name = 'test opp 2',amount = 10000, type = 'Upsell',of_CPU_Sockets__c=2,of_Virtual_Machines__c=2,closeDate = date.today().addDays(30), StageName = 'Upsell',Cisco_Opportunity__c=False,Stage_Change_Date__c=Date.valueof('2018-03-23'),AccountId = a2.Id);
       //insert opp2;
        Opportunity opp3 = new Opportunity(name = 'test opp 3',amount = 10000, type = 'New',of_CPU_Sockets__c= 2,of_Virtual_Machines__c=2,closeDate = date.today().addDays(30), StageName = 'New', Cisco_Opportunity__c=False,Stage_Change_Date__c=Date.valueof('2018-02-12'),AccountId = a3.Id);
        
        oppList.add(opp1); 
        oppList.add(opp2);
        oppList.add(opp3);    
        insert oppList;
        
        List<Opportunity> oppLst = new List<Opportunity>([select id,name,amount,type,closeDate,StageName,Stage_Change_Date__c,IsClosed,IsWon,AccountId,DealRegq1__c from opportunity]);
                     
        Lead l1 = new Lead(firstName = 'Lead1',lastName = 'One', company = 'Test Acct 1', Website='http://www.testcompany1.com',Deal_Type__c = 'Incremental',wi__Share_to_WI__c = true,wi__Associated_Partner__c=a1.Id);
        leadList.add(l1);
   
        Lead l2 = new Lead(firstName = 'Lead2', lastName = 'Two',company = 'Test Acct 2', Website='http://www.testcompany2.com',wi__Share_to_WI__c = true,wi__Associated_Partner__c=a1.Id);    
        leadList.add(l2);
            
        Lead l3 = new Lead(firstName = 'Lead3', lastName = 'Three',company = 'Test Acct 3', Website='http://www.testcompany3.com',wi__Share_to_WI__c = false);    
        leadList.add(l3);    
        insert leadList;
    
        List<Lead> leadlst = [select id,company,Account__c,website,DealRegq1__c from Lead Where id=: l1.Id or id=: l2.Id];             
            
          Test.stopTest();
        
        }
    }
}