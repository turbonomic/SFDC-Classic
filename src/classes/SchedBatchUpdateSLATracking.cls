global class SchedBatchUpdateSLATracking implements schedulable{
	
	global void execute(SchedulableContext sc) {
	    BatchUpdateSLATracking b = new BatchUpdateSLATracking();
	    b.query = 'SELECT id, SLA_1_Met__c, SLA_2_Met__c, SLA_3_Met__c, SLA_Status__c, Close_Date__c, Campaign__c, Contact__c, Lead__c, Expiration_Date__c, Rapid_Response_Eligible__c, CreatedDate, Demo__c, SLA_Dial_Count__c, SLA_Connect_Count__c, SLA_Conversation_Count__c FROM SLA__c WHERE CreatedDate = LAST_N_DAYS:70';
		ID batchprocessid = Database.executeBatch(b, 20);
	}
	
}