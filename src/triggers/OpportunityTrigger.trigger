trigger OpportunityTrigger on Opportunity (after insert, after update, before insert, before update) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    Map<id,Opportunity> opps = new Map<id,Opportunity>();
    Map<id,Opportunity> oldOpps = new Map<id,Opportunity>();
    
    for (Opportunity o : trigger.new) {
        if (trigger.isInsert) {
            oppList.add(o);
        } else if (trigger.isUpdate || trigger.isDelete) {
            oppList.add(o);
            opps.put(o.id,o);
            oldOpps.put(o.id,trigger.oldMap.get(o.id));
        } else if (trigger.isUndelete) {
            opps.put(o.id,o);
        }
    }
    
    
    
        if (trigger.isBefore) {
            
            if (trigger.isInsert) {
                //OpportunityMethods.oppStageMovement(oppList);
                OpportunityMethods.oppAutoNameCreation(oppList);
                OpportunityMethods.EmailUpdateStamp(oppList,oldOpps);
                OpportunityMethods.setOppLookups(oppList,oldOpps);
                OpportunityMethods.fillManualCampaignSource(oppList,oldOpps);  
                
            } else if (trigger.isUpdate) {
                //OpportunityMethods.oppStageMovement(oppList);
                OpportunityMethods.oppAutoNameCreation(oppList);
                OpportunityMethods.oppUpdateTeam(opps,oldOpps);
                OpportunityMethods.oppStampProgress(opps,oldOpps);
                OpportunityMethods.oppCountContactRoles(opps,oldOpps);
                OpportunityMethods.EmailUpdateStamp(oppList,oldOpps);
                OpportunityMethods.setOppLookups(oppList,oldOpps);
                OpportunityMethods.fillManualCampaignSource(oppList,oldOpps);
                
            }
            
            
            
        } else if (trigger.isAfter) {
            
            if (trigger.isInsert) {
                
                
                
            } else if (trigger.isUpdate) {
                OpportunityMethods.oppFillRegVendorStatus(opps,oldOpps);
                OpportunityMethods.oppCloseContacts(opps,oldOpps);
                OpportunityMethods.OppSplitEJFProjections(opps,oldOpps);
                
                                
            }
            
            if (AvoidRecursion.isFirstRun()) {
                OpportunityMethods.oppChangesEmailAlertExecTeam(opps,oldOpps);
            }
            
        }
    
    
    
}