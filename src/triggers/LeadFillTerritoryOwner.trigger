trigger LeadFillTerritoryOwner on Lead (before insert, before update) {
Trigger_Settings__c TS = Trigger_Settings__c.getValues('LeadFillTerritoryOwner');
  if(TS.isActive__c == TRUE){
    
    Map<id,Lead> leadMap = new Map<id,Lead>();
    
    List<Lead> usCommEast1 = new List<Lead>();
    List<Lead> usCommEast2 = new List<Lead>();
    List<Lead> usCommEast3 = new List<Lead>();
    List<Lead> usCommWest1 = new List<Lead>();
    List<Lead> usCommWest2 = new List<Lead>();
    List<Lead> usCommWest3 = new List<Lead>();
    List<Lead> emeaCommUK = new List<Lead>();
    List<Lead> emeaCommFrance = new List<Lead>();
    
    for (Lead l : trigger.new) {
        if (l.LeadSource != null && l.Account__c == null){
            leadMap.put(l.id,l);
        }
    }
    
    for (Lead l : leadMap.values()) {
        if (!l.LeadSource.containsIgnoreCase('Prospecting')) {
            if (l.Territory_Owner_Lead__c != null) {
            } else {
                if (l.State != null) {
                    system.debug('state check');
                    if (l.Lead_Assign_West__c == 'Y'){
                        usCommWest1.add(l);
                    } else if (l.Lead_Assign_West_2__c == 'Y'){
                        usCommWest2.add(l);
                    } else if (l.Lead_Assign_West_3__c == 'Y'){
                        usCommWest3.add(l);
                    } else if (l.Lead_Assign_North_East__c == 'Y'){
                        usCommEast1.add(l);
                    } else if (l.Lead_Assign_North_East_2__c == 'Y'){
                        usCommEast2.add(l); 
                    } else if (l.Lead_Assign_North_east_3__c == 'Y'){
                        usCommEast3.add(l);
                    } 
                }
                if (l.Country != null) {
                    if (l.Lead_Assign_EMEA__c == 'Y'){
//                      if (l.Country == 'United Kingdom' || l.Country == 'South Africa'){
//                          bangersnCash.add(l);
//                      } else {
//                          eunit.add(l);
//                      }
                        emeaCommUK.add(l);
                    }
                }
            }   
        }
    } 
    
    if (!leadMap.isEmpty()) {
        Map<Id,User> userMap = new Map<Id,User>([select id, name, Team__c, User_Role_Name__c from User where isActive = true]);
        Map<String,List<User>> teamMap = new Map<String,List<User>>();
        //teamMap.put('Notti By Nature',new List<User>());
        teamMap.put('US Comm East 1', new List<User>());
        teamMap.put('US Comm East 2', new List<User>());
        teamMap.put('US Comm East 3',new List<User>());
        teamMap.put('US Comm West 1',new List<User>());
        teamMap.put('US Comm West 2',new List<User>());
        teamMap.put('US Comm West 3',new List<User>());
        teamMap.put('EMEA Comm UK',new List<User>());
        teamMap.put('EMEA Comm France',new List<User>());
  
        for (User u : userMap.values()) {
            if (u.team__c == 'US Commercial East 1' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm East 1');
                userList.add(u);
                teamMap.put('US Comm East 1',userList);
            } else if (u.team__c == 'US Commercial East 2' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm East 2');
                userList.add(u);
                teamMap.put('US Comm East 2',userList);
            } else if (u.team__c == 'US Commercial East 3' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm East 3');
                userList.add(u);
                teamMap.put('US Comm East 3',userList);
            } else if (u.team__c == 'US Commercial West 1' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm West 1');
                userList.add(u);
                teamMap.put('US Comm West 1',userList);
            } else if (u.team__c == 'US Commercial West 2' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm West 2');
                userList.add(u);
                teamMap.put('US Comm West 2',userList);
            } else if (u.team__c == 'US Commercial West 3' && u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep')) {
                List<User> userList = teamMap.get('US Comm West 3');
                userList.add(u);
                teamMap.put('US Comm West 2',userList);
            } else if (u.team__c == 'EMEA Commercial UK' && (u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep') || u.User_Role_Name__c.containsIgnoreCase('US Commercial SDR'))) {
                List<User> userList = teamMap.get('EMEA Comm UK');
                userList.add(u);
                teamMap.put('EMEA Comm UK',userList);
            }// else if (u.team__c == 'EMEA Commercial France' && (u.User_Role_Name__c.containsIgnoreCase('US Commercial Rep') || u.User_Role_Name__c.containsIgnoreCase('US Commercial SDR'))) {
    //          List<User> userList = teamMap.get('EMEA Comm France');
    //          userList.add(u);
    //          teamMap.put('EMEA Comm France',userList);
    //      }
        }
    
//      system.debug('Green Monsters has ' + teamMap.get('The Green Monsters').size());
//      system.debug('SEC has ' + teamMap.get('SEC').size());
//      system.debug('### num greenMonster Leads ' + greenMonsters.size());
    
    
    
    
    
        if (usCommEast1.size() > 0){
            List<User> users = teamMap.get('US Comm East 1');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommEast1){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (usCommEast2.size() > 0){
            List<User> users = teamMap.get('US Comm East 2');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommEast2){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (usCommEast3.size() > 0){
            List<User> users = teamMap.get('US Comm East 3');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommEast3){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (usCommWest1.size() > 0){
            List<User> users = teamMap.get('US Comm West 1');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommWest1){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (usCommWest2.size() > 0){
            List<User> users = teamMap.get('US Comm West 2');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommWest2){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (usCommWest3.size() > 0){
            List<User> users = teamMap.get('US Comm West 3');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : usCommWest3){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
        if (emeaCommUK.size() > 0){
            List<User> users = teamMap.get('EMEA Comm UK');
            system.debug('Size of the Users is-------------------' +users.size());
            system.assert(users.size()>0);
            for (Lead currLead : emeaCommUK){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
    /*  if (eunit.size() > 0){
            List<User> users = teamMap.get('E-Unit');
            system.assert(users.size()>0);
            for (Lead currLead : eunit){
                User currUser = users.get((Integer) Math.Floor(Math.Random() * users.size()));
                currLead.Territory_Owner_Lead__c = currUser.Id;
            }
        }
    */
    }
    }
}