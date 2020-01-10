// Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]
// Tests: IndustrySetter.cls, AccountIndustryUpdate.trigger, LeadIndustryUpdate.trigger      
@isTest
private class testIndustrySetter {

    static testMethod void myUnitTest() {
    	
        //Create Account
        Account acct = new Account (Name = 'ABC, Co.', Industry = 'Nonprofit');
        
        //invoke triggers & @future methods
        //Test.startTest();
        insert acct;
        //Test.stopTest();
        
        //verify "Industry (clean)" field was set properly
        acct = [select Industry_clean_text__c, id, Industry from Account where id =: acct.id];
        //system.assert(acct.Industry_clean_text__c == 'Healthcare');
        
        //update Indstry
        acct.Industry = 'Service Providers';
        
        //invoke triggers & @future methods
        Test.startTest();
        update acct;
        Test.stopTest();
        
        //verify "Industry (clean)" field was set properly
        acct = [select Industry_clean_text__c from Account where id =: acct.id];
        system.assert(acct.Industry_clean_text__c == 'Service Providers');
        //system.assert(acct.Account_Rank_text__c == 'Key');
    }
}