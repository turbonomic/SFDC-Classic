trigger RegistrationTrigger on VartopiaDRS__Registration__c (after insert, after update, before insert, before update) {
	
	Map<id,VartopiaDRS__Registration__c> regs = new Map<id,VartopiaDRS__Registration__c>();
	Map<id,VartopiaDRS__Registration__c> oldRegs = new Map<id,VartopiaDRS__Registration__c>();
	List<VartopiaDRS__Registration__c> insertRegs = new List<VartopiaDRS__Registration__c>();
	Map<id,VartopiaDRS__Registration__c> deletedRegs = new Map<id,VartopiaDRS__Registration__c>();
	
	if (trigger.isDelete) {
		for (VartopiaDRS__Registration__c a: trigger.old) {
			deletedRegs.put(a.id,trigger.OldMap.get(a.id));
		}
	} else {
		for (VartopiaDRS__Registration__c a : trigger.new) {
			if (trigger.isInsert) {
				insertRegs.add(a);
			} else if (trigger.isUpdate) {
				regs.put(a.id,a);
				oldRegs.put(a.id,trigger.oldMap.get(a.id));
			} else if (trigger.isUndelete) {
				regs.put(a.id,a);
			}
		}
	}
	
	if (trigger.isBefore) {
		
		if (trigger.isInsert) {
			
		} else if (trigger.isUpdate) {
			
		}
		
	} else if (trigger.isAfter) {
		
		if (trigger.isInsert) {
			RegistrationMethods.regFillOppInfo(insertRegs);
		} else if (trigger.isUpdate) {
			RegistrationMethods.regFillOppInfo(regs.values());
		}
		
	}
	
	
}