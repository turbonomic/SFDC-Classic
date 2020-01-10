@isTest
private class TestUserFillSFMetrics {
	
	static testMethod void myUnitTest() {
		
		List<User> uList = [select id, name, tenure_Days__c, Current_Salesforce_Metric__c, trigger_Workflow_Rules__c from User where userRole.Name like '%Enterprise Rep%' and Current_Salesforce_Metric__c > 0 limit 3];
		
		User u = uList.get(0);
		User u2 = uList.get(1);
		User u3 = uList.get(2);
		
		List<Opportunity> oppInsert = new List<Opportunity>();
		Opportunity opp1 = new Opportunity(ownerId = u.id, name = 'Opp 1', stageName = 'Upside', closeDate = date.today().addDays(10), opportunity_Id_Date__c = date.today().addDays(-20), type = 'New', eval_Start_date__c = date.today().addDays(-15), amount = 50000);
		oppInsert.add(opp1);
		Opportunity opp2 = new Opportunity(ownerId = u.id, name = 'Opp 2', stageName = 'Strong Upside', closeDate = date.today().addDays(5), opportunity_id_date__c = date.today().addDays(-25), type = 'New', eval_Start_date__c = date.today().addDays(-20), eval_Completion_date__c = date.today().addDays(-10), amount = 25000);
		oppInsert.add(opp2);
		Opportunity opp3 = new Opportunity(ownerId = u.id, name = 'Opp 3', stageName = 'Closed Won', closeDate = date.today().addDays(-20), opportunity_id_Date__c = date.today().addDays(-45), type = 'New', eval_Start_Date__c = date.today().addDays(-40), eval_Completion_Date__c = date.today().addDays(-30), amount = 100000);
		oppInsert.add(opp3);
		Opportunity opp4 = new Opportunity(ownerId = u.id, name = 'Opp 4', stageName = 'Closed Won', closeDate = date.today(), opportunity_id_Date__c = date.today(), type = 'New', eval_Start_Date__c = date.today(), eval_Completion_Date__c = date.today(), amount = 1000000);
		oppInsert.add(opp4);
		Opportunity opp5 = new Opportunity(ownerId = u3.id, name = 'Opp 5', stageName = 'Closed Won', closeDate = date.today(), opportunity_id_Date__c = date.today(), type = 'New', eval_Start_Date__c = date.today(), eval_Completion_Date__c = date.today(), amount = 1000000);
		oppInsert.add(opp5);
		Opportunity opp6 = new Opportunity(ownerId = u2.id, name = 'Opp 6', stageName = 'Closed Won', closeDate = date.today(), opportunity_id_Date__c = date.today(), type = 'New', eval_Start_Date__c = date.today(), eval_Completion_Date__c = date.today(), amount = 1000000);
		oppInsert.add(opp6);
		
		insert oppInsert;
		
		List<Opportunity> oppUpdate = [select id, name, Opportunity_id_Date__c from Opportunity where id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id];
		List<Opportunity> oppUpdate2 = new List<Opportunity>();
		for (Opportunity o: oppUpdate) {
			if (o.id == opp1.id) {
				o.Opportunity_Id_Date__c = date.today().addDays(-20);
				oppUpdate2.add(o);
			} else if (o.id == opp2.id) {
				o.Opportunity_Id_Date__c = date.today().addDays(-25);
				oppUpdate2.add(o);
			} else if (o.id == opp3.id) {
				o.Opportunity_Id_Date__c = date.today().addDays(-45);
				oppUpdate2.add(o);
			}
		}
		
		update oppUpdate2;
		
		Integer currMonth = date.today().Month();
		Date startDate;
		Date endDate;
		if (currMonth == 2 || currMonth == 3 || currMonth == 4) {
			startDate = date.newInstance(date.today().year(),2,1);
			endDate = date.newInstance(date.today().year(),4,30);
		} else if (currMonth == 5 || currMonth == 6 || currMonth == 7) {
			startDate = date.newInstance(date.today().year(),5,1);
			endDate = date.newInstance(date.today().year(),7,31);
		} else if (currMonth == 8 || currMonth == 9 || currMonth == 10) {
			startDate = date.newInstance(date.today().year(),8,1);
			endDate = date.newInstance(date.today().year(),10,31);
		} else {
			if (currMonth == 1) {
				startDate = date.newInstance(date.today().year()-1,11,1);
				endDate = date.newInstance(date.today().year(),1,31);
			} else {
				startDate = date.newInstance(date.today().year(),11,1);
				endDate = date.newInstance(date.today().year()+1,1,31);
			}
		}
		
		List<Talent_Management__c> tmList = new List<Talent_Management__c>();
		Talent_Management__c tm = new Talent_Management__c(ownerId = u.id, recordTypeId = '01257000000Bekb');
		tmList.add(tm);
		Talent_Management__c tm2 = new Talent_Management__c(ownerId = u2.id, recordTypeId = '01257000000Bekb');
		tmList.add(tm2);
		Talent_Management__c tm3 = new Talent_Management__c(ownerId = u3.id, recordTypeId = '01257000000Bekb');
		tmList.add(tm3);
		insert tmList;
		
		List<Salesforce_Metrics__c> smInsert = new List<Salesforce_Metrics__c>();
		Salesforce_Metrics__c sm = new Salesforce_Metrics__c(name = '61-90 days', talent_Management_file__c = tm.id, salesforce_Metric__c = u.current_Salesforce_Metric__c, start_date__c = date.today().addDays(-40), end_Date__c = date.today().addDays(-10), recordtypeId = '012570000007QsV');
		smInsert.add(sm);
		Salesforce_Metrics__c sm2 = new Salesforce_Metrics__c(name = 'MTD', talent_Management_file__c = tm.id, salesforce_Metric__c = 1000, start_date__c = date.today().addDays(-31), end_Date__c = date.today().addDays(-1), recordtypeId = '01257000000Beiu');
		smInsert.add(sm2);
		Salesforce_Metrics__c sm3 = new Salesforce_Metrics__c(name = 'QTD', talent_Management_file__c = tm.id, salesforce_Metric__c = 2000, start_date__c = date.today().addDays(-100), end_Date__c = date.today().addDays(-10), recordtypeId = '01257000000Beiz');
		smInsert.add(sm3);
		Salesforce_Metrics__c sm4 = new Salesforce_Metrics__c(name = '1-30 days', talent_Management_file__c = tm3.id, salesforce_Metric__c = 1, start_date__c = date.today().addDays(-100), end_Date__c = date.today().addDays(-10), recordtypeId = '012570000007QsV');		
		smInsert.add(sm4);
		
		insert smInsert;
		
		List<User> updateUsers = new List<User>();
		u.trigger_workflow_rules__c = 'asd;flkaja';
		updateUsers.add(u);
		u2.trigger_workflow_rules__c = 'asd;flkaja';
		updateUsers.add(u2);
		u3.trigger_workflow_rules__c = 'asd;flkaja';
		updateUsers.add(u3);
		update updateUsers;
		
		u2 = [select id, name, tenure_Days__c, Current_Salesforce_Metric__c, trigger_Workflow_Rules__c from User where id =: u2.id];
		u2.trigger_workflow_Rules__c = 'fakadfad';
		
		update u2;
		
		List<Salesforce_Metrics__c> sms = [select id, name, deals_closed__c, end_Date__c, evals_Completed__c, evals_Started__c, pipeline_added__c, pipeline_added_N__c, salesforce_metric__c, start_Date__c, talent_Management_File__c, total_bookings__c, user_Safe_id__c from Salesforce_Metrics__c where talent_Management_File__c =: tm.id or talent_Management_File__c =: tm2.id or talent_Management_File__c =: tm3.id];
		
		for (Salesforce_Metrics__c currSM : sms) {
			if (currSM.id == sm.id) {
				system.assertEquals(currSM.deals_closed__c,1);
				system.assertEquals(currSM.total_bookings__c,100000);
				system.assertEquals(currSM.Evals_Completed__c,2);
				system.assertEquals(currSM.Evals_Started__c,3);
				system.assertEquals(currSM.pipeline_added__c,75000);
				system.assertEquals(currSM.pipeline_added_N__c,2);
			} else if (currSM.id == sm2.id) {
				system.assert(currSM.deals_Closed__c >= 0);
				system.assert(currSM.total_bookings__c >= 0);
				system.assert(currSM.Evals_Completed__c >= 0);
				system.assert(currSM.Evals_Started__c >= 0);
				system.assert(currSM.Pipeline_Added__c >= 0);
				system.assert(currSM.Pipeline_Added_N__c >= 0);
			} else if (currSM.id == sm3.id) {
				system.assert(currSM.deals_Closed__c >= 0);
				system.assert(currSM.total_bookings__c >= 0);
				system.assert(currSM.Evals_Completed__c >= 0);
				system.assert(currSM.Evals_Started__c >= 0);
				system.assert(currSM.Pipeline_Added__c >= 0);
				system.assert(currSM.Pipeline_Added_N__c >= 0);
			}
			
			if (currSM.User_Safe_Id__c == u2.id) {
				if (currSM.name == 'MTD') {
					system.assert(currSM.start_date__c == date.today().toStartOfMonth());
					system.assert(currSM.end_Date__c == date.today().addMonths(1).toStartOfMonth().addDays(-1));
					system.assertEquals(currSM.deals_Closed__c,1);
					system.assert(currSM.total_bookings__c == 1000000);
					system.assert(currSM.Evals_Completed__c == 1);
					system.assert(currSM.Evals_Started__c == 1);
					system.assert(currSM.Pipeline_Added__c == 1000000);
					system.assert(currSM.Pipeline_Added_N__c == 1);
				} else if (currSM.name == 'QTD') {
					system.assert(currSM.start_date__c == startDate);
					system.assert(currSM.end_Date__c == endDate);
					system.assert(currSM.deals_Closed__c == 1);
					system.assert(currSM.total_bookings__c == 1000000);
					system.assert(currSM.Evals_Completed__c == 1);
					system.assert(currSM.Evals_Started__c == 1);
					system.assert(currSM.Pipeline_Added__c == 1000000);
					system.assert(currSM.Pipeline_Added_N__c == 1);
				} else {
					system.assert(currSM.deals_Closed__c >= 0);
					system.assert(currSM.total_bookings__c >= 0);
					system.assert(currSM.Evals_Completed__c >= 0);
					system.assert(currSM.Evals_Started__c >= 0);
					system.assert(currSM.Pipeline_Added__c >= 0);
					system.assert(currSM.Pipeline_Added_N__c >= 0);
				}
			} else if (currSM.User_Safe_Id__c == u3.id) {
				if (currSM.name == 'MTD') {
					system.assert(currSM.start_date__c == date.today().toStartOfMonth());
					system.assert(currSM.end_Date__c == date.today().addMonths(1).toStartOfMonth().addDays(-1));
					system.assert(currSM.deals_Closed__c == 1);
					system.assert(currSM.total_bookings__c == 1000000);
					system.assert(currSM.Evals_Completed__c == 1);
					system.assert(currSM.Evals_Started__c == 1);
					system.assert(currSM.Pipeline_Added__c == 1000000);
					system.assert(currSM.Pipeline_Added_N__c == 1);
				} else if (currSM.name == 'QTD') {
					system.assert(currSM.start_date__c == startDate);
					system.assert(currSM.end_Date__c == endDate);
					system.assert(currSM.deals_Closed__c == 1);
					system.assert(currSM.total_bookings__c == 1000000);
					system.assert(currSM.Evals_Completed__c == 1);
					system.assert(currSM.Evals_Started__c == 1);
					system.assert(currSM.Pipeline_Added__c == 1000000);
					system.assert(currSM.Pipeline_Added_N__c == 1);
				} else {
					system.assert(currSM.deals_Closed__c >= 0);
					system.assert(currSM.total_bookings__c >= 0);
					system.assert(currSM.Evals_Completed__c >= 0);
					system.assert(currSM.Evals_Started__c >= 0);
					system.assert(currSM.Pipeline_Added__c >= 0);
					system.assert(currSM.Pipeline_Added_N__c >= 0);
				}
			}
			
			
		}
		
	}
	

}