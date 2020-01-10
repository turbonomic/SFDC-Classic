global class SchedBatchUpdateFocusAccts implements Schedulable {
	
	global void execute(SchedulableContext sc) {
        BatchAssignFocusAccounts b = new BatchAssignFocusAccounts();
     	b.query = 'SELECT id, name FROM User where (userRole.Name LIKE \'%Account Executive%\')';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 5);

	}
	
}