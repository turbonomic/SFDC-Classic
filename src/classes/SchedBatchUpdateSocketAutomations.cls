global class SchedBatchUpdateSocketAutomations implements Schedulable {
	
	global void execute(SchedulableContext sc) {
        BatchUpdateSocketAutomations b = new BatchUpdateSocketAutomations();
	   	b.query = 'SELECT id, name, stageName, first_socket_automation_date__c FROM Opportunity WHERE (stageName != \'Closed Lost\' or stageName !=  \'Closed Won\' or stageName != \'Unqualified\') AND (Type = \'New\' OR Type = \'Upsell\')';
	   	ID batchprocessid = Database.executeBatch(b, 20);   			 	
	}	
}