@isTest(SeeAllData=true)
private class ClickToDialController_Test{

	static testMethod void testClickToDial(){
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
		
		String phoneNumber = '(415) 787-4867';
		ClickToDialController.getCallResponse(phoneNumber);

		String phoneNumber2 = '+1 (415) 787-3747';
		ClickToDialController.getCallResponse(phoneNumber2);

		String phoneNumber3 = '+44 20 7723 1234';
		ClickToDialController.getCallResponse(phoneNumber3);

		String phoneNumber4 = '+44 20 7723 1234 x 1212';
		ClickToDialController.getCallResponse(phoneNumber4);
	}

	static testMethod void testClickToDialController_getCustomCallerIds(){
		ClickToDialController testController = new ClickToDialController();

		testController.getCustomCallerIds();
		testController.getCustomStationIds();
	}

	static testMethod void testClickToDialController_updateCusSettingCallerId(){
		ClickToDialController testController = new ClickToDialController();

		testController.selectCallerId = '*617;Boston MA';
		testController.updateCusSettingCallerId();
	}

	static testMethod void testClickToDialController_updatedStationId(){
		ClickToDialController testController = new ClickToDialController();

		testController.selectedStationId = 'true';
		testController.updateStationId();
	}

	static testMethod void testClickToDialController_getPhonenumber(){
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

		String phoneNumber = '4157871234';
		ClickToDialController.getPhonenumber(phoneNumber);
	}
}