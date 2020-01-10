global class schedBatchUpdateAssets implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchUpdateAssets b = new BatchUpdateAssets();
		b.query = 'SELECT id, of_Trainings__c, of_Services__c, of_TAMs__c, Completed_T_S_Hours__c, Total_T_S_Hours__c From Asset';
		
		ID batchprocessid = Database.executeBatch(b, 20);
	}

}