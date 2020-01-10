@isTest
private class TestOpportunityUpdateTeam {

    static testMethod void myUnitTest() {
        
        User AE = [select Id, Name from User where UserRole.Name like '%Account Executive%' and isActive = true limit 1];
        
        Account acct2 = new Account(Name = 'Test2', OwnerId = AE.Id );
        insert acct2;
        
        Opportunity opp = new Opportunity(Name = 'TestOpp', AccountId = acct2.id, OwnerId = AE.Id, Type = 'New', StageName = 'Identify', CloseDate = Date.today().addDays(30), Owner_Team__c = 'Virtual Empire', Amount = 55000);
        insert opp;
        
        User newOppOwner = [select id, Name, Team__c from User where UserRole.Name like '%Account Executive%' and isActive = true and id !=: AE.id limit 1];
        
        opp.OwnerId = newOppOwner.Id;
        update opp;
        
        
        Opportunity testOpp = [select id, Owner_Team__c from Opportunity where id =: opp.id];
        system.assert(testOpp.Owner_Team__c == newOppOwner.Team__c);
    }
}