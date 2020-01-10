/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestEmailUpdateStamp {

    static testMethod void myUnitTest() {
        Account acct1 = new Account(name = 'Acct1');
        insert acct1;
        
        List<Opportunity> oppInsert = new List<Opportunity>();
        
        //Amount, Close Date, and Stage Name Updated
		Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Identify',name='opp1',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp1');
		oppInsert.add(opp1);
		
		//Amount and Close Date Updated
		Opportunity opp2 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Pipeline',name='opp2',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp2');
		OpportunityMethods.oppSetStageHelper(opp2,'Pipeline');
		oppInsert.add(opp2);
		
		//Amount and Stage Name Updated
		Opportunity opp3 = new Opportunity(Type='New',amount=50000,closedate=date.Today(),stageName='Identify',name='opp3',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp3');
		oppInsert.add(opp3);
		
		//No Updates
		Opportunity opp4 = new Opportunity(Type='New',amount=90000,closedate=date.Today(),stageName='Identify',name='opp4',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Opportunity_Name_Override__c = 'opp4');
		oppInsert.add(opp4);
		
		//Amount Updated
		Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today(),stageName='Identify',name='opp5',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp5');
		oppInsert.add(opp5);
		
		//Close Date Updated
		Opportunity opp6 = new Opportunity(Type='New',amount=12345,closedate=date.Today(),stageName='Strong Upside',name='opp6',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp6');
		OpportunityMethods.oppSetStageHelper(opp6,'Strong Upside');
		oppInsert.add(opp6);
		
		//Stage Name Updated
		Opportunity opp7 = new Opportunity(Type='New',amount=67890,closedate=date.Today(),stageName='Pipeline',name='opp7',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp7');
		OpportunityMethods.oppSetStageHelper(opp7,'Pipeline');
		oppInsert.add(opp7);
		
		//Opp updated but Amount, Closed Date, and Stage Name remain the same
		Opportunity opp8 = new Opportunity(Type='New',amount=100000,closedate=date.Today(),stageName='Commit',name='opp8',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Term',Opportunity_Name_Override__c = 'opp8');
		OpportunityMethods.oppSetStageHelper(opp8,'Commit');
		oppInsert.add(opp8);
		
		//New Record
		Opportunity opp9 = new Opportunity(Type='New',amount=50000,closedate=date.Today(),stageName='Upside',name='opp9',accountId=acct1.Id,leadsource='Tradeshow',Expected_Revenue_Type__c='Perm with 1-2 Years Maintenance',Opportunity_Name_Override__c = 'opp9');
		OpportunityMethods.oppSetStageHelper(opp9,'Upside');
		oppInsert.add(opp9);
		
		insert oppInsert;
		
		List<Opportunity> OppUpdate = [SELECT amount, CloseDate, StageName, OwnerId, Email_Update_Stamp_Apex__c, Exec_Sponsor_Need_Timing__c, Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c, Began_Eval__c, Exec_Sponsors_Eval_Criteria_Documented__c, Tech_Win_Established__c, Exec_Buy_In_on_BIP__c, Agreement_on_Contract_Terms__c FROM Opportunity WHERE id =: opp1.id OR id =: opp2.id OR id =: opp3.id OR id =: opp4.id OR id =: opp5.id OR id =: opp6.id OR id =: opp7.id OR id =: opp8.id OR id =: opp9.id]; 
       	List<Opportunity> afterOppUpdate = new List<Opportunity>();
        
        for (Opportunity o: oppUpdate) {
        	if (o.id == opp1.id) {
        		o.amount = 49528;
        		o.CloseDate = date.Today().addDays(5);
        		o.StageName = 'Upside'; OpportunityMethods.oppSetStageHelper(o,'Upside'); //o.Exec_Sponsor_Need_Timing__c = true; o.Began_Eval__c = true; o.Exec_Sponsors_Eval_Criteria_Documented__c = true;
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp2.id) {
        		o.amount = 93752;
        		o.CloseDate = date.Today().addDays(10);
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp3.id) {
        		o.amount = 29752;
        		o.StageName = 'Commit'; OpportunityMethods.oppSetStageHelper(o,'Commit'); //o.Exec_Sponsor_Need_Timing__c = true; o.Began_Eval__c = true; o.Exec_Sponsors_Eval_Criteria_Documented__c = true; o.Tech_Win_Established__c = true; o.Exec_Buy_In_on_BIP__c = true; o.Agreement_on_Contract_Terms__c = true;
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp5.id) {
        		o.amount = 84736;
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp6.id) {
        		o.CloseDate = date.Today().addDays(7);
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp7.id) {
        		o.StageName = 'Closed Won';
        		afterOppUpdate.add(o);
        	}
        	else if (o.id == opp8.id) {
        		o.OwnerId = '005D0000004KUK5IAO';
        		afterOppUpdate.add(o);
        	}
        }
        
        update afterOppUpdate;
        
        List<Opportunity> assertOpps = [SELECT Email_Update_Stamp_Apex__c, of_CPU_Sockets__c,amount, CloseDate, StageName, Owner_Team__c, Exec_Sponsor_Need_Timing__c, Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c, Began_Eval__c, Exec_Sponsors_Eval_Criteria_Documented__c, Tech_Win_Established__c, Exec_Buy_In_on_BIP__c, Agreement_on_Contract_Terms__c FROM Opportunity WHERE id =: opp1.id OR id =: opp2.id OR id =: opp3.id OR id =: opp4.id OR id =: opp5.id OR id =: opp6.id OR id =: opp7.id OR id =: opp8.id OR id =: opp9.id];
        List<Opportunity> updateOppsRound2 = new List<Opportunity>();
        
        for (Opportunity o: assertOpps) {
        	if (o.id == opp1.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'100000.00<'+date.Today()+'>Identify');
        		o.CloseDate = date.today().addDays(30);
        		o.amount = 45216;
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp2.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'100000.00<'+date.Today()+'>(no stage change)');
        		o.StageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(o,'Strong Upside');
        		o.amount = 47515;
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp3.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'50000.00<(no close date change)>Identify');
        		o.CloseDate = date.today().addDays(35);
        		o.StageName = 'PO Received';
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp4.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'[new record]');
        		o.amount = 100000;
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp5.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'60000.00<(no close date change)>(no stage change)');
        		o.CloseDate = date.today().addDays(5);
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp6.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<'+date.Today()+'>(no stage change)');
        		o.StageName = 'Commit'; OpportunityMethods.oppSetStageHelper(o,'Commit');
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp7.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<(no close date change)>Pipeline');
        		o.Owner_Team__c = 'Closers Club';
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp8.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'[new record]');
        		o.StageName = 'Closed Won';
        		o.amount = 120000;
        		o.CloseDate = date.today().addDays(1);
        		updateOppsRound2.add(o);
        	}
        	else if (o.id == opp9.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'[new record]');
        		o.StageName = 'Commit'; OpportunityMethods.oppSetStageHelper(o,'Commit');
        		o.amount = 80000;
        		o.CloseDate = date.today().addDays(2);
        		updateOppsRound2.add(o);
        	}
        } 
        system.debug('first assertions done');
        update updateOppsRound2;
        
         List<Opportunity> secondAssert = [SELECT Email_Update_Stamp_Apex__c FROM Opportunity WHERE id =: opp1.id OR id =: opp2.id OR id =: opp3.id OR id =: opp4.id OR id =: opp5.id OR id =: opp6.id OR id =: opp7.id OR id =: opp8.id OR id =: opp9.id];
                 
        for (Opportunity o: secondAssert) {
        	if (o.id == opp1.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'49528.00<'+date.Today().addDays(5)+'>(no stage change)');
        	}
        	else if (o.id == opp2.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'93752.00<'+'(no close date change)'+'>Pipeline');
        	}
        	else if (o.id == opp3.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<' + date.today() + '>Commit');
        	}
        	else if (o.id == opp4.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'90000.00<(no close date change)>(no stage change)');
        	}
        	else if (o.id == opp5.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<'+date.today()+'>(no stage change)');
        	}
        	else if (o.id == opp6.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<(no close date change)>Strong Upside');
        	}
        	else if (o.id == opp7.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'(no amount change)<(no close date change)>Pipeline');
        	}
        	else if (o.id == opp8.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'100000.00<'+date.today()+'>Commit');
        	}
        	else if (o.id == opp9.id) {
        		system.assertEquals(o.Email_Update_Stamp_Apex__c,'50000.00<'+date.today()+'>Upside');
        	}
        }
    }
}