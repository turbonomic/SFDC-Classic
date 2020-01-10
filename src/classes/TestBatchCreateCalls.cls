@isTest
private class TestBatchCreateCalls {

    static testMethod void myUnitTest() {
        
    	User user1 = [select id, name, location__c from User where full_name__c =: 'Brian Gramza'];
        
        Test.StartTest();
      	BatchCreateCallsForEntReps n = new BatchCreateCallsForEntReps();
      	n.query = 'SELECT id, name FROM User WHERE id = \'' + user1.id + '\'';
      	ID batchprocessid = Database.executeBatch(n);
      	Test.StopTest();
        
        List<Task> tskList = [select id, subject, activityDate from Task where (activityDate =: Date.today() and OwnerId =: user1.id)];
        system.assertEquals(tskList.size(), 30);		
    }
}