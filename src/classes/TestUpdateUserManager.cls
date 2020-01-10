/**
 * This class contains test cases for the UpdateUserManager Method of the UserMethods Class.
 *
 *	Test 1: New AE User
 *	Test 2: New non-AE User
 *	Test 3: New non-AE User updated to AE
 *	Test 4: New AE User updated to no longer be AE
 *  Test 5: AE switched to a different AE Role
 *  Test 6: AE with multiple people in manager role
 *  Test 7: AE without a Parent Role Defined
 *
 */
@isTest
private class TestUpdateUserManager {

    static testMethod void myUnitTest() {
    	List<UserRole> insertUserRoles = new List<UserRole>();
    	List<User> insertManagers = new List<User>();
        List<User> insertUsers = new List<User>();

        UserRole mr1 = new UserRole(Name = 'Commercial Bus Driver - Test 1'); //Normal AE Manager
        UserRole mr2 = new UserRole(Name = 'Bus Driver - Enterprise Test 1'); //Second Normal AE Manager
        UserRole mr3 = new UserRole(Name = 'Manager - BDR Test Bus'); //Normal non-AE Manager
        UserRole mr4 = new UserRole(Name = 'Commercial Bus Driver - Test 2'); //Multiple Users in AE Manager Role

        insertUserRoles.add(mr1); insertUserRoles.add(mr2); insertUserRoles.add(mr3); insertUserRoles.add(mr4);
        insert insertUserRoles;

        insertUserRoles.clear();

        UserRole r1 = new UserRole(Name = 'Commercial Account Executive - Test 1', ParentRoleId = mr1.id); //Normal AE 1
        UserRole r2 = new UserRole(Name = 'Enterprise Rep - Test 2', ParentRoleId = mr2.id); //Normal AE 2
        UserRole r3 = new UserRole(Name = 'Commercial Sales Development Rep Test 3', ParentRoleId = mr3.id); //Non-AE Role
        UserRole r4 = new UserRole(Name = 'Commercial Account Executive - Test 4', ParentRoleId = mr4.id); //Multiple Users in Parent Role (AE)
        UserRole r5 = new UserRole(Name = 'Commercial Account Executive - Test 5'); //AE without Parent Role Defined

        insertUserRoles.add(r1); insertUserRoles.add(r2); insertUserRoles.add(r3); insertUserRoles.add(r4); insertUserRoles.add(r5);

        insert insertUserRoles;
        
        Profile p = [select Id,name from Profile where name like '%Standard%' limit 1];

        User man1 = new User(firstName = 'Manager', lastName = 'One', email = 'Manager.One@turbonomic.com', UserRoleId = mr1.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //Bus Driver 1
        User man2 = new User(firstName = 'Manager', lastName = 'Two', email = 'Manager.Two@turbonomic.com', UserRoleId = mr2.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //Bus Driver 2
        User man3 = new User(firstName = 'Manager', lastName = 'Three', email = 'Manager.Three@turbonomic.com', UserRoleId = mr3.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //SDR Manager
        User man4 = new User(firstName = 'Manager', lastName = 'Four', email = 'Manager.Four@turbonomic.com', UserRoleId = mr4.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //Bus Driver 3.1
        User man5 = new User(firstName = 'Manager', lastName = 'Five', email = 'Manager.Five@turbonomic.com', UserRoleId = mr4.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //Bus Driver 3.2

        User u1 = new User(firstName = 'User', lastName = 'One', email = 'User.One@turbonomic.com', UserRoleId = r1.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //New AE
        User u2 = new User(firstName = 'User', lastName = 'Two', email = 'User.Two@turbonomic.com', UserRoleId = r3.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //New Non-AE
        User u3 = new User(firstName = 'User', lastName = 'Three', email = 'User.Three@turbonomic.com', UserRoleId = r3.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //New non-AE to AE
        User u4 = new User(firstName = 'User', lastName = 'Four', email = 'User.Four@turbonomic.com', UserRoleId = r1.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //New AE to non-AE
        User u5 = new User(firstName = 'User', lastName = 'Five', email = 'User.Five@turbonomic.com', UserRoleId = r1.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //AE switched to other AE
        User u6 = new User(firstName = 'User', lastName = 'Six', email = 'User.Six@turbonomic.com', UserRoleId = r4.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //AE with multiple people in manager role
        User u7 = new User(firstName = 'User', lastName = 'Seven', email = 'User.Seven@turbonomic.com', UserRoleId = r5.id, IsActive = true, Start_Date__c = Date.Today(), Phone = 'n/a'); //AE without a Parent Role Defined


        insertManagers.add(man1); insertManagers.add(man2); insertManagers.add(man3); insertManagers.add(man4);
        insertUsers.add(u1); insertUsers.add(u2); insertUsers.add(u3); insertUsers.add(u4); insertUsers.add(u5); insertUsers.add(u6); insertUsers.add(u7);
        
        for (Integer i = 0; i < insertManagers.size() ; i++) {
        	User tempUser = insertManagers.get(i);
        	tempUser.UserName = tempUser.email;
        	tempUser.Alias = tempUser.firstName.left(1) + tempUser.lastName.left(4);
        	tempUser.CommunityNickname = tempUser.firstName + tempUser.lastName;
        	tempUser.TimeZoneSidKey = 'America/New_York';
        	tempUser.LocaleSidKey = 'en_US';
        	tempUser.EmailEncodingKey = 'ISO-8859-1';
        	tempUser.LanguageLocaleKey = 'en_US';
        	tempUser.ProfileId = p.id;
        	insertManagers.set(i, tempUser);
        }
        
        for (Integer i = 0; i < insertUsers.size() ; i++) {
        	User tempUser = insertUsers.get(i);
        	tempUser.UserName = tempUser.email;
        	tempUser.Alias = tempUser.firstName.left(1) + tempUser.lastName.left(4);
        	tempUser.CommunityNickname = tempUser.firstName + tempUser.lastName;
        	tempUser.TimeZoneSidKey = 'America/New_York';
        	tempUser.LocaleSidKey = 'en_US';
        	tempUser.EmailEncodingKey = 'ISO-8859-1';
        	tempUser.LanguageLocaleKey = 'en_US';
        	tempUser.ProfileId = p.id;
        	insertUsers.set(i, tempUser);
        }
        
		insert insertManagers;
        insert insertUsers;

        List<User> userList = new List<User>([SELECT id, UserRoleId FROM User WHERE id =: u1.id OR id =: u2.id OR id =: u3.id OR id =: u4.id OR id =: u5.id OR id =: u6.id OR id =: u7.id]);
        List<User> updateUser = new List<User>();

        for (User u: userList) {
        	if (u.id == u3.id) {
        		u.UserRoleId = r2.id;
        		updateUser.add(u);
        	}
        	if (u.id == u4.id) {
        		u.UserRoleId = r3.id;
        		updateUser.add(u);
        	}
        	if (u.id == u5.id) {
        		u.UserRoleId = r2.id;
        		updateUser.add(u);
        	}
        }

        update updateUser;

        List<User> userAssertList = new List<User>([SELECT id, ManagerId FROM User WHERE id =: u1.id OR id =: u2.id OR id =: u3.id OR id =: u4.id OR id =: u5.id OR id =: u6.id OR id =: u7.id]);

        for(User u: userAssertList) {
        	if (u.id == u1.id) {
        		System.assertEquals(u.ManagerId,man1.id);
        	}
        	if (u.id == u2.id) {
        		System.assertEquals(u.ManagerId,null);
        	}
        	if (u.id == u3.id) {
        		System.assertEquals(u.ManagerId,man2.id);
        	}
        	if (u.id == u4.id) {
        		System.assertEquals(u.ManagerId,null);
        	}
        	if (u.id == u5.id) {
        		System.assertEquals(u.ManagerId,man2.id);
        	}
        	if (u.id == u6.id) {
        		System.assertEquals(u.ManagerId,man4.id);
        	}
        	if (u.id == u7.id) {
        		System.assertEquals(u.ManagerId,null);
        	}
        }
    }
}