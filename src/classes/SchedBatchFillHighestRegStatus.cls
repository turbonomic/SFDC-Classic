global class SchedBatchFillHighestRegStatus implements Schedulable {
	
	global void execute(SchedulableContext sc) {
        BatchFillHighestRegistrationStatus b = new BatchFillHighestRegistrationStatus();
     	b.query = 'SELECT Id, name, highest_vendor_status__c, partner_manager__c, Contact_Role_Count__c, Type, First_Demo_Contact_Safe_Id__c, Deal_Type__c from Opportunity where (stageName = \'Identify\' or stageName = \'Pipeline\' or stageName = \'Upside\' or stageName = \'Strong Upside\' or stageName = \'Commit\' or stageName = \'PO Received\' or stageName = \'Closed Won\')';	   	
	   	ID batchprocessid = Database.executeBatch(b, 30);

	}
	
}