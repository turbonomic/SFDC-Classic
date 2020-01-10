global class SchedBatchRunLatticeModels implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		
		LBI.BatchProcessScoringForCurentRule b = new LBI.BatchProcessScoringForCurentRule('a6C57000000XdJl');
		//LBI.BatchProcessScoringForCurentRule b = new LBI.BatchProcessScoringForCurentRule();
		//b.query = 'SELECT id from LBI__ScoringRule__c where LBI__isActive__c = true';
		
		ID batchprocessid = Database.executeBatch(b, 1);
	}
    
}