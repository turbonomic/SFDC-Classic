trigger FillLocalTime on Task (before insert, before update) {
/*
	Map<Id,Id> tskWhoIdMap = new Map<Id,Id>();
	Map<Id,Task> tskMap = new Map<Id,Task>();

	for (Task tsk : trigger.new ) {
		if (tsk.status != null) {
			if(tsk.type != null) {
				if (tsk.status == 'Completed' && tsk.type == 'Call'){
					if (tsk.WhoId != null){
						tskWhoIdMap.put(tsk.id,tsk.whoId);
						tskMap.put(tsk.id,tsk);
					}
				}
			}
		}
	}
	
	String conPrefix = Schema.SObjectType.Contact.getKeyPrefix();
	String leadPrefix = Schema.SObjectType.Lead.getKeyPrefix();
	
	if (tskMap.size() > 0) {
	
		Map<Id,Contact> conList = new Map<Id,Contact>([select id, AccountId, MailingCountry, VMT_UTF_Offset__c from Contact where id in :tskWhoIdMap.values()]); 
		Map<Id,Lead> leadList = new Map<Id,Lead>([select id, Account__c, Country, VMT_UTF_Offset__c from Lead where id in :tskWhoIdMap.values()]);
		List<Id> acctIds = new List<Id>();
		
		for (Contact con : conList.values()){
			acctIds.add(con.accountId);
		}
		for (Lead ld : leadList.values()) {
			acctIds.add(ld.Account__c);
		}
		
		Map<Id,Account> acctList = new Map<Id,Account>([select id, billingCountry, VMT_UTF_Offset__c from Account where id in :acctIds]);
		
		for(Task tsk : tskMap.values()) {
			
			if (tsk.whoId != null) {
				if (((String)tsk.whoId).startsWith(leadPrefix)) {
				
					Lead currLead = leadList.get(tsk.WhoId);
					

					if (currLead.Country != null && currLead.VMT_UTF_Offset__c != null){
			
						if (tsk.Call_Date_Time__c != null) {
							tsk.Local_Date_Time__c = tsk.Call_Date_Time__c + (currLead.VMT_UTF_Offset__c+5)/24;
						} else {
							if (tsk.Created_Date_Time__c != null){
								tsk.Local_Date_Time__c = tsk.Created_Date_Time__c + (currLead.VMT_UTF_Offset__c+5)/24;
							} else {
								tsk.Local_Date_Time__c = DateTime.now() + (currLead.VMT_UTF_Offset__c+5)/24;
							}
						}
						system.debug('*** Task Local Date/Time is ' + tsk.Local_Date_Time__c + ' ***');
					}
					else {
						
						Account currAcct = acctList.get(currLead.account__c);
						if (currAcct != null) {
						
							if ( currAcct.billingCountry != null) {
								if (tsk.Call_Date_Time__c != null) {
									tsk.Local_Date_Time__c = tsk.Call_Date_Time__c + (currAcct.VMT_UTF_Offset__c+5)/24;
								} else {
									if (tsk.Created_Date_Time__c != null){
										tsk.Local_Date_Time__c = tsk.Created_Date_Time__c + (currAcct.VMT_UTF_Offset__c+5)/24;
									} else {
										tsk.Local_Date_Time__c = DateTime.now() + (currAcct.VMT_UTF_Offset__c+5)/24;
									}
								}
								system.debug('*** Task Local Date/Time is ' + tsk.Local_Date_Time__c + ' ***');	
							}
						}
					} 	
				}	
				if (((String)tsk.WhoId).startsWith(conPrefix)) {
				
					Contact currCon = conList.get(tsk.WhoId);
	
					if (currCon.MailingCountry != null && currCon.VMT_UTF_Offset__c != null) {
					
						if (tsk.Call_Date_Time__c != null) {
							tsk.Local_Date_Time__c = tsk.Call_Date_Time__c + (currCon.VMT_UTF_Offset__c+5)/24;				
						} else {
							if (tsk.Created_Date_Time__c != null){
								tsk.Local_Date_Time__c = tsk.Created_Date_Time__c + (currCon.VMT_UTF_Offset__c+5)/24;
							} else {
								tsk.Local_Date_Time__c = DateTime.now() + (currCon.VMT_UTF_Offset__c+5)/24;
							}
						}
						system.debug('*** Task Local Date/Time is ' + tsk.Local_Date_Time__c + ' ***');
					} else {
						
						Account currAcct = acctList.get(currCon.AccountId);
						
						if (currAcct != null) {
							if (currAcct.BillingCountry != null) {
								if (tsk.Call_Date_Time__c != null) {
									tsk.Local_Date_Time__c = tsk.Call_Date_Time__c + (currAcct.VMT_UTF_Offset__c+5)/24;				
								} else {
									if (tsk.Created_Date_Time__c != null){
										tsk.Local_Date_Time__c = tsk.Created_Date_Time__c + (currAcct.VMT_UTF_Offset__c+5)/24;
									} else {
										tsk.Local_Date_Time__c = DateTime.now() + (currAcct.VMT_UTF_Offset__c+5)/24;
									}
								}
							}
							system.debug('*** Task Local Date/Time is ' + tsk.Local_Date_Time__c + ' ***');	
						}		
					}
				}
			}
		}
	}
	
	*/
}