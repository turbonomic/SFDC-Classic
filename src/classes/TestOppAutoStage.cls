/**
 * Test for Opportunity Auto-Stage Movement and Opportunity Stage Helper Methods in Opportunity Methods Class
 *
 *
 *
 */
@isTest
private class TestOppAutoStage {

    static testMethod void myUnitTest() {
        List<Account> insertAccts = new List<Account>();
        Account acct1 = new Account(name = 'Acct1');        
        insertAccts.add(acct1); 
        
        insert insertAccts;
        
        List<Opportunity> oppInsert = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow', Term_or_Perm__c='Term', of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
        
        Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp2',accountId=acct1.Id,leadsource='Tradeshow', Term_or_Perm__c='Term', of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
        
        Opportunity opp3 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp3',accountId=acct1.Id,leadsource='Tradeshow', Term_or_Perm__c='Term', of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
        
        Opportunity opp4 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp4',accountId=acct1.Id,leadsource='Tradeshow', Term_or_Perm__c='Term', of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
        
        Opportunity opp5 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Closed Lost',name='opp5',accountId=acct1.Id,leadsource='Tradeshow', Term_or_Perm__c='Term', of_Cores__c = 640, Term_or_SNM_Length_in_Months__c = 12, Product_Type__c = 'Workload');
        
        OpportunityMethods.oppSetStageHelper(opp1,'Pipeline');
        OpportunityMethods.oppSetStageHelper(opp2,'Upside');
        OpportunityMethods.oppSetStageHelper(opp3,'Strong Upside');
        OpportunityMethods.oppSetStageHelper(opp4,'Commit');
        OpportunityMethods.oppSetStageHelper(opp5,'Pipeline');
        
        oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
        insert oppInsert;
        
        List<Opportunity> oppAssert1 = new List<Opportunity>([SELECT id, Sales_Stage__c, StageName, Exec_Sponsor_Need_Timing__c, Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c, Began_Eval__c, Exec_Sponsors_Eval_Criteria_Documented__c, Eval_Period_Concluded__c, Close_Plan_Reviewed_by_Tech_Team__c, Tech_Win_Established__c, BIP_Completed__c, Exec_Buy_In_on_BIP__c, CX_CoE_Introduced__c, Funding_Approved__c, Agreement_on_Contract_Terms__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id]);
        List<Opportunity> updateOpps = new List<Opportunity>();
        
        for (Opportunity opp: oppAssert1) {
          if (opp.id == opp1.id) {
            system.assertEquals(opp.StageName,'Pipeline');
            system.assertEquals(opp.Sales_Stage__c,'The Pact');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,false);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,false);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
            OpportunityMethods.oppSetStageHelper(opp,'Identify'); updateOpps.add(opp);
          }
          else if (opp.id == opp2.id) {
            system.assertEquals(opp.StageName,'Upside');
            system.assertEquals(opp.Sales_Stage__c,'Proof of Value');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
            opp.StageName = 'Closed Won'; updateOpps.add(opp);
          }
          else if (opp.id == opp3.id) {
            system.assertEquals(opp.StageName,'Strong Upside');
            system.assertEquals(opp.Sales_Stage__c,'Agreement');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,true);
            system.assertEquals(opp.Eval_Period_Concluded__c,true);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,true);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
            OpportunityMethods.oppSetStageHelper(opp,'Commit'); updateOpps.add(opp);
          }
          else if (opp.id == opp4.id) {
            system.assertEquals(opp.StageName,'Commit');
            system.assertEquals(opp.Sales_Stage__c,'Close');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,true);
            system.assertEquals(opp.Eval_Period_Concluded__c,true);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,true);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,true);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,true);
            system.assertEquals(opp.BIP_Completed__c,true);
            system.assertEquals(opp.CX_CoE_Introduced__c,true);
            system.assertEquals(opp.Funding_Approved__c,true);
            OpportunityMethods.oppSetStageHelper(opp,'Upside'); updateOpps.add(opp);
          }
          else if (opp.id == opp5.id) {
            system.assertEquals(opp.StageName,'Closed Lost');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,false);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,false);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
            opp.StageName = 'Upside'; updateOpps.add(opp);
          }
        }
        
        update updateOpps;
        
        List<Opportunity> oppAssert2 = new List<Opportunity>([SELECT id, Sales_Stage__c, StageName, Exec_Sponsor_Need_Timing__c, Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c, Began_Eval__c, Exec_Sponsors_Eval_Criteria_Documented__c, Eval_Period_Concluded__c, Close_Plan_Reviewed_by_Tech_Team__c, Tech_Win_Established__c, BIP_Completed__c, Exec_Buy_In_on_BIP__c, CX_CoE_Introduced__c, Funding_Approved__c, Agreement_on_Contract_Terms__c FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id]);
        for (Opportunity opp: oppAssert2) {
          if (opp.id == opp1.id) {
            system.assertEquals(opp.StageName,'Identify');
            system.assertEquals(opp.Sales_Stage__c,'Business Need');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,false);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,false);
            system.assertEquals(opp.Began_Eval__c,false);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,false);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
          }
          else if (opp.id == opp2.id) {
            system.assertEquals(opp.StageName,'Closed Won');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
          }
          else if (opp.id == opp3.id) {
            system.assertEquals(opp.StageName,'Commit');
            system.assertEquals(opp.Sales_Stage__c,'Close');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,true);
            system.assertEquals(opp.Eval_Period_Concluded__c,true);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,true);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,true);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,true);
            system.assertEquals(opp.BIP_Completed__c,true);
            system.assertEquals(opp.CX_CoE_Introduced__c,true);
            system.assertEquals(opp.Funding_Approved__c,true);
          }
          else if (opp.id == opp4.id) {
            system.assertEquals(opp.StageName,'Upside');
            system.assertEquals(opp.Sales_Stage__c,'Proof of Value');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,true);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,true);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
          }
          else if (opp.id == opp5.id) {
            system.assertEquals(opp.StageName,'Pipeline');
            system.assertEquals(opp.Sales_Stage__c,'The Pact');
            system.assertEquals(opp.Exec_Sponsor_Need_Timing__c,true);
            system.assertEquals(opp.Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c,true);
            system.assertEquals(opp.Began_Eval__c,false);
            system.assertEquals(opp.Exec_Sponsors_Eval_Criteria_Documented__c,false);
            system.assertEquals(opp.Tech_Win_Established__c,false);
            system.assertEquals(opp.Eval_Period_Concluded__c,false);
            system.assertEquals(opp.Close_Plan_Reviewed_by_Tech_Team__c,false);
            system.assertEquals(opp.Exec_Buy_In_on_BIP__c,false);
            system.assertEquals(opp.Agreement_on_Contract_Terms__c,false);
            system.assertEquals(opp.BIP_Completed__c,false);
            system.assertEquals(opp.CX_CoE_Introduced__c,false);
            system.assertEquals(opp.Funding_Approved__c,false);
          }
        }
    }
}