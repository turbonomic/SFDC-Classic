trigger AccountFillLastLinkedInFillDate on Account (before update) {
/*
	for (Account acct : trigger.new){
		
		if (acct.VMware_Hits__c != null){
			if (trigger.oldMap.get(acct.id).VMware_Hits__c != null){
				if (acct.VMware_Hits__c != trigger.oldMap.get(acct.id).VMware_Hits__c) {
					acct.Last_LinkedIn_Update_Date_Time__c = DateTime.now();
				}
			} else {
				acct.Last_LinkedIn_Update_Date_Time__c = DateTime.now();
			}
		}
	}
*/
}