public class ClickToDialController{
	
	//String variables used in the VF Page
	public String selectCallerId {get; set;}
	public String selectedStationId {get; set;}
  	public String userCusSettingCallerId {get; set;}
  	public String userCallerId {get; set;}

	//REST method to make Click2Call on Salesforce page
  	public static void getCallResponse(String phoneNumber){
	    String url;
	    /*String phoneNumber;
	    if(res != null){
	        System.debug('This is the response: '+res);
	        Util_JSONParser parser = Util_JSONParser.createParser(res);
	        phoneNumber = parser.get('number').value;
	    }*/
	    System.debug(phoneNumber);
	    phoneNumber = processPhoneNumber(phoneNumber);
	    url = urlBuilder(phoneNumber);
	    getCalloutResponseContents(url);
  	}

  	public static void getPhonenumber(String phone){
    	System.debug('VF Page debug '+phone);
    	getCalloutResponseContents(urlBuilder(phone));
  	}

  	//This method would process the Phone number removing the extra characters like --> (* ext x - +)
	public static String processPhoneNumber(String phoneNumber){

		//String preFix = ClickToDail_CusUserDefCallerId__c.getInstance(userInfo.getUserId()).CallerIdPrefix__c;
		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());

		if(!phoneNumber.startsWith('+')){
  			phoneNumber = '1'+phoneNumber.replaceAll('[^0-9]', '');
  			phoneNumber = phoneNumber.subString(0,11);
		}
		else if(phoneNumber.startsWith('+1')){
			phoneNumber = phoneNumber.replaceAll('[^0-9]', '');
			phoneNumber = phoneNumber.subString(0,11);
		}
  		else if(phoneNumber.startsWith('+')){
  			if(phoneNumber.contains('x')){
  				phoneNumber = phoneNumber.replaceAll('[^(0-9,"x")]', '');
  				phoneNumber = phoneNumber.substring(0,phoneNumber.indexOf('x'));
  			} 
  			else
				phoneNumber = phoneNumber.replaceAll('[^0-9]', '');
  		}

  		System.debug(phoneNumber);

		if(userCusSettingInfoObj.SelectedCallerIdPrefix__c != null)
			phoneNumber = userCusSettingInfoObj.SelectedCallerIdPrefix__c+phoneNumber;
		else
			phoneNumber = userCusSettingInfoObj.DefaultCallerIdPrefix__c+phoneNumber;

