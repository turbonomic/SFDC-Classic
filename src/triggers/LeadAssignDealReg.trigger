trigger LeadAssignDealReg on Lead (before insert,before update,after insert,after update) {
    
    List<Lead> checkExistingAccount = new List<Lead>();
    List<Lead> leads = new List<Lead>();
    List<Lead> updateLeads = new List<Lead>();
    
    for(Lead newLead : Trigger.new){
            checkExistingAccount.add(newLead);
    }   
    
    for(Lead l: Trigger.new){
            if(trigger.isInsert){
                leads.add(l); 
            }
        else if(trigger.isupdate){
            updateLeads.add(l);
        }
    }
    
    if(trigger.isInsert){
        LeadAssignDealRegCL.ExistingAccountCheck(checkExistingAccount);
    }
    else if(trigger.isupdate){
        LeadAssignDealRegCL.UpdateDupOppFields(updateLeads);
    }
}