/**
 * Test Class for the License Generator Classes including LicenseMethods, LicenseCodeGenerator, and LicenseCodeGenerator
 */ 
@isTest
private class TestLicenseXMLGenerator {
	
	private static testMethod void testFinishMessages() {
		List<License_Features__c> lfInsert = new List<License_Features__c>();
		License_Features__c lf1 = new License_Features__c(name = 'Eval - no planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf2 = new License_Features__c(name = 'Commercial', features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;action_script;cloud_targets;cluster_flattening');
		License_Features__c lf3 = new License_Features__c(name = 'Eval - with planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf4 = new License_Features__c(name = 'Eval - Workload Edition', features__c = 'storage;fabric;applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf5 = new License_Features__c(name = 'VHM', features__c = 'community;multiple_vc');
		License_Features__c lf6 = new License_Features__c(name = 'Freemium', features__c = 'automated_actions;custom_reports;customized_views;freemium;historical_data;optimizer');
		License_Features__c lf7 = new License_Features__c(name = 'Essentials', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;automated_actions;active_directory;full_policy;action_script;applications;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;public_cloud;vdi_control;cloud_cost');
		License_Features__c lf8 = new License_Features__c(name = 'Advanced', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies;cloud_cost');
		License_Features__c lf9 = new License_Features__c(name = 'Premier', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;network_control;container_control;public_cloud;vdi_control;scaling;custom_policies;SLA;cloud_cost');
		License_Features__c lf10 = new License_Features__c(name = 'Trial', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies;cloud_cost');
		
		
		lfInsert.add(lf1); lfInsert.add(lf2); lfInsert.add(lf3); lfInsert.add(lf4); lfInsert.add(lf5);
		lfInsert.add(lf6); lfInsert.add(lf7); lfInsert.add(lf8); lfInsert.add(lf9); lfInsert.add(lf10);
		
		insert lfInsert;
		
		List<Account> acctList = new List<Account>();
	
		Account acct1 = new Account(name = 'Eval Account');
		Account acct2 = new Account(name = 'Customer Account');
		acctList.add(acct1);
		acctList.add(acct2);
		
		insert acctList;
		//error message license 1
		List<Opportunity> oppList = new List<Opportunity>();
		Opportunity opp4 = new Opportunity(name = 'Opp4', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', licensee_email__c = 'justin.chang@fakecompany.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false,
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp4);
		
		//error message license 2
		Opportunity opp5 = new Opportunity(name = 'Opp5', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, license_end_date__c = date.today().addDays(30), commercial_license_key__c = false,
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp5);
		
		//error message license 3
		Opportunity opp6 = new Opportunity(name = 'Opp6', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', licensee_email__c = 'justin.chang@fakecompany.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, Pricing_Type__c = 'Workloads', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false,
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp6);
		
		//error message license 4
		Opportunity opp7 = new Opportunity(name = 'Opp7', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', licensee_email__c = 'justin.chang@fakecompany.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = true,
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp7);
		
		//create vhm license
		Opportunity opp8 = new Opportunity(name = 'Opp8', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_type__c = 'VHM', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp8);
		
		Opportunity opp9 = new Opportunity(name = 'Opp9', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Eddie', Licensee_Last_Name__c = 'Genao', Licensee_Email__c = 'eddie.genao@turbonomic.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_Type__c = 'Sockets', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_type__c = 'Freemium', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp9);
		
		//create vhm license with invalid date
		Opportunity opp10 = new Opportunity(name = 'Opp10', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_Type__c = 'Cores', license_end_date__c = date.today().addDays(380), commercial_license_key__c = false, license_type__c = 'VHM', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;Other;Form Download');
		oppList.add(opp10);
		
		//create eval license with invalid date
		Opportunity opp11 = new Opportunity(name = 'Opp11', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_Type__c = 'Cores', license_end_date__c = date.today().addDays(100), commercial_license_key__c = false, license_type__c = 'Eval - Advanced Edition', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;Other;Form Download');
		oppList.add(opp11);
		
		//create eval license with invalid date
		Opportunity opp12 = new Opportunity(name = 'Opp12', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_Type__c = 'Cores', license_end_date__c = date.today().addDays(380), commercial_license_key__c = false, license_type__c = 'Eval - Advanced Edition', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp12);
		
		Opportunity opp13 = new Opportunity(name = 'Opp13', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_Type__c = 'Cores', license_end_date__c = date.today(), commercial_license_key__c = false, license_type__c = 'Eval - Advanced Edition', 
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;Internal Use;Other;Form Download');
		oppList.add(opp13);
		
		//error message license 4
		Opportunity opp14 = new Opportunity(name = 'Opp14', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', licensee_email__c = 'justin.chang@fakecompany.com', total_licensed_workloads__c = 100, 
											pricing_type__c = 'Workloads', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_type__c = 'Eval - Advanced Edition',
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp14);
		
		insert oppList; 
		
		String response;
		
		response = LicenseXML.generateXML(opp4.Id);
		system.assertEquals(response,'Please enter in either a License Type or check the Commercial License Key box (if in Finance and issuing a commercial key).');
		
		response = LicenseXML.generateXML(opp5.id);
		system.assertEquals(response,'Please make sure to fill in the Licensee First Name, Licensee Last Name, Licensee Email, License End Date, License Creation Use Cases, and either license type or the commercial license key checkbox must be selected before trying to generate a license.');
		
		response = LicenseXML.generateXML(opp6.Id);
		system.assertEquals(response,'Please make sure to fill in the Total Licensed Workloads, Total Licensed Sockets, or Total Licensed Cores AND Total Licensed Sockets as appropriate');
		
		response = LicenseXML.generateXML(opp7.Id);
		system.assertEquals(response,'Please enter in the Revenue Type and Turbonomic Edition for this Opportunity before creating the Commercial License Key');
		
		response = LicenseXML.generateXML(opp8.id);
		system.assertEquals(response,'Successfully created VHM XML license. You will find the License attached to the Opportunity in the Attachments section and an email logged to your opportunity');
		
		response = LicenseXML.generateXML(opp9.id);
		system.assertEquals(response,'Successfully created Freemium XML license. You will find the License attached to the Opportunity in the Attachments section and an email logged to your opportunity');
		
		User u = [select id, UserRoleId from User where isActive = true and UserRole.Name = 'Sales Engineer - US' limit 1];
		
		system.runas(u) {
			response = LicenseXML.generateXML(opp10.id);
			system.assertEquals(response,'VHM and Freemium licenses may not have a License End Date more than 370 days from today.');
			
			response = LicenseXML.generateXML(opp11.id);
			system.assertEquals(response,'Eval licenses may not have a License End Date exceed 90 days from today.');
			
			response = LicenseXML.generateXML(opp12.id);
			system.assertEquals(response,'NFR and Internal Licenses may not have a License End Date more than 370 days from today.');
			
			response = LicenseXML.generateXML(opp13.id);
			system.assertEquals(response,'All Licenses must have a License End Date at least 1 day from today.');
		}
		
		response = LicenseXML.generateXML(opp14.Id);
		system.assertEquals(response,'Please select a Turbonomic Edition when creating a workload license');
		
		
	}
	
	//test generating both commercial and eval licenses from the Opportunity.
    private static testMethod void testLicenseOppGeneration() {
		
		List<License_Features__c> lfInsert = new List<License_Features__c>();
		License_Features__c lf1 = new License_Features__c(name = 'Eval - no planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf2 = new License_Features__c(name = 'Commercial', features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;action_script;cloud_targets;cluster_flattening');
		License_Features__c lf3 = new License_Features__c(name = 'Eval - with planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf4 = new License_Features__c(name = 'Eval - Workload Edition', features__c = 'storage;fabric;applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf5 = new License_Features__c(name = 'VHM', features__c = 'community;multiple_vc');
		License_Features__c lf6 = new License_Features__c(name = 'Freemium', features__c = 'automated_actions;custom_reports;customized_views;freemium;historical_data;optimizer');
		License_Features__c lf7 = new License_Features__c(name = 'Essentials', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;automated_actions;active_directory;full_policy;action_script;applications;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;public_cloud;vdi_control');
		License_Features__c lf8 = new License_Features__c(name = 'Advanced', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies');
		License_Features__c lf9 = new License_Features__c(name = 'Premier', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;network_control;container_control;public_cloud;vdi_control;scaling;custom_policies;SLA;cpu_speeds');
		
		lfInsert.add(lf1); lfInsert.add(lf2); lfInsert.add(lf3); lfInsert.add(lf4); lfInsert.add(lf5);
		lfInsert.add(lf6); lfInsert.add(lf7); lfInsert.add(lf8); lfInsert.add(lf9);
		
		insert lfInsert;
		
		List<Account> acctList = new List<Account>();
	
		Account acct1 = new Account(name = 'Eval Account');
		Account acct2 = new Account(name = 'Customer Account');
		acctList.add(acct1);
		acctList.add(acct2);
		
		insert acctList;
		
		List<Opportunity> oppList = new List<Opportunity>();

		
		//eval license opp
		Opportunity opp1 = new Opportunity(name = 'Opp1', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_type__c = 'Eval - no planner', control_module_license_features__c = 'fabric;storage',
											license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Upgrading Feature-Set;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Internal Use;Other;Form Download');
		oppList.add(opp1);

		
		//full license opp (perm deal)
		Opportunity opp2 = new Opportunity(name = 'Opp2', accountId = acct2.id, stageName = 'Closed Won', type = 'New', closeDate = date.today(), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', Total_licensed_sockets__c = 100, 
											Total_licensed_cores__c = 800, revenue_type__c = 'Perpetual', Product_Type__c = 'Workload', commercial_license_key__c = true, pricing_type__c = 'Cores', license_end_date__c = Date.newInstance(2050,12,31), control_module_license_features__c = 'fabric;storage',
											license_creation_use_cases__c = 'Commercial License Creation', Turbonomic_Edition__c = 'Advanced');
		oppList.add(opp2);
		
		//full license opp (term deal)
		Opportunity opp3 = new Opportunity(name = 'Opp3', accountId = acct1.id, stageName = 'Closed Won', type = 'New', closeDate = date.today(), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', Total_licensed_sockets__c = 100, 
											Total_licensed_cores__c = 800, commercial_license_key__c = true, Pricing_type__c = 'Cores', Product_Type__c = 'Workload', revenue_type__c = 'Subscription', license_end_date__c = Date.today().addDays(365), control_module_license_features__c = 'fabric;storage',
											license_creation_use_cases__c = 'Commercial License Creation', Turbonomic_Edition__c = 'Advanced');
		oppList.add(opp3);
		
		insert oppList;

		
		//test license generator for Opp1 - EVAL License
		String response = LicenseXML.generateXML(opp1.Id);
		system.assertEquals(response,'Successfully created Eval - no planner XML license. You will find the License attached to the Opportunity in the Attachments section and an email logged to your opportunity');
		
		List<String> allFeatures = new List<String>{'active_directory','aggregation','applications','automated_actions','cloud_targets','cluster_flattening','customized_views','custom_reports','deploy','full_policy','group_editor','historical_data','loadbalancer','multiple_vc','optimizer','scoped_user_view','trial','vmturbo_api'};
		List<String> workloadEdition = allFeatures;
		workloadEdition.add('storage');
		workloadEdition.add('fabric');
		
		
		Turbonomic_License__c tl1 = [select id, name, Account__c, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c,
									Use_Case_Form_Download__c, Use_Case_Other__c, Use_Case_Internal_Use__c, Use_Case_NFR_License__c, Use_Case_Update_Socket_Core_Count__c, Use_Case_Update_Prospect_Contact_Info__c,
									Use_Case_Downgrade_to_VHM__c, Use_Case_Upgrade_Feature_Set__c, Use_Case_Upgrade_from_VHM_to_Eval__c, Use_Case_DL_Form_Fail_to_Send__c, Use_Case_License_Extension_Sales__c, Use_Case_License_Extension_Technical__c from Turbonomic_License__c where opportunity__c =: opp1.id];
		system.assertEquals(tl1.name,'Eval License');
		system.assertEquals(tl1.license_Type__c,'Eval');
		system.assertEquals(tl1.licensee_email__c,'justin.chang@vmturbo.com');
		system.assertEquals(tl1.licensee_name__c,'Justin Chang');
		system.assertEquals(tl1.license_end_date__c,date.today().addDays(30));
		system.assert(tl1.license_key_plain_text__c.length()>0);
		system.assertEquals(tl1.total_licensed_cores__c,800);
		system.assertEquals(tl1.total_licensed_sockets__c,100);
		system.assertEquals(tl1.Account__c,acct1.id);
		system.assertEquals(tl1.Use_Case_License_Extension_Technical__c,true);
		system.assertEquals(tl1.Use_Case_License_Extension_Sales__c,true);
		system.assertEquals(tl1.Use_Case_DL_Form_Fail_to_Send__c,true);
		system.assertEquals(tl1.Use_Case_Upgrade_from_VHM_to_Eval__c,true);
		system.assertEquals(tl1.Use_Case_Upgrade_Feature_Set__c,true);
		system.assertEquals(tl1.Use_Case_Downgrade_to_VHM__c,true);
		system.assertEquals(tl1.Use_Case_Update_Prospect_Contact_Info__c,true);
		system.assertEquals(tl1.Use_Case_Update_Socket_Core_Count__c,true);
		system.assertEquals(tl1.Use_Case_NFR_License__c,true);
		system.assertEquals(tl1.Use_Case_Internal_Use__c,true);
		system.assertEquals(tl1.Use_Case_Other__c,true);
		system.assertEquals(tl1.Use_Case_Form_Download__c,true);
		
		Attachment a = [select id, body from Attachment where parentId =: tl1.id];
		String xmlString = a.body.toString();
		//system.debug('Actual XML\n' + xmlString);
		
		String licenseXml2 = '<?xml version="1.0"?>\n';
        licenseXml2 += '<!-- Turbonomic license file; license created: ';
        licenseXml2 += DateTime.now().format('YYYY-MM-dd') + ' -->\n';
        licenseXml2 += '<license>\n';
        licenseXml2 += '      <first-name>' + opp1.licensee_first_name__c + '</first-name>\n';
        licenseXml2 += '      <last-name>' + opp1.licensee_last_name__c + '</last-name>\n';
        licenseXml2 += '      <email>' + opp1.licensee_email__c + '</email>\n';
        licenseXml2 += '      <num-sockets>' + '100' + '</num-sockets>\n';
        licenseXml2 += '      <num-cores>' + '800' + '</num-cores>\n';	
        licenseXml2 += '      <expiration-date>' + DateTime.Now().addDays(30).format('YYYY-MM-dd') + '</expiration-date>\n';
        licenseXml2 += '      <lock-code>' + 'af3826e2a59f44a55e2a51a417a27ca3' + '</lock-code>\n';
        for(String fn: workloadEdition){
           licenseXml2 += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml2 += '</license>';
        
        //system.debug('Expected XML\n' + licenseXml2);
		
        system.assert(xmlString.length() > 0);
		system.assertEquals(xmlString.length(),licenseXml2.length());

		
		
		//test license generator for Opp2 - FULL License perpetual (advanced edition)
		//List<String> allFeatures2 = new List<String>{'action_script','active_directory','aggregation','applications','automated_actions','cloud_targets','cluster_flattening','custom_reports','customized_views','deploy','fabric','full_policy','group_editor__c','historical_data','loadbalancer','multiple_vc','optimizer','planner','scoped_user_view','storage','vmturbo_api'};
		List<String> allFeatures2 = new List<String>{'historical_data','custom_reports','planner','optimizer','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','full_policy','action_script','applications','app_control','loadbalancer','deploy','aggregation','fabric','storage','cloud_targets','cluster_flattening','container_control','public_cloud','vdi_control','custom_policies'};
		
		response = LicenseXML.generateXML(opp2.Id);
		system.assertEquals(response,'Successfully created Commercial XML license. You should receive an email to forward to the customer with the XML attached. A copy of the XML was also saved as an attachment to the Opportunity, as well as an Email logged to the Opportunity');
		
		Opportunity afterOpp2 = [select id, commercial_license_Key__c from Opportunity where id =: opp2.id];
		
		Turbonomic_License__c tl2 = [select id, name, Account__c, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c, License_Entity__c, Turbonomic_Edition__c from Turbonomic_License__c where opportunity__c =: opp2.id];
		system.assertEquals(tl2.name,'Commercial License');
		system.assertEquals(tl2.license_type__c,'Commercial');
		system.assertEquals(tl2.licensee_email__c,'justin.chang@vmturbo.com');
		system.assertEquals(tl2.licensee_name__c,'Justin Chang');
		system.assertEquals(tl2.license_end_date__c,date.newInstance(2050,12,31));
		system.assert(tl2.license_key_plain_text__c.length()>0);
		system.assertEquals(tl2.total_licensed_cores__c,800);
		system.assertEquals(tl2.total_licensed_sockets__c,100);
		system.assertEquals(tl2.Account__c,acct2.id);
		system.assertEquals(tl2.License_Entity__c,'Cores');
		system.assertEquals(tl2.Turbonomic_Edition__c,'Advanced');
		
		
		Attachment a2 = [select id, body from Attachment where parentId =: tl2.id];
		String xmlString2 = a2.body.toString();
		//system.debug('Actual XML\n' + xmlString2);
		
		String licenseXml3 = '<?xml version="1.0"?>\n';
        licenseXml3 += '<!-- Turbonomic license file; license created: ';
        licenseXml3 += DateTime.now().format('YYYY-MM-dd') + ' -->\n';
        licenseXml3 += '<license>\n';
        licenseXml3 += '      <first-name>' + opp2.licensee_first_name__c + '</first-name>\n';
        licenseXml3 += '      <last-name>' + opp2.licensee_last_name__c + '</last-name>\n';
        licenseXml3 += '      <email>' + opp2.licensee_email__c + '</email>\n';
        licenseXml3 += '      <num-sockets>' + '100' + '</num-sockets>\n';
        licenseXml3 += '      <num-cores>' + '800' + '</num-cores>\n';
        //licenseXml3 += '      <edition>' + 'Advanced' + '</edition>\n';
        licenseXml3 += '      <expiration-date>' + '2050-12-31' + '</expiration-date>\n';
        //licenseXml3 += '      <lock-code>' + 'af3826e2a59f44a55e2a51a417a27ca3' + '</lock-code>\n';
        licenseXml3 += '      <lock-code>' + '782788439e57fe0efea231930dbe57de' + '</lock-code>\n';
        for(String fn: allFeatures2){
           licenseXml3 += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml3 += '</license>';
        
        //system.debug('********************************************************Expected XML\n' + licenseXml3);
        //system.debug('**********************************************************Actual XML\n' + xmlString2);
        //system.debug('******************************************************XML Length: ' + xmlString2.length() + ' ' + licenseXml3.length());
        system.assert(xmlString2.length() > 0);
        system.assert(xmlString2.length() == licenseXml3.length());
		system.assert(licenseXml3.contains('<expiration-date>' + '2050-12-31' + '</expiration-date>'));
		
		
		//for opp 3 FULL license with term (workload edition)
		//List<String> allFeatures3 = new List<String>{'action_script','active_directory','aggregation','applications','automated_actions','cloud_targets','cluster_flattening','custom_reports','customized_views','deploy','fabric','full_policy','group_editor__c','historical_data','loadbalancer','multiple_vc','optimizer','planner','scoped_user_view','storage','vmturbo_api'};
		List<String> allFeatures3 = new List<String>{'historical_data','custom_reports','planner','optimizer','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','full_policy','action_script','applications','app_control','loadbalancer','deploy','aggregation','fabric','storage','cloud_targets','cluster_flattening','container_control','public_cloud','vdi_control','custom_policies'};
		
		response = LicenseXML.generateXML(opp3.Id);
		system.assertEquals(response,'Successfully created Commercial XML license. You should receive an email to forward to the customer with the XML attached. A copy of the XML was also saved as an attachment to the Opportunity, as well as an Email logged to the Opportunity');
		
		Opportunity afterOpp3 = [select id, commercial_license_key__c  from Opportunity where id =: opp3.id];
		system.assert(afterOpp3.commercial_license_key__c == false);
		
		Turbonomic_License__c tl3 = [select id, name, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c from Turbonomic_License__c where opportunity__c =: opp3.id];
		
		
		Attachment a3 = [select id, body from Attachment where parentId =: tl3.id];
		String xmlString3 = a3.body.toString();
		system.debug('Actual XML\n' + xmlString3);
		
		String licenseXml4 = '<?xml version="1.0"?>\n';
        licenseXml4 += '<!-- Turbonomic license file; license created: ';
        licenseXml4 += DateTime.now().format('YYYY-MM-dd') + ' -->\n';
        licenseXml4 += '<license>\n';
        licenseXml4 += '      <first-name>' + opp3.licensee_first_name__c + '</first-name>\n';
        licenseXml4 += '      <last-name>' + opp3.licensee_last_name__c + '</last-name>\n';
        licenseXml4 += '      <email>' + opp3.licensee_email__c + '</email>\n';
        licenseXml4 += '      <num-sockets>' + '100' + '</num-sockets>\n';
        licenseXml4 += '      <num-cores>' + '800' + '</num-cores>\n';
        //licenseXml4 += '      <edition>' + 'Advanced' + '</edition>\n';	
        licenseXml4 += '      <expiration-date>' + DateTime.Now().addDays(365).format('YYYY-MM-dd') + '</expiration-date>\n';
        licenseXml4 += '      <lock-code>' + 'af3826e2a59f44a55e2a51a417a27ca3' + '</lock-code>\n';
        for(String fn: allFeatures3){
           licenseXml4 += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml4 += '</license>';
        
        //system.debug('Expected XML\n' + licenseXml4);
                
        system.assert(licenseXml4.length() > 0);
        system.assert(licenseXml4.length() == xmlString3.length());
		system.assert(licenseXml4.contains('<expiration-date>' + DateTime.now().addDays(365).format('YYYY-MM-dd') + '</expiration-date>'));

    }
	
	// 4 cases for eval license updates
	//----------------------------------------------------------------------------------//
	// 1 - Update on closed license
	// 2 - Update on valid open license
	// 3 - Update on license with no use cases
	// 4 - Update on downgrade license
	private static testMethod void testEvalCase1and2() {
		
		List<License_Features__c> lfInsert = new List<License_Features__c>();
		License_Features__c lf1 = new License_Features__c(name = 'Eval - no planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		lfInsert.add(lf1);
		License_Features__c lf2 = new License_Features__c(name = 'Commercial', features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;action_script;cloud_targets;cluster_flattening');
		lfInsert.add(lf2);
		License_Features__c lf3 = new License_Features__c(name = 'Eval - with planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		lfInsert.add(lf3);
		License_Features__c lf4 = new License_Features__c(name = 'Eval - Workload Edition', features__c = 'storage;fabric;applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		lfInsert.add(lf4);
		License_Features__c lf5 = new License_Features__c(name = 'VHM', features__c = 'community;multiple_vc');
		lfInsert.add(lf5);
		License_Features__c lf6 = new License_Features__c(name = 'Freemium', features__c = 'automated_actions;custom_reports;customized_views;freemium;historical_data;optimizer');
		
		License_Features__c lf7 = new License_Features__c(name = 'Essentials', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;automated_actions;active_directory;full_policy;action_script;applications;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;public_cloud;vdi_control');
		License_Features__c lf8 = new License_Features__c(name = 'Advanced', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies');
		License_Features__c lf9 = new License_Features__c(name = 'Premier', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;network_control;container_control;public_cloud;vdi_control;scaling;custom_policies;SLA;cpu_speeds');
		
		lfInsert.add(lf6); lfInsert.add(lf7); lfInsert.add(lf8); lfInsert.add(lf9);
		
		insert lfInsert;
		
		
		Account acct1 = new Account(name = 'Eval Account');
		insert acct1;
		
		Opportunity opp1 = new Opportunity(name = 'Opp1', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_creation_use_cases__c = 'License Extension (Sales)', license_type__c = 'Eval - no planner');
		insert opp1;
		
		String allFeatures = 'active_directory;aggregation;applications;automated_actions;cloud_targets;cluster_flattening;customized_views;custom_reports;deploy;full_policy;group_editor;historical_data;loadbalancer;multiple_vc;optimizer;scoped_user_view;trial;vmturbo_api';
		
		List<Turbonomic_License__c> licenseInsert = new List<Turbonomic_License__c>();
		Turbonomic_License__c tl1 = new Turbonomic_License__c(name = 'Eval License', license_type__c = 'Eval', total_licensed_sockets__c = 100, total_licensed_cores__c = 800, License_entity__c = 'Cores', Current_License_Features__c = allFeatures, status__c = 'Open', licensee_email__c = 'justin.chang@vmturbo.com', licensee_name__c = 'Justin Chang', license_end_date__c = date.today().addDays(10), License_Key_Plain_Text__c = 'blah', license_Creation_use_Cases__c = 'Other', use_case_other_reason__c = 'blah');
    	licenseInsert.add(tl1);
		insert licenseInsert;		// first license
		
		String response = LicenseXML.generateXML(opp1.Id);		// newest license
    	system.debug('### opp1 license response ' + response);
    	
    	Map<id,Turbonomic_License__c> updatedLicenses = new Map<id,Turbonomic_License__c>([select id, name, updated_features__c, Updated_License_End_Date__c, updated_core_count__c, updated_socket_count__c, license_end_date__c, licensee_email__c, status__c, reason_for_update__c, license_type__c, current_license_features__c from Turbonomic_license__c where licensee_email__c = 'justin.chang@vmturbo.com']);
    	system.assertEquals(updatedLicenses.size(),2);
    	
    	Id newLicenseId;
    	Id evalId;
    	
    	for (Turbonomic_License__c tl : updatedLicenses.values()) {
    		//tl1 license - nothing happens because it is closed.
    		if (tl.id == tl1.id) {
    			system.assertEquals(tl.status__c,'Closed');
    			system.assertEquals(tl.license_type__c,'Eval');
    			system.debug('### original\'s license features: ' + tl.current_license_features__c);
    			system.assert(tl.current_license_features__c != null);
    			evalId = tl.id;
    			tl.license_update_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Updating Socket/Core Count;NFR License;Internal Use;Other';
    			tl.use_case_other_reason__c = 'Cause I feel like it';
    			tl.license_end_date__c = date.today().addDays(30);
    			tl.updated_socket_count__c = 100;
    			tl.updated_core_count__c = 800;
    			tl.updated_features__c = 'network_control;container_control';
    			update tl;
    		} else {
    			system.debug('### check check');
    			newLicenseId = tl.id;
    			system.debug('### new license: ' + tl);
    			system.assertEquals(tl.status__c,'Open');
    			system.assertEquals(tl.license_Type__c,'Eval');
    			tl.Updated_License_End_Date__c = date.today().addDays(60);
    			tl.updated_core_count__c = 1000;
    			tl.updated_socket_count__c = 150;
    			tl.updated_features__c = 'storage;fabric';
    			tl.reason_for_update__c = 'increasing sockets and extending end date. Also giving storage and fabric.';
    			tl.license_update_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading Feature-Set;Updating Socket/Core Count;NFR License;Internal Use;Other';
    			tl.other_reason__c = 'Cause I feel like it';
    			update tl;
    		}
    	}
    	
    	//CASE 1
    	//try to update license on closed license - assert results
    	String errorResponse = LicenseXML.updateLicenseXML(evalId);
    	system.assertEquals(errorResponse,'Please go to the most recently created Turbonomic Eval License attached to this email address and update the eval license there.');
    	Turbonomic_License__c oldEvalLicense = [select id, license_update_use_cases__c, updated_features__c, updated_socket_count__c, updated_core_count__c, updated_license_end_date__c, status__c from Turbonomic_License__c where id =: evalid limit 1];
		system.assertEquals(oldEvalLicense.updated_core_count__c,null);
    	system.assertEquals(oldEvalLicense.updated_socket_count__c,null);
    	system.assertEquals(oldEvalLicense.updated_license_end_date__c,null);
    	system.assertEquals(oldEvalLicense.updated_features__c,null);
    	system.assertEquals(oldEvalLicense.license_update_use_cases__c,null);
    	system.assertEquals(oldEvalLicense.status__c,'Closed');
    	
    	//CASE 2
    	//try to update license on open eval license - assert results
    	String newResponse = LicenseXML.updateLicenseXML(newLicenseId);
    	system.assertEquals(newResponse,'A new Turbonomic Eval License has been saved.');
    	Turbonomic_License__c newestLicense = [select id, total_licensed_cores__c, total_licensed_sockets__c, license_end_Date__c, license_type__c, status__c, current_license_Features__c, license_creation_use_cases__c, 
    			Use_Case_License_Extension_Technical__c, Use_Case_License_Extension_Sales__c, Use_Case_DL_Form_Fail_to_Send__c, Use_Case_Upgrade_Feature_Set__c, Use_Case_Update_Socket_Core_Count__c,
    			Use_Case_NFR_License__c, Use_Case_Internal_Use__c, Use_Case_Other__c, use_case_other_reason__c from Turbonomic_License__c where status__c = 'Open' and licensee_email__c = 'justin.chang@vmturbo.com' limit 1];
    	system.assertEquals(newestLicense.total_licensed_cores__c,1000);
    	system.assertEquals(newestLicense.total_licensed_sockets__c,150);
    	system.assertEquals(newestLicense.license_end_date__c,date.today().addDays(60));
    	system.assertEquals(newestLicense.current_license_features__c.length(),('storage;fabric;' + allFeatures).length());
    	system.assertEquals(newestLicense.license_creation_use_cases__c,'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading Feature-Set;Updating Socket/Core Count;NFR License;Internal Use;Other');
    	system.assertEquals(newestLicense.license_type__c,'Eval');
    	system.assertEquals(newestLicense.Use_Case_License_Extension_Technical__c,true);
    	system.assertEquals(newestLicense.Use_Case_License_Extension_Sales__c,true);
    	system.assertEquals(newestLicense.Use_Case_DL_Form_Fail_to_Send__c,true);
    	system.assertEquals(newestLicense.Use_Case_Upgrade_Feature_Set__c,true);
    	system.assertEquals(newestLicense.Use_Case_Update_Socket_Core_Count__c,true);
    	system.assertEquals(newestLicense.Use_Case_NFR_License__c,true);
    	system.assertEquals(newestLicense.Use_Case_Internal_Use__c,true);
    	system.assertEquals(newestLicense.Use_Case_Other__c,true);
    	system.assertEquals(newestLicense.use_case_other_reason__c,'Cause I feel like it');
    	
    	//assert updates to old open license
		Turbonomic_License__c oldLicense = [select id, license_update_use_cases__c, updated_features__c, updated_socket_count__c, updated_core_count__c, updated_license_end_date__c, status__c from Turbonomic_License__c where id =: newLicenseId limit 1];
    	system.assertEquals(oldLicense.updated_core_count__c,null);
    	system.assertEquals(oldLicense.updated_socket_count__c,null);
    	system.assertEquals(oldLicense.updated_license_end_date__c,null);
    	system.assertEquals(oldLicense.updated_features__c,null);
    	system.assertEquals(oldLicense.license_update_use_cases__c,null);
    	system.assertEquals(oldLicense.status__c,'Closed');
	}
	
	private static testMethod void testEvalCase3and4() {
		
		Account acct1 = new Account(name = 'Eval Account');
		insert acct1;
		
		String allFeatures = 'active_directory;aggregation;applications;automated_actions;cloud_targets;cluster_flattening;customized_views;custom_reports;deploy;full_policy;group_editor;historical_data;loadbalancer;multiple_vc;optimizer;scoped_user_view;trial;vmturbo_api';
		String vhmFeatures = 'community;multiple_vc';
		
		Turbonomic_License__c tl1 = new Turbonomic_License__c(name = 'Eval License', license_type__c = 'Eval', total_licensed_sockets__c = 100, total_licensed_cores__c = 800, license_entity__c = 'Cores', Current_License_Features__c = allFeatures, status__c = 'Open', licensee_email__c = 'justin.chang@vmturbo.com', licensee_name__c = 'Justin Chang', license_end_date__c = date.today().addDays(10), License_Key_Plain_Text__c = 'blah');
    	insert tl1;
    	
    	tl1 = [select id, updated_license_end_date__c, license_update_use_cases__c, updated_socket_count__c, updated_core_count__c from Turbonomic_License__c where id =: tl1.id limit 1];
    	tl1.updated_license_end_date__c = date.today().addDays(90);
    	update tl1;
    	
    	//CASE 3
    	//No updated use cases given
    	String response = LicenseXML.updateLicenseXML(tl1.id);
    	system.assertEquals(response,'Please fill in the License Update Use Cases field before trying to update the license.');
    	
    	tl1 = [select id, updated_license_end_date__c, license_update_use_cases__c, updated_socket_count__c, updated_core_count__c from Turbonomic_License__c where id =: tl1.id limit 1];
    	tl1.license_update_use_cases__c = 'License Extension (Sales);Downgrading to VHM';
    	update tl1;
    	
    	//CASE 4
    	//Downgrade to VHM
    	response = LicenseXML.updateLicenseXML(tl1.id);
    	system.assertEquals(response,'A new Turbonomic VHM License has been saved.');
    	
    	Turbonomic_License__c newVHMLicense = [select id, license_type__c, license_end_date__c, current_license_features__c, license_creation_use_cases__c, use_case_downgrade_to_vhm__c, use_case_license_extension_sales__c from Turbonomic_License__c where license_type__c = 'VHM' limit 1];
    	system.assert(newVHMLicense != null);
    	system.assertEquals(newVHMLicense.license_type__c,'VHM');
    	system.assertEquals(newVHMLicense.license_end_date__c,date.today().addDays(90));
    	system.assertEquals(newVHMLicense.license_creation_use_cases__c,'License Extension (Sales);Downgrading to VHM');
    	system.assertEquals(newVHMLicense.current_license_features__c.length(),vhmFeatures.length());
    	system.assertEquals(newVHMLicense.use_case_downgrade_to_vhm__c,true);
    	system.assertEquals(newVHMLicense.use_case_license_extension_sales__c,true);
    	
	}
	
	// 3 Cases for VHM License Updates
	//--------------------------------------------------------------------------------------
	// 1 Update VHM license with no use cases
	// 2 Update VHM license normally
	// 3 Update VHM license to Eval
	
    private static testMethod void testVHMCase123() {
    	
    	List<Account> acctList = new List<Account>();
	
		Account acct1 = new Account(name = 'Eval Account');
		acctList.add(acct1);
		insert acctList;

		String allFeatures = 'active_directory;aggregation;applications;automated_actions;cloud_targets;cluster_flattening;customized_views;custom_reports;deploy;full_policy;group_editor;historical_data;loadbalancer;multiple_vc;optimizer;scoped_user_view;trial;vmturbo_api';
		String vhmFeatures = 'community;multiple_vc';
		
		List<Turbonomic_License__c> licenseInsert = new List<Turbonomic_License__c>();
    	Turbonomic_License__c tl1 = new Turbonomic_License__c(name = 'community', license_type__c = 'VHM', total_licensed_sockets__c = 100, total_licensed_cores__c = 800, license_entity__c = 'Cores', Current_License_Features__c = vhmFeatures, status__c = 'Open', licensee_email__c = 'brandon.chang@vmturbo.com', licensee_name__c = 'Brandon Chang', license_end_date__c = date.today().addDays(90), License_Key_Plain_Text__c = 'blah');
    	licenseInsert.add(tl1);
    	insert licenseInsert;

    	tl1 = [select id, name, Updated_License_End_Date__c, updated_core_count__c, updated_socket_count__c, license_end_date__c, licensee_email__c, status__c, license_update_use_cases__c, updated_features__c, other_reason__c from Turbonomic_license__c where licensee_email__c = 'brandon.chang@vmturbo.com' limit 1];
    	
    	//CASE 1
    	//no use cases given
    	String response = LicenseXML.updateLicenseXML(tl1.id);
    	system.assertEquals(response,'Please fill in the License Update Use Cases field before trying to update the license.');
    
    	tl1.license_update_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Updating Socket/Core Count;Internal Use;Other';
		tl1.other_reason__c = 'cause I feel like it.';
		tl1.license_end_date__c = date.today().addDays(30);
		tl1.updated_socket_count__c = 100;
		tl1.updated_core_count__c = 800;
		update tl1;
    	
    	//CASE 2
    	//regular VHM update
    	response = LicenseXML.updateLicenseXML(tl1.id);
    	system.assertEquals(response,'VHM license was successfully updated');
    	
    	Turbonomic_License__c newVHMLicense = [select id, total_licensed_cores__c, total_licensed_sockets__c, license_end_Date__c, license_type__c, status__c, current_license_Features__c, license_creation_use_cases__c, use_case_other_reason__c, 
    				use_case_license_extension_technical__c, use_case_license_extension_sales__c, use_case_upgrade_feature_set__c, Use_Case_DL_Form_Fail_to_Send__c,
    				use_case_nfr_license__c, use_case_internal_use__c, use_case_other__c, license_update_use_cases__c from Turbonomic_License__c where id !=: tl1.id and licensee_email__c = 'brandon.chang@vmturbo.com' limit 1];
    	system.assert(newVHMLicense != null);
    	
    	system.assertEquals(newVHMLicense.total_licensed_sockets__c,100);
    	system.assertEquals(newVHMLicense.total_licensed_cores__c,800);
    	system.assertEquals(newVHMLicense.license_end_date__c,date.today().addDays(30));
    	system.assertEquals(newVHMLicense.license_type__c,'VHM');
    	system.assertEquals(newVHMLicense.license_creation_use_cases__c,'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Updating Socket/Core Count;Internal Use;Other');
    	system.assertEquals(newVHMLicense.use_case_other_reason__c,'cause I feel like it.');
    	system.assertEquals(newVHMLicense.use_case_license_extension_technical__c,true);
    	system.assertEquals(newVHMLicense.use_case_license_extension_sales__c,true);
    	system.assertEquals(newVHMLicense.Use_Case_DL_Form_Fail_to_Send__c,true);
    	system.assertEquals(newVHMLicense.use_case_internal_use__c,true);
    	system.assertEquals(newVHMLicense.use_case_other__c,true);
    	
    	//CASE 3
    	//Upgrade from VHM to Eval
    	newVHMLicense.license_update_use_cases__c = 'Upgrading VHM to Eval;NFR License';
    	newVHMLicense.updated_features__c = 'storage;fabric';
    	update newVHMLicense;
    	
    	response = LicenseXML.updateLicenseXML(newVHMLicense.id);
    	system.assertEquals(response,'The VHM License was successfully updated to an Eval license');
    	
    	Turbonomic_License__c newEvalLicense = [select id, current_license_features__c, license_end_date__c, total_licensed_sockets__c, total_licensed_cores__c, license_type__c, status__c, license_creation_use_cases__c, 
    			Use_Case_Upgrade_from_VHM_to_Eval__c, use_case_nfr_license__c from Turbonomic_License__c where licensee_email__c = 'brandon.chang@vmturbo.com' and license_type__c = 'Eval'];
    	system.assert(newEvalLicense != null);
    	
    	system.assertEquals(newEvalLicense.current_license_features__c.length(),(allFeatures+';storage;fabric').length());
    	system.assertEquals(newEvalLicense.license_type__c,'Eval');
    	system.assertEquals(newEvalLicense.use_case_upgrade_from_vhm_to_eval__c,true);
    	system.assertEquals(newEvalLicense.use_case_nfr_license__c,true);
    	system.assertEquals(newEvalLicense.license_end_date__c,date.today().addDays(30));
    	system.assertEquals(newEvalLicense.status__c,'Open');
    	
    	newVHMLicense = [select id, license_update_use_cases__c, updated_features__c from Turbonomic_License__c where id =: newVHMLicense.id limit 1];
    	system.assertEquals(newVHMLicense.license_update_use_cases__c,null);
    	system.assertEquals(newVHMLicense.updated_features__c,null);
    	
    }
	
	// 4 cases for Commercial License Updates
	//-----------------------------------------------------------------------------------------
	// 1 Update while not Finance/Admin
	// 2 Update with no use cases
	// 3 Update with no current features
	// 4 Normal Commercial update
	
	private static testMethod void testCommercialCase123() {

		List<String> allFeatures = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','planner','optimizer','full_policy','loadbalancer','deploy','aggregation','action_script','cloud_targets','cluster_flattening'};
		
		Account acct1 = new Account(name = 'Customer Account');
		insert acct1;
		
		Opportunity opp1 = new Opportunity(name = 'Opp1', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', total_licensed_sockets__c = 100, 
											total_licensed_cores__c = 800, pricing_type__c = 'Cores', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false);
		insert opp1;
		
		Turbonomic_License__c tl1 = new Turbonomic_License__c(name = 'Commercial License', license_type__c = 'Commercial', total_licensed_sockets__c = 100, total_licensed_cores__c = 800, license_entity__c = 'Cores', status__c = 'Open', licensee_email__c = 'justin.chang@vmturbo.com', licensee_name__c = 'Justin Chang', license_end_date__c = date.today().addDays(10), opportunity__c = opp1.id, License_Key_Plain_Text__c = 'blah', Turbonomic_edition__c = 'EOM - Legacy');
    	insert tl1;
    	
    	User u = [select id, userRole.Name from User where UserRole.Name = 'Sales Engineer - US' and isActive = true limit 1];
    	
    	String errorResponse;
    	String response;
    	
    	// CASE 1
    	// Non-Finance/Admin trying to update Commercial License
    	system.runAs(u) {
    		errorResponse = LicenseXML.updateLicenseXML(tl1.id);
    	}
    	
    	system.assertEquals(errorResponse,'Only Finance may make updates to commercial licenses.');
		
		tl1 = [select id, current_license_features__c, updated_core_count__c, updated_socket_count__c, updated_License_end_date__c, license_update_use_cases__c, other_reason__c, updated_features__c from Turbonomic_License__c where id =: tl1.id];
		
		tl1.updated_core_count__c = 1600;
		tl1.updated_socket_count__c = 200;
		tl1.updated_license_end_date__c = date.today().addDays(180);
//		tl1.license_update_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);Upgrading Feature-Set;Updating Prospect Contact Info;Updating Socket/Core Count;Internal Use;Other;Commercial License Creation';
		tl1.other_reason__c = 'Messed up on previous license';
		tl1.updated_features__c = 'storage;fabric;network_control;app_control';
		update tl1;
		
		// CASE 2
		// Updating License without updated use cases
		errorResponse = LicenseXML.updateLicenseXML(tl1.id);
		system.assertEquals(errorResponse,'Please fill in the License Update Use Cases field before updating the license.');
		
		tl1 = [select id, updated_core_count__c, updated_socket_count__c, updated_License_end_date__c, license_update_use_cases__c, other_reason__c, updated_features__c from Turbonomic_License__c where id =: tl1.id];
		tl1.license_update_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);Upgrading Feature-Set;Updating Socket/Core Count;Internal Use;Other;Commercial License Creation';
		update tl1;
		
		// CASE 3
		// Updating without current license features
		errorResponse = LicenseXML.updateLicenseXML(tl1.id);
		system.assertEquals(errorResponse,'Error: the license does not have any features. Please contact your system administrator.');
		
		tl1 = [select id, current_license_features__c, updated_core_count__c, updated_socket_count__c, updated_License_end_date__c, license_update_use_cases__c, other_reason__c, updated_features__c from Turbonomic_License__c where id =: tl1.id];
		tl1.current_license_features__c = String.join(allFeatures,';');
		update tl1;
		
		// CASE 4
		// Normally updated commercial license
		response = LicenseXML.updateLicenseXML(tl1.id);
		system.assertEquals(response,'A new Turbonomic Commercial License has been saved.');
		
		Turbonomic_License__c newCommLicense = [select id, current_license_Features__c, total_licensed_sockets__c, total_licensed_cores__c, license_end_date__c, license_type__c, license_creation_use_cases__c, use_case_other_reason__c,
					use_case_license_extension_technical__c, use_case_license_extension_sales__c, use_case_upgrade_feature_set__c, use_case_update_socket_core_count__c, use_case_internal_use__c, use_case_other__c, 
					use_case_commercial_license_creation__c from Turbonomic_License__c where licensee_email__c = 'justin.chang@vmturbo.com' and id !=: tl1.id];
		system.assert(newCommLicense != null);
		system.debug('### new commercial license check: ' + newCommLicense.current_license_features__c);
		system.debug('### expected license features: ' + allFeatures+';storage;fabric;network_control;app_control');
		system.assertEquals(newCommLicense.current_license_features__c.length(),(String.join(allFeatures,';')+';storage;fabric;network_control;app_control').length());
		system.assertEquals(newCommLicense.total_licensed_sockets__c,200);
		system.assertEquals(newCommLicense.total_licensed_cores__c,1600);
		system.assertEquals(newCommLicense.license_end_date__c,date.today().addDays(180));
		system.assertEquals(newCommLicense.license_type__c,'Commercial');
		system.assertEquals(newCommLicense.license_creation_use_cases__c,'License Extension (Technical Issues);License Extension (Sales);Upgrading Feature-Set;Updating Socket/Core Count;Internal Use;Other;Commercial License Creation');
		system.assertEquals(newCommLicense.use_case_other_reason__c,'Messed up on previous license');
		system.assertEquals(newCommLicense.use_case_license_extension_technical__c,true);
		system.assertEquals(newCommLicense.use_case_license_extension_sales__c,true);
		system.assertEquals(newCommLicense.use_case_upgrade_feature_set__c,true);
		system.assertEquals(newCommLicense.use_case_update_socket_core_count__c,true);
		system.assertEquals(newCommLicense.use_case_internal_use__c,true);
		system.assertEquals(newCommLicense.use_case_other__c,true);
		system.assertEquals(newCommLicense.use_case_commercial_license_creation__c,true);
	}
	
	// 4 cases for new Workload Licenses
	//-----------------------------------------------------------------------------------------
	// 1 Create new Eval Workload License
	// 2 Create Advanced license 
	// 3 Update Advanced Edition License
	// 4 Create EOM - Legacy Edition License
	
	
	private static testMethod void testNewWorkloadLicense() {
		List<License_Features__c> lfInsert = new List<License_Features__c>();
		License_Features__c lf1 = new License_Features__c(name = 'Eval - no planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf2 = new License_Features__c(name = 'Commercial', features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;action_script;cloud_targets;cluster_flattening');
		License_Features__c lf3 = new License_Features__c(name = 'Eval - with planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf4 = new License_Features__c(name = 'Eval - Workload Edition', features__c = 'storage;fabric;applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		License_Features__c lf5 = new License_Features__c(name = 'VHM', features__c = 'community;multiple_vc');
		License_Features__c lf6 = new License_Features__c(name = 'Freemium', features__c = 'automated_actions;custom_reports;customized_views;freemium;historical_data;optimizer');
		License_Features__c lf7 = new License_Features__c(name = 'Essentials', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;automated_actions;active_directory;full_policy;action_script;applications;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;public_cloud;vdi_control');
		License_Features__c lf8 = new License_Features__c(name = 'Advanced', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies');
		License_Features__c lf9 = new License_Features__c(name = 'Premier', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;network_control;container_control;public_cloud;vdi_control;scaling;custom_policies;SLA;cpu_speeds');
		License_Features__c lf10 = new License_Features__c(name = 'Trial', features__c = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies');
		
		
		lfInsert.add(lf1); lfInsert.add(lf2); lfInsert.add(lf3); lfInsert.add(lf4); lfInsert.add(lf5);
		lfInsert.add(lf6); lfInsert.add(lf7); lfInsert.add(lf8); lfInsert.add(lf9); lfInsert.add(lf10);
		
		insert lfInsert;
		
		List<Account> acctList = new List<Account>();
	
		Account acct1 = new Account(name = 'Acct1');
		Account acct2 = new Account(name = 'Acct2');
		acctList.add(acct1);
		acctList.add(acct2);
		
		insert acctList;
		
		List<Opportunity> oppList = new List<Opportunity>();

		
		//eval license opp
		Opportunity opp1 = new Opportunity(name = 'Opp1', accountId = acct1.id, stageName = 'Upside', type = 'New', closeDate = date.today().addDays(30), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Eddie', Licensee_Last_Name__c = 'Genao', Licensee_Email__c = 'eddie.genao@turbonomic.com', total_licensed_workloads__c = 100, 
											pricing_type__c = 'Workloads', license_end_date__c = date.today().addDays(30), commercial_license_key__c = false, license_type__c = 'Eval - no planner', control_module_license_features__c = 'fabric;storage',
											license_creation_use_cases__c = 'License Extension (Technical Issues)', Turbonomic_Edition__c = 'Trial');
		oppList.add(opp1);

		
		//EOM - Legacy edition
		Opportunity opp2 = new Opportunity(name = 'Opp2', accountId = acct2.id, stageName = 'Closed Won', type = 'New', closeDate = date.today(), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Justin', Licensee_Last_Name__c = 'Chang', Licensee_Email__c = 'justin.chang@vmturbo.com', Total_licensed_sockets__c = 100, 
											total_licensed_workloads__c = 800, revenue_type__c = 'Perpetual', Product_Type__c = 'Workload', commercial_license_key__c = true, pricing_type__c = 'Workloads', license_end_date__c = Date.newInstance(2050,12,31), 
											license_creation_use_cases__c = 'Commercial License Creation', Turbonomic_Edition__c = 'Advanced');
		oppList.add(opp2);
		
		//Advanced Edition
		Opportunity opp3 = new Opportunity(name = 'Opp3', accountId = acct1.id, stageName = 'Closed Won', type = 'New', closeDate = date.today(), amount = 10000, leadSource = 'Tradeshow',
											Licensee_First_Name__c = 'Eddie', Licensee_Last_Name__c = 'Genao', Licensee_Email__c = 'eddie.genao@turbonomic.com', total_licensed_workloads__c = 800, 
											commercial_license_key__c = true, Pricing_type__c = 'Workloads', Product_Type__c = 'Workload', revenue_type__c = 'Subscription', license_end_date__c = Date.today().addDays(365),
											license_creation_use_cases__c = 'Commercial License Creation', Turbonomic_Edition__c = 'EOM - Legacy');
		oppList.add(opp3);
		
		insert oppList;

		
		//test license generator for Opp1 - EVAL License
		String response = LicenseXML.generateXML(opp1.Id);
		system.assertEquals(response,'Successfully created Eval - no planner XML license. You will find the License attached to the Opportunity in the Attachments section and an email logged to your opportunity');
		
		List<String> allFeatures = new List<String>{'active_directory','aggregation','applications','automated_actions','cloud_targets','cluster_flattening','customized_views','custom_reports','deploy','full_policy','group_editor','historical_data','loadbalancer','multiple_vc','optimizer','scoped_user_view','trial','vmturbo_api'};
		List<String> workloadEdition = allFeatures;
		workloadEdition.add('storage');
		workloadEdition.add('fabric');
		
		
		Turbonomic_License__c tl1 = [select id, name, Account__c, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c, total_licensed_workloads__c, license_entity__c, turbonomic_edition__c,
									Use_Case_Form_Download__c, Use_Case_Other__c, Use_Case_Internal_Use__c, Use_Case_NFR_License__c, Use_Case_Update_Socket_Core_Count__c, Use_Case_Update_Prospect_Contact_Info__c,
									Use_Case_Downgrade_to_VHM__c, Use_Case_Upgrade_Feature_Set__c, Use_Case_Upgrade_from_VHM_to_Eval__c, Use_Case_DL_Form_Fail_to_Send__c, Use_Case_License_Extension_Sales__c, Use_Case_License_Extension_Technical__c from Turbonomic_License__c where opportunity__c =: opp1.id];
		system.assertEquals(tl1.name,'Eval License');
		system.assertEquals(tl1.license_Type__c,'Eval');
		system.assertEquals(tl1.licensee_email__c,'eddie.genao@turbonomic.com');
		system.assertEquals(tl1.licensee_name__c,'Eddie Genao');
		system.assertEquals(tl1.license_end_date__c,date.today().addDays(30));
		system.assert(tl1.license_key_plain_text__c.length()>0);
		system.assertEquals(tl1.total_licensed_cores__c,null);
		system.assertEquals(tl1.total_licensed_sockets__c,null);
		system.assertEquals(tl1.total_licensed_workloads__c,100);
		system.assertEquals(tl1.license_entity__c,'Workloads');
		system.assertEquals(tl1.turbonomic_edition__c,'Trial');
		system.assertEquals(tl1.Account__c,acct1.id);
		system.assertEquals(tl1.Use_Case_License_Extension_Technical__c,true);
		system.assertEquals(tl1.Use_Case_License_Extension_Sales__c,false);
		system.assertEquals(tl1.Use_Case_DL_Form_Fail_to_Send__c,false);
		system.assertEquals(tl1.Use_Case_Upgrade_from_VHM_to_Eval__c,false);
		system.assertEquals(tl1.Use_Case_Upgrade_Feature_Set__c,false);
		system.assertEquals(tl1.Use_Case_Downgrade_to_VHM__c,false);
		system.assertEquals(tl1.Use_Case_Update_Prospect_Contact_Info__c,false);
		system.assertEquals(tl1.Use_Case_Update_Socket_Core_Count__c,false);
		system.assertEquals(tl1.Use_Case_NFR_License__c,false);
		system.assertEquals(tl1.Use_Case_Internal_Use__c,false);
		system.assertEquals(tl1.Use_Case_Other__c,false);
		system.assertEquals(tl1.Use_Case_Form_Download__c,false);
		
		//test license generator for Opp2 - Advanced Edition
		response = LicenseXML.generateXML(opp2.Id);
		system.assertEquals(response,'Successfully created Commercial XML license. You should receive an email to forward to the customer with the XML attached. A copy of the XML was also saved as an attachment to the Opportunity, as well as an Email logged to the Opportunity');
		
		Opportunity afterOpp2 = [select id, commercial_license_Key__c from Opportunity where id =: opp2.id];
		
		Turbonomic_License__c tl2 = [select id, name, Account__c, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c, total_licensed_workloads__c, License_Entity__c, Turbonomic_Edition__c, updated_workload_count__c from Turbonomic_License__c where opportunity__c =: opp2.id];
		system.assertEquals(tl2.name,'Commercial License');
		system.assertEquals(tl2.license_type__c,'Commercial');
		system.assertEquals(tl2.licensee_email__c,'justin.chang@vmturbo.com');
		system.assertEquals(tl2.licensee_name__c,'Justin Chang');
		system.assertEquals(tl2.license_end_date__c,date.newInstance(2050,12,31));
		system.assert(tl2.license_key_plain_text__c.length()>0);
		system.assertEquals(tl2.total_licensed_cores__c,null);
		system.assertEquals(tl2.total_licensed_sockets__c,100);
		system.assertEquals(tl2.total_licensed_workloads__c,800);
		system.assertEquals(tl2.Account__c,acct2.id);
		system.assertEquals(tl2.License_Entity__c,'Workloads');
		system.assertEquals(tl2.Turbonomic_Edition__c,'Advanced');
		
		
		Attachment a2 = [select id, body from Attachment where parentId =: tl2.id];
		String xmlString2 = a2.body.toString();
		//system.debug('Actual XML\n' + xmlString2);
		
		List<String> advancedFeatures = lf8.features__c.split(';');
		
		String licenseXml3 = '<?xml version="1.0"?>\n';
        licenseXml3 += '<!-- Turbonomic license file; license created: ';
        licenseXml3 += DateTime.now().format('YYYY-MM-dd') + ' -->\n';
        licenseXml3 += '<license>\n';
        licenseXml3 += '      <first-name>' + opp2.licensee_first_name__c + '</first-name>\n';
        licenseXml3 += '      <last-name>' + opp2.licensee_last_name__c + '</last-name>\n';
        licenseXml3 += '      <email>' + opp2.licensee_email__c + '</email>\n';
        licenseXml3 += '      <vm-total>' + '800' + '</vm-total>\n';
        licenseXml3 += '      <edition>' + 'Advanced' + '</edition>\n';	
        licenseXml3 += '      <expiration-date>' + '2050-12-31' + '</expiration-date>\n';
        licenseXml3 += '      <lock-code>' + '782788439e57fe0efea231930dbe57de' + '</lock-code>\n';
        for(String fn: advancedFeatures){
           licenseXml3 += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml3 += '</license>';
        
        //system.debug('********************************************************Expected XML\n' + licenseXml3);
        //system.debug('**********************************************************Actual XML\n' + xmlString2);
        //system.debug('******************************************************XML Length: ' + xmlString2.length() + ' ' + licenseXml3.length());
        system.assert(xmlString2.length() > 0);
        system.assert(xmlString2.length() == licenseXml3.length());
		system.assert(licenseXml3.contains('<expiration-date>' + '2050-12-31' + '</expiration-date>'));
		
		
		//Create Updated license off of Opp 2 Advanced License
		tl2.updated_workload_count__c = 1200;
		tl2.License_Update_Use_Cases__c = 'Updating Socket/Core Count';
		update tl2;
		response = LicenseXML.updateLicenseXML(tl2.id);
		system.assertEquals(response,'A new Turbonomic Commercial License has been saved.');
		
		Turbonomic_License__c tl4 = [select id, name, Account__c, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_cores__c, total_licensed_sockets__c, total_licensed_workloads__c, License_Entity__c, Turbonomic_Edition__c, updated_workload_count__c, Use_Case_Update_Socket_Core_Count__c from Turbonomic_License__c where opportunity__c =: opp2.id AND id !=: tl2.id];
		system.assertEquals(tl4.license_type__c,'Commercial');
		system.assertEquals(tl4.licensee_email__c,'justin.chang@vmturbo.com');
		system.assertEquals(tl4.licensee_name__c,'Justin Chang');
		system.assertEquals(tl4.license_end_date__c,date.newInstance(2050,12,31));
		system.assert(tl4.license_key_plain_text__c.length()>0);
		system.assertEquals(tl4.total_licensed_cores__c,null);
		system.assertEquals(tl4.total_licensed_sockets__c,100);
		system.assertEquals(tl4.total_licensed_workloads__c,1200);
		system.assertEquals(tl4.Account__c,acct2.id);
		system.assertEquals(tl4.Use_Case_Update_Socket_Core_Count__c,true);
		system.assertEquals(tl4.License_Entity__c,'Workloads');
		system.assertEquals(tl4.Turbonomic_Edition__c,'Advanced');
		
		Turbonomic_License__c originalTl2 = [select id, status__c, updated_workload_count__c From Turbonomic_License__c where id =: tl2.id];
		system.assertEquals(originalTl2.status__c,'Closed');
		system.assertEquals(originalTl2.updated_workload_count__c,null);
		
		
		//for opp 3 EOM - Legacy Edition license		
		response = LicenseXML.generateXML(opp3.Id);
		system.assertEquals(response,'Successfully created Commercial XML license. You should receive an email to forward to the customer with the XML attached. A copy of the XML was also saved as an attachment to the Opportunity, as well as an Email logged to the Opportunity');
		
		Opportunity afterOpp3 = [select id, commercial_license_key__c  from Opportunity where id =: opp3.id];
		system.assert(afterOpp3.commercial_license_key__c == false);
		
		Turbonomic_License__c tl3 = [select id, name, Opportunity__c, license_type__c, licensee_email__c, licensee_name__c, license_end_date__c, license_key_plain_text__c, total_licensed_workloads__c, turbonomic_edition__c from Turbonomic_License__c where opportunity__c =: opp3.id];
		
		
		Attachment a3 = [select id, body from Attachment where parentId =: tl3.id];
		String xmlString3 = a3.body.toString();
		system.debug('Actual XML\n' + xmlString3);
		
		List<String> legacyFeatures = lf2.features__c.split(';');
		
		String licenseXml4 = '<?xml version="1.0"?>\n';
        licenseXml4 += '<!-- Turbonomic license file; license created: ';
        licenseXml4 += DateTime.now().format('YYYY-MM-dd') + ' -->\n';
        licenseXml4 += '<license>\n';
        licenseXml4 += '      <first-name>' + opp3.licensee_first_name__c + '</first-name>\n';
        licenseXml4 += '      <last-name>' + opp3.licensee_last_name__c + '</last-name>\n';
        licenseXml4 += '      <email>' + opp3.licensee_email__c + '</email>\n';
        licenseXml4 += '      <vm-total>' + '800' + '</vm-total>\n';
        licenseXml4 += '      <edition>' + 'EOM - Legacy' + '</edition>\n';
        licenseXml4 += '      <expiration-date>' + DateTime.Now().addDays(365).format('YYYY-MM-dd') + '</expiration-date>\n';
        licenseXml4 += '      <lock-code>' + 'af3826e2a59f44a55e2a51a417a27ca3' + '</lock-code>\n';
        for(String fn: legacyFeatures){
           licenseXml4 += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml4 += '</license>';
        
        //system.debug('Expected XML\n' + licenseXml4);
                
        system.assert(licenseXml4.length() > 0);
        system.assert(licenseXml4.length() == xmlString3.length());
		system.assert(licenseXml4.contains('<expiration-date>' + DateTime.now().addDays(365).format('YYYY-MM-dd') + '</expiration-date>'));
	}
    
    //test manual license creation
    private static testMethod void testManualLicenseCreate() {
    	
    	List<License_Features__c> lfInsert = new List<License_Features__c>();
		License_Features__c lf1 = new License_Features__c(name = 'Eval - no planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		lfInsert.add(lf1);
		License_Features__c lf2 = new License_Features__c(name = 'Commercial', features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;action_script;cloud_targets;cluster_flattening');
		lfInsert.add(lf2);
		License_Features__c lf3 = new License_Features__c(name = 'Eval - with planner',features__c = 'applications;historical_data;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;custom_reports;planner;optimizer;full_policy;loadbalancer;deploy;aggregation;cloud_targets;cluster_flattening;trial');
		lfInsert.add(lf3);
		License_Features__c lf4 = new License_Features__c(name = 'Eval - Advanced Edition', features__c = 'storage; fabric; public_cloud; container_control; app_control; vdi_control; applications; historical_data; multiple_vc; scoped_user_view; customized_views; group_editor; vmturbo_api; automated_actions; active_directory; custom_reports; planner; optimizer; full_policy; loadbalancer; deploy; aggregation; cloud_targets; cluster_flattening; custom_policies; action_script');
		lfInsert.add(lf4);
		License_Features__c lf5 = new License_Features__c(name = 'VHM', features__c = 'community;multiple_vc');
		lfInsert.add(lf5);
		License_Features__c lf6 = new License_Features__c(name = 'Freemium', features__c = 'automated_actions;custom_reports;customized_views;freemium;historical_data;optimizer');
		lfInsert.add(lf6);
		
		insert lfInsert;
    	
    	List<Turbonomic_License__c> licenseInsert = new List<Turbonomic_License__c>();
    	
    	String allFeatures = 'active_directory;aggregation;applications;automated_actions;cloud_targets;cluster_flattening;customized_views;custom_reports;planner;deploy;full_policy;group_editor;historical_data;loadbalancer;multiple_vc;optimizer;scoped_user_view;trial;vmturbo_api';
		String vhmFeatures = 'community;multiple_vc';
    	List<String> freemiumFeatures = new List<String>{'automated_actions','custom_reports','customized_views','freemium','historical_data','optimizer'};
    	String advancedFeatures = 'storage; fabric; public_cloud; container_control; app_control; vdi_control; applications; historical_data; multiple_vc; scoped_user_view; customized_views; group_editor; vmturbo_api; automated_actions; active_directory; custom_reports; planner; optimizer; full_policy; loadbalancer; deploy; aggregation; cloud_targets; cluster_flattening; custom_policies; action_script';
    	String advancedFeatures2 = 'historical_data;custom_reports;planner;optimizer;multiple_vc;scoped_user_view;customized_views;group_editor;vmturbo_api;automated_actions;active_directory;full_policy;action_script;applications;app_control;loadbalancer;deploy;aggregation;fabric;storage;cloud_targets;cluster_flattening;container_control;public_cloud;vdi_control;custom_policies';
    	
    	//manually created vhm license
    	Turbonomic_License__c newVHMLicense = new Turbonomic_License__c();
    	newVHMLicense.licensee_name__c = 'Justin Chang';
		newVHMLicense.licensee_email__c = 'justin.chang@vmturbo.com';
		newVHMLicense.license_end_date__c = date.today().addDays(30);
		newVHMLicense.license_Type__c = 'VHM';
		newVHMLicense.total_licensed_cores__c = 800;
		newVHMLicense.total_licensed_sockets__c = 100;
		newVHMLicense.License_Entity__c = 'Sockets';
		newVHMLicense.status__c = 'Open';
		newVHMLicense.license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Downgrading to VHM;Updating Prospect Contact Info;Updating Socket/Core Count;Internal Use;Other';
		newVHMLicense.use_case_other_reason__c = 'blah blah blah';
		licenseInsert.add(newVHMLicense);
		
		//manually created eval license (no control modules)
		Turbonomic_License__c newEvalLicense = new Turbonomic_License__c();
		newEvalLicense.licensee_name__c = 'Will Smith';
		newEvalLicense.licensee_email__c = 'will.smith@iamlegend.com';
		newEvalLicense.license_end_date__c = date.today().addDays(60);
		newEvalLicense.license_type__c = 'Eval - Advanced Edition';
		newEvalLicense.total_licensed_cores__c = 4000;
		newEvalLicense.total_licensed_sockets__c = 500;
		newEvalLicense.total_licensed_workloads__c = 800;
		newVHMLicense.License_Entity__c = 'Workloads';
    	newEvalLicense.status__c = 'Open';
    	newEvalLicense.license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);License Not Sent to Customer from Download Form;Upgrading VHM to Eval;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Other';
    	newEvalLicense.use_case_other_reason__c = 'blah blah blah';
    	licenseInsert.add(newEvalLicense);
    	
    	//manually created eval license (with control modules)
    	Turbonomic_License__c newEvalConLicense = new Turbonomic_License__c();
    	newEvalConLicense.licensee_name__c = 'Steve Young';
		newEvalConLicense.licensee_email__c = 'steve.young@byu.edu';
		newEvalConLicense.license_end_date__c = date.today().addDays(60);
		newEvalConLicense.license_type__c = 'Eval - with planner';
		newEvalConLicense.temp_insert_features__c = 'network_control';
		newEvalConLicense.total_licensed_cores__c = 4000;
		newEvalConLicense.total_licensed_sockets__c = 500;
		newVHMLicense.License_Entity__c = 'Cores';
    	newEvalConLicense.status__c = 'Open';
    	newEvalConLicense.license_creation_use_cases__c = 'License Extension (Technical Issues);License Extension (Sales);Upgrading Feature-Set;Updating Prospect Contact Info;Updating Socket/Core Count;NFR License;Other';
    	newEvalConLicense.use_case_other_reason__c = 'blah blah blah';
    	licenseInsert.add(newEvalConLicense);
    	
    	//manually created freemium license
    	Turbonomic_License__c newFreemiumLicense = new Turbonomic_License__c();
    	newFreemiumLicense.licensee_name__c = 'Michael Jordan';
    	newFreemiumLicense.licensee_email__c = 'michael.jordan@nike.com';
    	newFreemiumLicense.license_end_date__c = date.today().addDays(90);
    	newFreemiumLicense.license_type__c = 'Freemium';
    	newFreemiumLicense.temp_insert_features__c = 'storage';
    	newFreemiumLicense.total_licensed_cores__c = 500;
    	newFreemiumLicense.total_licensed_sockets__c = 80;
    	newVHMLicense.License_Entity__c = 'Sockets';
    	newFreemiumLicense.status__c = 'Open';
    	newFreemiumLicense.license_creation_use_cases__c = 'Internal Use';
    	licenseInsert.add(newFreemiumLicense);
    	
    	insert licenseInsert;
    	
    	List<Turbonomic_License__c> afterInsertLicenses = [select id, name, License_Key_Plain_Text__c, current_license_features__c, license_Type__c, Use_Case_DL_Form_Fail_to_Send__c, Use_Case_Downgrade_to_VHM__c,
    				Use_Case_Internal_Use__c, Use_Case_License_Extension_Sales__c, Use_Case_License_Extension_Technical__c, Use_Case_NFR_License__c, Use_Case_Other__c, Use_Case_Other_Reason__c, 
    				Use_Case_Update_Prospect_Contact_Info__c, Use_Case_Update_Socket_Core_Count__c, Use_Case_Upgrade_Feature_Set__c, Use_Case_Upgrade_from_VHM_to_Eval__c from Turbonomic_License__c where id =: newVHMLicense.id or id =: newEvalLicense.id or id =: newEvalConLicense.id or id =: newFreemiumLicense.id];
    	
    	for (Turbonomic_License__c tl : afterInsertLicenses) {
    		if (tl.id == newVHMLicense.id) {
    			system.assert(tl.License_Key_Plain_Text__c != null);
    			system.assertEquals(tl.current_License_Features__c.length(),vhmFeatures.length());
    			system.assertEquals(tl.name,'Community');
    			system.assertEquals(tl.license_type__c,'VHM');
    			system.assertEquals(tl.use_case_license_extension_sales__c,true);
    			system.assertEquals(tl.use_case_license_extension_technical__c,true);
    		} else if (tl.id == newEvalLicense.id) {
    			system.assert(tl.License_Key_Plain_Text__c != null);
    			system.assertEquals(tl.current_license_Features__c.length(),advancedFeatures2.length());
    			system.assertEquals(tl.name,'Eval');
    			system.assertEquals(tl.license_type__c,'Eval');
    		} else if (tl.id == newEvalConLicense.id) {
    			system.assert(tl.License_Key_Plain_Text__c != null);
    			system.assertEquals(tl.current_license_features__c.length(),(allFeatures+';network_control').length());
    			system.assertEquals(tl.name,'Eval');
    			system.assertEquals(tl.license_type__c,'Eval');
    		} else if (tl.id == newFreemiumLicense.id) {
    			system.assert(tl.License_Key_Plain_Text__c != null);
    			system.assertEquals(tl.current_license_Features__c.length(),String.join(freemiumFeatures,';').length());
    			system.assertEquals(tl.name,'Freemium');
    			system.assertEquals(tl.license_type__c,'Freemium');
    		}
    	}
    	
    }
   
    
}