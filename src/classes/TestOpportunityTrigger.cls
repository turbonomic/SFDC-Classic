@isTest
public class TestOpportunityTrigger{
     
    static testMethod void myUnitTest(){
        
      OpportunityMethods[] oppmet = new List<OpportunityMethods>();
        
        
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
        List<Opportunity> oppList = new List<Opportunity>();
        List<Opportunity> oppList1 = new List<Opportunity>();
        Map<id,Opportunity> oppMap = new Map<id,Opportunity>();
        Map<id,Opportunity> oppMap1 = new Map<id,Opportunity>();                      
        List<Account> acctInsert = new List<Account>();
            
        Account a1 = new Account(name = 'Test Acct 1');
        acctInsert.add(a1);
        Account a2 = new Account(name = 'Test Acct 2');
        acctInsert.add(a2); 
        insert acctInsert;
        
           
        Opportunity opp1 = new Opportunity(name = 'test opp 1', accountId = a1.id, amount = 10000, type = 'New',of_CPU_Sockets__c= 2,of_Virtual_Machines__c=2,Term_or_Perm__c='Term', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'New', Cisco_Opportunity__c=False);
        oppList.add(opp1);  
            
        Opportunity opp2 = new Opportunity(name = 'test opp 2', accountId = a2.id, amount = 10000, type = 'Upsell',of_CPU_Sockets__c=2,of_Virtual_Machines__c=2,Term_or_Perm__c='Perm', closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Upsell',Cisco_Opportunity__c=False);
        oppList.add(opp2);
        
        //Opportunity opp3 = new Opportunity(name = 'test opp 3', accountId = a2.id, amount = 20000, type = 'Quota',of_CPU_Sockets__c=2,of_Virtual_Machines__c=2,Term_or_Perm__c='Perm',Product_Type__c='Virtualization',Sales_Engineer_Assigned__c=user2.id, closeDate = date.today().addDays(30), createdDate = datetime.now().addDays(-15), stageName = 'Upside',Cisco_Opportunity__c=False);    
        //oppList1.add(opp3);
            
         insert oppList;
        // insert oppList1;   
          for(Opportunity o: oppList){
              oppMap.put(o.id,o);
          }
          
        System.debug('List Values are :' +oppList);
            Test.startTest();
       		 //OpportunityMethods.oppAutoNameCreation(oppList);
        	 //OpportunityMethods.setOppLookups(oppList,oppMap);
             //OpportunityMethods.oppCountContactRoles(oppMap1,oppMap);
        	Test.stopTest();
        
        }
        
    }
    

}