global class SchedBatchUpdatePartnerInfo implements schedulable{
	
	global void execute(SchedulableContext sc) {
		BatchUpdatePartnerInfo b = new BatchUpdatePartnerInfo();
		b.query = 'SELECT ID, Name, AR12_Score__c, AR6_Score__c, IP12_Score__c, IP6_Score__c, TP12_Score__c, TP6_Score__c, IR12_Score__c, IR6_Score__c, TR12_Score__c, ' +
					'TR6_Score__c, NGPC_Score__c, NAS_Score__c, NAT_Score__c, NPO_Score__c, NMA_Score__c, NAC_Score__c, Graded_Partners_C_and_Above__c, A_and_B_Graded_Sales_Partners__c,' +
					'A_and_B_Graded_Tech_Partners__c, Number_of_ACE_Certified_Contacts__c, number_of_mapped_sales_accounts__c, Number_Of_Partner_Offices__c, registered_bookings_last_12_months__c, ' +
					'registered_bookings_last_6_months__c, incremental_bookings_last_12_months__c, incremental_bookings_last_6_months__c, registered_pipe_adds_last_12_months__c, ' +
					'registered_pipe_adds_last_6_months__c, incremental_pipe_adds_last_12_months__c, incremental_pipe_adds_last_6_months__c, approved_registrations_last_12_months__c, ' + 
					'approved_registrations_last_6_months__c, Active_Partner__c, first_registration_date__c, last_registration_date__c, number_of_registrations__c, number_of_booked_registrations__c ' + 
 					'from Account where recordTypeId = \'012D0000000kbiU\' and id != \'001D000000ev464IAA\'';					
		ID batchprocessid = Database.executeBatch(b, 10);
	}
	
}