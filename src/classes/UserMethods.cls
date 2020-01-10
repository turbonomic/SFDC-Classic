global class UserMethods {
	/*
  	*	[U1]	Fill out the manager field for Account Executives/Reps
  	*	[U2]	Hash Green Circle Passwords
  	*/
  
	//	[U1] fill out manager field for Account Executives/Reps
  	public static void updateUserManager(List<User> newUsers, Map<id,User> editedUsers, Map<id, User> oldUserMap) {
		List<User> filteredNewUsers = new List<User>(); //Filtered List for new Account Executive Users
	  	Map<id, User> filteredEditedUsers = new Map<id, User>(); //Filtered Map for Users that have had their role changed and are currently an Account Executive
	  	Map<id, User> removeManagers = new Map<id, User>(); //Filtered Map for Users that are no longer Account Executives to clear out the Manager field
	  	Map<id, id> roleToParentRoleMap = new Map<id,id>(); //Role to ParentRoleId Map
	  	Set<id> rolesToQuery = new Set<id>(); //Set for Roles to be queried
	
	  	if (newUsers.size() > 0) {
	  		for (User u : newUsers) {
	  			if (u.User_Role_Name__c.contains('Account Executive') || u.User_Role_Name__c.contains('Enterprise Rep')) { 
	  				//System.debug('User going through Insert manager loop: ' + u.firstName + u.LastName);
	  				rolesToQuery.add(u.UserRoleId);
	  				filteredNewUsers.add(u);
	  			}
	  		}
	  	}


	  	if (editedUsers.size() > 0) {
	  		for (User u : editedUsers.values()) {
	  			//System.debug('User going through update manager loop: ' + u.firstName + u.LastName);
	  			if (u.User_Role_Name__c != oldUserMap.get(u.id).User_Role_Name__c) {
	  				if (u.User_Role_Name__c.contains('Account Executive') || u.User_Role_Name__c.contains('Enterprise Rep')) {
	  					rolesToQuery.add(u.UserRoleId);
	  					filteredEditedUsers.put(u.id,u);
	  				}
	  				else if (u.ManagerId != null) {
	  					removeManagers.put(u.id, u);
	  				}
	  			}
	  		}
	  	}

	  	Map<id, UserRole> roleMap = new Map<id, UserRole>([SELECT id, name, ParentRoleId FROM UserRole WHERE id in: rolesToQuery]); //Role Query
	
	  	//Map Roles to their Parent Role
	  	if (roleMap.size() > 0) {
	  		for (UserRole r : roleMap.values()) {
	  			if (r.ParentRoleId != null) { 
	  				roleToParentRoleMap.put(r.id,r.ParentRoleId);
	  			}
	  		}
	  	}

	  	//Query for the Manager Users using the Parent Role values queried above
	  	System.debug('Parent Roles: ' + roleToParentRoleMap.values());
	  	Map<id, User> managerQuery = new Map<id, User>([SELECT id, Email, UserRoleId FROM User WHERE UserRoleId in: roleToParentRoleMap.values()]);
	
	  	Map<id,List<id>> parentRoleToManagerMap = new Map<id,List<id>>();
	  	if (managerQuery.size() > 0 ) {
	  		for (User m: managerQuery.values()) {
	  			if (parentRoleToManagerMap.containsKey(m.UserRoleId)) {
	  				List<id> tempList = parentRoleToManagerMap.get(m.UserRoleId);
	  				tempList.add(m.id);
	  				parentRoleToManagerMap.put(m.UserRoleId,tempList);
	  			}
	  			else {
	  				List<id> tempList = new List<id>();
	  				tempList.add(m.id);
	  				parentRoleToManagerMap.put(m.UserRoleId,tempList);
	  			}
	  		}
	  	}
  	
	  	//Set ManagerId for AE's that have just been created
		if (filteredNewUsers.size() > 0) {
	  		for (User u : filteredNewUsers) {
	  			if (roleToParentRoleMap.containsKey(u.UserRoleId)) {
	  				if(parentRoleToManagerMap.containsKey(roleToParentRoleMap.get(u.UserRoleId))) {
	  					u.ManagerId = parentRoleToManagerMap.get(roleToParentRoleMap.get(u.UserRoleId)).get(0);
	  				}
	  			}
				
	  		}
	  	}

	
	  	//Set ManagerId for AE's that have had their role updated
		if (filteredEditedUsers.size() > 0) {
	  		for (User u : filteredEditedUsers.values()) {
	  			if (roleToParentRoleMap.containsKey(u.UserRoleId)) {
	  				if(parentRoleToManagerMap.containsKey(roleToParentRoleMap.get(u.UserRoleId))) {
						u.ManagerId = parentRoleToManagerMap.get(roleToParentRoleMap.get(u.UserRoleId)).get(0);
	  				}
	  			}
	  		}
	  	}

	  	//Clear out the manager field for non-Account Executive Users
	  	if (removeManagers.size() > 0) {
	  		for (User u: removeManagers.values()) {
	  			u.ManagerId = null;
	  		}
	  	}
  	}
  	
  	
  	//	[U2] hash GreenCircle Password
  	public static void hashUserGreenCirclePassword(Map<id,User> userMap, Map<id,User> oldUserMap) {
  		
  		List<User> filteredUsers = new List<User>();
  		
  		for (User u : userMap.values()) {
  			if (u.ProfileId == oldUserMap.get(u.id).ProfileId) {
  				if (u.ForecastEnabled == oldUserMap.get(u.id).ForecastEnabled) {
  					if (u.IsPortalEnabled == oldUserMap.get(u.id).IsPortalEnabled) {
  						if (u.Username == oldUserMap.get(u.id).Username) {
  							if (u.ProfileId == oldUserMap.get(u.id).ProfileId) {
  								if (u.User_Role_Name__c == oldUserMap.get(u.id).User_Role_Name__c) {
	  								if (u.Green_Circle_Password__c != null) {
	  									if (u.Green_Circle_Password__c != oldUserMap.get(u.id).Green_Circle_Password__c) {
	  										filteredUsers.add(u);
	  									}
	  								}
  								}
  							}
  						}
  					}
  				}
  			}
  		}
  		
  		if (filteredUsers.size() > 0) {
	  		Map<String,Private_Key__c> allKeys = Private_Key__c.getAll();
	  		//List<Private_Key__c> newKeys = new List<Private_Key__c>();
	  		Map<String,String> keyMappings = new Map<String,String>();
	  		
	  		for (User u : filteredUsers) {
	  			Blob key;
	  			if (allKeys.containsKey(u.id)) {
	  				key = EncodingUtil.base64decode(allKeys.get(u.id).Key_Value__c);
	  				system.debug('### key exists');
	  			} else {
	  				key = Crypto.generateAesKey(128);
	  				String keyValueToStore = EncodingUtil.base64encode(key);
	  				keyMappings.put(u.id,keyValueToStore);
	  				//Private_Key__c newKey = new Private_Key__c(name = u.id, Key_Value__c = keyValueToStore);
	  				//newKeys.add(newKey);
	  				system.debug('### key is new');
	  			}
	  			
	  			//Blob key = Crypto.generateAesKey(128);
	  			//system.debug('### Key is ' + EncodingUtil.base64Encode(key));
	  			Blob passwordBlob = Blob.valueOf(u.Green_Circle_Password__c);
	  			Blob encryptedValue = Crypto.encryptWithManagedIV('AES128', key, passwordBlob);
	  			String encryptedPassword = EncodingUtil.base64encode(encryptedValue);
	  			u.Hashed_Green_Circle_Password__c = encryptedPassword;
	  			
	  			system.debug('### encrypted password is now ' + u.Hashed_Green_Circle_Password__c);
	
	  		}
	  		
	  		system.debug('### keyMappings contains: ' + keyMappings.keySet().size() + ' keys to be inserted');
	  		UserMethods.insertPrivateKeys(keyMappings);
	  		//if (newKeys.size() > 0) insert newKeys;
  		}
  		
  	}
  	
  	//	[U2.5] Decrypt Password for Gregg
  	webservice static String decryptHashedPassword(Id userId) {
  		
  		User u = [select id, Hashed_Green_Circle_Password__c from User where id =: userId limit 1];
  		
  		Map<String,Private_Key__c> allKeys = Private_Key__c.getAll();
  		
  		if (allKeys.containsKey(u.id)) {
	  		String encodedKey = allKeys.get(u.id).Key_Value__c;
	  		Blob key = EncodingUtil.base64decode(encodedKey);
	  		
	  		String hashedPassword = u.Hashed_Green_Circle_Password__c;
	  		Blob base64Password = EncodingUtil.base64decode(hashedPassword);
	  		Blob decryptedPassword = Crypto.decryptWithManagedIV('AES128',key,base64Password);
	  		String output = decryptedPassword.toString();
  			return output;
  		} else {
  			return null;
  		}
  	}
  	
  	//@future (callout=true)
  	public static void insertPrivateKeys(Map<String,String> keysToInsert) {
  		
  		system.debug('### keys to be inserted: ' + keysToInsert.keySet().size());
  		
  		List<Private_Key__c> insertKeys = new List<Private_Key__c>();
  		Map<String,Private_Key__c> allKeys = Private_Key__c.getAll();
  		
  		
  		for (String userId : keysToInsert.keySet()) {
  			system.debug('### inserting key for id ' + userId + ' and key value ' + keysToInsert.get(userId));
  			Private_Key__c newKey = new Private_Key__c(name = userId, key_value__c = keysToInsert.get(userId));
  			insertKeys.add(newKey);
  		} 
  		
  		if (insertKeys.size() > 0) insert insertKeys;
  	}
  	
  	
}