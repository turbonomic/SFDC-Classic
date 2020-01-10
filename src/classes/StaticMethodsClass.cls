public with sharing class StaticMethodsClass {

/*
	@future
	public static void insertCPAobject (List<Id> cmIds) {
		
		Map<id,CampaignMember> cmMap = new Map<id,CampaignMember>([select id, ContactId, LeadId, CampaignId, Created_Date_Adj__c from CampaignMember where id in: cmIds]);
		Map<Id,Id> cmToCampaignMap = new Map<Id,Id>();
		Map<id,Boolean> existingCPAMap = new Map<id,Boolean>();
		List<ConciergePipeAttribution__c> cpaList = new List<ConciergePipeAttribution__c>();
		
		
		for (CampaignMember cm : cmMap.values()) {
			cmToCampaignMap.put(cm.id,cm.CampaignId);
		}
		
		
		Set<Id> CMtoRemove = new Set<Id>();
		Map<Id,Campaign> campaignList = new Map<Id,Campaign>([select id, type, name from Campaign where id in: cmToCampaignMap.values()]);
		
		for (CampaignMember cm : cmMap.values()) {
			Campaign c = campaignList.get(cm.CampaignId);
			
			if (c.type != 'Inbound - Product Download') {
				CMtoRemove.add(cm.id);
			}
			
		}
		
		
		List<ConciergePipeAttribution__c> existingCPA = [select id, CampaignMember_Safe_Id__c from ConciergePipeAttribution__c where CampaignMember_Safe_Id__c in : cmMap.KeySet()];
		
		for (ConciergePipeAttribution__c cpa : existingCPA) {
			CMtoRemove.add(cpa.CampaignMember_Safe_Id__c);
		}
		
		if (CMtoRemove.size() > 0) {
			cmMap.keySet().removeAll(CMtoRemove);
		}
		
		
		//draw in list of conciergepipeattribution objects that have campaignmember ids
		
		for (CampaignMember cm : cmMap.values()) {
			
			ConciergePipeAttribution__c cpa = new ConciergePipeAttribution__c(campaignMember_Safe_Id__c = cm.id, campaignMember_Add_Date__c = date.newInstance(cm.Created_Date_Adj__c.Year(),cm.Created_Date_Adj__c.Month(),cm.Created_Date_Adj__c.Day()));
			
			if (cm.contactId != null){
				cpa.Lead_Contact_Safe_Id__c = cm.ContactId;
			} else {
				cpa.Lead_Contact_Safe_Id__c = cm.LeadId;
			}
			
			cpaList.add(cpa);
		}
		
		insert cpaList;
			
	}
*/	

}