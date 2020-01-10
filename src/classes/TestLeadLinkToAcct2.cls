/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestLeadLinkToAcct2 {
	
	// There are 3 ways we have to match against - DiscoverOrg Company ID, Email domain, and cleaned account match
	// They also cascade according to the order stated above and will try to make regional matches before assigning randomly to a match
	
	//test case 1 - discoverorg matches and bucket cascades
    static testMethod void myUnitTest() {
        
        List<US_Velocity_State_Alignments__c> stateAlignments = new List<US_Velocity_State_Alignments__c>();
        US_Velocity_State_Alignments__c usv1 = new US_Velocity_State_Alignments__c(name = 'MASSACHUSETTS', team__c = 'Closers Club');
        stateAlignments.add(usv1);
        US_Velocity_State_Alignments__c usv2 = new US_Velocity_State_Alignments__c(name = 'FLORIDA', team__c = 'SEC');
        stateAlignments.add(usv2);
        
        insert stateAlignments;
        
        List<International_Alignments__c> countryAlignments = new List<International_Alignments__c>();
        International_Alignments__c ca1 = new International_Alignments__c(name = 'UNITED KINGDOM', team__c = 'Ganas iOS');
        countryAlignments.add(ca1);
        International_Alignments__c ca3 = new International_Alignments__c(name = 'FRANCE', team__c = 'Ganas iOS');
        countryAlignments.add(ca3);
        International_Alignments__c ca2 = new International_Alignments__c(name = 'AUSTRALIA', team__c = 'APAC Enterprise');
        countryAlignments.add(ca2);
        
        insert countryAlignments;
        
        List<User> userMap = [select id, name from User where UserRole.Name like '%Account Executive%' and isActive = true limit 2];
        
        List<Account> acctInsert = new List<Account>();
        Account a1 = new Account(billingState = 'Massachusetts', billingCountry = 'United States', name = 'Hitachi Data Systems', ownerId = userMap.get(0).id, DiscoverOrg_Id_VMT__c = 100, ae_rep__c = userMap.get(0).id, email_for_lead_link__c = 'hds.com', ops_it_budget__c = 18);
        acctInsert.add(a1);
        Account a2 = new Account(billingState = 'Massachusetts', billingCountry = 'United States', name = 'Hitachi Data Systems', ownerId = userMap.get(0).id, ae_rep__c = userMap.get(0).id, email_for_lead_link__c = 'hds.com');
        acctInsert.add(a2);
        Account a3 = new Account(billingState = 'England', billingCountry = 'United Kingdom', name = 'Hitachi Data Systems Europe', ownerId = userMap.get(1).id, ae_rep__c = userMap.get(1).id, email_for_lead_link__c = 'hds.com', ops_it_budget__c = 15);
        acctInsert.add(a3);
        Account a4 = new Account(name = 'Rotondi Masonry inc', ownerId = userMap.get(0).id);
        acctInsert.add(a4);
        Account a5 = new Account(name = 'ABC', ownerId = userMap.get(0).id);
        acctInsert.add(a5);
        Account a6 = new Account(name = 'Excalibur', ownerId = userMap.get(0).id, email_for_lead_link__c = 'exalibur.com');
        acctInsert.add(a6);
        Account a7 = new Account(name = 'Chuckey Cheese', ownerId = userMap.get(0).id, email_for_lead_link__c = 'chuckeycheese.com', billingCountry = 'Israel');
        acctInsert.add(a7);
        Account a8 = new Account(name = 'Chuckey Cheese US', ownerId = userMap.get(0).id, email_for_lead_link__c = 'chuckeycheese.com', billingCountry = 'United States', billingState = 'Florida');
        acctInsert.add(a8);
        Account a9 = new Account(name = 'Fox News', ownerId = userMap.get(1).id, billingState = 'Florida', billingCountry = 'United States', email_for_lead_link__c = 'foxnews.com');
        acctInsert.add(a9);
        Account a10 = new Account(name = 'Fox 25 News', ownerId = userMap.get(1).id, billingState = 'Massachusetts', billingCountry = 'United States', email_for_lead_link__c = 'foxnews.com');
        acctInsert.add(a10);
        Account a11 = new Account(name = 'Fox International News', ownerId = usermap.get(1).id, billingCountry = 'United Kingdom', email_for_lead_link__c = 'foxnews.com');
        acctInsert.add(a11);
        insert acctInsert;
        
        
        List<Lead> leadInsert = new List<Lead>();
        // straight company id match
        Lead l1 = new Lead(firstName = 'Charles', lastName = 'Barkley', company = 'Hitachi', email = 'cbarkely@hds.com', leadSource = 'Prospecting - DiscoverOrg', DiscoverOrg_Company_ID_VMT__c = 100);
        leadInsert.add(l1);
        // no discoverorg match - falls to email domain match - match to acct with ops it budget 14+ in US
        Lead l2 = new Lead(firstName = 'Patrick', lastName = 'Ewing', company = 'Hitachi', email = 'pewing@hds.com', leadSource = 'Prospecing - DiscoverOrg', DiscoverOrg_Company_ID_VMT__c = 99, state = 'Massachusetts', country = 'United States');
        leadInsert.add(l2);
        // no discoverorg match - falls to email domain match - match to acct with ops it budget 14+ intl
        Lead l3 = new Lead(firstName = 'Anthony', lastName = 'Davis', company = 'Hitachi', email = 'adavis@hds.com', leadSource = 'Prospecing - DiscoverOrg', DiscoverOrg_Company_ID_VMT__c = 99, state = 'England', country = 'United Kingdom');
        leadInsert.add(l3);
        // email match - match to acct with ops it budget 14+ in US
        Lead l4 = new Lead(firstName = 'Yao', lastname = 'Ming', company = 'Hitachi Data Systems', email = 'yming@hds.com', leadSource = 'Inbound - Website', state = 'Florida', country = 'United States');
        leadInsert.add(l4);
        // email match - match to acct with ops it budget 14+ intl
        Lead l5 = new Lead(firstName = 'Jeremy', lastname = 'Lin', company = 'Hitachi Data Systems', email = 'jlin@hds.com', leadSource = 'Inbound - Website', state = 'Liverpool', country = 'United Kingdom');
        leadInsert.add(l5);
        // email match and update acct fields
        Lead l6 = new Lead(firstName = 'Jeremy', lastname = 'Lingo', company = 'Rotondi Masonry', email = 'jlingo@rmasonry.com', leadSource = 'Inbound - Website', state = 'Georgia', country = 'United States', city = 'Atlanta', postalcode = '39421', street = '123 fake street', numberofemployees = 10, annualrevenue = 1, industry = 'Construction', website = 'rmasonry.com');
        leadInsert.add(l6);
        // email match with acct attached update acct fields
        Lead l7 = new Lead(firstName = 'Alpha', lastname = 'Beta', company = 'ABC', email = 'abeta@abc.com', leadSource = 'Inbound - Website', state = 'Georgia', country = 'United States', city = 'Atlanta', postalcode = '39421', street = '123 fake street', numberofemployees = 10, annualrevenue = 1, industry = 'Construction', website = 'abc.com', account__c = a5.id);
        leadInsert.add(l7);
        // single email match
        Lead l8 = new Lead(firstName = 'Bob', lastName = 'Burger', company = 'Excal', email = 'bob.burger@exalibur.com', leadsource = 'Inbound - Website', state = 'Massachusetts', country = 'United States');
        leadInsert.add(l8);
        // dupe non-match
        Lead l9 = new Lead(firstName = 'Bob', lastName = 'Burger2', company = 'Chucky Cheese', email = 'bob.burger2@chuckeycheese.com', leadsource = 'Inbound - Website', country = 'Nicaragua');
        leadInsert.add(l9);
        // no email match, acct name match
        Lead l10 = new Lead(firstName = 'First', lastName = 'Last', company = 'hitachi Data Systems Europe', email = 'first.last@hitachi.com', leadsource = 'Inbound - Website', country = 'United Kingdom');
        leadInsert.add(l10);
        //personal email, country match
        Lead l11 = new Lead(firstName = 'First', lastName = 'Last2', company = 'hitachi Data Systems Europe', email = 'first.last2@gmail.com', leadsource = 'Inbound - Website', country = 'United Kingdom');
        leadInsert.add(l11);
        //personal email, no matching discoverorg acct, state match
        Lead l12 = new Lead(firstName = 'Charles', lastName = 'Barkley2', company = 'Hitachi Data Systems', email = 'cbarkely@gmail.com', leadSource = 'Prospecting - DiscoverOrg', DiscoverOrg_Company_ID_VMT__c = 99);
        leadInsert.add(l12);
        //email match and 2 non-it budget accts with state matches
        Lead l13 = new Lead(firstName = 'Suzanne', lastName = 'Summers', company = 'Fox News Corp', email = 'suzanne.summers@foxnews.com', leadSource = 'Inbound - Website', state = 'Georgia', country = 'United States');
        leadInsert.add(l13);
        //email match and with no country and no US state
        Lead l14 = new Lead(firstName = 'Suzanne', lastName = 'Summers1', company = 'Fox News Corp', email = 'suzanne.summers2@foxnews.com', leadSource = 'Inbound - Website', state = 'England');
        leadInsert.add(l14);
        insert leadInsert;
        
        List<Lead> leadResults = [select id, account__c, ready_to_link_to_account__c, ownerId from Lead where id =: l1.id or id =:l2.id or id =:l3.id or id =:l4.id or id =:l5.id or id =:l6.id or id =:l7.id or id =:l8.id or id =:l9.id or id =:l10.id or id =: l11.id or id =:l12.id or id =:l13.id or id =:l14.id];
        
        for (Lead l : leadResults) {
        	if (l.id == l1.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assertEquals(l.ownerId,userMap.get(0).id);
        		system.assert(l.account__c == a1.id);
        	} else if (l.id == l2.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(0).id);
        		system.assert(l.account__c == a1.id);
        	} else if (l.id == l3.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c == a3.id);
        	} else if (l.id == l4.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(0).id);
        		system.assert(l.account__c == a1.id);
        	} else if (l.id == l5.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c == a3.id);
        	} else if (l.id == l6.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(0).id);
        		system.assert(l.account__c == a4.id);
        	} else if (l.id == l7.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId != null);
        		system.assert(l.account__c != null);
        	} else if (l.id == l8.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(0).id);
        		system.assert(l.account__c == a6.id);
        	} else if (l.id == l9.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(0).id);
        		system.assert(l.account__c == a7.id);
        	} else if (l.id == l10.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c == a3.id);
        	} else if (l.id == l11.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c == a3.id);
        	} else if (l.id == l12.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assertEquals(l.ownerId,userMap.get(0).id);
        		system.assert(l.account__c == a1.id);
        	} else if (l.id == l13.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c == a9.id || l.account__c == a10.id);
        	} else if (l.id == l14.id) {
        		system.assert(!l.ready_to_link_to_account__c);
        		system.assert(l.ownerId == userMap.get(1).id);
        		system.assert(l.account__c != null);
        	}
        }
        
        List<Account> acctResults = [select id, name, billingCity, billingState, billingCountry, lead_source_transfer__c, billingstreet, billingpostalcode, annualrevenue, numberofemployees, industry, website from Account where id =: a4.id or id =: a5.id];
        
        for (Account a : acctResults) {
        	if (a.id == a4.id) {
        		system.assertEquals(a.billingstreet,'123 fake street');
        		system.assert(a.billingCity == 'Atlanta');
        		system.assert(a.billingState == 'Georgia');
        		system.assert(a.billingpostalcode == '39421');
        		system.assert(a.billingCountry == 'United States');
        		system.assert(a.website == 'rmasonry.com');
        		system.assert(a.industry == 'Construction');
        		system.assert(a.annualRevenue == 1);
        		system.assert(a.numberofemployees == 10);
        		system.assert(a.lead_source_transfer__c == 'Inbound - Website');
        	} else if (a.id == a5.id) {
        		system.assertEquals(a.billingstreet,'123 fake street');
        		system.assert(a.billingCity == 'Atlanta');
        		system.assert(a.billingState == 'Georgia');
        		system.assert(a.billingpostalcode == '39421');
        		system.assert(a.billingCountry == 'United States');
        		system.assert(a.website == 'abc.com');
        		system.assert(a.industry == 'Construction');
        		system.assert(a.annualRevenue == 1);
        		system.assert(a.numberofemployees == 10);
        		system.assert(a.lead_source_transfer__c == 'Inbound - Website');
        	}
        }
    }
}