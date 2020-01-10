global class OktaIntegrationClass {
	
	webservice static void createUser(id conId, String groupId) {
		
		Contact con = [select id, firstName, lastName, email, phone, accountId, PRMImport_c__c from Contact where id =: conId limit 1];
		
		
		//String body = '{\"profile\": {\"firstName\": \"' + con.firstName + '\",\"lastName\":\"' + con.lastName + '\",\"email\":\"' + con.email + '\",\"login\":\"' + con.email + '\",\"primaryPhone\":\"' +
		//				con.phone + '\",\"sfdcPartnerId\":\"' + con.accountId + '\",\"sfdcVendorId\":\"' + '00D20000000JhbeEAC' + '\"}}';
		//system.debug(body);
		Boolean updateCon = false;
		
		
		JSONGenerator generator = JSON.createGenerator(true);
		generator.writeStartObject();	generator.writeFieldName('profile');
			generator.writeStartObject();
				generator.writeObjectField('firstName',con.firstName);
				generator.writeObjectField('lastName',con.lastName);
				generator.writeObjectField('email',con.email);
				generator.writeObjectField('login',con.email);
				generator.writeObjectField('primaryPhone',con.phone);
				if (groupId == '00g4nra5c8Nx73YYK0x7') generator.writeObjectField('sfdcPartnerId',con.AccountId);
				generator.writeObjectField('sfdcVendorId','00D20000000JhbeEAC');
			generator.writeEndObject(); generator.writeEndObject();
		//system.debug(generator.getAsString());
		
		HttpRequest req = new HttpRequest();
		Http h = new Http();
		HttpResponse resp = new HttpResponse();
		
		req.setEndpoint('https://vmturbo.okta.com/api/v1/users?activate=true');
		req.setHeader('Content-Type','application/json');
		req.setHeader('Authorization','SSWS 00YMUTcw5mjyxs1dMqv0VVMqvj1_a1AwhiI7NqUTt0');
		req.setHeader('Accept','application/json');
		req.setMethod('POST');
		req.setBody(generator.getAsString());
		//req.setBody(generator);
		
		try {
			resp = h.send(req);
			if (groupId == '00g4nra5c8Nx73YYK0x7') updateCon = true;
		} catch (System.CalloutException e) {
			system.debug('Callout error: ' + e);
			system.debug(resp.toString());
		}
		
		system.debug(resp.getBody());
		
		HttpResponse resp2 = new HttpResponse();
		HttpRequest req2 = new HttpRequest();
		
		req2.setEndpoint('https://vmturbo.okta.com/api/v1/users/' + con.email);
		req2.setHeader('Content-Type','application/json');
		req2.setHeader('Authorization','SSWS 00YMUTcw5mjyxs1dMqv0VVMqvj1_a1AwhiI7NqUTt0');
		req2.setHeader('Accept','application/json');
		req2.setMethod('GET');
		
		try {
			resp2 = h.send(req2);
		} catch (System.CalloutException e) {
			system.debug('Callout error: ' + e);
			system.debug(resp2.toString());
		}
		
		String responseString = resp2.getBody();
		
		system.debug(resp2.getBody());
//		String userId;
		
/*		
		System.JSONParser parser = JSON.CreateParser(responseString);
		while (parser.nextToken() != null) {
			if (parser.getCurrentToken() == 'id') {
				userId = parser.getCurrentValue();
			}
		}
*/
		
		Util_JSONParser parser = Util_JSONParser.createParser(responseString);
		String userId = parser.get('id').value;	
		
		HttpRequest req3 = new HttpRequest();
		HttpResponse resp3 = new HttpResponse();
		
		req3.setEndpoint('https://vmturbo.okta.com/api/v1/groups/'+groupId+'/users/' + userId);
		req3.setHeader('Content-Type','application/json');	
		req3.setHeader('Authorization','SSWS 00YMUTcw5mjyxs1dMqv0VVMqvj1_a1AwhiI7NqUTt0');
		req3.setHeader('Accept','application/json');
		req3.setMethod('PUT');
		
		try {
			resp3 = h.send(req3);
		} catch (System.CalloutException e) {
			system.debug('Callout error: ' + e);
			system.debug(resp3.toString());
			system.debug(resp3.getBody());
		}
		
		if (updateCon) { 
			con.PRMImport_c__c = true;
			update con;
		}
		
	}

}