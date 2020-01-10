trigger UserStampTransitionFromRole on User (before update) {

	Map<Id,User> oldUserMap = new Map<Id,User>();
	Map<Id,User> currUserMap = new Map<Id,User>();
	List<Id> userRoleIds = new List<Id>();


	for (User u : trigger.new){
	
		User currUser = trigger.newMap.get(u.id);
		User oldUser = trigger.oldMap.get(u.id);


		currUserMap.put(currUser.id,currUser);		
		oldUserMap.put(oldUser.id,oldUser);

		if (u.UserRoleId != null) userRoleIds.add(u.UserRoleId);
		if (oldUser.UserRoleId != null) userRoleIds.add(oldUser.UserRoleId);
		
	}
	
	Map<Id,UserRole> userRoles = new Map<Id,UserRole>([select id, name from UserRole where id in :userRoleIds]);
	
	for (ID currId : currUserMap.keySet()){
		
		User currUser = currUserMap.get(currId);
		User oldUser = oldUserMap.get(currId);
		UserRole oldUserRole = userRoles.get(oldUser.UserRoleId);
		UserRole currUserRole = userRoles.get(currUser.UserRoleId);
		
		system.debug('*** currUser is ' + currUser);
		system.debug('*** old Role is ' + oldUserRole);
		system.debug('*** new role is ' + currUserRole);
		
		if (oldUserRole != null) {
			if ((oldUserRole.Name.contains('Account Executive') || oldUserRole.Name.contains('Business Development Rep') || oldUserRole.Name.contains('Bus Driver') || oldUserRole.Name.contains('Sales Development Rep')) && !oldUserRole.Name.contains('Enterprise')) {
				system.debug('### check');
				if ((!currUserRole.Name.contains('Account Executive')) && (!currUserRole.Name.contains('Business Development Rep')) && (!currUserRole.Name.contains('Bus Driver')) && (!currUserRole.Name.contains('Sales Development Rep')) && (!currUserRole.Name.contains('Enterprise'))) {
					system.debug('### check2');
					currUser.Transition_from_BDR_AE_Bus_Driver_Date__c = date.today();
					currUser.Transition_from_Role__c = oldUserRole.Name;
					system.debug('### final check and Transition From Role is ' + currUser.Transition_from_Role__c );
				}
			}
		}
	}	
}