global class RegistrationMethods {
	
	public static void regFillOppInfo(List<VartopiaDRS__Registration__c> regList) {
		
		Map<id,VartopiaDRS__Registration__c> regMap = new Map<id,VartopiaDRS__Registration__c>();
		//Map<id,VartopiaDRS__Registration__c> regMap2 = new Map<id,VartopiaDRS__Registration__c>();
		Map<id,id> regToOppIds = new Map<id,id>();
		
		for (VartopiaDRS__Registration__c reg : regList) {
			regMap.put(reg.id,reg);
			if (reg.VartopiaDRS__Opportunity__c != null && reg.VartopiaDRS__Opportunity__c != '006D000000GvUcfIAF')
				regToOppIds.put(reg.id,reg.VartopiaDRS__Opportunity__c);
		}
		
		Map<id,Opportunity> oppMap = new Map<id,Opportunity>([select id, name, Registration_Partner_Manager__c, Partner_Manager__c, Deal_Type__c from Opportunity where id in: regToOppIds.values()]);
	
		List<Opportunity> updateOpps = new List<Opportunity>();
		
		for (VartopiaDRS__Registration__c reg : regMap.values()) {
			
			Opportunity opp = oppMap.get(regToOppIds.get(reg.id));
			if (opp != null) {
				Boolean updated = false;
				
				if (reg.VartopiaDRS__Vendor_Status__c == 'Submitted' || reg.VartopiaDRS__Vendor_Status__c == 'Approved' || reg.VartopiaDRS__Vendor_Status__c == 'Closed-Won') {
					if (reg.Partner_Manager_Name__c != null) {
				
						if (opp.Registration_Partner_Manager__c == null) {
							opp.Registration_Partner_Manager__c = reg.Partner_Manager_Name__c;
							updated = true;
						} else {
							if (opp.Registration_Partner_Manager__c != reg.Partner_Manager_Name__c) {
								opp.Registration_Partner_Manager__c = reg.Partner_Manager_Name__c;
								updated = true;
							}
						}
						
						if (opp.Partner_Manager__c == null) {
							opp.Partner_Manager__c = reg.Partner_Manager__c;
							updated = true;
						} else {
							if (reg.Partner_Manager__c != opp.Partner_Manager__c) {
								opp.Partner_Manager__c = reg.Partner_Manager__c;
								updated = true;
							}
						}
					}
				}
				
				if (reg.Deal_Type__c != null) {
					if (opp.Deal_Type__c == null) {
						opp.Deal_Type__c = reg.Deal_Type__c;
						updated = true;
					} else {
						if (opp.Deal_Type__c != reg.Deal_Type__c) {
							opp.Deal_Type__c = reg.Deal_Type__c;
							updated = true;
						}
					}
				}
				
				if (updated) updateOpps.add(opp);
			}
		}
		
		if (updateOpps.size() > 0) {
			Set<Opportunity> noDupeList = new Set<Opportunity>();
			List<Opportunity> finalList = new List<Opportunity>();
			noDupeList.addAll(updateOpps);
			finalList.addAll(noDupeList);
			update finalList;
		}
	}
	
}