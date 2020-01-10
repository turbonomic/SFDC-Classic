global class CampaignMemberWrapper implements Comparable{
	
	public CampaignMember cMember;
	
	public CampaignMemberWrapper(CampaignMember cm) {
		cMember = cm;
	}
	
	global Integer compareTo(Object cm) {
		
		CampaignMemberWrapper cmw = (CampaignMemberWrapper) cm;
		
		Integer returnValue = 0;
		if (cMember.Created_Date_Adj__c > cmw.cMember.Created_Date_Adj__c) {
			returnValue = 1;
		} else if (cMember.Created_Date_Adj__c < cmw.cMember.Created_Date_Adj__c) {
			returnValue = -1;
		}
		
		return returnValue;
	}
	
}