/**
 * Case 1: unattached lead
 * Case 2: attached lead
 * Case 3: Merged lead
 * Case 4: Converted lead
 *
 *
 */
@isTest
private class testCreateCampaignMemberAfterInsert {

    static testMethod void myUnitTest() {
    	
    	List<Account> acctInsert = new List<Account>();
    	List<Lead> ldInsert = new List<Lead>();
		List<Campaign> campaignInsert = new List<Campaign>();
		
		Account a1 = new Account(name = 'acct1');
		Account a2 = new Account(name = 'acct2');
		Account a3 = new Account(name = 'acct3');
        
        acctInsert.add(a1); acctInsert.add(a2); acctInsert.add(a3);
        insert acctInsert;
    	
    	Campaign c1 = new Campaign(Name = 'INB: Website', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true);
        Campaign c2 = new Campaign(Name = 'INB: Webinar', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	Campaign c3 = new Campaign(Name = 'INB: Product Download', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	Campaign c4 = new Campaign(Name = 'INB: Testing', IsActive = true, Status = 'In Progress', SLA_Eligible__c = true); 
    	
    	
    	campaignInsert.add(c1); campaignInsert.add(c2); campaignInsert.add(c3); campaignInsert.add(c4);
    	insert campaignInsert;
    	
    	//Contact con1 = new Contact(AccountId = a1.id, FirstName = 'Bob', LastName = 'One', LeadSource = 'Inbound - website', MailingCountry = 'United States', CreatedDate = System.now().addDays(-30));
    	//insert con1;
    	
    	Lead ld1 = new Lead(FirstName = 'Laura', LastName = 'One', Company = 'Acct4', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', Campaign_Id_Marketo__c = c1.id);
        Lead ld2 = new Lead(Account__c = a1.id, FirstName = 'Tim', LastName = 'Two', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', Campaign_Id_Marketo__c = c2.id);
        Lead ld3 = new Lead(Account__c = a2.id, FirstName = 'Sarah', LastName = 'Three', Company = 'Acct2', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', Campaign_Id_Marketo__c = c3.id);
        Lead ld4 = new Lead(Account__c = a2.id, FirstName = 'Sarah', LastName = 'Three', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada');
    	Lead ld5 = new Lead(Account__c = a3.id, FirstName = 'Bob', LastName = 'Five', Company = 'Acct45', LeadSource = 'Inbound - website', Status = 'Suspect',Latest_Web_Form_Fill__c = 'Other', Country = 'Canada', Campaign_Id_Marketo__c = c4.id);
    	
    	
    	ldInsert.add(ld1); ldInsert.add(ld2); ldInsert.add(ld3); ldInsert.add(ld4); ldInsert.add(ld5);
    	insert ldInsert;
    	
    	merge ld4 ld3;
    	
    	Map<id,Lead> leadQuery = new Map<id,Lead>([SELECT id, status FROM LEAD WHERE id =: ld5.id]);
       	
       	Database.LeadConvert lc = new Database.LeadConvert();
       	
       	for (lead l : leadQuery.values()) {
       		if (l.id == ld5.id) {
       			lc.setLeadId(l.id);
       		}
       	}
       	
       	lc.setConvertedStatus('New');
       	lc.setDoNotCreateOpportunity(true);
       	Database.LeadConvertResult lcr = Database.convertLead(lc);
       	System.assert(lcr.isSuccess());
       	
       	List<CampaignMember> cmAssert = new List<CampaignMember>([SELECT id, Leadid, ContactId, CampaignId FROM CampaignMember WHERE CampaignId =: c1.id OR CampaignId =: c2.id OR CampaignId =: c3.id OR CampaignId =: c4.id]);
       	
       	system.assertEquals(cmAssert.size(),4);
       	
       	for (CampaignMember cm: cmAssert) {
       		if (cm.CampaignId == c1.id) {
       			system.assertEquals(cm.LeadId,ld1.id);
       		} 
       		else if (cm.CampaignId == c2.id) {
       			system.assertEquals(cm.LeadId,ld2.id);
       		}
       		else if (cm.CampaignId == c3.id) {
       			system.assertEquals(cm.LeadId,ld4.id);
       		}
       		else if (cm.CampaignId == c4.id) {
       			system.assertEquals(cm.LeadId,ld5.id);
       			system.assert(cm.ContactId != null);
       		}
       	}
        
        
    }
}