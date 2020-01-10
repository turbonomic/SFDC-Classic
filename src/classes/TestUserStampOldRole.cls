@isTest
private class TestUserStampOldRole {

    static testMethod void myUnitTest() {
        
        User u = [select id, Transition_from_Role__c, Transition_from_BDR_AE_Bus_Driver_Date__c, UserRoleId, UserRole.Name from User where UserRole.Name like '%Sales Development Rep%' AND isActive = true limit 1];
        String originalRole = u.UserRole.Name;
        
        
        u.UserRoleId = '00ED0000001amkN';
        update u;
        
        User u2 = [select id, Transition_from_Role__c, Transition_from_BDR_AE_Bus_Driver_Date__c, UserRole.Name from User where id =: u.id];
        
        system.assertEquals(u2.Transition_from_BDR_AE_Bus_Driver_Date__c,date.today());
		system.assertEquals(u2.Transition_from_Role__c, originalRole);
        
    }
}