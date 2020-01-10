public with sharing class TaskDelete_ext {

    public apexpages.standardcontroller stdCtrl {get; set;}
    private User TheUser {get; set;}
    private set<Id> ProfIds {get; set;}
    private Task TheTask {get; set;}

    public TaskDelete_ext(ApexPages.StandardController controller) {
        stdCtrl = controller;
        TheTask =(Task) stdctrl.getRecord();
        Id userId = UserInfo.getUserId();
        TheUser = [SELECT Id, ProfileId FROM User WHERE Id =: userId limit 1];
        list<Profile> Plist = [Select Id, Name FROM Profile WHERE Name = 'System Administrator'];
        ProfIds = new set<Id>();
        for(Profile P : Plist){
            ProfIds.add(P.Id);
        }
    }
    
    public PageReference checkDelete(){
      for(Id PId : ProfIds){
          if(TheUser.ProfileId == PId){
			delete TheTask;
			if (ApexPages.currentPage().getParameters().get('retURL') != null) {
            	return new PageReference(ApexPages.currentPage().getParameters().get('retURL'));
			} else {
				return new PageReference('/');
			}
          }
      }   
      return null;
   }
   
}