// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Tests: LeadLinkToAccount.trigger      
@isTest
private class testLeadLinkToAccount {
/*

    static testMethod void myUnitTest() {
    	
        User usr = [select id from User where UserType = 'Standard' and IsActive = true limit 1];
//        List<User> bangersnCash = [select id, name from User where (Team__c =: 'Bangers n Cash' and name != 'Brady Lenahan' and isActive = true and (userRole.name like '%Account Executive%' or userRole.name like '%Key Account%')) order by lastName asc];

        //Create Account & Lead w/ same Company Name
        Account acct1 = new Account(Name = 'Bose Headphones');
        insert acct1;
        
        Lead lead1 = new Lead(FirstName = 'Bob', LastName = 'Jones', Company = 'Bose Headphones', LeadSource = 'Prospecting - RainKing', AnnualRevenue = 10, NumberOfEmployees = 66,
        	Street = '1 Pine St.', City = 'Springfield', mkto71_Inferred_State_Region__c = 'Nebraska', PostalCode = '12345', mkto71_Inferred_Country__c = 'United States', Industry = 'Healthcare', Website = 'www.test.com');
        insert lead1;
        
        //make sure Lead is placed under the Account & fields set on Acct
        lead1 = [select id, OwnerId, Account__c, LeadSource, AnnualRevenue, NumberOfEmployees, Street, City, mkto71_Inferred_State_Region__c, PostalCode, mkto71_Inferred_Country__c, Industry, Website from Lead where id =: lead1.id];
        acct1 = [select id, OwnerId, Lead_source_transfer__c, AnnualRevenue, NumberOfEmployees, BillingStreet, BillingState, BillingCity, BillingPostalCode, BillingCountry, Industry, Website from Account where id =: acct1.id];
        system.assertEquals(lead1.Account__c, acct1.id);
        system.assertEquals(lead1.OwnerId, acct1.OwnerId);
        system.assertEquals(acct1.Lead_source_transfer__c, lead1.LeadSource);
        system.assertEquals(acct1.AnnualRevenue, lead1.AnnualRevenue);
        system.assertEquals(acct1.NumberOfEmployees, lead1.NumberOfEmployees);
        system.assertEquals(acct1.BillingStreet, lead1.Street);
        system.assertEquals(acct1.BillingCity, lead1.City);
        system.assertEquals(acct1.BillingState, lead1.mkto71_Inferred_State_Region__c);
        system.assertEquals(acct1.BillingPostalCode, lead1.PostalCode);
        system.assertEquals(acct1.BillingCountry, lead1.mkto71_Inferred_Country__c);
        system.assertEquals(acct1.Industry, lead1.Industry);
        system.assertEquals(acct1.Website, lead1.Website);
       
        //create another lead with different Co.
        Lead lead2 = new Lead(OwnerId = usr.id, FirstName = 'Jeff', LastName = 'King', Company = 'Kings, Inc.', LeadSource = 'Prospecting - DiscoverOrg', AnnualRevenue = 10, NumberOfEmployees = 66,
        	Street = '1 Pine St.', City = 'Springfield', State = 'Nebraska', PostalCode = '12345', Country = 'United States', Industry = 'Healthcare', Website = 'www.test.com');
        insert lead2;
        //make sure new Account is created with fields set
        Account newAcct = [select id, OwnerId, Lead_source_transfer__c, AnnualRevenue, NumberOfEmployees, BillingStreet, BillingState, BillingCity, BillingPostalCode, BillingCountry, Industry, Website from Account where Name = 'Kings, Inc.'];
        lead2 = [select Account__c, OwnerId, LeadSource, AnnualRevenue, NumberOfEmployees, Street, City, State, PostalCode, Country, Industry, Website from Lead where id =: lead2.id];
        
        system.assertEquals(lead2.Account__c, newAcct.id);
        system.assertEquals(lead2.OwnerId, newAcct.OwnerId);
        system.assertEquals(newAcct.Lead_source_transfer__c, lead2.LeadSource);
        system.assertEquals(newAcct.AnnualRevenue, lead2.AnnualRevenue);
        system.assertEquals(newAcct.NumberOfEmployees, lead2.NumberOfEmployees);
        system.assertEquals(newAcct.BillingStreet, lead2.Street);
        system.assertEquals(newAcct.BillingCity, lead2.City);
        system.assertEquals(newAcct.BillingState, lead2.State);
        system.assertEquals(newAcct.BillingPostalCode, lead2.PostalCode);
        system.assertEquals(newAcct.BillingCountry, lead2.Country);
        system.assertEquals(newAcct.Industry, lead2.Industry);
        system.assertEquals(newAcct.Website, lead2.Website);
        
        //Create a new Account & attached Lead
        Account acct3 = new Account(Name = 'ZZY', OwnerId = usr.id);
        insert acct3;
        
        Lead lead3 = new Lead(Account__c = acct3.id, FirstName = 'Bob', LastName = 'Jones', Company = 'ZZY', LeadSource = 'Unknown', AnnualRevenue = 10, NumberOfEmployees = 66,
        	Street = '1 Pine St.', City = 'Springfield', State = 'NE', PostalCode = '12345', Country = 'USA', Industry = 'Healthcare', Website = 'www.eustace.com');
        insert lead3;
        
        //make sure Lead owner changed & fields set on Acct
        lead3 = [select id, OwnerId, Account__c, LeadSource, AnnualRevenue, NumberOfEmployees, Street, City, State, PostalCode, Country, Industry, Website from Lead where id =: lead3.id];
        acct3 = [select id, OwnerId, Lead_source_transfer__c, AnnualRevenue, NumberOfEmployees, BillingStreet, BillingState, BillingCity, BillingPostalCode, BillingCountry, Industry, Website from Account where id =: acct3.id];
        system.assertEquals(lead3.Account__c, acct3.id);
        system.assertEquals(lead3.OwnerId, acct3.OwnerId);
        system.assertEquals(acct3.Lead_source_transfer__c, lead3.LeadSource);
        system.assertEquals(acct3.AnnualRevenue, lead3.AnnualRevenue);
        system.assertEquals(acct3.NumberOfEmployees, lead3.NumberOfEmployees);
        system.assertEquals(acct3.BillingStreet, lead3.Street);
        system.assertEquals(acct3.BillingCity, lead3.City);
        system.assertEquals(acct3.BillingState, lead3.State);
        system.assertEquals(acct3.BillingPostalCode, lead3.PostalCode);
        system.assertEquals(acct3.BillingCountry, lead3.Country);
        system.assertEquals(acct3.Industry, lead3.Industry);
        system.assertEquals(acct3.Website, lead3.Website);

// start comment block        
        Lead lead4 = new Lead(firstName = 'Intl', lastName = 'Lead', Company = 'UK Trading Co.', city = 'London', country = 'United Kingdom', Industry = 'Retail', Website = 'www.uktrading.co.uk', leadSource = 'Inbound - Website');
        insert lead4;
        
        Account newAcct2 = [select id, OwnerId, Lead_source_transfer__c, BillingCity, BillingCountry, Industry, Territory_Owner_Team__c, Website, AE_Rep__c from Account where Name = 'UK Trading Co.'];
        lead4 = [select Account__c, OwnerId, LeadSource, City, Country, Industry, Website from Lead where id =: lead4.id];
        system.assertEquals(lead4.Account__c, newAcct2.id);
        system.assert(newAcct2.ae_rep__c != null);
        system.assertEquals(newAcct2.Territory_Owner_Team__c,'Bangers n Cash');
        
        Lead lead5 = new Lead(firstName = 'Intl', lastName = 'Lead2', Company = 'Spanish Trading Co.', city = 'Madrid', country = 'Germany', Industry = 'Retail', Website = 'www.sptrading.co.uk', leadSource = 'Inbound - Website');
        insert lead5;
        
        Account newAcct3 = [select id, OwnerId, Lead_source_transfer__c, BillingCity, BillingCountry, Industry, Territory_Owner_Team__c, Website, AE_Rep__c from Account where Name = 'Spanish Trading Co.'];
        lead5 = [select Account__c, OwnerId, LeadSource, City, Country, Industry, Website from Lead where id =: lead5.id];
        system.assertEquals(lead5.Account__c, newAcct3.id);
        system.assert(newAcct3.AE_Rep__c != null);
        system.assertEquals(newAcct3.Territory_Owner_Team__c,'Bangers n Cash');
// end comment block
    }
    
    static testMethod void myUnitTest2() {
    	
    	User testUser = [select id, name from User where user_role_Name__c = 'VMT SF admin' limit 1];
    	
    	Account a2 = new Account(name = 'ESPN News', email_for_lead_link__c = 'def.com', ownerId = testUser.id);
    	insert a2;
    	
    	Lead l4 = new Lead(firstName = 'Justin', lastName = 'Chang', company = 'def', email = 'justin.chang@def.com', leadSource = 'Inbound - Website', status = 'Suspect');
    	insert l4;
    	
    	List<Account> acctList = [select id, name, email_for_lead_link__c from Account where id =: a2.id];
    	system.assertEquals(acctList.size(),1);
    	Lead afterl4 = [select id, ownerId, account__c from Lead where id =: l4.id];
    	system.assertEquals(afterl4.account__c,acctList.get(0).id);
    	system.assertEquals(afterl4.ownerId,testUser.id);
    	
    	Lead l5 = new Lead(firstName = 'Brandon', lastName = 'Chang', company = 'abc', email = 'brandon.chang@abc.com', leadSource = 'Inbound - Website', status = 'Suspect');
    	insert l5;
    	
    	Lead afterl5 = [select id, ownerId, account__c from Lead where id =: l5.id];
    	system.assertEquals(afterl5.account__c,null);
    	
    }
*/
}