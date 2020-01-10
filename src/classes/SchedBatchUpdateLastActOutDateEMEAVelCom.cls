global class SchedBatchUpdateLastActOutDateEMEAVelCom implements schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchUpdateLastAcctOutcomeDate b = new BatchUpdateLastAcctOutcomeDate();
		b.query = 'SELECT id, Last_Activity_With_Outcome_Date__c, customer_status__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c, Name FROM Account where (Id != \'001D000000v5q5N\' and Status__c != \'Defunct Account\' and (Territory_Owner_Team__c = \'EMEA Commercial\' or Territory_Owner_Team__c = \'Ganas iOS\' or Territory_Owner_Team__c = \'\'))';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 15); 
		
	}

}