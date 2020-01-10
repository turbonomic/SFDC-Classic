global class SchedBatchUpdateTaskCallsLeads implements Schedulable{
	
	global void execute(SchedulableContext sc) {
        BatchUpdateTaskCallsLeads b = new BatchUpdateTaskCallsLeads();
	   	b.query = 'SELECT id, name, status, first_dial_date__c, last_dial_date__c, dial_count__c, first_connect_date__c, last_Connect_Date__c, first_Conversation_Date__c, last_Conversation_Date__c, ' +
	   				'Dial_Count_since_Last_Status_Change__c, first_Dial_Date_Time__c, Status_Change_Date__c, Dials_until_First_Conversation__c,Inbound_Qualified__c, Inbound_Qualified_By__c, Inbound_Qualified_Date_Stamp__c from Lead where Account__c = NULL AND systemModStamp >= 2015-01-01T00:00:00Z AND isConverted = false';
	   	
	   	ID batchprocessid = Database.executeBatch(b, 70);
	}
	

}