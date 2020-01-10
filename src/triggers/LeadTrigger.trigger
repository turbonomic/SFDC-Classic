trigger LeadTrigger on Lead (after insert, after update, before insert, before update) {
    
    Map<id,Lead> leads = new Map<id,Lead>();
    List<Lead> insertLeads = new List<Lead>();
    List<Lead> updateLeads = new List<Lead>();
    Map<id,Lead> oldLeads = new Map<id,Lead>();
    
   //Id recordTypeId = [Select Id From RecordType Where SObjectType = 'Lead' And DeveloperName='Lead'].Id;
    
    for (Lead l : trigger.new) {
         if(l.wi__Share_to_WI__c != True){     
                if (trigger.isInsert) {
                    insertleads.add(l);
                } else if (trigger.isUpdate || trigger.isDelete) {
                    leads.put(l.id,l);
                    oldLeads.put(l.id,trigger.oldMap.get(l.id));
                    updateLeads.add(l);
                } else if (trigger.isUndelete) {
                    leads.put(l.id,l);
                }
      } 
    }
    
    if (trigger.isBefore) {      
        if (trigger.isInsert) {
            LeadMethods.LeadFillRoundRobinNumber(insertLeads);
            LeadMethods.setLeadLookups(insertLeads);
            
        } else if (trigger.isUpdate) {
            LeadMethods.LeadLinkToAccount(leads,oldLeads);
            LeadMethods.LeadStampOriginalLeadOwner(leads,oldLeads);
            LeadMethods.setLeadLookups(updateLeads);
        }
        
    } else if (trigger.isAfter) {
        
        if (trigger.isInsert) {         
            LeadMethods.createCampaignMemberAfterInsert(insertLeads);           
        } 
        else if (trigger.isUpdate) {
            LeadMethods.LeadOwnerUpdate(leads,oldLeads);
            if (MyLeadReassignmentClass.futureMethodAlreadyCalled == false) {
                LeadMethods.LeadTriggerAssignmentRules(leads,oldLeads);
            }
            LeadMethods.LeadDispositionSlaMet(leads,oldLeads);
        }
    } 
}