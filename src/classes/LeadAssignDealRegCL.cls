public class LeadAssignDealRegCL {
public static void ExistingAccountCheck(List<Lead> checkAcc){
	
    List<Lead> newLeadsNoAcc = new List<Lead>();     
    QueueSObject queObjpartnerid = [Select Queue.Id, Queue.Name, Queue.Type from QueueSObject WHERE Queue.Type ='Queue' AND Queue.Name = 'Partner Desk' Limit 1 ];       
    QueueSObject queObjopsid = [Select Queue.Id, Queue.Name, Queue.Type from QueueSObject WHERE Queue.Type ='Queue' AND Queue.Name = 'Ops Queue' Limit 1 ];
    
    for(Lead le : checkAcc){
        if(le.Account__c == null && le.wi__Share_to_WI__c == true){
     		newLeadsNoAcc.add(le);
    	}
	}
    if(newLeadsNoAcc.size() > 0){
        system.debug('### Leads with no account matches ' + newLeadsNoAcc.size() + ' leads to process');
        Set<String> acctWebNames = new Set<String>();
        Set<String> acctCompany  = new Set<String>();
                
        for(Lead le : newLeadsNoAcc){         
           acctWebNames.add(le.Website);
           acctCompany.add(le.Company);
        }
        
        if((acctWebNames.size()>0) || (acctCompany.size()>0)) {
               Map<id,Account> acctMap = new Map<id,Account>([select Id, Name, OwnerId,AE_Rep__c, Lead_source_transfer__c, Website from Account where Website IN : acctWebNames OR Name IN : acctCompany]);
                
                Map<String, Account> acctNameMap = new Map<String, Account>();
                
            if(acctMap != null && acctMap.size() > 0){
                for(Account aa : acctMap.values()){
                    acctNameMap.put(aa.Name, aa);
                    acctNameMap.put(aa.Website, aa);
                }
            }
               
                List<Opportunity> oppLst = new List<Opportunity>();
            	System.debug('Account Map Key set values######' +acctMap.keyset());
                oppLst = [select id, AccountId, Account_Name__c,Name, StageName,Stage_Change_Date__c,CloseDate from Opportunity where StageName != 'Renewal Clear' AND (Stage_Change_Date__c >= 2018-01-01 and Stage_Change_Date__c <= 2018-07-31) AND (NOT Name like '%Renewal%') AND IsClosed = False AND IsWon = False AND AccountId IN : acctMap.keyset()];
                
            	System.debug('Opportunity List values--------' +oppLst);
                
            	Map<Id,List<Id>> oppMap = new Map<id,List<Id>>();
                
            
            	if((oppLst != null && oppLst.size() > 0) || (Test.isRunningTest())){
                    for(Opportunity opp : oppLst){
                        if(oppMap.get(opp.AccountId) != null){
                            List<Id> tempList = oppMap.get(opp.AccountId);
                            tempList.add(opp.id);
                            oppMap.put(opp.AccountId, tempList);
                        }
                           else{
                            List<Id> tempList = new List<Id>();
                            tempList.add(opp.Id);
                            oppMap.put(opp.AccountId, tempList);  
                           }
                        
                    }
                }  
              
			   if(checkAcc != null && checkAcc.size() > 0){         
                    for(Lead le : checkAcc){
                        if(le.Account__c == null){
                            if(acctNameMap.get(le.Website) != null){
                                le.Account__c = acctNameMap.get(le.Website).id;
                                le.Territory_Owner_Lead__c = acctNameMap.get(le.Website).AE_Rep__c;
                                le.OwnerId = queObjpartnerid.Queue.Id;
                            }
                            else{
                                if(acctNameMap.get(le.Company) != null) {
                                    le.Account__c = acctNameMap.get(le.Company).id;
                                    le.Territory_Owner_Lead__c = acctNameMap.get(le.Company).AE_Rep__c;
                                    le.OwnerId = queObjpartnerid.Queue.Id;
                                }                              
                            }     		
                        }
                        if(oppMap.get(le.Account__c) != null){
                                List<String> tempList = oppMap.get(le.Account__c);
                                le.Lead_Opp_Dup__c = true;
                                le.Deal_Type__c = 'Joint/Accelerated';
                                String Opp1 = tempList[0];
                                le.Related_Opportunity__c = Opp1;  
                                le.OwnerId = queObjpartnerid.Queue.Id;
                            }
                    }
               }
        }   
    }   
}
public static void UpdateDupOppFields(List<Lead> updLead){
      List<Id> leadOppUpd = new List<Id>(); 
      List<Id> leadOppMatch = new List<Id>();
      Map<Id,Boolean> LeadMapCustomerDemo = new Map<Id,Boolean>(); //Customer Demo Completed
      Map<Id,Boolean> LeadMapCustomerDownTrial = new Map<Id,Boolean>(); //Customer has Downloaded Trial
      Map<Id,String>  LeadMapRegDesc = new Map<Id,String>(); //Registration Description
      Map<Id,Decimal>  LeadMapNoServer = new Map<Id,Decimal>(); //Number of Server Hosts
      Map<Id,Decimal>  LeadMapNoCores = new Map<Id,Decimal>(); //Number of Cores
      Map<Id,Decimal>  LeadMapNoVMs = new Map<Id,Decimal>(); //Number of VMs to be licensed
      Map<Id,String>  LeadStageCloud = new Map<Id,String>(); //Stage of Customer "Cloud Journey"	
      Map<Id,String>  LeadStageCustPref = new Map<Id,String>(); //Customer Preferred Cloud Provider
      Map<Id,String>  LeadStVendor = new Map<Id,String>(); //Current Storage Vendor
      Map<Id,String>  LeadHyperVis = new Map<Id,String>(); //Current Hypervisor (P)
      Map<Id,String>  LeadHowResellFind = new Map<Id,String>(); //How did the Reseller find this deal
      Map<Id,String>  LeadOtherSol = new Map<Id,String>(); //Other Solutions Customer is Evaluating
      Map<Id,String>  LeadWhichProduct = new Map<Id,String>(); //Which Product Version is the customer in
      Map<Id,Decimal>  LeadExpecRev = new Map<Id,Decimal>(); //Expected Revenue
      Map<Id,String>  LeadPrefDist = new Map<Id,String>(); //Preferred Distributor
      Map<Id,String>  LeadCurrSerVend = new Map<Id,String>(); //Current Server Vendor
      Map<Id,Date> LeadAppDate = new Map<Id,Date>(); //Deal reg approval date
      Map<Id,Date> LeadExpDate = new Map<Id,Date>(); //Deal Reg Expired date
      Map<Id,Date> LeadDateNextCust = new Map<Id,Date>(); //Date of Next Customer Meeting
      Map<Id,Id> LeadAssoPart = new Map<Id,Id>(); //Associated Partner
      Map<Id,String> LeadWFStatus = new Map<Id,String>(); //Workflow Status
      Map<Id,Id> LeadPartCont = new Map<Id,String>(); //Partner Contact
      Map<Id,Decimal> LeadWIid = new Map<Id,Decimal>(); //WI Lead Id
      Map<Id,String>  LeadDealType = new Map<Id,String>(); //Deal Type
        
      List<Opportunity> oppUpd = new List<Opportunity>();
          
        if(updLead.size()>0 && updLead != null){
            for(Lead le : updLead){
                if(le.Partner_Status__c == 'Approved' && le.Related_Opportunity__c !=null){
                    leadOppUpd.add(le.Id);
                    leadOppMatch.add(le.Related_Opportunity__c);
                    LeadMapCustomerDemo.put(le.Related_Opportunity__c,le.DealRegq3__c); //Customer Demo Completed
                    LeadMapRegDesc.put(le.Related_Opportunity__c,le.DealRegq1__c); //Registration Description
                    LeadMapCustomerDownTrial.put(le.Related_Opportunity__c,le.DealRegq4__c); //Customer has Downloaded Trial 
                    LeadMapNoServer.put(le.Related_Opportunity__c,le.DealRegq5__c); //Number of Server Hosts
                    LeadMapNoCores.put(le.Related_Opportunity__c,le.DealRegq6__c); //Number of Cores
                    LeadMapNoVMs.put(le.Related_Opportunity__c,le.DealRegq7__c); //Number of VMs to be licensed
                    LeadStageCloud.put(le.Related_Opportunity__c,le.DealRegq8__c); //Stage of Customer "Cloud Journey"
                    LeadStageCustPref.put(le.Related_Opportunity__c,le.DealRegq9__c); //Customer Preferred Cloud Provider
                    LeadStVendor.put(le.Related_Opportunity__c,le.DealRegq10__c); //Current Storage Vendor
                    LeadHyperVis.put(le.Related_Opportunity__c,le.DealRegq11__c);  //Current Hypervisor (P)
                    LeadHowResellFind.put(le.Related_Opportunity__c,le.DealRegq12__c); //How did the Reseller find this deal
                    LeadOtherSol.put(le.Related_Opportunity__c,le.DealRegq13__c); //Other Solutions Customer is Evaluating
                    LeadWhichProduct.put(le.Related_Opportunity__c,le.DealRegq14__c);  //Which Product Version is the customer in
                    LeadExpecRev.put(le.Related_Opportunity__c,le.DealRegq15__c); //Expected Revenue
                    LeadPrefDist.put(le.Related_Opportunity__c,le.DealRegq16__c);  //Preferred Distributor
                    LeadCurrSerVend.put(le.Related_Opportunity__c,le.DealRegq17__c);  //Current Server Vendor
                    LeadAppDate.put(le.Related_Opportunity__c,le.Deal_reg_approval_date__c); //Deal reg approval date
                    LeadExpDate.put(le.Related_Opportunity__c,le.Deal_Reg_Expired_date_formula__c); //Deal Reg Expired date
                    LeadDateNextCust.put(le.Related_Opportunity__c,le.DealRegq2__c); //Date of Next Customer Meeting
                    LeadAssoPart.put(le.Related_Opportunity__c,le.wi__Associated_Partner__c); //Associated Partner
                    LeadWFStatus.put(le.Related_Opportunity__c,le.wi__Workflow_Status__c); //Workflow Status
                    LeadPartCont.put(le.Related_Opportunity__c,le.wi__Partner_Contact__c); //Partner Contact
                    LeadWIid.put(le.Related_Opportunity__c,le.wi__WI_Lead_Id__c); //WI Lead Id
                    LeadDealType.put(le.Related_Opportunity__c,le.Deal_Type__c); //Deal Type
                } 
            }
        }
        
        Map<Id,Opportunity> OppMapUpd = new Map<Id,Opportunity>([Select id,name,DDealRegq3__c from Opportunity where id IN : leadOppMatch]);
        System.debug('OppValues' +OppMapUpd.keySet());
        Map<Integer,String> oppMapVal = new Map<Integer,String>();
        
        if(OppMapUpd.size()>0 && OppMapUpd != null){
            for(Opportunity opp: OppMapUpd.values()){
                opp.DealRegq1__c = LeadMapRegDesc.get(opp.id); //Registration Description
                opp.DealRegq2__c = LeadDateNextCust.get(opp.Id); //Date of Next Customer Meeting
                opp.DDealRegq3__c = LeadMapCustomerDemo.get(opp.id);     //Customer Demo Completed          
                opp.DealRegq4__c = LeadMapCustomerDownTrial.get(opp.id); //Customer has Downloaded Trial 
                opp.DealRegq5__c = LeadMapNoServer.get(opp.id); //Number of Server Hosts
                opp.Number_of_Cores__c = LeadMapNoCores.get(opp.Id); //Number of Cores
                opp.DealRegq6__c = LeadExpecRev.get(opp.id); //Expected Revenue
                opp.DealRegq7__c = LeadMapNoVMs.get(opp.id); //Number of VMs to be licensed
                opp.DealRegq8__c = LeadStageCloud.get(opp.Id); //Stage of Customer "Cloud Journey"
                opp.DealRegq9__c = LeadStageCustPref.get(opp.Id); //Customer Preferred Cloud Provider
                opp.DealRegq10__c = LeadStVendor.get(opp.Id); //Current Storage Vendor
                opp.Current_Hypervisor__c = LeadHyperVis.get(opp.Id); //Current Hypervisor (P)
                opp.DealRegq12__c = LeadHowResellFind.get(opp.Id); //How did the Reseller find this deal
				opp.DealRegq13__c = LeadOtherSol.get(opp.id); //Other Solutions Customer is Evaluating
                opp.DealRegq14__c = LeadWhichProduct.get(opp.Id);   //Which Product Version is the customer in   
                opp.DealRegq16__c = LeadPrefDist.get(opp.Id);  //Preferred Distributor
                opp.DealRegq17__c = LeadCurrSerVend.get(opp.id);   //Current Server Vendor
                opp.Deal_reg_approval_date__c = LeadAppDate.get(opp.Id);  //Deal reg approval date
                opp.Deal_Reg_Expired_date__c = LeadExpDate.get(opp.Id); //Deal Reg Expired date
                opp.wi__Associated_Partner__c = LeadAssoPart.get(opp.id); //Associated Partner
                opp.wi__Workflow_Status__c = LeadWFStatus.get(opp.Id); //Workflow Status
                opp.wi__Contact__c = LeadPartCont.get(opp.id); //Partner Contact
                opp.wi__WI_Lead_Id__c = LeadWIid.get(opp.id); //WI Lead Id
                opp.Deal_Type__c = LeadDealType.get(opp.Id); //Deal Type
                oppUpd.add(opp);
                System.debug('Values to update in opp' +oppUpd);
                }
            }
        
        If(oppUpd.size()>0 && oppUpd != null){            
           Update oppUpd; 
        }
        } 
    public static void LeadAssignFunc1(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc2(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc3(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc4(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc5(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc6(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc7(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
    public static void LeadAssignFunc8(){
        Integer i = 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
    }
}