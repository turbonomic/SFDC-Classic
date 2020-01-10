trigger OpportunitySplitTrigger on OpportunitySplit (after insert, after update, before insert, before update) {
    Map<id,OpportunitySplit> oppSplits = new Map<id,OpportunitySplit>();
	Map<id,OpportunitySplit> oldOppSplits = new Map<id,OpportunitySplit>();
	
	for (OpportunitySplit os : trigger.new) {
		if (trigger.isInsert) {
			oppSplits.put(os.id,os);
		} else if (trigger.isUpdate || trigger.isDelete) {
			oppSplits.put(os.id,os);
			oldOppSplits.put(os.id,trigger.oldMap.get(os.id));
		} else if (trigger.isUndelete) {
			oppSplits.put(os.id,os);
		}
	}
	
	if (trigger.isBefore) {
			
		if (trigger.isInsert) {
			
		} else if (trigger.isUpdate) {
			
		}
			
			
	} else if (trigger.isAfter) {
			
		if (trigger.isInsert) {
			OpportunitySplitMethods.StampSplitOwnerTeam(oppSplits);   
			
			
		} else if (trigger.isUpdate) {
							
		}
	}
	
}