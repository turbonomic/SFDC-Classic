global class SchedBatchUpdateOthersEMEAEnt implements Schedulable {
  
  global void execute(SchedulableContext sc) {
        BatchUpdateTaskOthers b = new BatchUpdateTaskOthers();
       b.query = 'SELECT id, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Evaluation_Meeting_Count__c, Last_Evaluation_Meeting_Date__c, Rating, Revisit_Date__c, ' + 
            'Latest_Demo_Date__c, Opps_Identify__c, Opps_open_pipe__c, Opps_closed_Won__c, Hypervisor_Vendor__c, Core_Count__c, Last_Core_Count_Update_Date__c, ' + 
            'Last_Activity_With_Outcome_Date__c, Socket_Count__c, VM_Count__c, Last_Socket_Count_Update_Date__c, Last_VM_Count_Update_Date__c, Name, auto_bill__c, Status__c, Customer_LTV_Tier__c, Exclude_From_Auto_Bill__c, Most_Recent_EBC_Meeting__c, Most_Recent_Roadmap_Meeting__c ' +
            'FROM Account where (Id != \'001D000000v5q5N\' and Status__c != \'Defunct Account\' and (Territory_Owner_Team__c = \'EMEA Enterprise\'))';
       
       ID batchprocessid = Database.executeBatch(b, 4);
  }
  
}