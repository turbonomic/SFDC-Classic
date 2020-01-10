global class SchedBatchFillTrainingRSEPerformed implements Schedulable{
	
	global void execute(SchedulableContext sc) {
        BatchFillTrainingRSEPerformed b = new BatchFillTrainingRSEPerformed();
     	b.query = 'SELECT id, name, Training__c, RSE__c FROM Account where (status__c like \'%Customer%\')';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 50);

	}
	
	
}