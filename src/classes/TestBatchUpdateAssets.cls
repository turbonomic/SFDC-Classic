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
private class TestBatchUpdateAssets {
    static testMethod void myUnitTest() {
    	
    	List<Asset> assetInsert = new List<Asset>();
    	List<Training_Services__c> tsInsert = new List<Training_Services__c>();
    	
    	
    	Account acct1 = new Account(Name = 'acct1');
    	insert acct1;
    	
    	Product2 prod1 = new Product2(ProductCode = 'PSO Training Test', Name = 'Test Product', Family = 'Other', Description = 'Test');
    	insert prod1;
    	
    	//Multiple Trainings and Services and TAMs
    	Asset ass1 = new Asset(Name = 'Asset 1', Product2 = prod1, Price = 1000, Quantity = 5, AccountId = acct1.id);
    	assetInsert.add(ass1);
    	//Only Trainings
    	Asset ass2 = new Asset(Name = 'Asset 2', Product2 = prod1, Price = 2000, Quantity = 2, AccountId = acct1.id);
    	assetInsert.add(ass2);
    	//Only Services
    	Asset ass3 = new Asset(Name = 'Asset 3', Product2 = prod1, Price = 3000, Quantity = 3, AccountId = acct1.id);
    	assetInsert.add(ass3);
    	//Only TAMs
    	Asset ass4 = new Asset(Name = 'Asset 3', Product2 = prod1, Price = 3000, Quantity = 3, AccountId = acct1.id);
    	assetInsert.add(ass4);
    	//One of Each
    	Asset ass5 = new Asset(Name = 'Asset 5', Product2 = prod1, Price = 4000, Quantity = 10, AccountId = acct1.id);
    	assetInsert.add(ass5);
    	//No services or Trainings or TAMs
    	Asset ass6 = new Asset(Name = 'Asset 6', Product2 = prod1, Price = 3000, Quantity = 3, AccountId = acct1.id);
    	assetInsert.add(ass6);
    	
    	
    	
    	insert assetInsert;
    	
    	//Asset 1 T&S
    	Training_Services__c ts1 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Scheduled', Hours__c = 10);
    	tsInsert.add(ts1);
    	Training_Services__c ts2 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Completed', Hours__c = 20);
    	tsInsert.add(ts2);
    	Training_Services__c ts3 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Completed', Hours__c = 15);
    	tsInsert.add(ts3);
    	Training_Services__c ts4 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'In Progress', Hours__c = 35);
    	tsInsert.add(ts4);
    	Training_Services__c ts5 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Scheduled', Hours__c = 40);
    	tsInsert.add(ts5);
    	Training_Services__c ts6 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Completed', Hours__c = 20);
    	tsInsert.add(ts6);
    	Training_Services__c ts7 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'On Hold', Hours__c = 20);
    	tsInsert.add(ts7);
    	Training_Services__c ts8 = new Training_Services__c(Type__c = 'TAM', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass1.id, Status__c = 'Expired', Hours__c = 50);
    	tsInsert.add(ts8);
    	
    	//Asset 2 T&S
    	Training_Services__c ts9 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass2.id, Status__c = 'Scheduled', Hours__c = 7);
    	tsInsert.add(ts9);
    	Training_Services__c ts10 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass2.id, Status__c = 'In Progress', Hours__c = 8);
    	tsInsert.add(ts10);
    	
    	//Asset 3 T&S
    	Training_Services__c ts11 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass3.id, Status__c = 'Completed', Hours__c = 15);
    	tsInsert.add(ts11);
    	Training_Services__c ts12 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass3.id, Status__c = 'Completed', Hours__c = 45);
    	tsInsert.add(ts12);
    	
    	//Asset 4 T&S
    	Training_Services__c ts13 = new Training_Services__c(Type__c = 'TAM', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass4.id, Status__c = 'On Hold', Hours__c = 27);
    	tsInsert.add(ts13);
    	Training_Services__c ts14 = new Training_Services__c(Type__c = 'TAM', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass4.id, Status__c = 'Completed', Hours__c = 30);
    	tsInsert.add(ts14);
    	
    	//Asset 5 T&S
    	Training_Services__c ts15 = new Training_Services__c(Type__c = 'Services', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass5.id, Status__c = 'Completed', Hours__c = 20);
    	tsInsert.add(ts15);
    	Training_Services__c ts16 = new Training_Services__c(Type__c = 'Training', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass5.id, Status__c = 'In Progress', Hours__c = 15);
    	tsInsert.add(ts16);
    	Training_Services__c ts17 = new Training_Services__c(Type__c = 'TAM', Account__c = acct1.id, Delivered_By__c = 'Alec Kemp', asset__c = ass5.id, Status__c = 'Completed', Hours__c = 50);
    	tsInsert.add(ts17);
    	
    	
    	
    	insert tsInsert;
    	
    	Test.StartTest();
		BatchUpdateAssets n = new BatchUpdateAssets();
		n.query = 'SELECT id, of_Trainings__c, of_Services__c, of_TAMs__c, Completed_T_S_Hours__c, Total_T_S_Hours__c From Asset WHERE id = \'' + ass1.id + '\' OR id = \'' + ass2.id + '\' OR id = \'' + ass3.id + '\' OR id = \'' + ass4.id + '\' OR id = \'' + ass5.id + '\' OR id = \'' + ass6.id + '\'';
		ID batchprocessid = Database.executeBatch(n);
		Test.StopTest();
		
		List<Asset> getAssets = [SELECT of_Trainings__c, of_Services__c, of_TAMs__c, Completed_T_S_Hours__c, Total_T_S_Hours__c FROM Asset WHERE id =: ass1.id  OR id =: ass2.id OR id =: ass3.id OR id =: ass4.id OR id =: ass5.id OR id =: ass6.id];
    	
    	for (Asset a : getAssets) {
    		if (a.id == ass1.id) {
				system.assertEquals(a.of_Trainings__c,3);
				system.assertEquals(a.of_Services__c,4);
				system.assertEquals(a.of_TAMs__c,1);
				system.assertEquals(a.Completed_T_S_Hours__c,55);
				system.assertEquals(a.Total_T_S_Hours__c,210);
    		}
			else if (a.id == ass2.id) {
				system.assertEquals(a.of_Trainings__c,2);
				system.assertEquals(a.of_Services__c,0);
				system.assertEquals(a.of_TAMs__c,0);
				system.assertEquals(a.Completed_T_S_Hours__c,0);
				system.assertEquals(a.Total_T_S_Hours__c,15);
				
			}
			else if (a.id == ass3.id) {
				system.assertEquals(a.of_Trainings__c,0);
				system.assertEquals(a.of_Services__c,2);
				system.assertEquals(a.of_TAMs__c,0);
				system.assertEquals(a.Completed_T_S_Hours__c,60);
				system.assertEquals(a.Total_T_S_Hours__c,60);
			}
			else if (a.id == ass4.id) {
				system.assertEquals(a.of_Trainings__c,0);
				system.assertEquals(a.of_Services__c,0);
				system.assertEquals(a.of_TAMs__c,2);
				system.assertEquals(a.Completed_T_S_Hours__c,30);
				system.assertEquals(a.Total_T_S_Hours__c,57);
			}
			else if (a.id == ass5.id) {
				system.assertEquals(a.of_Trainings__c,1);
				system.assertEquals(a.of_Services__c,1);
				system.assertEquals(a.of_TAMs__c,1);
				system.assertEquals(a.Completed_T_S_Hours__c,70);
				system.assertEquals(a.Total_T_S_Hours__c,85);
			}
			else if (a.id == ass6.id) {
				system.assertEquals(a.of_Trainings__c,0);
				system.assertEquals(a.of_Services__c,0);
				system.assertEquals(a.of_TAMs__c,0);
				system.assertEquals(a.Completed_T_S_Hours__c,0);
				system.assertEquals(a.Total_T_S_Hours__c,0);
			}
    	}
    	
    }
}