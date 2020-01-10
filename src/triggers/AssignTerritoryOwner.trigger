trigger AssignTerritoryOwner on Account (before update) {
/*
    Map<Id,Id> accountToAEMap = new Map<Id,Id>();
    Map<Id,Account> acctMap = new Map<id,Account>();
  
    for (Account acct : trigger.new) {
        if (acct.Ready_To_Assign_Territory_Owner__c) {
            acctMap.put(acct.id,acct);
        }
    }

    if (!acctMap.isEmpty()) {
  
        List<Account> greenMonsters = new List<Account>();
        List<Account> closerClub = new List<Account>();
        List<Account> beastCoast = new List<Account>();
        List<Account> sec = new List<Account>();
        List<Account> kitchen = new List<Account>();
        List<Account> wildWest = new List<Account>();
        List<Account> greenFlash = new List<Account>();
        List<Account> bangersnCash = new List<Account>();
        List<Account> titans = new List<Account>();
        List<Account> greenberets = new List<Account>();
    //  List<Account> eunit = new List<Account>();
        List<Account> latam = new List<Account>();
    
      
        Map<Id,User> userMap = new Map<Id,User>([select id, name, Team__c, User_Role_Name__c, Aligned_Account_Executive__c from User where isActive = true]);
        Map<String,List<User>> teamMap = new Map<String,List<User>>();
        teamMap.put('Notti By Nature',new List<User>());
        teamMap.put('Closers Club', new List<User>());
        teamMap.put('Shake n Bake',new List<User>());
        teamMap.put('SEC',new List<User>());
        teamMap.put('The Kitchen',new List<User>());
        teamMap.put('The Hunchbacks',new List<User>());
        teamMap.put('The Wild West',new List<User>());
        teamMap.put('Ganas iOS',new List<User>());
        teamMap.put('Los Conquistadores',new List<User>());
        teamMap.put('The Titans',new List<User>());
        teamMap.put('Green Berets',new List<User>());
    //  teamMap.put('E-Unit',new List<User>());
    

        for (User u : userMap.values()) {
            if(u.team__c == 'Notti By Nature' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('Notti By Nature');
                userList.add(u);
                teamMap.put('Notti By Nature',userList);
            } else if (u.team__c == 'Closers Club' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('Closers Club');
                userList.add(u);
                teamMap.put('Closers Club',userList);
            } else if (u.team__c == 'Shake n Bake' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('Shake n Bake');
                userList.add(u);
                teamMap.put('Beast Coast',userList);
            } else if (u.team__c == 'Green Berets' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('Green Berets');
                userList.add(u);
                teamMap.put('Green Berets',userList);
            } else if (u.team__c == 'SEC' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('SEC');
                userList.add(u);
                teamMap.put('SEC',userList);
            } else if (u.team__c == 'The Kitchen' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('The Kitchen');
                userList.add(u);
                teamMap.put('The Kitchen',userList);
            } else if (u.team__c == 'The Wild West' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('The Wild West');
                userList.add(u);
                teamMap.put('The Wild West',userList);
            } else if (u.team__c == 'The Hunchbacks' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('The Hunchbacks');
                userList.add(u);
                teamMap.put('The Hunchbacks',userList);
            } else if (u.team__c == 'The Titans' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('The Titans');
                userList.add(u);
                teamMap.put('The Titans',userList);
            }// else if (u.team__c == 'Ganas iOS' && (u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep') || u.User_Role_Name__c.containsIgnoreCase('US Commercial SDR'))) {
    //              List<User> userList = teamMap.get('Ganas iOS');
    //              userList.add(u);
    //              teamMap.put('Ganas iOS',userList);} 
            else if (u.team__c == 'Los Conquistadores' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('Los Conquistadores');
                userList.add(u);
                teamMap.put('Los Conquistadores',userList);
            }   
        
        
        // else if (u.team__c == 'E-Unit' && (u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep') || u.User_Role_Name__c.containsIgnoreCase('US Commercial SDR'))) {
    //          List<User> userList = teamMap.get('E-Unit');
    //          userList.add(u);
    //          teamMap.put('E-Unit',userList);
    //      }
        }

  
        for (Account acct : acctMap.values()) {
        
            ID currUserID = userInfo.getUserID();
        
            if (currUserID != '005D0000003PSDbIAO' && currUserID != '005D0000005Gi0mIAC') { 
                User currUser = userMap.get(currUserID);
                
                if (acct.AE_Rep__c != null) {
                    acct.Ready_To_Assign_Territory_Owner__c = false;
                } else if (acct.SMB_Territory_Owner__c != null) {
                    acct.AE_Rep__c = acct.SMB_Territory_Owner__c;
                    acct.Ready_To_Assign_Territory_Owner__c = false;
                } else if (currUser.User_Role_Name__c.containsIgnoreCase('Account Executive')) {
                    acct.AE_Rep__c = currUser.Id;
                    acct.Ready_To_Assign_Territory_Owner__c = false;
                }// else if ((currUser.User_Role_Name__c.containsIgnoreCase('Sales Development Rep') || currUser.User_Role_Name__c.containsIgnoreCase('Business Development Rep')) && currUser.Aligned_Account_Executive__c != null) {
    //              acct.AE_Rep__c = currUser.Aligned_Account_Executive__c;
    //              acct.Ready_To_Assign_Territory_Owner__c = false; } 
                else {
                    if (acct.Territory_Team__c == 'Notti By Nature') {
                        greenMonsters.add(acct);
                    } else if (acct.Territory_Team__c == 'Closers Club') {
                        closerClub.add(acct);
                    } else if (acct.Territory_Team__c == 'Green Berets') {
                        greenberets.add(acct);
                    } else if (acct.Territory_Team__c == 'Shake n Bake') {
                        beastCoast.add(acct);
                    } else if (acct.Territory_Team__c == 'SEC') {
                        sec.add(acct);
                    } else if (acct.Territory_Team__c == 'The Kitchen') {
                        kitchen.add(acct);
                    } else if (acct.Territory_Team__c == 'The Hunchbacks') {
                        greenFlash.add(acct);
                    } else if (acct.Territory_Team__c == 'The Wild West') {
                        wildWest.add(acct);
                    } else if (acct.Territory_Team__c == 'The Titans') {
                        titans.add(acct);
                    } //else if (acct.Territory_Team__c == 'Ganas iOS') {
                    //  bangersnCash.add(acct); } 
                    else if (acct.Territory_Team__c == 'Los Conquistadores') {
                        latam.add(acct);
                    }
                }
            }
            
            if (greenMonsters.size() > 0){
                List<User> users = teamMap.get('Notti By Nature');
                system.assert(users.size()>0);
                for (Account currAcct : greenMonsters){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (closerClub.size() > 0){
                List<User> users = teamMap.get('Closers Club');
                system.assert(users.size()>0);
                for (Account currAcct : closerClub){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (greenberets.size() > 0){
                List<User> users = teamMap.get('Green Berets');
                system.assert(users.size()>0);
                for (Account currAcct : greenberets){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (beastCoast.size() > 0){
                List<User> users = teamMap.get('Shake n Bake');
                system.assert(users.size()>0);
                for (Account currAcct : beastCoast){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (sec.size() > 0){
                List<User> users = teamMap.get('SEC');
                system.assert(users.size()>0);
                for (Account currAcct : sec){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (kitchen.size() > 0){
                List<User> users = teamMap.get('The Kitchen');
                system.assert(users.size()>0);
                for (Account currAcct : kitchen){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (greenFlash.size() > 0){
                List<User> users = teamMap.get('The Hunchbacks');
                system.assert(users.size()>0);
                for (Account currAcct : greenFlash){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (wildWest.size() > 0){
                List<User> users = teamMap.get('The Wild West');
                system.assert(users.size()>0);
                for (Account currAcct : wildWest){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            if (titans.size() > 0){
                List<User> users = teamMap.get('The Titans');
                system.assert(users.size()>0);
                for (Account currAcct : titans){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            /*
            if (bangersnCash.size() > 0){
                List<User> users = teamMap.get('Ganas iOS');
                system.assert(users.size()>0);
                for (Account currAcct : bangersnCash){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
            *//*
            if (latam.size() > 0) {
                List<User> users = teamMap.get('Los Conquistadores');
                system.assert(users.size()>0);
                for (Account currAcct : latam){
                    User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                    currAcct.AE_Rep__c = currUser.Id;
                    currAcct.Ready_To_Assign_Territory_Owner__c = false;
                }
            }
          
        //  if (eunit.size() > 0){
        //      List<User> users = teamMap.get('E-Unit');
        //      system.assert(users.size()>0);
        //      for (Account currAcct : eunit){
        //          User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
        //          currAcct.AE_Rep__c = currUser.Id;
        //          currAcct.Ready_To_Assign_Territory_Owner__c = false;
        //      }
        //  }

        }
    }
*/
}