		return phoneNumber;
	}

	//Method to build the REST Callout URL
	public static String urlBuilder(String phoneNumber){
		String url;
		String stationPhNum;

		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());

		//If Condition --> for setting the Station phone to be called --> Cell or Desk depending upon the Custom setting value-IsMakeCallOnMobPhone__c
		
		if((userCusSettingInfoObj.ExtensionMobilePhone__c != null && userCusSettingInfoObj.IsMakeCallOnMobPhone__c && userCusSettingInfoObj.Extension__c != null) || 
			(userCusSettingInfoObj.ExtensionMobilePhone__c != null && userCusSettingInfoObj.Extension__c == null)) {
			stationPhNum = userCusSettingInfoObj.ExtensionMobilePhone__c;
			stationPhNum = stationPhNum.replaceAll('[^0-9]', '');
		}
		else
			stationPhNum = UserExtension__c.getInstance(userInfo.getUserId()).Extension__c;

		url = AsteriskClickToDailCS__c.getInstance('clicktocall').PbxURL__c+'endpoint=local/'+stationPhNum+'@from-internal&extension='+phoneNumber;
		url = url+'&context='+AsteriskClickToDailCS__c.getInstance('clicktocall').Context__c+'&timeout='+AsteriskClickToDailCS__c.getInstance('clicktocall').timeout__c;
		url = url+'&api_key='+AsteriskClickToDailCS__c.getInstance('clicktocall').api_key__c;

		return url;
	}

	//Method for calling REST Callout and return the RESPONSE
	public static String getCalloutResponseContents(String url) {
		// Instantiate a new http object
		Http h = new Http();

		//String test = 'http://ep.vmturbo.com:8088/ari/channels?endpoint=PJSIP%2F1703&app=bridge-dial&timeout=30&api_key=heynow:heynow&endPointKey=PJSIP/1702';

		 // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		req.setEndpoint(url);
		req.setMethod('POST');

		// Send the request, and return a response
		HttpResponse res = h.send(req);
		System.debug(res.getBody());
		System.debug(res.getStatusCode());
		if(res.getStatusCode() != 200){
			sendEmailForError(res.getStatusCode(),res.getBody());
		}
		return res.getBody();
	}

	//Method to return list of Custom Caller Id picklist values
	public list<SelectOption> getCustomCallerIds(){
		list<SelectOption> callerIdSelectOptionList = new list<SelectOption>();
		//List of Custom Setting Caller Id values from the Custom Setting -> ClickToDial_CustomCallerId__c
		list<ClickToDial_CustomCallerId__c> callerIdCSList = ClickToDial_CustomCallerId__c.getAll().values();
		callerIdCSList.sort();

		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());

		//Condition to get the value of User Selected Caller Id
		if(userCusSettingInfoObj.SelectedCallerIdPrefix__c != null)
			userCusSettingCallerId = UserExtension__c.getInstance(userInfo.getUserId()).SelectedCallerId__c;

		callerIdSelectOptionList.add(new SelectOption('', 'Select a Caller Id'));

		/*
		Default Caller Id -> Defines a user default Caller Id such as his Desk phone's caller Id
		Condition to check the Default Caller Id value and adding it to the list<SelectOption>
		*/
		if(userCusSettingInfoObj.DefaultCallerIdPrefix__c != null)
			//callerIdSelectOptionList.add(new SelectOption(userCusSettingInfoObj.DefaultCallerIdPrefix__c+';'+userCusSettingInfoObj.DefaultCallerId__c, UserInfo.getName()+' - '+userCusSettingInfoObj.DefaultCallerIdPrefix__c));
			callerIdSelectOptionList.add(new SelectOption(getSelectOptionValue(userCusSettingInfoObj.DefaultCallerIdPrefix__c,userCusSettingInfoObj.DefaultCallerId__c), getSelectOptionLabel(UserInfo.getName(),userCusSettingInfoObj.DefaultCallerIdPrefix__c)));

		/*
		Alternate Caller Id -> Defines a user's personal Caller Id in addition to his Desk Phone such as a Cell Phone or any alternate Caller Id
		Condition to check the alternate caller value and adding adding to the list<SelectOption> 
		*/
		if(userCusSettingInfoObj.AlternateCallerIdPrefix__c != null){
			list<String> asternateCallerIdsList = new list<String>();
			asternateCallerIdsList = userCusSettingInfoObj.AlternateCallerIdPrefix__c.split(',',5);
			for(String callerId: asternateCallerIdsList)
				callerIdSelectOptionList.add(new SelectOption(getSelectOptionValue(callerId,callerId), getSelectOptionLabel(UserInfo.getName(),callerId)));
		}
				
		/*
		Custom Caller Id -> Defines list of public caller id's available to all the users such as Each states(s) local precense number Ex., San Jose, CA - 408-***-****
		Looping through the list of available callerd id and adding it to the list<SelectOption>
		*/
		for(ClickToDial_CustomCallerId__c callCSObj: callerIdCSList)
		  callerIdSelectOptionList.add(new SelectOption(getSelectOptionValue(callCSObj.Prefix__c,callCSObj.CallerId__c), getSelectOptionLabel(callCSObj.Name,callCSObj.Prefix__c)));

		return callerIdSelectOptionList; 
	}

	//Action fuction on the VF Page - ClickToDialPage to select a Caller Id and update the value to the respective CallerId Custom Setting record
	public void updateCusSettingCallerId(){
		System.debug('in the method updateCusSettingCallerId');
		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());
		String preFix = userCusSettingInfoObj.SelectedCallerIdPrefix__c;

		if(selectCallerId != null){
			list<String> selectedCallerIdList = new String[2];
			selectedCallerIdList = selectCallerId.split(';',5);

			userCusSettingInfoObj.SelectedCallerIdPrefix__c = selectedCallerIdList.get(0);
			userCusSettingInfoObj.SelectedCallerId__c = selectedCallerIdList.get(1);

			update userCusSettingInfoObj;
		}
	}

	//Method to return list of available station id's such as Desk or Cell phone on the VF Page - ClickToDialPage
	public list<SelectOption> getCustomStationIds(){
		list<SelectOption> stationIdSelectOptionList = new list<SelectOption>();
		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());

		String deskPhoneStr = 'Desk: ';
		String cellPhoneStr = 'Cell:';
		
		//the <SelectOption> value is set to True or False to convert it to a Boolean value for the Custom setting - UserExtension__c.IsMakeCallOnMobPhone__c
		if(userCusSettingInfoObj.ExtensionMobilePhone__c == null){
			stationIdSelectOptionList.add(new SelectOption('false',deskPhoneStr+userCusSettingInfoObj.Extension__c));
		} else if(userCusSettingInfoObj.ExtensionMobilePhone__c != null && userCusSettingInfoObj.IsMakeCallOnMobPhone__c && userCusSettingInfoObj.Extension__c != null){
			stationIdSelectOptionList.add(new SelectOption('true',cellPhoneStr+userCusSettingInfoObj.ExtensionMobilePhone__c));
			stationIdSelectOptionList.add(new SelectOption('false',deskPhoneStr+userCusSettingInfoObj.Extension__c));
		} else if(userCusSettingInfoObj.ExtensionMobilePhone__c != null && userCusSettingInfoObj.Extension__c == null){
			stationIdSelectOptionList.add(new SelectOption('true',cellPhoneStr+userCusSettingInfoObj.ExtensionMobilePhone__c));
		} else {
			stationIdSelectOptionList.add(new SelectOption('false',deskPhoneStr+userCusSettingInfoObj.Extension__c));
			stationIdSelectOptionList.add(new SelectOption('true',cellPhoneStr+userCusSettingInfoObj.ExtensionMobilePhone__c));
		}

		return stationIdSelectOptionList;
	}

	/*
	Action function method on VF Page - ClickToDialPage to update the Station Id selected by the User
	Logic is when user selects his Cell Phone as Station Id the Custom Setting UserExtension__c.IsMakeCallOnMobPhone__c is set to TRUE else it is set as FALSE
	*/
	public void updateStationId(){
		System.debug('in the update Station Id **********(((((((())))))))))*********'+selectedStationId);
		UserExtension__c userCusSettingInfoObj = UserExtension__c.getInstance(userInfo.getUserId());
		userCusSettingInfoObj.IsMakeCallOnMobPhone__c = Boolean.valueOf(selectedStationId);

		System.debug('before update');

		update userCusSettingInfoObj;
	}

	//Method to create SelectOption value with the provided parameters and it is seperated with semi-colon ';'
	public static String getSelectOptionValue(String preFix, String callerId){
		String selectOptionValueString = preFix+';'+callerId;
		return selectOptionValueString;
	}

	//Method to create SelectOption label with the provided parameters and it is seperated with hyphen '-'
	public static String getSelectOptionLabel(String name, String preFix){
		String selectOptionLabelString = name+'-'+preFix;
		return selectOptionLabelString;
	}

	//Method to send out an Email with the Response Error by getting Email Id's from the Custom Setting - AsteriskClickToDailCS__c.ErrorHandlerToEmail__c
	public static void sendEmailForError(Integer statusCode, String resString){
		System.debug('in the send email for error');
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new list<String>();
		toAddresses = AsteriskClickToDailCS__c.getInstance('clicktocall').ErrorHandlerToEmail__c.split(',',5);
		mail.setToAddresses(toAddresses);
		mail.setSubject('Error on Click to Dial :'+UserInfo.getName()+';'+UserInfo.getUserId());
		mail.setPlainTextBody('There was a an error on click to Dial \nStatus Code:'+statusCode+'\nResponse Error:'+resString);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
	}
}