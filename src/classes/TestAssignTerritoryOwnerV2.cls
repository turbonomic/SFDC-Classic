/**
 *
 *
 *	Test Cases: 
 * 		- Normal (State defined, single Rep)
 * 		- Lat/Long Defined
 *		- City Defined
 *		- Round Robin Defined (US)
 *		- Lat/Long + Round Robin Territory by state ????
 *		- City + Round Robin Territory by state
 *		- Country Defined (EMEA)
 *	 	- Round Robin Defined by Country (EMEA)
 *		- No State (US)
 *		- No Country (EMEA)
 *		- Normal APAC
 * 		- Normal LATAM
 *		
 *		Notes: Will fail City Defined (or really any case) without a state filled in for Account
 *
 *
 *
 *
 */
@isTest
private class TestAssignTerritoryOwnerV2 {

    static testMethod void myUnitTest() {
    	/*
    	Map<id,User> userList = new Map<id,User>([select id, name from User where isActive = true]);
    	
    	//Long/Lat Defined
    	List<Territory__c> territoryInsert = new List<Territory__c>();
    	Territory__c t1 = new Territory__c(name = 'California Velocity 1', Territory_Geo__c = 'US', state__c = 'California', country__c = 'United States',
    						min_latitude__c = 37.56194900, latitude_longitude_defined__c = true);
    	Territory__c t2 = new Territory__c(name = 'California Velocity 2', Territory_Geo__c = 'US', state__c = 'California', country__c = 'United States',
    						max_latitude__c = 37.56194900, min_latitude__c = 36.54892000, latitude_longitude_defined__c = true);
    	Territory__c t3 = new Territory__c(name = 'California Velocity 3', Territory_Geo__c = 'US', state__c = 'California', country__c = 'United States',
    						max_latitude__c = 36.54892000, min_latitude__c = 34.03221700,latitude_longitude_defined__c = true);
    	Territory__c t4 = new Territory__c(name = 'California Velocity 4', Territory_Geo__c = 'US', state__c = 'California', country__c = 'United States',
    						max_latitude__c = 34.03221700, min_latitude__c = 33.68819900, latitude_longitude_defined__c = true);
    	Territory__c t5 = new Territory__c(name = 'California Velocity 5', Territory_Geo__c = 'US', state__c = 'California', country__c = 'United States',
    						max_latitude__c = 33.68819900, latitude_longitude_defined__c = true);
    	
    	//City Defined
    	Territory__c t6 = new Territory__c(name = 'Texas Velocity 1.0', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						City__c = 'Austin', City_Defined__c = true);
    	Territory__c t7 = new Territory__c(name = 'Texas Velocity 1.1', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						City__c = 'El Paso', City_Defined__c = true); 
    	Territory__c t8 = new Territory__c(name = 'Texas Velocity 1.2', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						Round_Robin_Number__c = 0, Round_Robin_Defined__c = true); 
    	Territory__c t9 = new Territory__c(name = 'Texas Velocity 2.0', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						City__c = 'Dallas', City_Defined__c = true);
    	Territory__c t10 = new Territory__c(name = 'Texas Velocity 2.1', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						Round_Robin_Number__c = 1, Round_Robin_Defined__c = true);
    	Territory__c t11 = new Territory__c(name = 'Texas Velocity 3.0', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						City__c = 'Houston', City_Defined__c = true); 
    	Territory__c t12 = new Territory__c(name = 'Texas Velocity 3.1', Territory_Geo__c = 'US', state__c = 'Texas', country__c = 'United States',
    						Round_Robin_Number__c = 2, Round_Robin_Defined__c = true); 
    	
    	//City + Round Robin Territory			
		Territory__c t13 = new Territory__c(name = 'Boston Velocity 1', Territory_Geo__c = 'US', state__c = 'Massachusetts', country__c = 'United States',
    						City__c = 'Boston', Round_Robin_Number__c = 0, City_Defined__c = true, Round_Robin_Defined__c = true); 
    	Territory__c t14 = new Territory__c(name = 'Boston Velocity 2', Territory_Geo__c = 'US', state__c = 'Massachusetts', country__c = 'United States',
    						City__c = 'Boston', Round_Robin_Number__c = 1, City_Defined__c = true, Round_Robin_Defined__c = true);   
    	
    	//Round Robin Defined
    	Territory__c t15 = new Territory__c(name = 'Michigan Velocity 1', Territory_Geo__c = 'US', state__c = 'Michigan', country__c = 'United States',
    						Round_Robin_Number__c = 0, Round_Robin_Defined__c = true); 
    	Territory__c t16 = new Territory__c(name = 'Michigan Velocity 2', Territory_Geo__c = 'US', state__c = 'Michigan', country__c = 'United States',
    						Round_Robin_Number__c = 1, Round_Robin_Defined__c = true);  	
    						
    	//Normal State Defined
    	Territory__c t17 = new Territory__c(name = 'Wisconsin Velocity 1', Territory_Geo__c = 'US', state__c = 'Wisconsin', country__c = 'United States');  		
    						
    	//Country Defined (EMEA)
    	Territory__c t18 = new Territory__c(name = 'Belgium', Territory_Geo__c = 'EMEA', country__c = 'Belgium');
    	Territory__c t19 = new Territory__c(name = 'South Africa', Territory_Geo__c = 'EMEA', country__c = 'South Africa');
    						  
    	//Round Robin Defined by Country (EMEA)
    	Territory__c t20 = new Territory__c(name = 'UK Commercial 1.0', Territory_Geo__c = 'EMEA', country__c = 'United Kingdom',
    						Round_Robin_Number__c = 0, Round_Robin_Defined__c = true);
    	Territory__c t21 = new Territory__c(name = 'UK Commercial 1.1', Territory_Geo__c = 'EMEA', country__c = 'Ireland',
    						Round_Robin_Number__c = 0, Round_Robin_Defined__c = true);
   		Territory__c t22 = new Territory__c(name = 'UK Commercial 2.0', Territory_Geo__c = 'EMEA', country__c = 'United Kingdom',
    						Round_Robin_Number__c = 1, Round_Robin_Defined__c = true);
    	Territory__c t23 = new Territory__c(name = 'UK Commercial 3.0', Territory_Geo__c = 'EMEA', country__c = 'United Kingdom',
    						Round_Robin_Number__c = 2, Round_Robin_Defined__c = true);
    						
    	//APAC						
    	Territory__c t24 = new Territory__c(name = 'APAC', Territory_Geo__c = 'APAC', country__c = 'Australia');
    	
    	//LATAM
    	Territory__c t25 = new Territory__c(name = 'LATAM', Territory_Geo__c = 'LATAM', country__c = 'Brazil');
    											
    	for (User u : userList.values()) {
    		if (u.name == 'Tarek Alaruri') {
    			t1.rep__c = u.id;
    		} else if (u.name == 'Dan Mullan') {
    			t2.rep__c = u.id;
    		} else if (u.name == 'Nick Parisi') {
    			t3.rep__c = u.id;
    		} else if (u.name == 'Kevin Amarucci') {
    			t4.rep__c = u.id;
    		} else if (u.name == 'Michael Biciocchi') {
    			t5.rep__c = u.id;
    		} else if (u.name == 'Topher Piazza') {
    			t6.rep__c = u.id;
    			t7.rep__c = u.id;
    			t8.rep__c = u.id;
    		} else if (u.name == 'Idrina Potts') {
    			t9.rep__c = u.id;
    			t10.rep__c = u.id;
    		} else if (u.name == 'Kevin Frechette') {
    			t11.rep__c = u.id;
    			t12.rep__c = u.id;
    		} else if (u.name == 'Tom Strachan') {
    			t13.rep__c = u.id;
    		} else if (u.name == 'Jake Quinn') {
    			t14.rep__c = u.id;
    		} else if (u.name == 'Luke Palma') {
    			t15.rep__c = u.id;
    			t17.rep__c = u.id;
    		} else if (u.name == 'Michael Bernard') {
    			t16.rep__c = u.id;
    		} else if (u.name == 'Tresor Karera') {
    			t18.rep__c = u.id;
    		} else if (u.name == 'Perry Forbes') {
    			t19.rep__c = u.id;
    		} else if (u.name == 'Alex Osterman') {
    
    		} else if (u.name == 'Enoch Antwi') {
    			
    		} else if (u.name == 'Jennifer Clark') {
    			t21.rep__c = u.id;
    			t23.rep__c = u.id;
    			t20.rep__c = u.id;
    			t22.rep__c = u.id;
    		} else if (u.name == 'Greg Beale') {
    			t24.rep__c = u.id;
    		} else if (u.name == 'David Serna') {
    			t25.rep__c = u.id;
    		}
    		
    	}
    	
    	territoryInsert.add(t1); territoryInsert.add(t2); territoryInsert.add(t3); territoryInsert.add(t4); territoryInsert.add(t5);
    	territoryInsert.add(t6); territoryInsert.add(t7); territoryInsert.add(t8); territoryInsert.add(t9); territoryInsert.add(t10);
		territoryInsert.add(t11); territoryInsert.add(t12); territoryInsert.add(t13); territoryInsert.add(t14); territoryInsert.add(t15);
    	territoryInsert.add(t16); territoryInsert.add(t17); territoryInsert.add(t18); territoryInsert.add(t19); territoryInsert.add(t20);
    	territoryInsert.add(t21); territoryInsert.add(t22); territoryInsert.add(t23); territoryInsert.add(t24); territoryInsert.add(t25);
    	
    	insert territoryInsert;
    	
    	List<Account_Coordinates__c> cordList = new List<Account_Coordinates__c>();
    	Account_Coordinates__c cord1 = new Account_Coordinates__c(Latitude_Longitude__c = '33.86;-117.92',Zip_Code__c = '92832');
      	Account_Coordinates__c cord2 = new Account_Coordinates__c(Latitude_Longitude__c = '35.34;-119.07',Zip_Code__c = '93309');
       	Account_Coordinates__c cord3 = new Account_Coordinates__c(Latitude_Longitude__c = '38.45;-122.68',Zip_Code__c = '95404');
    	
    	
    	cordList.add(cord1); cordList.add(cord2); cordList.add(cord3);
    	insert cordList;
    	
    	List<Territory_Round_Robin__c> TerrRoundRobinCS = new List<Territory_Round_Robin__c>();
    	Territory_Round_Robin__c bostonRR = new Territory_Round_Robin__c(Name = 'Boston' ,RR_Number__c = 2);
    	Territory_Round_Robin__c michiganRR = new Territory_Round_Robin__c(Name = 'Michigan' ,RR_Number__c = 2);
    	Territory_Round_Robin__c TexasRR = new Territory_Round_Robin__c(Name = 'Texas' ,RR_Number__c = 3);
    	//Territory_Round_Robin__c UKRR = new Territory_Round_Robin__c(Name = 'United Kingdom' ,RR_Number__c = 1);
    	
    	TerrRoundRobinCS.add(bostonRR); TerrRoundRobinCS.add(michiganRR); TerrRoundRobinCS.add(TexasRR); //TerrRoundRobinCS.add(UKRR);
    	insert TerrRoundRobinCS;
    	*/
    	/*
    		3 Cali - Lat Defined
       		3 TX - Dallas, Austin, Houston
    		2 TX - State RR
    		2 BOS - City RR
    		2 MI - State RR
    		1 WI - State Defined
    		1 Belgium - Country Defined (EMEA)
    		1 SA - Country Defined (EMEA)
    		3 UK - RR by Country (EMEA) 
    		1 APAC
    		1 No State (US)
    		1 No Country
    		1 Non-compatible Country
    		1 Non-compatible State
    		1 SMB Account
    		1 Rep already set
    		1 LATAM
    	*/
    	/*
    	List<Account> acctInsert = new List<Account>();
    	Account a1 = new Account(name = 'acct1', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Santa Rosa', BillingPostalCode = '95404', territory_team__c = 'The Hunchbacks');
    	Account a2 = new Account(name = 'acct2', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Fullerton', BillingPostalCode = '92832', territory_team__c = 'The Hunchbacks');
    	Account a3 = new Account(name = 'acct3', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Bakersfield', BillingPostalCode = '93309', territory_team__c = 'The Hunchbacks');
    	Account a4 = new Account(name = 'acct4', BillingState = 'Texas', BillingCountry = 'United States', BillingCity = 'Austin', BillingPostalCode = '78681', territory_team__c = 'The Wild West');
    	Account a5 = new Account(name = 'acct5', BillingState = 'Texas', BillingCountry = 'United States', BillingCity = 'Dallas', territory_team__c = 'The Wild West');
    	Account a6 = new Account(name = 'acct6', BillingState = 'Texas', BillingCountry = 'United States', BillingCity = 'Houston', territory_team__c = 'The Wild West');
    	Account a7 = new Account(name = 'acct7', BillingState = 'Texas', BillingCountry = 'United States', BillingPostalCode = '77840', territory_team__c = 'The Wild West');
    	Account a8 = new Account(name = 'acct8', BillingState = 'Texas', BillingCountry = 'United States', BillingCity = 'College Station', territory_team__c = 'The Wild West');
    	Account a9 = new Account(name = 'acct9', BillingState = 'Massachusetts', BillingCountry = 'United States', BillingCity = 'Boston', BillingPostalCode = '02116', territory_team__c = 'Green Berets');
    	Account a10 = new Account(name = 'acct10', BillingState = 'Massachusetts', BillingCountry = 'United States', BillingCity = 'Boston', territory_team__c = 'Green Berets');
    	Account a11 = new Account(name = 'acct11', BillingState = 'Michigan', BillingCountry = 'United States', territory_team__c = 'Green Berets');
    	Account a12 = new Account(name = 'acct12', BillingState = 'Michigan', BillingCountry = 'United States', BillingCity = 'Kalamazoo', BillingPostalCode = '49001', territory_team__c = 'Green Berets');
    	Account a13 = new Account(name = 'acct13', BillingState = 'Wisconsin', BillingCountry = 'United States', BillingCity = 'Milwaukee', territory_team__c = 'Green Berets');
    	Account a14 = new Account(name = 'acct14', BillingState = 'Brussels', BillingCountry = 'Belgium', BillingCity = 'Milwaukee', territory_team__c = 'Ganas iOS');
    	Account a15 = new Account(name = 'acct15', BillingCountry = 'United Kingdom', BillingCity = 'London', territory_team__c = 'Ganas iOS');
    	Account a16 = new Account(name = 'acct16', BillingCountry = 'United Kingdom', BillingState = 'England', territory_team__c = 'Ganas iOS');
    	Account a17 = new Account(name = 'acct17', BillingCountry = 'United Kingdom', territory_team__c = 'Ganas iOS');
    	Account a18 = new Account(name = 'acct18', BillingCountry = 'Australia', territory_team__c = 'APAC Enterprise');
    	Account a19 = new Account(name = 'acct19', BillingCountry = 'United States', BillingCity = 'El Paso', territory_team__c = 'The Wild West');
    	Account a20 = new Account(name = 'acct20', BillingState = 'Georgia', territory_team__c = 'The Kitchen');
    	Account a21 = new Account(name = 'acct21', BillingCountry = 'Georgia', territory_team__c = 'The Kitchen');
    	Account a22 = new Account(name = 'acct22', BillingState = 'Canada');
    	Account a23 = new Account(name = 'acct23', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Santa Rosa', BillingPostalCode = '95404', Account_Level__c = 'SMB', territory_team__c = 'The Hunchbacks');
    	Account a24 = new Account(name = 'acct24', BillingState = 'California', BillingCountry = 'United States', BillingCity = 'Santa Rosa', BillingPostalCode = '95404', territory_team__c = 'The Hunchbacks', ae_rep__c = '005D0000004u17RIAQ');
    	Account a25 = new Account(name = 'acct25', BillingCountry = 'Brazil', territory_team__c = 'LATAM');
    	
    	
    	acctInsert.add(a1); acctInsert.add(a2); acctInsert.add(a3); acctInsert.add(a4); acctInsert.add(a5);
    	acctInsert.add(a6); acctInsert.add(a7); acctInsert.add(a8); acctInsert.add(a9); acctInsert.add(a10);
		acctInsert.add(a11); acctInsert.add(a12); acctInsert.add(a13); acctInsert.add(a14); acctInsert.add(a15);
    	acctInsert.add(a16); acctInsert.add(a17); acctInsert.add(a18); acctInsert.add(a19); acctInsert.add(a20);
    	acctInsert.add(a21); acctInsert.add(a22); acctInsert.add(a23); acctInsert.add(a24);
    	    	
    	insert acctInsert;
    	
    	Map<id, Account> acctUpdateMap = new Map<id, Account>([SELECT id, Territory_Label__c, territory_team__c FROM Account WHERE id =: a1.id or id =: a2.id or id =: a3.id or id =: a4.id or id =: a5.id or id =: a6.id or id =: a7.id or id =: a8.id or id =: a9.id or id =: a10.id or id =: a11.id or id =: a12.id or id =: a13.id or id =: a14.id or id =: a15.id or id =: a16.id or id =: a17.id or id =: a18.id or id =: a19.id or id =: a20.id or id =: a21.id or id =: a22.id or id =: a23.id or id =: a24.id]);
		
		List<Account> updateAccts = new List<Account>();
		for (Account acct: acctUpdateMap.values()) {
			system.debug(acct.territory_team__c);
			acct.Territory_Label__c = 'Test Patch';
			updateAccts.add(acct);
		}
		
		update updateAccts;
		
		Map<id, Account> assertAcctMap = new Map<id, Account>([SELECT id, ae_rep__c, Territory_Owner_Display__c, territory_team__c, billingCity, BillingState, BillingCountry, Latitude_Longitude__c, Billing_Zip_Cleaned__c, BillingPostalCode FROM Account WHERE id in: acctUpdateMap.keyset()]);
		
		for (Account acct : assertAcctMap.values()) {
			if (acct.id == a1.id) {
				system.assertEquals(acct.ae_rep__c,t1.rep__c); //NorCal (Tarek) Patch
			} else if (acct.id == a2.id) {
				system.assertEquals(acct.ae_rep__c,t4.rep__c); //LA (Ammarucci) Patch
			} else if (acct.id == a3.id) {
				system.assertEquals(acct.ae_rep__c,t3.rep__c); //Mid-Cal (Parisi) Patch
			} else if (acct.id == a4.id) {
				system.assertEquals(acct.ae_rep__c,t6.rep__c); //Austin City Defined
			} else if (acct.id == a5.id) {
				system.assertEquals(acct.ae_rep__c,t9.rep__c); //Dallas City Defined
			} else if (acct.id == a6.id) {
				system.assertEquals(acct.ae_rep__c,t11.rep__c); //Houston City Defined
			} else if (acct.id == a7.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t6.rep__c || acct.ae_rep__c == t9.rep__c || acct.ae_rep__c == t11.rep__c); //TX RR
			} else if (acct.id == a8.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t6.rep__c || acct.ae_rep__c == t9.rep__c || acct.ae_rep__c == t11.rep__c); //TX RR
			} else if (acct.id == a9.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t13.rep__c || acct.ae_rep__c == t14.rep__c); //BOS RR
			} else if (acct.id == a10.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t13.rep__c || acct.ae_rep__c == t14.rep__c); //BOS RR
			} else if (acct.id == a11.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t15.rep__c || acct.ae_rep__c == t16.rep__c); //MI RR
			} else if (acct.id == a12.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t15.rep__c || acct.ae_rep__c == t16.rep__c); //MI RR
			} else if (acct.id == a13.id) {
				system.assertEquals(acct.ae_rep__c,t17.rep__c); //Wisconsin (single rep aligned)
			} else if (acct.id == a14.id) {
				system.assertEquals(acct.ae_rep__c,t18.rep__c); // Belgium (single rep aligned)
			} else if (acct.id == a15.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t20.rep__c || acct.ae_rep__c == t22.rep__c || acct.ae_rep__c == t23.rep__c); //UK RR
			} else if (acct.id == a16.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t20.rep__c || acct.ae_rep__c == t22.rep__c || acct.ae_rep__c == t23.rep__c); //UK RR
			} else if (acct.id == a17.id) {
				system.debug(acct.Territory_Owner_Display__c);
				system.assert(acct.ae_rep__c == t20.rep__c || acct.ae_rep__c == t22.rep__c || acct.ae_rep__c == t23.rep__c); //UK RR
			} else if (acct.id == a18.id) {
				system.assertEquals(acct.ae_rep__c,t24.rep__c); //APAC (single rep aligned)
			} else if (acct.id == a19.id) {
				system.assertEquals(acct.ae_rep__c,null); //No State
			} else if (acct.id == a20.id) {
				system.assertEquals(acct.ae_rep__c,null); //No Country
			} else if (acct.id == a21.id) {
				system.assertEquals(acct.ae_rep__c,null); //Non-compatible country
			} else if (acct.id == a22.id) {
				system.assertEquals(acct.ae_rep__c,null); //Non-compatible state
			} else if (acct.id == a23.id) {
				system.assertEquals(acct.ae_rep__c,null); //SMB Account
			} else if (acct.id == a24.id) {
				system.assertEquals(acct.Territory_Owner_Display__c,'Topher Piazza'); //Rep already set
			} else if (acct.id == a25.id) {
				system.assertEquals(acct.ae_rep__c,t25.rep__c); //LATAM (single rep aligned)
			}
			
		}
	*/	    
    }
    
}