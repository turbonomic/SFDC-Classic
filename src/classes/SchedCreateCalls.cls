global class SchedCreateCalls implements Schedulable {
	
	global void execute(SchedulableContext sc) {
        BatchCreateCallsForEntReps b = new BatchCreateCallsForEntReps();
     	b.query = 'SELECT id, name FROM User where ((userRole.Name LIKE \'%Enterprise Rep%\' or userRole.Name = \'Enterprise Rep - Global Accounts\') and lastName != \'Fosdick\')';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 60);

	}
	
}