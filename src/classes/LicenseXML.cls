global class LicenseXML {
	
	webservice static String generateXML(String oppId) {
		
		Opportunity opp = [select id, name, Account.Name, AccountId, Account.Customer_Experience_Owner3__r.Full_Name__c, Product_Type__c, Scheduled_License_Key_Send_Date__c, Revenue_Type__c, Licensee_Email__c, Licensee_First_Name__c, Licensee_Last_Name__c, Total_Licensed_Cores__c, Total_Licensed_Sockets__c, Total_Licensed_Workloads__c, License_End_Date__c, Commercial_License_Key__c, Control_Module_License_Features__c, License_Type__c, License_Creation_Use_Cases__c, Other_Reason__c, Pricing_Type__c, Turbonomic_Edition__c from Opportunity where id =: oppId];
		String returnString;
		
		User cxUser = [select id, name, email, firstName, lastName, phone from User where id =: opp.Account.Customer_Experience_Owner3__c and User_Role_Name__c like 'Customer Account%' limit 1];
		List<Contact> licensees = [select id from Contact where firstName =: opp.licensee_first_name__c and lastName =: opp.licensee_last_name__c and email =: opp.licensee_email__c];
		
		if (opp.licensee_email__c == null || opp.licensee_first_name__c == null || opp.licensee_last_name__c == null ||  opp.license_end_date__c == null || opp.License_Creation_use_Cases__c == null) {
			return 'Please make sure to fill in the Licensee First Name, Licensee Last Name, Licensee Email, License End Date, License Creation Use Cases, and either license type or the commercial license key checkbox must be selected before trying to generate a license.';
		} else if (opp.Pricing_type__c == null) {
			return 'Please enter in the Pricing Type for this Opportunity before creating a License Key';
		} else if ((opp.Pricing_Type__c == 'Workloads' && opp.total_licensed_workloads__c == null) || (opp.Pricing_Type__c == 'Sockets' && opp.total_licensed_sockets__c == null) || (opp.Pricing_Type__c == 'Cores' && (opp.total_licensed_cores__c == null || opp.total_licensed_sockets__c == null))){
			return 'Please make sure to fill in the Total Licensed Workloads, Total Licensed Sockets, or Total Licensed Cores AND Total Licensed Sockets as appropriate';
		} else if (opp.license_type__c == null && opp.commercial_license_key__c == false){
			return 'Please enter in either a License Type or check the Commercial License Key box (if in Finance and issuing a commercial key).';
		} else if ((opp.Revenue_Type__c == null || opp.Turbonomic_Edition__c == null) && opp.commercial_license_key__c) {
			return 'Please enter in the Revenue Type and Turbonomic Edition for this Opportunity before creating the Commercial License Key';
		} else if (opp.Pricing_Type__c == 'Workloads' && opp.Turbonomic_Edition__c == null) {
			return 'Please select a Turbonomic Edition when creating a workload license';
		} else if (UserInfo.getUserRoleId() != '00ED0000001P92nMAC' && UserInfo.getUserRoleId() != '00ED0000001QuNyMAK' && opp.license_end_date__c < date.today().addDays(1)) {
			return 'All Licenses must have a License End Date at least 1 day from today.';
		} else if (UserInfo.getUserRoleId() != '00ED0000001P92nMAC' && UserInfo.getUserRoleId() != '00ED0000001QuNyMAK' && (opp.license_creation_use_cases__c.containsIgnoreCase('NFR License') || opp.license_creation_use_cases__c.containsIgnoreCase('Internal Use')) && opp.license_end_date__c > date.today().addDays(370)) {
			return 'NFR and Internal Licenses may not have a License End Date more than 370 days from today.';
		} else if (UserInfo.getUserRoleId() != '00ED0000001P92nMAC' && UserInfo.getUserRoleId() != '00ED0000001QuNyMAK' && opp.license_type__c.contains('Eval') && opp.license_end_date__c > date.today().addDays(90)){
			return 'Eval licenses may not have a License End Date exceed 90 days from today.';
		} else if (UserInfo.getUserRoleId() != '00ED0000001P92nMAC' && UserInfo.getUserRoleId() != '00ED0000001QuNyMAK' && (opp.license_type__c == 'VHM' || opp.license_type__c == 'Freemium') && opp.license_end_date__c > date.today().addDays(370)) {
			return 'VHM and Freemium licenses may not have a License End Date more than 370 days from today.';
		}  else { 
			
			//define variables needed
			String firstName;
			String lastName;
			String email;
			String numSocketsString;
			String numCoresString;
			String numWorkloadsString;
			String numEntityAmountString;
			DateTime endDate;
			String licenseEntity; //Workloads, Sockets, or Cores. Derived from the Pricing Type Field
			String turboEdition; //Turbonomic Edition for Commercial licenses
			
			
			
			// set variables
			firstName = opp.Licensee_First_Name__c;
			lastName = opp.Licensee_Last_Name__c;
			email = opp.Licensee_Email__c;
			if (opp.license_end_date__c != null) endDate = DateTime.NewInstance(opp.License_End_Date__c.year(),opp.License_End_Date__c.month(),opp.License_End_Date__c.day());
			if (opp.Total_Licensed_Sockets__c != null) numSocketsString = string.valueOf(opp.Total_Licensed_Sockets__c);
			if (opp.Total_Licensed_Cores__c != null) numCoresString = string.valueOf(opp.Total_Licensed_Cores__c);
			if (opp.Total_Licensed_Workloads__c != null) numWorkloadsString = string.valueOf(opp.Total_Licensed_Workloads__c); 
			
			if (opp.Turbonomic_Edition__c != null) {
				if (opp.Turbonomic_Edition__c != 'EOM - Legacy' || (opp.Turbonomic_Edition__c == 'EOM - Legacy' && opp.Pricing_Type__c == 'Workloads')) {
					turboEdition = string.valueOf(opp.Turbonomic_Edition__c);
				} else turboEdition = 'N/A'; 
			} else turboEdition = 'N/A';
			
			licenseEntity = opp.Pricing_Type__c;
			if (licenseEntity == 'Workloads') numEntityAmountString = numWorkloadsString;
			else if (licenseEntity == 'Sockets') numEntityAmountString = numSocketsString;
			else if (licenseEntity == 'Cores') numEntityAmountString = numSocketsString + ';' + numCoresString;
			//system.debug('The Num Entity Amount String for ' + licenseEntity + ' is ' + numEntityAmountString);
			
		
			List<String> finalFeatures = new List<String>();
			
			List<String> commercialFeatures = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','planner','optimizer','full_policy','loadbalancer','deploy','aggregation','action_script','cloud_targets','cluster_flattening'};
			//List<String> evalFeatures = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','optimizer','full_policy','loadbalancer','deploy','aggregation','cloud_targets','cluster_flattening','trial'};
			//List<String> evalFeatureswPlanner = new List<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','planner','optimizer','full_policy','loadbalancer','deploy','aggregation','cloud_targets','cluster_flattening','trial'};		
			//List<String> vhmFeatures = new List<String>{'community','multiple_vc'};
			//List<String> freemiumFeatures = new List<String>{'automated_actions','custom_reports','customized_views','freemium','historical_data','optimizer'};
			
			List<License_Features__c> allLicenseFeatures = [select id, name, features__c from License_Features__c];
			Map<String,List<String>> featureMap = new Map<String,List<String>>();
			for (License_Features__c lf : allLicenseFeatures) {
				List<String> tempList = lf.features__c.split(';');
				featureMap.put(lf.name,tempList);
			}
			
			//system.debug('### opp name is ' + opp.name);
			//system.debug('### opp license type is ' + opp.license_type__c);
			//system.debug('### featureMap has ' + featureMap.size() + ' license type options');
			
			String[] controlFeatures;
			if (opp.Control_Module_License_Features__c != null) {
				controlFeatures = opp.Control_Module_License_Features__c.split(';');
			}
			
			if (opp.license_type__c != null) {
				if (opp.license_type__c == 'VHM') {
					finalFeatures.addAll(featureMap.get(opp.license_type__c));
				} else if (opp.license_type__c == 'Freemium') {
					finalFeatures.addAll(featureMap.get(opp.license_type__c));
				} else if (opp.license_type__c.contains('Eval')) {
					system.debug('### featureMap inside features ' + featureMap.get(opp.license_type__c));
					Set<String> basicFeatures = new Set<String>();
					basicFeatures.addAll(featureMap.get(opp.license_type__c));
					system.debug('### basic features includes ' + basicFeatures);
					if (controlFeatures != null && controlFeatures.size() > 0) {
						for (String addon : controlFeatures) {
							if (!basicFeatures.contains(addon)) {
								finalFeatures.add(addon);
							}
						}
					}
					finalFeatures.addAll(basicFeatures);
				}
			} else if (opp.commercial_license_key__c) {
				Set<String> basicFeatures = new Set<String>();
				if (opp.Turbonomic_Edition__c == 'EOM - Legacy') basicFeatures.addAll(commercialFeatures);
				else basicFeatures.addAll(featureMap.get(opp.Turbonomic_Edition__c));
				if (controlFeatures != null && controlFeatures.size() > 0) {
					for (String addon : controlFeatures) {
						if (!basicFeatures.contains(addon)) {
							finalFeatures.add(addon);
						}
					}
				}
				finalFeatures.addAll(basicFeatures);
			}
			
			String featureString = String.join(finalFeatures,';');
			//system.debug('### current license features prior to insert' + featureString);

			//generate XML
			try {
				returnString = LicenseCodeGenerator.newGenerateLicenseXml(firstName, LastName, email, endDate, licenseEntity, numEntityAmountString, turboEdition, finalFeatures);
			} catch (Exception e) {
				returnString = 'Could not create XML - ' + e;
			}
			
			
			
			Blob xmlBLob = Blob.valueOf(returnString);
			
			
			Turbonomic_License__c tl = new Turbonomic_License__c(Opportunity__c = opp.id);
			if (opp.commercial_license_key__c) { 
				tl.name = 'Commercial License';
				tl.license_type__c = 'Commercial';
			} else {
				if (opp.license_type__c == 'VHM') {
					tl.name = 'Community';
					tl.license_type__c = 'VHM';
				} else if (opp.license_type__c == 'Freemium') {
					tl.name = 'Freemium';
					tl.license_type__c = 'Freemium';
				} else if (opp.license_type__c.containsIgnoreCase('Eval')) {
					tl.name = 'Eval License'; 
					tl.license_type__c = 'Eval';
				}
				
			}
			
			tl.license_end_date__c = opp.license_end_date__c;
			tl.licensee_email__c = opp.licensee_email__c;
			tl.licensee_name__c = opp.licensee_first_name__c + ' ' + opp.licensee_last_name__c;
			tl.license_key_plain_text__c = returnString;
			tl.account__c = opp.AccountId;
			tl.current_license_features__c = featureString;
			tl.status__c = 'Open';
			tl.license_creation_use_cases__c = opp.license_creation_use_cases__c;
			tl.License_Entity__c = opp.Pricing_Type__c;
			
			
			if (opp.Turbonomic_Edition__c != null) tl.Turbonomic_Edition__c = opp.Turbonomic_Edition__c;
			if (opp.total_licensed_sockets__c != null) tl.total_licensed_sockets__c = opp.total_licensed_sockets__c;
			if (opp.total_licensed_cores__c != null) tl.total_licensed_cores__c = opp.total_licensed_cores__c;
			if (opp.Total_Licensed_Workloads__c != null) tl.Total_Licensed_Workloads__c = opp.Total_Licensed_Workloads__c;
			
			if (opp.license_creation_use_cases__c != null) {
				if (opp.license_creation_use_cases__c.containsIgnoreCase('License Extension (Technical Issues)')) {
					tl.Use_Case_License_Extension_Technical__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('License Extension (Sales)')) {
					tl.Use_Case_License_Extension_Sales__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('License Not Sent to Customer from Download Form')) {
					tl.Use_Case_DL_Form_Fail_to_Send__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
					tl.Use_Case_Upgrade_from_VHM_to_Eval__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Upgrading Feature-Set')) {
					tl.Use_Case_Upgrade_Feature_Set__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Downgrading to VHM')) {
					tl.Use_Case_Downgrade_to_VHM__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Updating Prospect Contact Info')) {
					tl.Use_Case_Update_Prospect_Contact_Info__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Updating Socket/Core Count')) {
					tl.Use_Case_Update_Socket_Core_Count__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('NFR License')) {
					tl.Use_Case_NFR_License__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Internal Use')) {
					tl.Use_Case_Internal_Use__c = true;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Other')) {
					tl.Use_Case_Other__c = true;
					if (opp.other_reason__c != null) tl.Use_Case_Other_Reason__c = opp.other_reason__c;
				}
				if (opp.license_creation_use_cases__c.containsIgnoreCase('Form Download')) {
					tl.Use_Case_Form_Download__c = true;
				}
			}
			
			
			insert tl;
			
			Attachment attachment = new Attachment();
			attachment.Body = xmlBlob;
			if (opp.commercial_license_key__c) {
				attachment.Name = opp.Account.Name + '_Full' + '_license.xml';
			} else if (opp.license_type__c.containsIgnoreCase('Eval')) {
				attachment.Name = opp.Account.Name + '_eval_license.xml';
			} else if (opp.license_type__c == 'VHM') {
				attachment.Name = opp.Account.Name + '_vhm_license.xml';
			} else if (opp.license_type__c == 'Freemium') {
				attachment.Name = opp.Account.Name + '_freemium_license.xml';
			}
			attachment.ParentId = tl.id;
			attachment.OwnerId = userInfo.getUserId();
			
			insert attachment;
			
			if (opp.commercial_license_Key__c) {
				
				String edition;
				if (turboEdition != null) {
					if (opp.Turbonomic_Edition__c == 'EOM - Legacy') edition = opp.product_type__c;
					else edition = turboEdition;
				} else edition = opp.product_type__c;

				Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
				efa.setFileName('license.xml');
				efa.setBody(attachment.body);
				
				Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		        String[] toAddresses = new String[] {userInfo.getUserEmail()};
		        mail.setToAddresses(toAddresses);
		        mail.setSubject(opp.Account.Name + ' License Key');
		        mail.setFileAttachments(new Messaging.EmailFileAttachment[]{efa});
		        String emailBody;
		        emailBody =  opp.Licensee_First_Name__c + ',<br><br>'; emailBody += 'Good Afternoon.<br><br>'; emailBody += 'Congratulations on your purchase of Turbonomic\'s ' + edition + ' edition. Below my signature is your '; if (opp.License_End_Date__c == date.newInstance(2050,12,31)) emailBody += 'Perpetual License Key ID, '; else emailBody += 'Term License Key ID, ';
		        //if (opp.pricing_type__c != 'Sockets') emailBody += numCoresString + ' ' + opp.pricing_type__c + ' '; else emailBody += numSocketsString + ' ' + opp.pricing_type__c + ' '; 
		        if (licenseEntity == 'Workloads') emailBody += numWorkloadsString + ' ' + licenseEntity + ' '; else if (licenseEntity == 'Cores') emailBody += numCoresString + ' ' + licenseEntity + ' '; else emailBody += numSocketsString + ' ' + licenseEntity + ' ';
		        if (opp.License_End_Date__c != date.newInstance(2050,12,31)) emailBody += '(through ' + opp.License_End_Date__c.month() + '/' + opp.License_End_Date__c.day() + '/' + opp.License_End_Date__c.year() + ' read as mm/dd/yyyy). '; else emailBody += '. '; 
		        emailBody += ' <b> To ensure you are successful as you continue to use our Turbonomic product, you have been assigned a customer experience contact named ' + opp.Account.Customer_Experience_Owner3__r.Full_Name__c;
		        emailBody += ' who can be reached via e-mail <a href="mailto:' + cxUser.email + '">' + cxUser.firstName + '.' + cxUser.lastName + '@turbonomic.com' + '</a> or telephone ('+ cxUser.phone + ') should you have any additional questions.</b> '; 
		        emailBody += 'Please follow the instructions for whichever scenario applies:<br><br>'; emailBody += '<ol type="1"> <li><a href="http://go.vmturbo.com/green-circle-login-request.html">"Sign Up" for our Turbonomic user community</a>, <b>"The Green Circle"</b>. This will give you access to all of our knowledge content as well as a forum to engage directly with other Turbonomic users.<br></li>';
		        emailBody += '<li><a href="https://support.vmturbo.com/registration">"Register yourself on our customer support website"</a> so you have access to technical support for assistance and to check in on ticket statuses</li>';
				emailBody += '<li>If you have Turbonomic Operations Manager already installed, it is recommended that you are running the latest version of Turbonomic Operations Manager. For more information on how to determine your version and your update options please <a href="https://greencircle.vmturbo.com/docs/DOC-1649">click here</a>.<br></li>';
				emailBody += '<li>Once your Operations Manager instance has been successfully updated, simply copy the license key text from start to finish and paste it into the "License Configuration" (in the Admin tab) of your Operations Manager instance. If you choose to copy the key from the attached file, it is strongly recommended you open the file using "Notepad" or similar plain text editor to ensure the key populates correctly, as opening the file using a browser may cause errors.<br></li>';
				emailBody += '<li>If you have not previously installed Turbonomic Operations Manager in your environment, simply download it here: <a href="http://turbonomic.com/thx-dl-ft-cloud-edition-download">http://turbonomic.com/thx-dl-ft-cloud-edition-download</a>. Once installed, you will be prompted in the installation and configuration process to submit your license key to activate the product.<br></li></ol>';
				emailBody += 'Should you have any questions or issues, please feel free to log on to Turbonomic Customer Support at <a href="https://support.turbonomic.com/hc/en-us">https://support.turbonomic.com/hc/en-us</a>.<br><br>';
				emailBody += 'Your business is greatly appreciated!<br><br>'; emailBody += 'Best Regards,<br><br>';	emailBody += 'Turbonomic Team<br><br>';
				emailBody += '<xmp>' + returnString + '</xmp>';
		        mail.setHTMLBody(emailBody);
		        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		        
		        Task newTask = new Task(subject = opp.Account.Name + ' Full License Key Sent', description = emailBody, createdBy = [select id from User where id =: UserInfo.getUserId()], activityDate = date.today(), whatId = opp.id, type = 'Email', status = 'Completed');
				if (licensees.size() > 0) {
					newTask.whoId = licensees.get(0).id;
				}
				insert newTask;
				
				opp.commercial_license_key__c = false;
				opp.Turbonomic_Edition__c = null;
				if (opp.Revenue_Type__c == 'Perpetual' && opp.license_end_date__c != date.newInstance(2050,12,31)) opp.Scheduled_License_Key_Send_Date__c = opp.license_end_date__c.addDays(-1);
				opp.license_end_date__c = null;
				opp.license_creation_use_cases__c = null;
				opp.other_reason__c = null;
				//opp.control_module_license_features__c = null;
				update opp;
				
				return 'Successfully created Commercial XML license. You should receive an email to forward to the customer with the XML attached. A copy of the XML was also saved as an attachment to the Opportunity, as well as an Email logged to the Opportunity';
				
			} else {
				String licenseTypeText = opp.license_type__c;
		        Task newTask = new Task(subject = opp.Account.Name + ' ' + licenseTypeText  +' License Created', description = returnString, createdBy = [select id from User where id =: UserInfo.getUserId()], activityDate = date.today(), whatId = opp.id, type = 'Email', status = 'Completed');
		        if (licensees.size() > 0) {
		        	newTask.whoId = licensees.get(0).id;
		        }
		        insert newTask;
		        
		        opp.license_end_date__c = null;
		        opp.license_type__c = null;
		        opp.license_creation_use_cases__c = null;
		        opp.other_reason__c = null;
		        opp.control_module_license_features__c = null;
		        update opp;
		        
		        return 'Successfully created ' + licenseTypeText + ' XML license. You will find the License attached to the Opportunity in the Attachments section and an email logged to your opportunity';
			}
	        
	        return 'Error: please contact a SFDC administrator to look into the issue.';
		}
		
		return 'Error: please contact a SFDC administrator to look into the issue.';
	}
	
	

	
	webservice static String updateLicenseXML(String licenseId) {
    	
    	Turbonomic_License__c license = [select id, name, status__c, Total_Licensed_Cores__c, Total_Licensed_Sockets__c, Total_Licensed_Workloads__c, current_license_features__c, licensee_email__c, licensee_name__c, license_end_date__c, updated_core_count__c, reason_for_update__c, Updated_License_ID__c, 
    									updated_socket_count__c, Updated_Workload_Count__c, Updated_Turbonomic_Edition__c, Updated_License_Entity__c, updated_features__c, updated_license_end_date__c, Lead__c, Account__c, Opportunity__c, license_Type__c, upgrade_from_vhm_to_eval__c, license_creation_use_cases__c, other_reason__c, license_update_use_cases__c, Turbonomic_Edition__c, License_Entity__c from Turbonomic_License__c where id =: licenseId limit 1];
    	
    	//system.debug('### license:' + license.current_license_features__c );
    	
		List<String> vhmFeatures = new List<String>{'community','multiple_vc'};
		List<String> freemiumFeatures = new List<String>{'automated_actions','custom_reports','customized_views','freemium','historical_data','optimizer'};
    	
    	
    	String sockets;
    	String cores;
    	String workloads;
    	String turboEdition;
    	String licenseEntity;
    	String entityAmount;
    	DateTime endDate;
    	String email = license.Licensee_email__c;
    	String name = license.licensee_name__c;
    	String firstName;
    	String lastName;
    	if (name.indexOf(' ') == -1) {
    		lastName = name;
    		firstName = '';
    	} else {
	    	firstName = name.subString(0,name.indexOf(' '));
	    	lastName = name.subString(name.indexOf(' ')+1);
    	}
    	
    	if (license.updated_socket_count__c != null) {
    		sockets = String.valueOf(license.updated_Socket_Count__c);
    	} else {
    		if (license.total_licensed_sockets__c != null) sockets = String.valueOf(license.total_licensed_sockets__c);
    	}
    	
    	if (license.updated_core_count__c != null) {
    		cores = String.valueOf(license.updated_Core_Count__c);
    	} else {
    		if (license.total_licensed_cores__c != null) cores = String.valueOf(license.total_licensed_cores__c);
    	}
    	
    	if (license.Updated_Workload_Count__c != null) {
    		workloads = String.valueOf(license.Updated_Workload_Count__c);
    	} else {
    		if (license.Total_Licensed_Workloads__c != null) workloads = String.valueOf(license.Total_Licensed_Workloads__c);
    	}
    	
    	if (license.updated_license_end_date__c != null) {
    		endDate = DateTime.newInstance(license.updated_license_end_date__c,Time.newInstance(0,0,0,0));
    	} else {
    		endDate = DateTime.newInstance(license.license_end_date__c,Time.newInstance(0,0,0,0));
    	}
    	
    	if (license.Updated_License_Entity__c != null) {
    		licenseEntity = String.valueOf(license.Updated_License_Entity__c);
    	} else {
    		if (license.License_Entity__c != null) licenseEntity = String.valueOf(license.License_Entity__c);
    		else return 'Please input an updated License Entity if one is not already set on the license.';
    	}
    	
    	if (license.Updated_Turbonomic_Edition__c != null) {
    		turboEdition = String.valueOf(license.Updated_Turbonomic_Edition__c);
    		if (license.Updated_Turbonomic_Edition__c == 'EOM - Legacy' && licenseEntity != 'Workloads') turboEdition = 'N/A';
    	} else {
    		if (license.Turbonomic_Edition__c != null) {
    			if (license.Turbonomic_Edition__c == 'EOM - Legacy' && licenseEntity != 'Workloads') turboEdition = 'N/A';
    			else turboEdition = String.valueOf(license.Turbonomic_Edition__c);
    		} else {
    			if (license.license_type__c == 'Commercial' || licenseEntity == 'Workloads') {
    				return 'Please fill out an updated Turbonomic Edition if this is a Commercial license or a Workload based license and the Turbonomic Edition is not currently filled out';
    			}
    			else turboEdition = 'N/A';			    			
    		}
    	}
    	
    	if (licenseEntity == 'Workloads') entityAmount = workloads;
		else if (licenseEntity == 'Sockets') entityAmount = sockets;
		else if (licenseEntity == 'Cores') entityAmount = sockets + ';' + cores;
    	
    	
    	
    	if (license.license_type__c.containsIgnoreCase('Eval')) {
 	
    		system.debug('### license updated use cases: ' + license.license_update_use_cases__c);
    		if (license.status__c == 'Closed') {
    			if (license.updated_socket_count__c != null) {
		    		license.updated_socket_count__c = null;
		    	}
		    	if (license.updated_core_count__c != null) {
		    		license.updated_core_count__c = null;
		    	}
		    	if (license.Updated_Workload_Count__c != null) {
		    		license.Updated_Workload_Count__c = null;
		    	}
		    	if (license.updated_license_end_date__c != null) {
		    		license.updated_license_end_date__c = null;
		    	}
		    	if (license.updated_features__c != null) {
		    		license.updated_features__c = null;
		    	}
		    	if (license.license_update_use_cases__c != null) {
		    		license.license_update_use_cases__c = null;
		    	}
		    	if (license.Updated_Turbonomic_Edition__c != null) {
		    		license.Updated_Turbonomic_Edition__c = null;
		    	}
		    	if (license.Updated_License_Entity__c != null) {
		    		license.Updated_License_Entity__c = null;
		    	}
		    	update license;
		    	return 'Please go to the most recently created Turbonomic Eval License attached to this email address and update the eval license there.';		
		    	
    		} else {
    			if (license.license_update_use_cases__c == null) {
    				
    				return 'Please fill in the License Update Use Cases field before trying to update the license.';
    				
    			} else {
    				
    				String returnString;
    				String allLicenseFeatureString;
    				turboEdition = 'N/A';
    				
    				if (license.license_update_use_cases__c.containsIgnoreCase('Downgrading to VHM')) {
    					
    					try {
    						//returnString = LicenseCodeGenerator.GenerateLicenseXml(firstName, lastName, email, endDate, sockets, cores, vhmFeatures);
    						returnString = LicenseCodeGenerator.newGenerateLicenseXml(firstName, lastName, email, endDate, licenseEntity, entityAmount, turboEdition, vhmFeatures);
    					} catch (Exception e) {
    						returnString = 'Could not create XML - ' + e;
    					}
    					
    					allLicenseFeatureString = String.join(vhmFeatures,';');
    					
    				} else {
    				
	    				Set<String> currentFeatures = new Set<String>();
	    				system.debug('### license current license features - ' + license.current_license_features__c);
	    				currentFeatures.addAll(license.current_license_features__c.split(';'));
				    	List<String> allFeatures = new List<String>();
				    	
				    	if (license.updated_features__c != null) {
				    		List<String> updatedFeatures = license.updated_features__c.split(';');
				    		for (String s : updatedFeatures) {
				    			if (!currentFeatures.contains(s)) {
				    				allFeatures.add(s);
				    			}
				    		}
				    	}
				    	allFeatures.addAll(currentFeatures);
				    	
				    	//generate license xml
				    	try {
				    		//returnString = LicenseCodeGenerator.GenerateLicenseXml(firstName, lastName, email, endDate, sockets, cores, allFeatures);
				    		returnString = LicenseCodeGenerator.newGenerateLicenseXml(firstName, lastName, email, endDate, licenseEntity, entityAmount, turboEdition, allFeatures);
				    	} catch (Exception e) {
				    		returnString = 'Could not create XML - ' + e;
				    	}
				    	
				    	//create license multi-select picklist
				    	allLicenseFeatureString = String.join(allFeatures,';'); 

    				}
			    	
			    	// create updated license
			    	Turbonomic_License__c tl = new Turbonomic_License__c();
			    	if (sockets != null) tl.total_licensed_sockets__c = Integer.valueOf(sockets);
					if (cores != null) tl.total_licensed_cores__c = Integer.valueOf(cores);
					if (workloads != null) tl.total_licensed_workloads__c = Integer.valueOf(workloads);
					tl.license_end_date__c = Date.newInstance(endDate.year(),endDate.month(),endDate.day());
					tl.licensee_email__c = license.licensee_email__c;
					tl.licensee_name__c = name;
					if (license.license_update_use_cases__c.containsIgnoreCase('Downgrading to VHM')) {
						tl.license_type__c = 'VHM';
						tl.name = 'VHM License';
					} else {
						tl.license_type__c = license.license_type__c;
						tl.name = license.license_type__c + ' License';
					}
					tl.license_key_plain_text__c = returnString;
					tl.current_license_features__c = allLicenseFeatureString;
					tl.license_creation_use_cases__c = license.license_update_use_cases__c;
					//tl.notes_from_previous_license__c = license.reason_for_update__c;
					if (license.Lead__c != null) tl.Lead__c = license.lead__c;
					if (license.Account__c != null) tl.Account__c = license.account__c;
					if (license.Opportunity__c != null) tl.Opportunity__c = license.Opportunity__c;
					tl.License_Entity__c = licenseEntity;
					if (turboEdition != null && turboEdition != 'N/A') tl.Turbonomic_Edition__c = turboEdition;
					
					tl.status__c = 'Open';
					
					
					
					if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Technical Issues)')) {
						tl.Use_Case_License_Extension_Technical__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Sales)')) {
						tl.Use_Case_License_Extension_Sales__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('License Not Sent to Customer from Download Form')) {
						tl.Use_Case_DL_Form_Fail_to_Send__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading Feature-Set')) {
						tl.Use_Case_Upgrade_Feature_Set__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Downgrading to VHM')) {
						tl.Use_Case_Downgrade_to_VHM__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Updating Socket/Core Count')) {
						tl.Use_Case_Update_Socket_Core_Count__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('NFR License')) {
						tl.Use_Case_NFR_License__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Internal Use')) {
						tl.Use_Case_Internal_Use__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Other')) {
						system.debug('### other check');
						tl.Use_Case_Other__c = true;
						if (license.other_reason__c != null) tl.Use_Case_Other_Reason__c = license.Other_reason__c;
					}
					
					
					insert tl;
			    	
			    	Turbonomic_License__c insertedLicense = [select id from Turbonomic_License__c where id =: tl.id limit 1];
			    	
			    	//clear old update License values
			    	if (license.updated_socket_count__c != null) {
			    		license.updated_socket_count__c = null;
			    	}
			    	if (license.updated_core_count__c != null) {
			    		license.updated_core_count__c = null;
			    	}
			    	if (license.updated_workload_count__c != null) {
			    		license.updated_workload_count__c = null;
			    	}
			    	if (license.updated_license_end_date__c != null) {
			    		license.updated_license_end_date__c = null;
			    	}
			    	if (license.License_Update_Use_Cases__c != null) {
			    		license.License_Update_Use_Cases__c = null;
			    	}
			    	if (license.updated_features__c != null) {
			    		license.updated_features__c = null;
			    	}
			    	if (license.other_reason__c != null) {
			    		license.other_reason__c = null;
			    	}
			    	if (license.Updated_Turbonomic_Edition__c != null) {
		    			license.Updated_Turbonomic_Edition__c = null;
		    		}
		    		if (license.Updated_License_Entity__c != null) {
		    			license.Updated_License_Entity__c = null;
		    		}
			    	license.status__c = 'Closed';
			    	license.Updated_License_ID__c = insertedLicense.id;
			    	
			    	update license;
			    	
			    	
			    	return 'A new Turbonomic ' + tl.license_type__c + ' License has been saved.';
    				
    			}
    			
    			return 'Error: please contact your SFDC admin for assistance.';
    		}
    		
    		return 'Error: please contact your SFDC admin for assistance.';
    		
    	} else if (license.license_type__c == 'VHM' || license.license_type__c == 'Freemium') {
    		
    		if (license.license_update_use_cases__c == null) {
    			
    			return 'Please fill in the License Update Use Cases field before trying to update the license.';
    			
    		} else {
    		
	    		Set<String> mainFeatures = new Set<String>();
	    		
	    		if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
	    			mainFeatures = new Set<String>{'applications','historical_data','multiple_vc','scoped_user_view','customized_views','group_editor','vmturbo_api','automated_actions','active_directory','custom_reports','optimizer','full_policy','loadbalancer','deploy','aggregation','cloud_targets','cluster_flattening','trial'};
	    			if (license.license_end_date__c == endDate) endDate = DateTime.newInstance(date.today().addDays(90),Time.newInstance(0,0,0,0));
	    		} else {
	    			mainFeatures.addAll(license.current_license_features__c.split(';'));
	    		}
	    		
		    	List<String> allFeatures = new List<String>();
		    	
		    	if (license.updated_features__c != null && license.license_update_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
		    		List<String> updatedFeatures = license.updated_features__c.split(';');
		    		for (String s : updatedFeatures) {
		    			if (!mainFeatures.contains(s)) {
		    				allFeatures.add(s);
		    			}
		    		}
		    	}
	    		allFeatures.addAll(mainFeatures);
	    		
	    		String returnString;
		    	try {
		    		//returnString = LicenseCodeGenerator.GenerateLicenseXml(firstName, lastName, email, endDate, sockets, cores, allFeatures);
		    		returnString = LicenseCodeGenerator.newGenerateLicenseXml(firstName, lastName, email, endDate, licenseEntity, entityAmount, turboEdition, allFeatures);
		    	} catch (Exception e) {
		    		returnString = 'Could not create XML - ' + e;
		    	}
		    	
		    	
		    	//create license multi-select picklist
		    	String allLicenseFeatureString = String.join(allFeatures,';'); 
				system.debug('### allLicenseFeatureString = ' + allLicenseFeatureString);
		    	
		    	//instantiate new license
		    	Turbonomic_License__c tl = new Turbonomic_License__c();
		    	if (sockets != null) tl.total_licensed_sockets__c = Integer.valueOf(sockets);
				if (cores != null) tl.total_licensed_cores__c = Integer.valueOf(cores);
				if (workloads != null) tl.total_licensed_workloads__c = Integer.valueOf(workloads);
				tl.license_end_date__c = Date.newInstance(endDate.year(),endDate.month(),endDate.day());
				tl.licensee_email__c = license.licensee_email__c;
				tl.licensee_name__c = name;
	    		if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
	    			system.debug('### eval if check');
	    			tl.license_type__c = 'Eval';
	    			tl.name = 'Eval License';
	    		} else {
	    			tl.license_type__c = license.license_type__c;
	    			tl.name = license.license_type__c;
	    		}
				tl.license_key_plain_text__c = returnString;
				tl.current_license_features__c = allLicenseFeatureString;
				//tl.notes_from_previous_license__c = license.reason_for_update__c;
				tl.license_creation_use_cases__c = license.license_update_use_cases__c;
				if (license.Lead__c != null) tl.Lead__c = license.lead__c;
				if (license.Account__c != null) tl.Account__c = license.account__c;
				if (license.Opportunity__c != null) tl.Opportunity__c = license.Opportunity__c;
				tl.status__c = 'Open';
				tl.License_Entity__c = licenseEntity;
				if (turboEdition != null && turboEdition != 'N/A') tl.Turbonomic_Edition__c = turboEdition;
				
				system.debug('### license type for converted license is ' + tl.license_type__c);
				if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Technical Issues)')) {
					tl.Use_Case_License_Extension_Technical__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Sales)')) {
					tl.Use_Case_License_Extension_Sales__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('License Not Sent to Customer from Download Form')) {
					tl.Use_Case_DL_Form_Fail_to_Send__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading Feature-Set')) {
					tl.Use_Case_Upgrade_Feature_Set__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
					tl.Use_Case_Upgrade_from_VHM_to_Eval__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('Updating Socket/Core Count')) {
					tl.Use_Case_Update_Socket_Core_Count__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('NFR License')) {
					tl.Use_Case_NFR_License__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('Internal Use')) {
					tl.Use_Case_Internal_Use__c = true;
				}
				if (license.license_update_use_cases__c.containsIgnoreCase('Other')) {
					tl.Use_Case_Other__c = true;
					if (license.other_reason__c != null) tl.Use_Case_Other_Reason__c = license.other_reason__c;
				}
				
				insert tl;
	    		
	    		Turbonomic_License__c insertedLicense = [select id from Turbonomic_License__c where id =: tl.id limit 1];
	    		
	    		//cancel out all license updated fields once finished
	    		Boolean upgrade = false;
	    		if (license.updated_socket_count__c != null) {
		    		license.updated_socket_count__c = null;
		    	}
		    	if (license.updated_core_count__c != null) {
		    		license.updated_core_count__c = null;
		    	}
		    	if (license.updated_workload_count__c != null) {
			    	license.updated_workload_count__c = null;
			    }
		    	if (license.updated_license_end_date__c != null) {
		    		license.updated_license_end_date__c = null;
		    	}
		    	if (license.updated_features__c != null) {
		    		license.updated_features__c = null;
		    	}
		    	if (license.License_Update_Use_Cases__c != null) {
		    		if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading VHM to Eval')) {
		    			upgrade = true;
		    		}
		    		license.license_update_use_cases__c = null;
		    	}
		    	if (license.other_reason__c != null) {
		    		license.other_reason__c = null;
		    	}
		    	if (license.Updated_Turbonomic_Edition__c != null) {
		    			license.Updated_Turbonomic_Edition__c = null;
		    	}
		    	if (license.Updated_License_Entity__c != null) {
		    		license.Updated_License_Entity__c = null;
		    	}
		    	
		    	license.Updated_License_ID__c = insertedLicense.id;
		    	update license;
		    	
		    	if (upgrade) return 'The VHM License was successfully updated to an Eval license';
		    	else return 'VHM license was successfully updated';
    		}
    		
    		return 'Error: please contact your SFDC admin for assistance.';
    		
    	} else if (license.license_type__c == 'Commercial'){
    		
    		if (UserInfo.getUserRoleId() != '00ED0000001P92nMAC' && UserInfo.getUserRoleId() != '00ED0000001QuNyMAK') {

    			return 'Only Finance may make updates to commercial licenses.';
    			
    		} else {
		    	
		    	if (license.License_Update_Use_Cases__c == null) {
		    		return 'Please fill in the License Update Use Cases field before updating the license.';
		    	} else {
		    		List<String> allFeatures = new List<String>();
		    		if (license.current_license_features__c != null) {
				    	Set<String> currentFeatures = new Set<String>(license.current_license_features__c.split(';'));
				    	
				    	if (license.updated_features__c != null) {
				    		List<String> updatedFeatures = license.updated_features__c.split(';');
				    		for (String s : updatedFeatures) {
				    			if (!currentFeatures.contains(s)) {
				    				currentFeatures.add(s);
				    			}
				    		}
				    	}
				    	allFeatures.addAll(currentFeatures);
		    		} else {
		    			return 'Error: the license does not have any features. Please contact your system administrator.';
		    		}
			    	
			    	//generate license
			    	String returnString;
			    	try {
			    		//returnString = LicenseCodeGenerator.GenerateLicenseXml(firstName, lastName, email, endDate, sockets, cores, allFeatures);
			    		returnString = LicenseCodeGenerator.newGenerateLicenseXml(firstName, lastName, email, endDate, licenseEntity, entityAmount, turboEdition, allFeatures);
			    		System.debug('********************Updated License Reached here');
			    	} catch (Exception e) {
			    		returnString = 'Could not create XML - ' + e;
			    	}
			    	
			    	//create license multi-select picklist
			    	String allLicenseFeatureString = String.join(allFeatures,';');
			    	
			    	//enter in newly updated license data
			    	Turbonomic_License__c tl = new Turbonomic_License__c();
					if (sockets != null) tl.total_licensed_sockets__c = Integer.valueOf(sockets);
					if (cores != null) tl.total_licensed_cores__c = Integer.valueOf(cores);
					if (workloads != null) tl.total_licensed_workloads__c = Integer.valueOf(workloads);
					tl.license_end_date__c = Date.newInstance(endDate.year(),endDate.month(),endDate.day());
					tl.licensee_email__c = license.licensee_email__c;
					tl.licensee_name__c = name;
					tl.license_type__c = license.license_type__c;
					tl.name = license.license_type__c + ' License: Created ' + String.valueOf(DateTime.now());
					tl.license_key_plain_text__c = returnString;
					tl.current_license_features__c = allLicenseFeatureString;
					//tl.notes_from_previous_license__c = license.reason_for_update__c;
					if (license.Lead__c != null) tl.Lead__c = license.lead__c;
					if (license.Account__c != null) tl.Account__c = license.account__c;
					if (license.Opportunity__c != null) tl.Opportunity__c = license.Opportunity__c;
					tl.status__c = 'Open';
					tl.license_creation_use_cases__c = license.license_update_use_cases__c;
					tl.License_Entity__c = licenseEntity;
					if (turboEdition != null && turboEdition != 'N/A') tl.Turbonomic_Edition__c = turboEdition;
					
					if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Technical Issues)')) {
						tl.Use_Case_License_Extension_Technical__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('License Extension (Sales)')) {
						tl.Use_Case_License_Extension_Sales__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Upgrading Feature-Set')) {
						tl.Use_Case_Upgrade_Feature_Set__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Updating Socket/Core Count')) {
						tl.Use_Case_Update_Socket_Core_Count__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Internal Use')) {
						tl.Use_Case_Internal_Use__c = true;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Other')) {
						tl.Use_Case_Other__c = true;
						if (license.other_reason__c != null) tl.Use_Case_Other_Reason__c = license.other_reason__c;
					}
					if (license.license_update_use_cases__c.containsIgnoreCase('Commercial License Creation')) {
						tl.use_case_commercial_license_creation__c = true;
					}
					
					insert tl;
			    	
			    	Turbonomic_License__c insertedLicense = [select id from Turbonomic_License__c where id =: tl.id limit 1];
			    	
			    	
			    	//clear old update License values
			    	if (license.updated_socket_count__c != null) {
			    		license.updated_socket_count__c = null;
			    	}
			    	if (license.updated_core_count__c != null) {
			    		license.updated_core_count__c = null;
			    	}
			    	if (license.updated_workload_count__c != null) {
			    		license.updated_workload_count__c = null;
			    	}
			    	if (license.updated_license_end_date__c != null) {
			    		license.updated_license_end_date__c = null;
			    	}
			    	if (license.license_update_use_cases__c != null) {
			    		license.license_update_use_cases__c = null;
			    	}
			    	if (license.updated_features__c != null) {
			    		license.updated_features__c = null;
			    	}
			    	if (license.other_reason__c != null) {
			    		license.other_reason__c = null;
			    	}
			    	if (license.Updated_Turbonomic_Edition__c != null) {
		    			license.Updated_Turbonomic_Edition__c = null;
		    		}
		    		if (license.Updated_License_Entity__c != null) {
		    			license.Updated_License_Entity__c = null;
		    		}
			    	license.status__c = 'Closed';
			    	license.Updated_License_ID__c = insertedLicense.id;
			    	update license;
			    	
			    	
			    	return 'A new Turbonomic Commercial License has been saved.';
	    		}
	    		
	    		return 'Error: please contact your SFDC admin for assistance.';
	    		
    		}
    		
    		return 'Error: please contact your SFDC admin for assistance.';
    		
    	}
    	
    	return 'Error: please contact your SFDC admin for assistance.';
    	
	}
}