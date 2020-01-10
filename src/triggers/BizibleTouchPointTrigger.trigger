trigger BizibleTouchPointTrigger on bizible2__Bizible_Touchpoint__c (after insert) {
	
	Map<id,List<DateTime>> acctTouchPointMap = new Map<id,List<DateTime>>();
	Map<id,List<DateTime>> acctTouchPointMap30 = new Map<id,List<DateTime>>();
	Map<id,List<DateTime>> acctTouchPointMap60 = new Map<id,List<DateTime>>();
	Map<id,List<DateTime>> acctTouchPointMap90 = new Map<id,List<DateTime>>();
	Map<id,bizible2__Bizible_Touchpoint__c> bizibleMap = new Map<id,bizible2__Bizible_Touchpoint__c>();
	
	for (bizible2__Bizible_Touchpoint__c tp: trigger.new) {
		if (tp.Account_ID__c != null) {
			bizibleMap.put(tp.id,tp);
		}
	}
	
	for (bizible2__Bizible_Touchpoint__c tp: bizibleMap.values()) {
		//Create temporary lists to store Touchpoint Dates
		List<DateTime> tempList1; List<DateTime> tempList2; List<DateTime> tempList3; List<DateTime> tempList4;
		
		//if Touchpoint Date is within 30 days, add touchpoint date to appropriate mapping
		if (tp.bizible2__Touchpoint_Date__c.date() >= Date.Today().addDays(-30)) {
			if (acctTouchPointMap30.containsKey(tp.Account_ID__c)) tempList1 = acctTouchPointMap30.get(tp.Account_ID__c); 
			else tempList1 = new List<DateTime>();
			tempList1.add(tp.bizible2__Touchpoint_Date__c);
			acctTouchPointMap30.put(tp.Account_ID__c,tempList1);
		}
		
		//if Touchpoint Date is within 60 days, add touchpoint date to appropriate mapping
		if (tp.bizible2__Touchpoint_Date__c.date() >= Date.Today().addDays(-60)) {
			if (acctTouchPointMap60.containsKey(tp.Account_ID__c)) tempList2 = acctTouchPointMap60.get(tp.Account_ID__c); 
			else tempList2 = new List<DateTime>();
			tempList2.add(tp.bizible2__Touchpoint_Date__c);
			acctTouchPointMap60.put(tp.Account_ID__c,tempList2);
		}
		
		//if Touchpoint Date is within 90 days, add touchpoint date to appropriate mapping
		if (tp.bizible2__Touchpoint_Date__c.date() >= Date.Today().addDays(-90)) {
			if (acctTouchPointMap90.containsKey(tp.Account_ID__c)) tempList3 = acctTouchPointMap90.get(tp.Account_ID__c); 
			else tempList3 = new List<DateTime>();
			tempList3.add(tp.bizible2__Touchpoint_Date__c);
			acctTouchPointMap90.put(tp.Account_ID__c,tempList3);
		}
		
		if (acctTouchPointMap.containsKey(tp.Account_ID__c)) tempList4 = acctTouchPointMap.get(tp.Account_ID__c); 
		else tempList4 = new List<DateTime>();
		tempList4.add(tp.bizible2__Touchpoint_Date__c);
		acctTouchPointMap.put(tp.Account_ID__c,tempList4);
		
	}
	
	
	Map<id,Account> acctQuery = new Map<id,Account>([SELECT id, name, MQI_Last_30_Days__c, MQI_Last_60_Days__c, MQI_Last_90_Days__c, MQI_Total__c, Last_Marketing_Interaction__c FROM Account WHERE id in: acctTouchPointMap.KeySet()]);
    List<Account> updateAccounts = new List<Account>();
    
    for (Account acct: acctQuery.values()) {
    	boolean updated = false;
    	
    	if (acctTouchPointMap30.containsKey(acct.id)) {
    		if (acct.MQI_Last_30_Days__c != null) {
    			acct.MQI_Last_30_Days__c = acct.MQI_Last_30_Days__c + acctTouchPointMap30.get(acct.id).size();
    		} else acct.MQI_Last_30_Days__c = acctTouchPointMap30.get(acct.id).size();
    		updated = true;
    	}
    	
    	if (acctTouchPointMap60.containsKey(acct.id)) {
    		if (acct.MQI_Last_60_Days__c != null) {
    			acct.MQI_Last_60_Days__c = acct.MQI_Last_60_Days__c + acctTouchPointMap60.get(acct.id).size();
    		} else acct.MQI_Last_60_Days__c = acctTouchPointMap60.get(acct.id).size();
    		updated = true;
    	}
    	
    	if (acctTouchPointMap90.containsKey(acct.id)) {
    		if (acct.MQI_Last_90_Days__c != null) {
    			acct.MQI_Last_90_Days__c = acct.MQI_Last_90_Days__c + acctTouchPointMap90.get(acct.id).size();
    		} else acct.MQI_Last_90_Days__c = acctTouchPointMap90.get(acct.id).size();
    		updated = true;
    	}
    	
    	List<DateTime> tempList = acctTouchPointMap.get(acct.id);
		if (tempList.size() > 0) {
			if (acct.MQI_Total__c != null) {
    			acct.MQI_Total__c = acct.MQI_Total__c + tempList.size();
    		} else acct.MQI_Total__c = tempList.size();
			tempList.sort();
			DateTime tempDT = tempList.get(tempList.size()-1);
			if (acct.Last_Marketing_Interaction__c == null) {
				acct.Last_Marketing_Interaction__c = tempDT;
				updated = true;
			} else if (acct.Last_Marketing_Interaction__c < tempDT) {
				acct.Last_Marketing_Interaction__c = tempDT;
				updated = true;
			}
		}
    
    
    	if (updated) updateAccounts.add(acct);
    }
    
    if (updateAccounts.size() > 0) {
    	update updateAccounts;
    }
}