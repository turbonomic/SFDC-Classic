global class SchedBatchUpdateCallsAPAC implements Schedulable {
  
  global void execute(SchedulableContext sc) {
      BatchUpdateTaskCalls b = new BatchUpdateTaskCalls();
      b.query = 'SELECT id, Last_Dial_Date__c, Dial_Count__c, Contact_Count__c, Lead_Count__c, First_Demo_Date__c, First_Evaluation_Meeting_Date__c, Demo_Count__c, Evaluation_Meeting_Count__c, Last_Evaluation_Meeting_Date__c, ' + 
            'Latest_Demo_Date__c, Connect_Count__c, Conversation_Count__c, First_Connect_Date__c, Latest_Connect_Date__c, First_Conversation_Date__c, Latest_Conversation_Date__c, Dials_Before_First_Connect_Conv__c, Dials_Before_First_Evaluation_Meeting__c, Dials_Before_First_Demo__c, ' +
            'Contacts_Dialed_in_Last_X_Days__c, Leads_Dialed_in_Last_X_Days__c, Dials_in_Last_30_Days__c, Dials_in_Last_60_Days__c, Dials_in_Last_90_Days__c, Email_Count__c, Emails_in_Last_30_Days__c, Emails_in_Last_60_Days__c, Emails_in_Last_90_Days__c, Last_Email_Date__c, ' + 
            'Last_Activity_With_Outcome_Date__c, First_Dial_Date__c, Green_Circle_Registration_Date__c, Name FROM Account where (Id != \'001D000000v5q5N\' AND Status__c != \'Defunct Account\' AND (Territory_Owner_Team__c like \'%APAC%\'))';
            
      ID batchprocessid = Database.executeBatch(b, 25);    
    }
    
}