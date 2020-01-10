global class DeleteMarketoTasks implements Schedulable, Database.Batchable<Sobject> {
	
	global string queryStr;
	global boolean runBatch;
	
	
	global DeleteMarketoTasks(){
		User mUsr = [select id, Name from User where isActive = true and Name = 'Marketo' limit 1];
		
		if (mUsr != null) {
			if (mUsr.Name == 'Marketo') runBatch = true;
		} else {
			runBatch = false;
		}
		
		queryStr = 'SELECT id, Subject, OwnerId FROM Task WHERE ((Subject like \'Was Sent Email:%\' OR Subject like \'Opened Email:%\') AND ActivityDate > ' + String.valueOf(Date.today()-180) + ' AND ActivityDate < ' + String.valueOf(Date.Today()-90) + ' AND OwnerId = \'' + mUsr.id + '\')';
		system.debug(queryStr);
	}
	
	global void execute(SchedulableContext sc) { 
		if (runBatch) {
			Id jobId = Database.executeBatch(new DeleteMarketoTasks(), 1000);
		}
	}
	
	global Database.Querylocator start(Database.BatchableContext bc){
		return Database.getQueryLocator(queryStr);
	}
		
	global void execute(Database.BatchableContext BC, list<Sobject> scope) {
	
		List<Task> delList = new List<Task>();
		for(Sobject obj : scope){
			Task tsk = (Task)obj;
			delList.add(tsk);
		}
			
		delete delList;
	}
	
	global void finish(Database.BatchableContext BC){
		 AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, ExtendedStatus, 
            TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
    
        // Send an email to the Apex job's submitter notifying of job completion (only if error) 
        if (a.NumberOfErrors > 0) {
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        String[] toAddresses = new String[] {a.CreatedBy.Email};
	        mail.setToAddresses(toAddresses);
	        mail.setSubject('DeleteMarketoTasks Batch Job Results: ' + a.Status);
	        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.\n' + a.ExtendedStatus);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
	}
	
	@isTest
	public static void testDeleteTasks(){
		

		Account a = new Account(Name = 'test');
		insert a;
		
		Contact c = new Contact(LastName = 'test', AccountId = a.id);
		insert c;
		
		User mUsr = [select id, Name from User where isActive = true and Name = 'Marketo' limit 1];
		system.assertEquals(mUsr.Name, 'Marketo');
		
		Task t1 = new Task(Status='Completed', Subject ='Was Sent Email: XXXXX', ActivityDate=Date.Today().addDays(-11), WhoId=c.id, OwnerId = mUsr.id);
		Task t2 = new Task(Status='Completed', Subject ='Opened Email: XXXXX', ActivityDate=Date.Today().addDays(-95), WhoId=c.id, OwnerId = mUsr.id);
		//Task t3 = new Task(Status='Completed', Subject ='Blah', ActivityDate=Date.Today().addDays(-95));
		insert new List<Task> {t1, t2};
		
		Test.StartTest();
		DeleteMarketoTasks d = new DeleteMarketoTasks();
		d.execute(null);
		Test.StopTest();
		
		List<Task> tskList = [select id, OwnerId from Task where id =: t1.id or id =: t2.id];
		system.assertEquals(tskList.size(), 1);
        
	}

}