trigger RegFillPartnerManager on VartopiaDRS__Registration__c (after insert, after update) {
/*
	Map<id,VartopiaDRS__Registration__c> regMap = new Map<id,VartopiaDRS__Registration__c>();
	Map<id,id> regToOppIds = new Map<id,id>();
	
	for (VartopiaDRS__Registration__c reg : trigger.new) {
		if (reg.VartopiaDRS__Vendor_Status__c == 'Submitted' || reg.VartopiaDRS__Vendor_Status__c == 'Approved' || reg.VartopiaDRS__Vendor_Status__c == 'Closed-Won') {
			if (reg.Partner_Manager_Name__c != null) {
				regMap.put(reg.id,reg);
				if (reg.VartopiaDRS__Opportunity__c != null && reg.VartopiaDRS__Opportunity__c != '006D000000GvUcfIAF')
					regToOppIds.put(reg.id,reg.VartopiaDRS__Opportunity__c);
			}
		}
	}
	
	Map<id,Opportunity> oppMap = new Map<id,Opportunity>([select id, name, Registration_Partner_Manager__c from Opportunity where id in: regToOppIds.values()]);
	
	List<Opportunity> updateOpps = new List<Opportunity>();
	
	for (VartopiaDRS__Registration__c reg : regMap.values()) {
		 Opportunity opp = oppMap.get(regToOppIds.get(reg.id));
		 
		 if (opp != null) {
			 if (opp.Registration_Partner_Manager__c == null) {
			 	opp.Registration_Partner_Manager__c = reg.Partner_Manager_Name__c;
			 	updateOpps.add(opp);
			 } else {
			 	if (reg.Partner_Manager_Name__c != opp.Registration_Partner_Manager__c) {
			 		opp.Registration_Partner_Manager__c = reg.Partner_Manager_Name__c;
			 		updateOpps.add(opp);
			 	}
			 }
		}
	}
	
	if (!updateOpps.isEmpty()) update updateOpps;
*/	
}