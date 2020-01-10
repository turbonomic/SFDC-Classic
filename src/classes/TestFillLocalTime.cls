@isTest
private class TestFillLocalTime {

 /*   static testMethod void myUnitTest() {

        Lead_Auto_Number__c lan = new Lead_Auto_Number__c();
        insert lan;
        
        DateTime now = DateTime.now(); */
/*        
        Account acct = new Account(name = 'Test Company', BillingCountry = 'Australia');
        insert acct;
        
        Lead ld1 = new Lead(lastName = 'Test', firstName = 'One', company = 'Test Company', leadSource = 'Prospecting - DiscoverOrg', country = 'Australia');
        insert ld1;
        Lead ld2 = new Lead(lastName = 'Test', firstName = 'Two', company = 'Test Company', account__c = acct.id, leadSource = 'Prospecting - DiscoverOrg');
        insert ld2;
        
        Contact con1 = new Contact(lastName = 'Test', firstName = 'Two', accountId = acct.id, leadSource = 'Prospecting - DiscoverOrg', mailingCountry = 'Australia');
        insert con1;
        Contact con2 = new Contact(lastName = 'Test', firstName = 'Two', accountId = acct.id, leadSource = 'Prospecting - DiscoverOrg');
        insert con2;
        
        Task tsk1 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = ld1.id);
        insert tsk1;
        Task tsk2 = new Task(type = 'Call', status = 'Completed', whoId = con1.id);
        insert tsk2;
        Task tsk3 = new Task(type = 'Call', status = 'Completed', whoId = ld1.id);
        insert tsk3;
        Task tsk4 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = con1.id);
        insert tsk4;
        Task tsk5 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = con2.id);
        insert tsk5;
        Task tsk6 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = ld2.id);
        insert tsk6;
        
        Lead lead1 = [select id, VMT_UTF_Offset__c from Lead where id = :ld1.id];
        Account acct1 = [select id, VMT_UTF_Offset__c from Account where id = :acct.id];
        
        Task afterTsk1 = [select local_date_time__c from Task where id = :tsk1.id];
        system.assertEquals(afterTsk1.local_date_time__c,now+(lead1.VMT_UTF_Offset__c+5)/24);
        Task afterTsk2 = [select local_date_time__c from Task where id = :tsk2.id];
		system.assert(afterTsk2.local_date_time__c.isSameDay(now-(lead1.VMT_UTF_Offset__c+5)/24));
		Task afterTsk3 = [select local_date_time__c from Task where id = :tsk3.id];
		system.assert(afterTsk3.local_date_time__c.isSameDay(now-(lead1.VMT_UTF_Offset__c+5)/24));
        Task afterTsk4 = [select local_date_time__c from Task where id = :tsk4.id];
        system.assertEquals(afterTsk4.local_date_time__c,now+(lead1.VMT_UTF_Offset__c+5)/24);		
		Task afterTsk5 = [select local_date_time__c from Task where id = :tsk5.id];
        system.assertEquals(afterTsk5.local_date_time__c,now+(acct1.VMT_UTF_Offset__c+5)/24);
        Task afterTsk6 = [select local_date_time__c from Task where id = :tsk6.id];
        system.assertEquals(afterTsk6.local_date_time__c,now+(acct1.VMT_UTF_Offset__c+5)/24);
*/        		
/*	
		Account fallbackAcct = new Account(name = 'Test Company', BillingCountry = 'Australia');
		insert fallbackAcct;
		
		Lead ld1 = new Lead(lastName = 'one', firstName = 'lead', company = 'Test Company', leadSource = 'Tradeshow', country = 'Australia');
		insert ld1;
		Lead ld2 = new Lead(lastName = 'two', firstName = 'lead', company = 'Test Company', Account__c = fallbackAcct.id, leadSource = 'Tradeshow');
		insert ld2;
		
		Contact con1 = new Contact(lastName = 'one', firstName = 'contact', accountId = fallbackAcct.id, leadSource = 'Tradeshow', mailingCountry = 'Australia');
		insert con1;
		Contact con2 = new Contact(lastName = 'two', firstName = 'contact', accountId = fallbackAcct.id, leadSource = 'Tradeshow');
		insert con2;
		
		Map<Id,Task> tskMap = new Map<Id,Task>(); 
		List<Task> tskList = new List<Task>();
		
		Task tsk1 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = ld1.id);		//task with Call Date Time and Lead with Country
		tskMap.put(tsk1.id,tsk1);
		Task tsk2 = new Task(type = 'Call', status = 'Completed', whoId = ld1.id);								//task w/out Call Date Time and Lead with Country
		tskMap.put(tsk2.id,tsk2);
		Task tsk3 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = ld2.id);		//task with Call Date Time and Lead w/out Country (default to acct)
		tskMap.put(tsk3.id,tsk3);
		Task tsk4 = new Task(type = 'Call', status = 'Completed', whoId = ld2.id);								//task w/out Call Date Time and Lead w/out Country (default to acct)
		tskMap.put(tsk4.id,tsk4);
		Task tsk5 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = con1.id);	//task with Call Date Time and Contact with Country
		tskMap.put(tsk5.id,tsk5);
		Task tsk6 = new Task(type = 'Call', status = 'Completed', whoId = con1.id);								//task w/out Call Date Time and Contact with Country
		tskMap.put(tsk6.id,tsk6);
		Task tsk7 = new Task(type = 'Call', Call_Date_Time__c = now, status = 'Completed', whoId = con2.id);	//task with Call Date Time and Contact w/out Country
		tskMap.put(tsk7.id,tsk7);
		Task tsk8 = new Task(type = 'Call', status = 'Completed', whoId = con2.id);								//task w/out Call Date Time and Contact w/out Country
		tskMap.put(tsk8.id,tsk8);
		
		tskList.add(tskMap.values());
		insert tskList;
		
		Account account1 = [select id, VMT_UTF_Offset__c from Account where id =: fallbackAcct.id];
		Lead lead1 = [select id, VMT_UTF_Offset__c from Lead where id = :ld1.id];
		Contact contact1 = [select id, VMT_UTF_Offset__c from Contact where id =: con1.id];

		List<Task> tskList2 = [select id, local_date_time__c, description from Task where id IN :tskMap.keySet()];
		
		
		for (Task tsk : tskList2) {
			
			if (tsk.id == tsk1.id) {
				system.assertEquals(tsk.local_date_time__c, now + (lead1.VMT_UTF_Offset__c+5)/24);
			} else if (tsk.id == tsk2.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(lead1.VMT_UTF_Offset__c+5)/24));
				
				tsk.description = 'Add something';
				update tsk;

			} else if (tsk.id == tsk3.id) {
				system.assertEquals(tsk.local_date_time__c, now + (account1.VMT_UTF_Offset__c+5)/24);
			} else if (tsk.id == tsk4.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(account1.VMT_UTF_Offset__c+5)/24));
				
				tsk.description = 'Add something';
				update tsk;
				
			} else if (tsk.id == tsk5.id) {
				system.assertEquals(tsk.local_date_time__c, now + (contact1.VMT_UTF_Offset__c+5)/24);
			} else if (tsk.id == tsk6.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(contact1.VMT_UTF_Offset__c+5)/24));
				
				tsk.description = 'Add something';
				update tsk;
				
			} else if (tsk.id == tsk7.id) {
				system.assertEquals(tsk.local_date_time__c, now + (account1.VMT_UTF_Offset__c+5)/24);
			} else if (tsk.id == tsk8.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(account1.VMT_UTF_Offset__c+5)/24));
				
				tsk.description = 'Add something';
				update tsk;
				
			}
		}
		
		List<Task> tskList3 = [select id, local_date_time__c from Task where id IN :tskMap.keySet() ];
		
		for (Task tsk : tskList3) {
			
			if (tsk.id == tsk2.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(lead1.VMT_UTF_Offset__c+5)/24));
			} else if (tsk.id == tsk4.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(account1.VMT_UTF_Offset__c+5)/24));
			} else if (tsk.id == tsk6.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(contact1.VMT_UTF_Offset__c+5)/24));
			} else if (tsk.id == tsk8.id) {
				system.assert(tsk.local_date_time__c.isSameDay(now-(account1.VMT_UTF_Offset__c+5)/24));
			}
			
		}
		
		
		
    } */
}