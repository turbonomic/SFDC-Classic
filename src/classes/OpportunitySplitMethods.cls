public class OpportunitySplitMethods {
	
	/*	Table of Contents - to quickly find the method you want, ctrl + F and use the below bracketed values
	*						Note: the format is the letter "O", not the number 0
	*
	*	[O1]	Stamp Split Owner Team (Static)
	*	
	*	
	*/
	 
	
	
	
	
    /*
	*	[O1]
	*	Stamp Split Owner Team (Static)
	*
	*   This method will update the Split Owner Team (Static) field when there is an split opportunity owner change.
	*
	*/
	
	public static void StampSplitOwnerTeam(Map<id,OpportunitySplit> splitMap) {
		Map<id, OpportunitySplit> filteredOppSplits = new Map<id, OpportunitySplit>();
		Set<id> oppList = new Set<id>();
		Set<id> userList = new Set<id>();

		for (OpportunitySplit currOppSplit: splitMap.values()) {
			//Add brand new opp splits to the filtered map
				filteredOppSplits.put(currOppSplit.id,currOppSplit);				
			}
			
		Map<id, OpportunitySplit> filteredSplitMap = new Map<id, OpportunitySplit>([SELECT id, Split_Owner_Team__c, Owner_Team__c, SplitPercentage, OpportunityId, SplitOwnerId FROM OpportunitySplit where id in: filteredOppSplits.keyset()]);
		for (OpportunitySplit split : filteredSplitMap.values()) { 
			oppList.add(split.OpportunityId); 
			userList.add(split.SplitOwnerId);
		}
		
		Map<id,Opportunity> OppMap = new Map<id, Opportunity>([SELECT id,StageName,Type,name FROM Opportunity WHERE id in: oppList]);
		Map<id,User> UserMap = new Map<id, User>([SELECT id,User_Role_Name__c FROM User WHERE id in: userList]);
		
		List<OpportunitySplit> updateOppSplits = new List<OpportunitySplit>();
		
		//Run through filtered Opps to determine if the Opp splits should be updated
		for (OpportunitySplit split : filteredSplitMap.values()) { 
			if (OppMap.get(split.OpportunityId).StageName != 'Unqualified' && OppMap.get(split.OpportunityId).StageName != 'Closed Lost') {
				if (OppMap.get(split.OpportunityId).Type == 'New' || OppMap.get(split.OpportunityId).Type == 'Upsell' || OppMap.get(split.OpportunityId).Type == 'Subscription Renewal') {
					if (!UserMap.get(split.SplitOwnerId).User_Role_Name__c.contains('SDR') && !UserMap.get(split.SplitOwnerId).User_Role_Name__c.contains('Sales Development Rep') && !UserMap.get(split.SplitOwnerId).User_Role_Name__c.contains('Business Development Rep') && !UserMap.get(split.SplitOwnerId).User_Role_Name__c.contains('Channel')) {
						if ((split.Split_Owner_Team__c == null) || (split.Split_Owner_Team__c != split.Owner_Team__c)) {
							split.Split_Owner_Team__c = split.Owner_Team__c;
							updateOppSplits.add(split);
							system.debug('OppSplit has completed trigger: ' + OppMap.get(split.OpportunityId).Name.left(4));
						} 
					}
				} 	
			}
		}
		
		//if there are opp splits to update, update
		if (!updateOppSplits.isEmpty()) update updateOppSplits;
	}
}