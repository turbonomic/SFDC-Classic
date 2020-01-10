/**
 *Test Class for BizibleTouchPointTrigger
 * Case 1: Account with counts to increment
 * Case 2: Account with null counts
 * Case 3: Mixed null and counts to increment. Last Marketing Interaction field not updated
 *
 */
@isTest
private class TestBizibleTouchPointsTrigger {

    static testMethod void myUnitTest() {
       List<Account> insertAccts = new List<Account>();
       
       DateTime currTime = system.now();
        
       Account acct1 = new Account(name = 'acct1', MQI_Last_30_Days__c = 5, MQI_Last_60_Days__c = 5, MQI_Last_90_Days__c = 2, MQI_Total__c = 10);
       Account acct2 = new Account(name = 'acct2');
       Account acct3 = new Account(name = 'acct3', MQI_Last_30_Days__c = 0, MQI_Total__c = 3, Last_Marketing_Interaction__c = currTime);
       
       insertAccts.add(acct1); insertAccts.add(acct2); insertAccts.add(acct3);
        
       insert insertAccts;
        
       List<Contact> insertContacts = new List<Contact>();
       Contact con1 = new Contact(FirstName = 'Contact', LastName = 'One', AccountId = acct1.id);
       Contact con2 = new Contact(FirstName = 'Contact', LastName = 'Two', AccountId = acct2.id);
        
       insertContacts.add(con1); insertContacts.add(con2);
       insert insertContacts;
        
       List<Lead> insertLeads = new List<Lead>();
       Lead ld1 = new Lead(Account__c = acct3.id, FirstName = 'Lead', LastName = 'One', Company = 'Acct3', LeadSource = 'Inbound - website', Status = 'Suspect');
       Lead ld2 = new Lead(Account__c = acct1.id, FirstName = 'Lead', LastName = 'Two', Company = 'Acct1', LeadSource = 'Inbound - website', Status = 'Suspect');
        
       insertLeads.add(ld1); insertLeads.add(ld2);
       insert insertLeads;
        
       List<bizible2__Bizible_Person__c> insertPersons = new List<bizible2__Bizible_Person__c>();
        
       bizible2__Bizible_Person__c person1 = new bizible2__Bizible_Person__c(bizible2__Contact__c = con1.id);
       bizible2__Bizible_Person__c person2 = new bizible2__Bizible_Person__c(bizible2__Contact__c = con2.id);
       bizible2__Bizible_Person__c person3 = new bizible2__Bizible_Person__c(bizible2__Lead__c = ld1.id);
       bizible2__Bizible_Person__c person4 = new bizible2__Bizible_Person__c(bizible2__Lead__c = ld2.id);
       
       insertPersons.add(person1); insertPersons.add(person2); insertPersons.add(person3); insertPersons.add(person4);
       
       insert insertPersons;
       
       List<bizible2__Bizible_Touchpoint__c> insertMQI = new List<bizible2__Bizible_Touchpoint__c>();
       
       bizible2__Bizible_Touchpoint__c tp1 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con1.id, bizible2__Bizible_Person__c = person1.id, bizible2__Touchpoint_Date__c = currTime);
       bizible2__Bizible_Touchpoint__c tp2 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con1.id,bizible2__Bizible_Person__c = person1.id, bizible2__Touchpoint_Date__c = system.now().addDays(-40));
       bizible2__Bizible_Touchpoint__c tp3 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con1.id,bizible2__Bizible_Person__c = person1.id, bizible2__Touchpoint_Date__c = system.now().addDays(-80));
       bizible2__Bizible_Touchpoint__c tp4 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con1.id, bizible2__Bizible_Person__c = person1.id, bizible2__Touchpoint_Date__c = system.now().addDays(-120));
       
       bizible2__Bizible_Touchpoint__c tp5 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con2.id, bizible2__Bizible_Person__c = person2.id, bizible2__Touchpoint_Date__c = system.now().addDays(-40));
       bizible2__Bizible_Touchpoint__c tp6 = new bizible2__Bizible_Touchpoint__c(bizible2__Contact__c = con2.id,bizible2__Bizible_Person__c = person2.id, bizible2__Touchpoint_Date__c = system.now().addDays(-70));
       
       
       bizible2__Bizible_Touchpoint__c tp7 = new bizible2__Bizible_Touchpoint__c(bizible2__Bizible_Person__c = person3.id,bizible2__Touchpoint_Date__c = currTime.addDays(-70));
       
       insertMQI.add(tp1); insertMQI.add(tp2); insertMQI.add(tp3); insertMQI.add(tp4); insertMQI.add(tp5);
       insertMQI.add(tp6); insertMQI.add(tp7);
       
       insert insertMQI;
       
       Map<id, Account> acctQuery = new Map<id, Account>([SELECT id, Last_Marketing_Interaction__c, MQI_Last_30_Days__c, MQI_Last_60_Days__c, MQI_Last_90_Days__c, MQI_Total__c FROM Account WHERE id =: acct1.id or id =: acct2.id or id =: acct3.id]);
       
       for (Account a: acctQuery.values()) {
       		if (a.id == acct1.id) {
       			system.assertEquals(a.MQI_Last_30_Days__c,6);
       			system.assertEquals(a.MQI_Last_60_Days__c,7);	
       			system.assertEquals(a.MQI_Last_90_Days__c,5);	
       			system.assertEquals(a.MQI_Total__c,14);
       			system.assertEquals(a.Last_Marketing_Interaction__c,tp1.bizible2__Touchpoint_Date__c);			
       		} else if (a.id == acct2.id) {
       			system.assertEquals(a.MQI_Last_30_Days__c,null);
       			system.assertEquals(a.MQI_Last_60_Days__c,1);	
       			system.assertEquals(a.MQI_Last_90_Days__c,2);	
       			system.assertEquals(a.MQI_Total__c,2);
       			system.assertEquals(a.Last_Marketing_Interaction__c,tp5.bizible2__Touchpoint_Date__c);			
        	} else if (a.id == acct3.id) {
       			system.assertEquals(a.MQI_Last_30_Days__c,0);
       			system.assertEquals(a.MQI_Last_60_Days__c,null);	
       			system.assertEquals(a.MQI_Last_90_Days__c,1);	
       			system.assertEquals(a.MQI_Total__c,4);
       			system.assertEquals(a.Last_Marketing_Interaction__c,currTime);			
       		}
        }
        
    }
}