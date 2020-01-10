// Created by: Eustace Consulting [Developer: Jennifer Blair]
// Class: schedBatchUpdateSummaries.cls
// Description: makes BatchFillLastEngagementDate.cls schedulable and passes in the query to the batch process
global class schedFillLastEngagementDate implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		
        BatchFillLastEngagementDate b = new BatchFillLastEngagementDate();
	   	b.query = 'SELECT id, Last_Engagement_Date__c FROM Account where Id != \'001D000000v5q5N\'';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 70);
	   			
	}
	
}