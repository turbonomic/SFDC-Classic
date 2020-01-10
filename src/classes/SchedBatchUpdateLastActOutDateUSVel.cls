global class SchedBatchUpdateLastActOutDateUSVel implements schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchUpdateLastAcctOutcomeDate b = new BatchUpdateLastAcctOutcomeDate();
		b.query = 'SELECT id, Last_Activity_With_Outcome_Date__c, customer_status__c, last_customer_touchpoint__c, Customer_Attention_Reason_NEW__c, Name FROM Account where (Id != \'001D000000v5q5N\' and Status__c != \'Defunct Account\' and (Territory_Owner_Team__c = \'Closers Club\' or Territory_Owner_Team__c = \'Notti By Nature\' or Territory_Owner_Team__c = \'Green Berets\' or Territory_Owner_Team__c = \'Shake n Bake\' or Territory_Owner_Team__c = \'SEC\' or Territory_Owner_Team__c = \'The Kitchen\' or Territory_Owner_Team__c = \'The Hunchbacks\' or Territory_Owner_Team__c = \'The Wild West\' or Territory_Owner_Team__c = \'The Titans\' or Territory_Owner_Team__c = \'Xccelerators\' or Territory_Owner_Team__c = \'Los Conquistadores\'))';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 20); 
		
	}

}