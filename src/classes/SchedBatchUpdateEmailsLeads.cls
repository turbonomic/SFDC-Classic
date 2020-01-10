global class SchedBatchUpdateEmailsLeads implements schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchUpdateEmailsLeads b = new BatchUpdateEmailsLeads();
		b.query = 'SELECT id, name, Last_Email_Date__c FROM Lead WHERE Account__c = null AND isConverted = FALSE';
		ID batchprocessid = Database.executeBatch(b, 50);
	}
	
}