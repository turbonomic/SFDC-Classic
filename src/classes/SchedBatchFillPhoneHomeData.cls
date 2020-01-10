global class SchedBatchFillPhoneHomeData implements Schedulable {
	
	global void execute(SchedulableContext sc) {
		BatchFillPhoneHomeData b = new BatchFillPhoneHomeData();
		b.query = 'SELECT id, email, account__c, phoneHome_Data_Last_Refreshed__c, phoneHome_Number_of_Hosts__c, phoneHome_Number_of_VMs__c, phoneHome_License_Type__c from Lead where email != null and isConverted = false and isDeleted = false';
		
		ID batchprocessid = Database.executeBatch(b, 150);
	}
	
}