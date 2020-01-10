global class AccountWrapper implements Comparable{
	
	public Account acct;
	
	public AccountWrapper(Account a){
		acct = a;
	}
	
	global Integer compareTo(Object compareTo){
		
		AccountWrapper compareToAcct = (AccountWrapper)compareTo;
		
		Integer returnValue = 0;
		if (acct.VMT_Account_Score__c > compareToAcct.acct.VMT_Account_Score__c) {
			returnValue = -1;
		} else if (acct.VMT_Account_Score__c < compareToAcct.acct.VMT_Account_Score__c) {
			returnValue = 1;
		}
		
		return returnValue;
	}
	

}