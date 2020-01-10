trigger UserTrigger on User (before insert, before update) {
	
    Map<id,User> users = new Map<id,User>();
	List<User> insertUsers = new List<User>();
	Map<id,User> oldUsers = new Map<id,User>();
	
	for (User u : trigger.new) {
		if (trigger.isInsert) {
			insertUsers.add(u);
		} else if (trigger.isUpdate) {
			if (u.isActive && trigger.oldMap.get(u.id).isActive) {
				users.put(u.id,u);
				oldUsers.put(u.id,trigger.oldMap.get(u.id));
			}
		}
	}
	
	
	if (trigger.isBefore) {
		
		if (trigger.isInsert) {
			UserMethods.updateUserManager(insertUsers, users, oldUsers);
		} else if (trigger.isUpdate) {
			UserMethods.updateUserManager(insertUsers, users, oldUsers);
			UserMethods.hashUserGreenCirclePassword(users,oldUsers);
		}
		
	} 
	else if (trigger.isAfter) {
		
		if (trigger.isInsert) {
			//UserMethods.updateUserManager(insertUsers, users, oldUsers);
			
		} else if (trigger.isUpdate) {
			//UserMethods.updateUserManager(insertUsers, users, oldUsers);
		}
	}
	
}