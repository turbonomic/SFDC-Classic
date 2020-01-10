/**
 * 
 */
@isTest
private class TestStampSplitOwnerTeam {
	static testMethod void myUnitTest() {

		/*  Opp 1: Split owner changed normally
			Opp 2: split owner changed but same team
			Opp 3: split owner changed to user without team
			Opp 4: split owner changed to SDR
			Opp 5: split owner team changed (static team should remain the same)
			Opp 6: Split owner changed by opp owner change
			Opp 7: mulitple splits on single opp with opp owner change
			Opp 8: split owner changed by acct owner change <-- Imperfect Case, could not implement proper workaround
		*/
         
          
         //Query and grab users for different scenarios
        Map<id, User> userList = new Map<id, User>([SELECT id, Team__c, User_Role_Name__c, Full_Name__c, location__c FROM User WHERE ((isActive = true) AND ((User_Role_Name__c like '%Account Executive%' AND Team__c != null) OR (User_Role_Name__c like '%VMT SF Admin%') OR ((User_Role_Name__c like '%Sales Development Rep%') and (Not(User_Role_Name__c like '%Manager%')))))]);
        User aeTeam1;
        User aeSameTeam;
        User aeTeam2;
        User aeTeam3;
        User aeTeamToChange;
        User sdr;
        User userNoTeam;
        
        system.assert(userList.size() > 0);
        
        for (User u: userList.values()) {
        	if (u.User_Role_Name__c.contains('Account Executive')) {
        		if (aeTeam1 == null) {
        			if (u.location__c == 'United States' && !u.User_Role_Name__c.contains('Global')) {   
        				aeTeam1 = u;
        			}
    			    //system.debug(aeTeam1.Full_Name__c);
        		}
        		else if(u.Team__c == aeTeam1.Team__c) {
        			if (aeSameTeam == null) {
        				aeSameTeam = u;
        				//system.debug('aeTeam1 is ' + aeTeam1.Full_Name__c + ' (' + aeTeam1.Team__c + ')');
        			}
        		}
        		else if (aeTeam2 == null) {
        			aeTeam2 = u;
        			//system.debug('aeTeam2 is ' + aeTeam2.Full_Name__c + ' (' + aeTeam2.Team__c + ')');
        		}
        		else if (aeTeam3 == null) {
        			aeTeam3 = u;
        			//system.debug('aeTeam3 is ' + aeTeam3.Full_Name__c + ' (' + aeTeam3.Team__c + ')');
        		}
        		else if (aeTeamToChange == null) {
        			aeTeamToChange = u;
        			//system.debug('aeTeamToChange is ' + aeTeamToChange.Full_Name__c + ' (' + aeTeamToChange.Team__c + ')');
        		}
        	}
        	else if (u.User_Role_Name__c.contains('Sales Development Rep')) {
        		if (sdr == null) {
        			sdr = u;
        			//system.debug('sdr is ' + sdr.Full_Name__c + ' (' + sdr.Team__c + ')');
        		}
        		
        	}
        	else if (u.User_Role_Name__c == 'VMT SF Admin') {
        		if (userNoTeam == null) {
        			userNoTeam = u;
        			//system.debug('userNoTeam is ' + userNoTeam.Full_Name__c + ' (' + userNoTeam.Team__c + ')');
        		}
        	}
        }
        
        
        system.assert(aeTeam1 != null);
        system.assert(aeSameTeam != null);
        system.assert(aeTeam2 != null);
        system.assert(aeTeam3 != null);
        system.assert(aeTeamToChange != null);
        system.assert(sdr != null);
        system.assert(userNoTeam != null);
        
        List<Account> acctInsert = new List<Account>();
        
        Account acct1 = new Account(name = 'acct1');
        acctInsert.add(acct1);
        Account acct2 = new Account(name = 'acct2');
        acctInsert.add(acct2);
        insert acctInsert;
        
        List<Opportunity> oppInsert = new List<Opportunity>();
		
        Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1',Opportunity_Name_Override__c = 'opp1',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        oppInsert.add(opp1);
        Opportunity opp2 = new Opportunity(Type='New',amount=90000,closedate=date.Today().addDays(30),stageName='Identify',name='opp2',Opportunity_Name_Override__c = 'opp2',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=1000,of_CPU_Sockets__c=70, OwnerId = aeTeam1.id);
        oppInsert.add(opp2);
        Opportunity opp3 = new Opportunity(Type='New',amount=80000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp3',Opportunity_Name_Override__c = 'opp3',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=600,of_CPU_Sockets__c=900, OwnerId = aeTeam1.id);
        oppInsert.add(opp3);
        Opportunity opp4 = new Opportunity(Type='New',amount=70000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp4',Opportunity_Name_Override__c = 'opp4',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=750,of_CPU_Sockets__c=30, OwnerId = aeTeam1.id);
        oppInsert.add(opp4);
        Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today().addDays(30),stageName='Strong Upside',name='opp5',Opportunity_Name_Override__c = 'opp5',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=500, OwnerId = aeTeamToChange.id);
        oppInsert.add(opp5);
        Opportunity opp6 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Commit',name='opp6',Opportunity_Name_Override__c = 'opp6',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=75);
        oppInsert.add(opp6);
        Opportunity opp7 = new Opportunity(Type='New',amount=60000,closedate=date.Today().addDays(30),stageName='Identify',name='opp7',Opportunity_Name_Override__c = 'opp7',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=45,OwnerId = aeTeam1.id);
        oppInsert.add(opp7);
        Opportunity opp8 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Identify',name='opp8',Opportunity_Name_Override__c = 'opp8',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=50);
        oppInsert.add(opp8);
        
        insert oppInsert;
        
      
    	
    	//Update Opp5 Owner's team
    	String originalTeam = aeTeamToChange.Team__c;
    	if (aeTeamToChange.Team__c != 'Closers Club') {
    		aeTeamToChange.Team__c = 'Closers Club';
    	}
    	else {
    		aeTeamToChange.Team__c = 'SEC';
    	}
    	update aeTeamToChange;
    	
    	//Create Opportunity Team members for Opp7 (opp with multiple splits)
    	List<OpportunityTeamMember> memberInsert = new List<OpportunityTeamMember>();
    	OpportunityTeamMember member1 = new OpportunityTeamMember(OpportunityId = opp7.id, UserId = aeSameTeam.id);
        memberInsert.add(member1);
        OpportunityTeamMember member2 = new OpportunityTeamMember(OpportunityId = opp7.id, UserId = aeTeam2.id);
        memberInsert.add(member2);
    	insert memberInsert;
    	
    	
    	//insert 2 additional splits for Opp7
    	List<OpportunitySplit> splitInsert = new List<OpportunitySplit>();
   		OpportunitySplit split1 = new OpportunitySplit(OpportunityId = opp7.id, SplitOwnerId = aeSameTeam.id, SplitPercentage = 25);
   		splitInsert.add(split1);
   		OpportunitySplit split2 = new OpportunitySplit(OpportunityId = opp7.id, SplitOwnerId = aeTeam2.id, SplitPercentage = 25);
   		splitInsert.add(split2);
   		insert splitInsert;
   		
   		//Assert Opp7 has 3 team members and a 3-way split
   		Integer memberCount = [SELECT count() FROM OpportunityTeamMember WHERE OpportunityId =: opp7.id];
   		Integer splitCount = [SELECT count() FROM OpportunitySplit WHERE OpportunityId =: opp7.id];
   		system.assertEquals(memberCount,3);
   		system.assertEquals(splitCount,3);
    	
    	
    	//Split owner changed by opp owner change
		//mulitple splits on single opp with opp owner change
    	List<Opportunity> oppList = [SELECT id,Ownerid FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp6.id or id =: opp7.id];
    	List<Opportunity> oppUpdate = new List<Opportunity>();
    	for (Opportunity opp: oppList) {
    		//Split owner changed normally
    		if (opp.id == opp1.id) {
    			opp.OwnerId = aeTeam1.id;
    			oppUpdate.add(opp);
    		} 
    		//split owner changed but same team
    		else if (opp.id == opp2.id) {
    			opp.OwnerId = aeSameTeam.id;
    			oppUpdate.add(opp);
    		}
    		//split owner changed to user without team
    		else if (opp.id == opp3.id) {
    			opp.OwnerId = userNoTeam.id;
    			oppUpdate.add(opp);
    		}
    		//split owner changed to SDR
    		else if (opp.id == opp4.id) {
    			opp.OwnerId = sdr.id;
    			oppUpdate.add(opp);
    		}
    		else if (opp.id == opp6.id) {
    			opp.OwnerId = aeTeam2.id;
    			oppUpdate.add(opp);
    		}
    		else if (opp.id == opp7.id) {
    			opp.OwnerId = aeTeam3.id;
    			oppUpdate.add(opp);
    		}
    	}
    	
    	if (!oppUpdate.isEmpty()) update oppUpdate;
        
        //split owner changed by acct owner change
        Account newAcct2 = [Select ownerId FROM Account WHERE id =: acct2.id];
        newAcct2.ownerid = aeTeam2.id;
        update newAcct2;
        
        
        
        List<OpportunitySplit> assertSplits = new List<OpportunitySplit>([SELECT OpportunityId, SplitOwnerId, Split_Owner_Team__c, Split_Owner_User_Name__c FROM OpportunitySplit WHERE OpportunityId =: opp1.id OR OpportunityId =: opp2.id OR OpportunityId =: opp3.id OR OpportunityId =: opp4.id OR OpportunityId =: opp5.id OR OpportunityId =: opp6.id OR OpportunityId =: opp7.id OR OpportunityId =: opp8.id]);
     	
     	for (OpportunitySplit s: assertSplits) {
     		if (s.OpportunityId == opp1.id) {
     			system.debug(aeTeam1.Full_Name__c);
     			system.debug(s.SplitOwnerId);
     			System.assertEquals(s.Split_Owner_Team__c, aeTeam1.Team__c);
     		} 
     		else if (s.OpportunityId == opp2.id) {
     			System.assertEquals(s.Split_Owner_Team__c, aeTeam1.Team__c);
     		}
     		else if (s.OpportunityId == opp3.id) {
     			System.assertEquals(s.Split_Owner_Team__c, null);
     		}
     		else if (s.OpportunityId == opp4.id) {
     			System.assertEquals(s.Split_Owner_Team__c, aeTeam1.Team__c);
     		}
     		else if (s.OpportunityId == opp5.id) {
     			System.assertEquals(s.Split_Owner_Team__c, originalTeam);
     		}
     		else if (s.OpportunityId == opp6.id) {
     			System.assertEquals(s.Split_Owner_Team__c, aeTeam2.Team__c);
     		}
     		else if (s.OpportunityId == opp7.id) {
     			if (s.SplitOwnerId == aeTeam1.id) {
     				System.assertEquals(s.Split_Owner_Team__c, aeTeam1.Team__c);	
     			}
     			else if (s.SplitOwnerId == aeSameTeam.id) {
     				System.assertEquals(s.Split_Owner_Team__c, aeSameTeam.Team__c);	
     			}
     			else if (s.SplitOwnerId == aeTeam2.id) {
     				System.assertEquals(s.Split_Owner_Team__c, aeTeam2.Team__c);	
     			}
     			else { 
     				System.assertEquals(s.Split_Owner_Team__c, aeTeam3.Team__c);
     			}
     		}
     		else if (s.OpportunityId == opp8.id) {
     			system.debug(s.Split_Owner_User_Name__c);
     			//system.assertEquals(s.SplitOwnerId, aeTeam2.id);
     			//system.assertEquals(s.Split_Owner_Team__c, aeTeam2.Team__c);
     		} 
     	}
        
	}
}