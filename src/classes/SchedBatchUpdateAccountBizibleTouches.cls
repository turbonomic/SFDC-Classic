global class SchedBatchUpdateAccountBizibleTouches implements Schedulable {
	
    global void execute(SchedulableContext sc) {
    	BatchUpdateAccountBizibleTouchCounts b = new BatchUpdateAccountBizibleTouchCounts();
	   	b.query = 'SELECT id, Name, Last_Marketing_Interaction__c, MQI_Last_30_Days__c, MQI_Last_60_Days__c, MQI_Last_90_Days__c, MQI_Total__c FROM Account';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 10);
    }
    
}