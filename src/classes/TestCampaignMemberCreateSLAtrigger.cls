/**
 * This class contains unit tests for validating the CampaignMemberCreateSLAtrigger
 * 
 */
@isTest
private class TestCampaignMemberCreateSLAtrigger {

    static testMethod void myUnitTest() {
        
		List<Account> acctInsert = new List<Account>();
		List<Lead> ldInsert = new List<Lead>();
		List<Contact> conInsert = new List<Contact>();
		List<Campaign> campaignInsert = new List<Campaign>();
		List<CampaignMember> cmInsert = new List<CampaignMember>();
		List<SLA__c> slaInsert = new List<SLA__c>();
		
		List<Time_Zone_Offset__c> timeZoneCS = new List<Time_Zone_Offset__c>();
    	Time_Zone_Offset__c emeaCS = new Time_Zone_Offset__c(Name = 'EMEA' , GMT_Offset__c = 1);
    	Time_Zone_Offset__c usCS = new Time_Zone_Offset__c(Name = 'NORAM' , GMT_Offset__c = -4);
    	timeZoneCS.add(emeaCS); timeZoneCS.add(usCS); 
    	insert timeZoneCS;		
		
		//Create Accounts
	    Account acct1 = new Account(Name = 'Acct1', AE_Rep__c = UserInfo.getUserId());
	    Account acct2 = new Account(Name = 'Acct2');
	    
	    acctInsert.add(acct1); acctInsert.add(acct2);
	    insert acctInsert;
	    
	    //Create leads
	    
	    //Create contacts
        Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id, MailingCountry = 'United States', Latest_Web_Form_Fill__c = 'VHM', mkto71_Lead_Score__c = 70);
		Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct1.id, MailingCountry = 'United Kingdom', Latest_Web_Form_Fill__c = 'Inbound Whitepaper');
		Contact con3 = new Contact(FirstName = 'Contact', LastName = 'Three', AccountId = acct1.id, MailingCountry = 'Canada');
		Contact con4 = new Contact(FirstName = 'Contact', LastName = 'Four', AccountId = acct2.id, MailingCountry = 'Belgium');
        Contact con5 = new Contact(FirstName = 'Contact', LastName = 'Five', AccountId = acct2.id, MailingCountry = 'Romania');
		Contact con6 = new Contact(FirstName = 'Contact', LastName = 'Six', AccountId = acct2.id, MailingCountry = 'Spain');
		
		conInsert.add(con1); conInsert.add(con2); conInsert.add(con3); conInsert.add(con4); conInsert.add(con5); conInsert.add(con6);
		insert conInsert;
		
		//Create Leads
		Lead lead1 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', mkto71_Lead_Score__c = 30);
        Lead lead2 = new Lead(Account__c = acct1.id, FirstName = 'Lead', lastName = 'Two', company = 'Acct1', leadSource = 'Tradeshow', Status = 'New', Country = 'Germany');
        Lead lead3 = new Lead(Account__c = acct2.id, FirstName = 'Lead', lastName = 'Three', company = 'Acct2', leadSource = 'Channel', Status = 'New', Country = 'South Africa');
        Lead lead4 = new Lead(Account__c = acct2.id, FirstName = 'Lead', lastName = 'Four', company = 'Acct2', leadSource = 'Third Party', Status = 'New', Country = 'Portugal');
        Lead lead5 = new Lead(FirstName = 'Lead', lastName = 'Five', company = 'Acct3', leadSource = 'Inbound - Other', Status = 'New', Latest_Web_Form_Fill__c = 'Webinar');
        Lead lead6 = new Lead(FirstName = 'Lead', lastName = 'Six', company = 'Acct3', leadSource = 'Tradeshow', Status = 'New', Country = 'United States', State = 'Colorado',Territory_Owner_Lead__c = UserInfo.getUserId());
        Lead lead7 = new Lead(Account__c = acct2.id, FirstName = 'Lead', lastName = 'Seven', company = 'Acct2', leadSource = 'Third Party', Status = 'New', Country = 'Portugal');
        
        
		ldInsert.add(lead1); ldInsert.add(lead2); ldInsert.add(lead3); ldInsert.add(lead4); ldInsert.add(lead5); ldInsert.add(lead6); ldInsert.add(lead7);
        insert ldInsert;
        
        //Create Campaigns
        Campaign c1 = new Campaign(Name = 'INB: Website', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); //SLA eligible campaign
        campaignInsert.add(c1);
        Campaign c2 = new Campaign(Name = 'DO Prospecting', IsActive = true, Status = 'In Progress'); 
        campaignInsert.add(c2);
        Campaign c3 = new Campaign(Name = 'INB: Webinar', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); //SLA eligible campaign
        campaignInsert.add(c3);
        
        insert campaignInsert;
        
        SLA__c sla1 = new SLA__c(Campaign__c = c3.id, Contact__c = con1.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(2), Web_Form_Fill__c = 'Other');
        slaInsert.add(sla1);
        SLA__c sla2 = new SLA__c(Campaign__c = c3.id, Contact__c = con2.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(5), Web_Form_Fill__c = '3pt Whitepaper');
        slaInsert.add(sla2);
        SLA__c sla3 = new SLA__c(Campaign__c = c3.id, lead__c = lead1.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now());
        slaInsert.add(sla3);
        SLA__c sla4 = new SLA__c(Campaign__c = c3.id, lead__c = lead2.id, SLA_Status__c = 'Open', Expiration_Date__c = system.now().addDays(29));
        slaInsert.add(sla4);
        
        insert slaInsert;
        
        //Insert CampaignMembers
        CampaignMember cm1 = new CampaignMember(CampaignId = c1.id, ContactId = con1.id, Status = 'Responded');
        CampaignMember cm2 = new CampaignMember(CampaignId = c2.id, ContactId = con2.id, Status = 'Responded');        
        CampaignMember cm3 = new CampaignMember(CampaignId = c1.id, ContactId = con3.id, Status = 'Responded'); 
        CampaignMember cm4 = new CampaignMember(CampaignId = c1.id, ContactId = con4.id, Status = 'Responded');         
        CampaignMember cm5 = new CampaignMember(CampaignId = c1.id, ContactId = con5.id, Status = 'Responded');         
        CampaignMember cm6 = new CampaignMember(CampaignId = c1.id, ContactId = con6.id, status = 'Sent');         
        CampaignMember cm7 = new CampaignMember(CampaignId = c1.id, LeadId = lead1.id, Status = 'Responded');         
        CampaignMember cm8 = new CampaignMember(CampaignId = c2.id, LeadId = lead2.id, Status = 'Responded');         
        CampaignMember cm9 = new CampaignMember(CampaignId = c1.id, LeadId = lead3.id, Status = 'Responded');         
        CampaignMember cm10 = new CampaignMember(CampaignId = c1.id, LeadId = lead4.id, Status = 'Responded');         
        CampaignMember cm11 = new CampaignMember(CampaignId = c1.id, LeadId = lead5.id, Status = 'Responded');         
        CampaignMember cm12 = new CampaignMember(CampaignId = c3.id, LeadId = lead6.id, Status = 'Responded');         
        CampaignMember cm13 = new CampaignMember(CampaignId = c3.id, LeadId = lead7.id, Status = 'Sent');
        
        cmInsert.add(cm1); cmInsert.add(cm2); cmInsert.add(cm3); cmInsert.add(cm4); cmInsert.add(cm5);
        cmInsert.add(cm6); cmInsert.add(cm7); cmInsert.add(cm8); cmInsert.add(cm9); cmInsert.add(cm10);
        cmInsert.add(cm11); cmInsert.add(cm12);
        insert cmInsert;
        
        cmInsert.clear();
        
        CampaignMember cm14 = [SELECT id, status FROM CampaignMember WHERE ContactId =: con6.id LIMIT 1];
        cm14.status = 'Responded'; 
        update cm14;
        
        CampaignMember cm15 = new CampaignMember(CampaignId = c3.id, ContactId = con6.id, Status = 'Responded');         
        CampaignMember cm16 = new CampaignMember(CampaignId = c1.id, LeadId = lead6.id, Status = 'Responded');
         
        cmInsert.add(cm15); cmInsert.add(cm16);
        
        insert cmInsert;
        
        //List<Contact> conQuery = new List<Contact>([SELECT id, name from Contact where id =: con1.id OR id =: con2.id OR id =: con3.id OR id =: con4.id OR id =: con5.id OR id =: con6.id]);
        //List<Lead> leadQuery = new List<Lead>([SELECT id, name FROM lead WHERE id =: lead1.id OR id =: lead2.id OR id =: lead3.id OR id =: lead4.id OR id =: lead5.id OR id =: lead6.id]);
        //List<Campaign> campaignQuert = new List<Campaign>([SELECT id FROM Campaign WHERE id =: c1.id OR id =: c2.id OR id =: c3.id]);
        
        List<SLA__c> slaAssert = new List<SLA__c>([SELECT id, lead__c, contact__c, SLA_Status__c, Close_Date__c, expiration_date__c,Rapid_Response_Eligible__c, Bizible_Medium__c, Web_Form_Fill__c, Campaign__c, Original_Lead_Contact_Owner__c, Original_Lead_Contact_Territory_Owner__c, SLA_1_Due_Date__c, Lead_Score_Stamped__c FROM SLA__c WHERE Campaign__c =: c1.id or Campaign__c =: c2.id or Campaign__c =: c3.id]);
        
        Map<Id,List<SLA__c>> slaMemberAssertMap = new Map<Id,List<SLA__c>>();
        for (SLA__c s : slaAssert) {
        	//if (s.SLA_Status__c == 'Open') {
	        	if(s.Campaign__c != null) {
	        		if (s.Contact__c != null) {
	        			if (slaMemberAssertMap.containsKey(s.Contact__c)) {
	        				List<SLA__c> tempList = slaMemberAssertMap.get(s.Contact__c);
	        				tempList.add(s);
	        				slaMemberAssertMap.put(s.Contact__c,tempList);
	        			}
	        			else {
	        				List<SLA__c> tempList = new List<SLA__c>();
	        				tempList.add(s);
	        				slaMemberAssertMap.put(s.Contact__c,tempList);
	        			}
	        		}
	        		else if (s.Lead__c != null) {
	        			if (slaMemberAssertMap.containsKey(s.Lead__c)) {
	        				List<SLA__c> tempList = slaMemberAssertMap.get(s.Lead__c);
	        				tempList.add(s);
	        				slaMemberAssertMap.put(s.Lead__c,tempList);
	        			}
	        			else {
	        				List<SLA__c> tempList = new List<SLA__c>();
	        				tempList.add(s);
	        				slaMemberAssertMap.put(s.Lead__c,tempList);
	        			}
	        		}
	        	}
        	//}
        }
        
        System.assertEquals(slaMemberAssertMap.containskey(con1.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(con2.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(con3.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(con4.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(con5.id),false);
        System.assertEquals(slaMemberAssertMap.containskey(con6.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead1.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead2.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead3.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead4.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead5.id),false);
        System.assertEquals(slaMemberAssertMap.containskey(lead6.id),true);
        System.assertEquals(slaMemberAssertMap.containskey(lead7.id),false);
        
        for (Id personId : slaMemberAssertMap.keySet()) {
        	if (personId == con1.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 2);
        	else if (personId == con2.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == con3.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == con4.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == con6.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 2); 
        	else if (personId == lead1.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 2);
        	else if (personId == lead2.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == lead3.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == lead4.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 1);
        	else if (personId == lead6.id) System.assertEquals(slaMemberAssertMap.get(personId).size(), 2);
        }
        
        Boolean workHoursEMEA; Boolean workHoursUS;
        DateTime currTime = system.now();
        Integer currHour = currTime.hourGMT();
        Integer currMin = currTime.minute();
        String dayOfWeek = currTime.formatGMT('EEE');
        
        Map<String, Time_Zone_Offset__c> gmtOffSetMap = Time_Zone_Offset__c.getall();
        
        Integer emeaHour; Integer usHour;
        Integer emeaOffset = (Integer) gmtOffSetMap.get('EMEA').GMT_Offset__c; 
        Integer usOffset = (Integer) gmtOffSetMap.get('NORAM').GMT_Offset__c;
        
        if (currHour + emeaOffset < 0) emeaHour = 24 + currHour + emeaOffset;
		else emeaHour = currHour + emeaOffset;
		
		if (currHour + usOffset < 0) usHour = 24 + currHour + usOffset;
		else usHour = currHour + usOffset;
        
        if ((emeaHour > 7 && emeaHour < 16) || (emeaHour == 16 && currMin <= 30)) workHoursEMEA = true; else workHoursEMEA = false;
        if ((usHour > 7 && usHour < 16) || (usHour == 16 && currMin <= 30)) workHoursUS = true; else workHoursUS = false;
        
        Date slaDueDateEMEA = date.today(); Date slaDueDateUS = date.today();
        
        if (emeaHour > 16 || dayOfWeek == 'Sat' || dayOfWeek == 'Sun') slaDueDateEMEA = SLAMethods.AdjustedSLATime(currTime, emeaOffset).date();
        if (usHour > 16 || dayOfWeek == 'Sat' || dayOfWeek == 'Sun') slaDueDateUS = SLAMethods.AdjustedSLATime(currTime, usOffset).date();        
         
        for (SLA__c s : slaAssert) {
        	if (s.SLA_Status__c == 'Open') {
	        	if (s.Contact__c == con1.id) {
	        		system.assertEquals(s.Expiration_Date__c.Date(), System.now().addDays(30).Date());
	        		system.assertEquals(s.Web_Form_Fill__c,'VHM');
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		//system.assertEquals(s.Rapid_Response_Eligible__c, workHoursUS);
	        		system.assert(s.Original_Lead_Contact_Owner__c != null);
	        		system.assert(s.Original_Lead_Contact_Territory_Owner__c != null);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateUS);
	        		system.assertEquals(s.Lead_Score_Stamped__c, 70);
	        		
	        	}
	        	else if (s.Contact__c == con2.id) {
	        		system.assertEquals(s.Expiration_Date__c.Date(), date.today().addDays(5));
	        		system.assertEquals(s.Web_Form_Fill__c,'3pt Whitepaper');
	        		system.assertEquals(s.Campaign__c,c3.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, false);
	        	}
	        	else if (s.Contact__c == con3.id) {
	        		system.assertEquals(s.Expiration_Date__c.Date(), System.now().addDays(30).Date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		//system.assertEquals(s.Rapid_Response_Eligible__c, workHoursUS);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateUS);
	        	}
	        	else if (s.Contact__c == con4.id) {
	        		system.assertEquals(s.Expiration_Date__c.Date(), System.now().addDays(30).Date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, workHoursEMEA);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateEMEA);
	        	}
	        	else if (s.Contact__c == con6.id) {
	        		system.assertEquals(s.Expiration_Date__c.Date(), System.now().addDays(30).Date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c3.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, workHoursEMEA);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateEMEA);
	        	}
	        	else if (s.lead__c == lead1.id) {
	        		system.assertEquals(s.Expiration_Date__c.date(), System.now().addDays(30).date());
	        		system.assertEquals(s.Web_Form_Fill__c,'Other');
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		//system.assertEquals(s.Rapid_Response_Eligible__c, workHoursUS);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateUS);
	        		system.assertEquals(s.Lead_Score_Stamped__c, 30);
	        	}
	        	else if (s.lead__c == lead2.id) {
	        		system.assertEquals(s.Expiration_Date__c.date(), date.today().addDays(29));
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c3.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, false);
	        	}
	        	else if (s.lead__c == lead3.id) {
	        		system.assertEquals(s.Expiration_Date__c.date(), System.now().addDays(30).date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, workHoursEMEA);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateEMEA);
	        	}
	        	else if (s.lead__c == lead4.id) {
	        		system.assertEquals(s.Expiration_Date__c.date(), System.now().addDays(30).date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		system.assertEquals(s.Rapid_Response_Eligible__c, workHoursEMEA);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateEMEA);
	        	}
	        	else if (s.lead__c == lead6.id) {
	        		system.assertEquals(s.Expiration_Date__c.date(), System.now().addDays(30).date());
	        		system.assertEquals(s.Web_Form_Fill__c,null);
	        		system.assertEquals(s.Campaign__c,c1.id);
	        		//system.assertEquals(s.Rapid_Response_Eligible__c, workHoursUS);
	        		system.assert(s.Original_Lead_Contact_Owner__c != null);
	        		system.assert(s.Original_Lead_Contact_Territory_Owner__c != null);
	        		system.assertEquals(s.SLA_1_Due_Date__c, slaDueDateUS);
	        	}
        	}
        	
        }
        
        
    }
}