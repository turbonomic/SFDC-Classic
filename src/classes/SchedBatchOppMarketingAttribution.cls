global class SchedBatchOppMarketingAttribution implements Schedulable{
	
	global void execute(SchedulableContext sc) {
		BatchOpportunityMarketingAttribution b = new BatchOpportunityMarketingAttribution();
		b.query = 'SELECT id, AccountId, CreatedDate, Marketing_Attribution_Calculated__c FROM Opportunity WHERE Marketing_Attribution_Calculated__c = FALSE AND (Type = \'New\' OR Type = \'Upsell\') AND (StageName = \'Identify\' OR StageName = \'Pipeline\' OR StageName = \'Upside\' OR StageName = \'Strong Upside\' OR StageName = \'Commit\' OR StageName = \'PO Received\')';
		ID batchprocessid = Database.executeBatch(b, 20);
	}
	
}