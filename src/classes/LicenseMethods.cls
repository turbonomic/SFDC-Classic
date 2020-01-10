public with sharing class LicenseMethods {
	
	//[TL1]
	public static void CloseOtherOpenLicenses(List<Turbonomic_License__c> licenses) {
		
		Map<id,Turbonomic_License__c> allLicenses = new Map<id,Turbonomic_License__c>();
		List<String> emailList = new List<String>();
		
		for (Turbonomic_License__c tl : licenses) {
			if (tl.license_type__c.containsIgnoreCase('Eval') && tl.status__c == 'Open' ) {
				allLicenses.put(tl.id,tl);
				emailList.add(tl.licensee_email__c);
			}
		}
		
		if (allLicenses.size() > 0) {
			
			List<Turbonomic_License__c> updateLicenses = new List<Turbonomic_License__c>();
			Map<id,Turbonomic_License__c> allAssociatedLicenses = new Map<id,Turbonomic_License__c>([select id, licensee_email__c, status__c, license_type__c from Turbonomic_License__c where licensee_email__c in: emailList and license_type__c like 'Eval%' and status__c = 'Open' and (NOT(id in: allLicenses.keySet()))]);
			
			if (allAssociatedLicenses.size() > 0) {
				system.debug('### found associated licenses');
				for (Turbonomic_License__c tl : allAssociatedLicenses.values()) {
					tl.status__c = 'Closed';
					updateLicenses.add(tl);
				}
				
				if (updateLicenses.size() > 0) update updateLicenses;	
			}	
		}
	}
	
	//[TL2]
	public static void createManualLicenses (List<Turbonomic_License__c> licenses) {
		
		List<String> evalFeatures = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','optimizer','full_policy','loadbalancer','deploy','aggregation','cloud_targets','cluster_flattening','trial'};
		List<String> evalFeatureswPlanner = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','planner','optimizer','full_policy','loadbalancer','deploy','aggregation','cloud_targets','cluster_flattening','trial'};
		List<String> vhmFeatures = new List<String>{'community','multiple_vc'};
		List<String> freemiumFeatures = new List<String>{'automated_actions','custom_reports','customized_views','freemium','historical_data','optimizer'};
		
		List<License_Features__c> allLicenseFeatures = [select id, name, features__c from License_Features__c];
		Map<String,List<String>> featureMap = new Map<String,List<String>>();
		for (License_Features__c lf : allLicenseFeatures) {
			List<String> tempList = lf.features__c.split(';');
			featureMap.put(lf.name,tempList);
		}
		
		for (Turbonomic_License__c tl : licenses) {
			
			if (tl.License_Key_Plain_Text__c == null) {
				
				String firstName;
				String lastName;
				
				if (tl.licensee_name__c.indexOf(' ') == -1) {
					lastName = tl.licensee_name__c;
				} else {
					firstName = tl.licensee_name__c.subString(0,tl.licensee_name__c.indexOf(' '));
					lastName = tl.licensee_name__c.subString(tl.licensee_name__c.indexOf(' ')+1);
				}
				
    			Date licenseExp = tl.license_end_date__c;
    			system.debug('### license expiration date (date form) is ' + licenseExp);
    			DateTime expiration = DateTime.newInstance(licenseExp,Time.newInstance(0,0,0,0));
    			system.debug('### license expiration date (date/time form) is ' + expiration);
    			
    			String sockets;
    			String cores;
    			String workloads;
    			String licenseEntity;
    			String numEntityAmountString;
    			sockets = string.valueOf((Integer)tl.total_licensed_sockets__c);
    			cores = string.valueOf((Integer)tl.total_licensed_cores__c);
    			workloads = string.valueOf((Integer)tl.total_licensed_workloads__c);
    			
    			licenseEntity = tl.License_Entity__c;
				if (licenseEntity == 'Workloads') numEntityAmountString = workloads;
				else if (licenseEntity == 'Sockets') numEntityAmountString = sockets;
				else if (licenseEntity == 'Cores') numEntityAmountString = sockets + ';' + cores;
				//system.debug('The Num Entity Amount String for ' + licenseEntity + ' is ' + numEntityAmountString);
    			system.debug('### sockets is ' + sockets);
    			system.debug('### cores is ' + cores);
    			//system.debug('### workloads is ' + workloads);
    			
    			Set<String> features = new Set<String>();
    			List<String> featureList = new List<String>();
				
				if (tl.license_type__c.containsIgnoreCase('Eval')) {
					//if (tl.license_type__c.containsIgnoreCase('no planner')) {
					//	features.addAll(evalFeatures);
					//} else if (tl.license_type__c.containsIgnoreCase('with planner')) {
					//	features.addAll(evalFeatureswPlanner);
					//} else if (tl.license_type__c.containsIgnoreCase('Workload Edition')) {
					//	List<String> workload = new List<String>{'storage','fabric'};
					//	features.addAll(workload);
					//	features.addAll(evalFeatureswPlanner);
					//} else if (tl.license_type__c.containsIgnoreCase('Application Edition')) {
					//	List<String> application = new List<String>{'storage','fabric','network_control','app_control'};
					//	features.addAll(application);
					//	features.addAll(evalFeatureswPlanner);
					//} else if (tl.license_type__c.containsIgnoreCase('Cloud Native Edition')) {
					//	List<String> cloudNative = new List<String>{'storage','fabric','network_control','public_cloud','container_control','app_control'};
					//	features.addAll(cloudNative);
					//	features.addAll(evalFeatureswPlanner);
					//}
					List<string> tempFeatures = featureMap.get(tl.license_type__c);
					features.addAll(tempFeatures);
					if (tl.temp_insert_features__c != null) {
						List<String> additionalFeatures = tl.temp_insert_features__c.split(';');
						system.debug('### additionalFeatures for manual insert has ' + additionalFeatures.size() + ' elements' );
						for (String module : additionalFeatures) {
							if (!features.contains(module)) {
								featureList.add(module);
							}
						}
					}
					featureList.addAll(features);
					tl.name = 'Eval';
					tl.license_type__c = 'Eval';
				} else if (tl.license_type__c == 'VHM') {
					featureList = featureMap.get(tl.license_Type__c);
					tl.name = 'Community';
				} else if (tl.license_type__c == 'Freemium') {
					featureList = featureMap.get(tl.license_Type__c);
					tl.name = 'Freemium';
				}
				
				if (tl.license_creation_use_cases__c != null || tl.license_creation_use_cases__c.length() > 0) {
					if (tl.license_creation_use_cases__c.containsIgnoreCase('License Extension (Technical Issues)')) {
						tl.Use_Case_License_Extension_Technical__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('License Extension (Sales)')) {
						tl.Use_Case_License_Extension_Sales__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('License Not Sent to Customer from Download Form')) {
						tl.Use_Case_DL_Form_Fail_to_Send__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
						tl.Use_Case_Upgrade_from_VHM_to_Eval__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Upgrading Feature-Set')) {
						tl.Use_Case_Upgrade_Feature_Set__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Downgrading to VHM')) {
						tl.Use_Case_Downgrade_to_VHM__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Updating Prospect Contact Info')) {
						tl.Use_Case_Update_Prospect_Contact_Info__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Updating Socket/Core Count')) {
						tl.Use_Case_Update_Socket_Core_Count__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('NFR License')) {
						tl.Use_Case_NFR_License__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Internal Use')) {
						tl.Use_Case_Internal_Use__c = true;
					}
					if (tl.license_creation_use_cases__c.containsIgnoreCase('Other')) {
						tl.Use_Case_Other__c = true;
					}
				}
				
				tl.current_license_features__c = String.join(featureList,';');
				
				/*
				* To do: concatenate parameter for Cores, add in entity type field, call new method
				*
				*/
				//tl.License_Key_Plain_Text__c = LicenseCodeGenerator.GenerateLicenseXml(firstName, lastName, tl.licensee_email__c, expiration, sockets, cores, featureList);
				String edition = 'Trial';
				tl.License_Key_Plain_Text__c = LicenseCodeGenerator.newGenerateLicenseXml(firstName, lastName, tl.licensee_email__c, expiration, licenseEntity, numEntityAmountString, edition, featureList);
				system.debug('### license xml:\n' + tl.License_Key_Plain_Text__c);
				if (tl.temp_insert_features__c != null) tl.temp_insert_features__c = null;

				
			}
			
		}
		
	}
	
	
}