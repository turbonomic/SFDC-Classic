/* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair]  
 * Description: test class for AcctLookupLatLongByZip.trigger
 */
@isTest
private class testAcctLookupLatLong {

    static testMethod void myUnitTest() {
    	
      lead_auto_number__c leadnum = new lead_auto_number__c(round_robin_number__c = 0);
	  insert leadnum;
	  
      //create Account Coordinate Entry
      Account_Coordinates__c ac = new Account_Coordinates__c(Zip_Code__c = '12345', Latitude_Longitude__c = '18.14;-66.26');
      insert ac;
      
      //create Account
      Account acct = new Account(Name = 'MyAccount', BillingPostalCode = '12345');
      insert acct;

      //verify Lat/Long info populated
      acct = [select Latitude_Longitude__c from Account where id =: acct.id];
      system.assertEquals(acct.Latitude_Longitude__c, '18.14;-66.26');
    }
}