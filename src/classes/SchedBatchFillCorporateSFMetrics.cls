global class SchedBatchFillCorporateSFMetrics implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		
		BatchFillCorporateSFMetrics b = new BatchFillCorporateSFMetrics();
		b.query = 'SELECT id, full_name__c, trigger_workflow_rules__c, has_talent_management_file__c from User where isActive = true and calculate_sf_metrics__c = true';
		
		ID batchprocessid = Database.executeBatch(b, 10);
	}
}