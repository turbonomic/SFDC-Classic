/**
 * 
 * 1. Normal Case US (State + Country)
 * 2. Normal Case Canada (State + Country)
 * 3. US State + No Country
 * 4. US Country + No State
 * 5. Normal EMEA (UK)
 * 6. Normal EMEA (EU)
 * 7. Normal EMEA + State
 * 8. No State + No Country
 * 9. Update to add state
 * 10. Update to change state
 * 11. Update to add Country
 * 12. Update to change country
 * 13. Update to change state and country
 * 14. Update to change country but keep state the same
 * 15. Update to Clear out State
 * 16. Update to Clear out Country
 * 17. Update to clear out both State and Country
 * 18. US State + EU Country
 *
 */
@isTest
private class TestAccountVeloTeamUpdate {

    static testMethod void myUnitTest() {
    /*	
    	
    	//Create US State Alignment Custom Settings
    	List<US_Velocity_State_Alignments__c> veloStateAlignments = new List<US_Velocity_State_Alignments__c>();
    	
    	US_Velocity_State_Alignments__c california = new US_Velocity_State_Alignments__c(Name = 'CALIFORNIA', Team__c = 'The Hunchbacks');
    	US_Velocity_State_Alignments__c alberta = new US_Velocity_State_Alignments__c(Name = 'ALBERTA', Team__c = 'The Titans');
    	US_Velocity_State_Alignments__c michigan = new US_Velocity_State_Alignments__c(Name = 'MICHIGAN', Team__c = 'Green Berets');
    	US_Velocity_State_Alignments__c florida = new US_Velocity_State_Alignments__c(Name = 'FLORIDA', Team__c = 'SEC');
    	
    	veloStateAlignments.add(california); veloStateAlignments.add(alberta); veloStateAlignments.add(michigan); veloStateAlignments.add(florida);
    	
    	insert veloStateAlignments;
    	
    	
    	//Create International Alignment Custom Settings
    	List<International_Alignments__c> countryAlignments = new List<International_Alignments__c>();
    	
    	International_Alignments__c unitedKingdom = new International_Alignments__c(name = 'UNITED KINGDOM', Team__c = 'Ganas iOS');
    	International_Alignments__c denmark = new International_Alignments__c(name = 'DENMARK', Team__c = 'Ganas iOS');
    	International_Alignments__c australia = new International_Alignments__c(name = 'AUSTRALIA', Team__c = 'APAC');
    	
        countryAlignments.add(unitedKingdom); countryAlignments.add(denmark); countryAlignments.add(australia);
        
        insert countryAlignments;
    	
    	
    	//Create Accounts
    	List<Account> acctInsert = new List<Account>();
    	Account a1 = new Account(name = 'acct1', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Santa Rosa', BillingPostalCode = '95404');
    	Account a2 = new Account(name = 'acct2', BillingState = 'Alberta', BillingCountry = 'Canada');
    	Account a3 = new Account(name = 'acct3', BillingState = 'Michigan');
    	Account a4 = new Account(name = 'acct4', BillingCountry = 'United States');
    	Account a5 = new Account(name = 'acct5', BillingCountry = 'United Kingdom');
    	Account a6 = new Account(name = 'acct6', BillingCountry = 'Denmark');
    	Account a7 = new Account(name = 'acct7', BillingState = 'Swansea', BillingCountry = 'United Kingdom');
    	Account a8 = new Account(name = 'acct8');
    	Account a9 = new Account(name = 'acct9', BillingCountry = 'United States');
    	Account a10 = new Account(name = 'acct10', BillingState = 'California', BillingCountry = 'United States');
    	Account a11 = new Account(name = 'acct11', BillingState = 'Sydney');
    	Account a12 = new Account(name = 'acct12', BillingCountry = 'Australia');
    	Account a13 = new Account(name = 'acct13', BillingState = 'California', BillingCountry = 'United States');
    	Account a14 = new Account(name = 'acct14', BillingState = 'California', BillingCountry = 'United States');
    	Account a15 = new Account(name = 'acct15', BillingState = 'California', BillingCountry = 'United States');
    	Account a16 = new Account(name = 'acct16', BillingState = 'California', BillingCountry = 'United States');
    	Account a17 = new Account(name = 'acct17', BillingState = 'California', BillingCountry = 'United States');
    	Account a18 = new Account(name = 'acct18', BillingState = 'California', BillingCountry = 'United Kingdom');
    	
    	
    	acctInsert.add(a1); acctInsert.add(a2); acctInsert.add(a3); acctInsert.add(a4); acctInsert.add(a5);
    	acctInsert.add(a6); acctInsert.add(a7); acctInsert.add(a8); acctInsert.add(a9); acctInsert.add(a10);
		acctInsert.add(a11); acctInsert.add(a12); acctInsert.add(a13); acctInsert.add(a14); acctInsert.add(a15);
    	acctInsert.add(a16); acctInsert.add(a17); acctInsert.add(a18);
    	
    	insert acctInsert;
    	
    	Map<id, Account> acctUpdateMap = new Map<id, Account>([SELECT id, BillingState, BillingCountry, territory_team__c FROM Account WHERE id =: a1.id or id =: a2.id or id =: a3.id or id =: a4.id or id =: a5.id or id =: a6.id or id =: a7.id or id =: a8.id or id =: a9.id or id =: a10.id or id =: a11.id or id =: a12.id or id =: a13.id or id =: a14.id or id =: a15.id or id =: a16.id or id =: a17.id or id =: a18.id]);
    	
    	List<Account> updateAccts = new List<Account>();
    	for (Account acct: acctUpdateMap.values()) {
    		boolean changed = false;
    		if (acct.id == a9.id) {
    			acct.BillingState = 'Florida';
    			changed = true;
    		}
    		if (acct.id == a10.id) {
    			acct.BillingState = 'Michigan';
    			changed = true;
    		}
    		if (acct.id == a11.id) {
    			acct.BillingCountry = 'Australia';
    			changed = true;
    		}
    		if (acct.id == a12.id) {
    			acct.BillingCountry = 'Denmark';
    			changed = true;
    		}
    		if (acct.id == a13.id) {
    			acct.BillingState = 'Florida';
    			acct.BillingCountry = 'Denmark';
    			changed = true;
    		}
    		if (acct.id == a14.id) {
    			acct.BillingCountry = 'Canada';
    			changed = true;
    		}
    		if (acct.id == a15.id) {
    			acct.BillingState = null;
    			changed = true;
    		}
    		if (acct.id == a16.id) {
    			acct.BillingCountry = null;
    			changed = true;
    		}
    		if (acct.id == a17.id) {
    			acct.BillingState = null;
    			acct.BillingCountry = null;
    			changed = true;
    		}
    		
    		if (changed) updateAccts.add(acct);
    	}
    	
    	update updateAccts;

        
        Map<id, Account> assertAcctMap = new Map<id, Account>([SELECT id, territory_team__c, BillingState, BillingCountry FROM Account WHERE id =: a1.id or id =: a2.id or id =: a3.id or id =: a4.id or id =: a5.id or id =: a6.id or id =: a7.id or id =: a8.id or id =: a9.id or id =: a10.id or id =: a11.id or id =: a12.id or id =: a13.id or id =: a14.id or id =: a15.id or id =: a16.id or id =: a17.id or id =: a18.id]);
		
		for (Account acct : assertAcctMap.values()) {
			if (acct.id == a1.id) {
				system.assertEquals(acct.territory_team__c,'The Hunchbacks');
			}
			else if (acct.id == a2.id) {
				system.assertEquals(acct.territory_team__c,'The Titans');
			}
			else if (acct.id == a3.id) {
				system.assertEquals(acct.territory_team__c,'Green Berets');
			}
			else if (acct.id == a4.id) {
				system.assertEquals(acct.territory_team__c,null);
			}
			else if (acct.id == a5.id) {
				system.assertEquals(acct.territory_team__c,'Ganas iOS');
			}
			else if (acct.id == a6.id) {
				system.assertEquals(acct.territory_team__c,'Ganas iOS');
			}
			else if (acct.id == a7.id) {
				system.assertEquals(acct.territory_team__c,'Ganas iOS');
			}
			else if (acct.id == a8.id) {
				system.assertEquals(acct.territory_team__c,null);
			}
			else if (acct.id == a9.id) {
				system.assertEquals(acct.territory_team__c,'SEC');
			}
			else if (acct.id == a10.id) {
				system.assertEquals(acct.territory_team__c,'Green Berets');	
			}
			else if (acct.id == a11.id) {
				system.assertEquals(acct.territory_team__c,'APAC');
			}
			else if (acct.id == a12.id) {
				system.assertEquals(acct.territory_team__c,'Ganas iOS');
			}
			else if (acct.id == a13.id) {
				system.assertEquals(acct.territory_team__c,'SEC');
			}
			else if (acct.id == a14.id) {
				system.assertEquals(acct.territory_team__c,'The Hunchbacks');
			}
			else if (acct.id == a15.id) {
				system.assertEquals(acct.territory_team__c,'The Hunchbacks');
			}
			else if (acct.id == a16.id) {
				system.assertEquals(acct.territory_team__c,'The Hunchbacks');
			}
			else if (acct.id == a17.id) {
				system.assertEquals(acct.territory_team__c,null);
			}
			else if (acct.id == a18.id) {
				system.assertEquals(acct.territory_team__c,'The Hunchbacks');
			}
		}
	*/	
    }
}