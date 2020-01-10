global class SchedBatchFillPhoneHomeDataCon implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchFillPhoneHomeDataCon b = new BatchFillPhoneHomeDataCon();
		b.query = 'SELECT id, email, accountId, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Contact where email != null and isDeleted = false';
		
		ID batchprocessid = Database.executeBatch(b, 150);
	}
	
}