trigger FillOppPartnerManager on VartopiaDRS__Registration__c (after insert, after update) {
/*	
	
	Map<Id,VartopiaDRS__Registration__c> changedRegs = new Map<Id,VartopiaDRS__Registration__c>();
	List<ID> oppIds = new List<ID>();
	
	
	for (VartopiaDRS__Registration__c vrc : Trigger.new) {
		
		if (vrc.Partner_Manager__c != null && vrc.VartopiaDRS__Opportunity__c != null && (vrc.VartopiaDRS__Vendor_Status__c == 'Submitted' || vrc.VartopiaDRS__Vendor_Status__c == 'Approved')) {
			changedRegs.put(vrc.id,vrc);
			oppIds.add(vrc.VartopiaDRS__Opportunity__c);
		}
		
	}
	
	
	Map<Id,Opportunity> allOpps = new Map<Id,Opportunity>([select id, Partner_Manager__c from Opportunity where id in :oppIds]);
	List<Opportunity> updateOpps = new List<Opportunity>();
	
	
	for (VartopiaDRS__Registration__c vrc : changedRegs.values()) {
		
		Opportunity currOpp = allOpps.get(vrc.VartopiaDRS__Opportunity__c);
		
		currOpp.Partner_Manager__c = vrc.Partner_Manager__c;
		
		
		updateOpps.add(currOpp);
		
	}
	
	if (updateOpps.size() > 0) {
		Set<Opportunity> setOpps = new Set<Opportunity>();
		setOpps.addAll(updateOpps);
		List<Opportunity> finalUpdate = new List<Opportunity>();
		finalUpdate.addAll(setOpps);
		update finalUpdate;	
	}	
	
*/
}