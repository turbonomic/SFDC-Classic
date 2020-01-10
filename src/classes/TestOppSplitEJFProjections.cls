/*
 	Opp1: Stays in Identify, amounts should be Zero
   	Opp2: Velocity owned, Not Run Rate, Upside
   	Opp3: Enterprise owned, Not Run Rate, Strong Upside
   	Opp4: Closed Lost, amounts should be Zero
   	Opp5: "Velocity", Run Rate, Strong Upside
   	Opp6: Enterprise Owned, Not Run Rate, Commit
  	Opp7: "Velocity", Not Run Rate, Strong Upside
   	Opp8: "Velocity", Run Rate, Closed Won, amounts should be equal to Opp Amount
   	*Opp9: Run Rate, Upside, Enterprise team retained despite account owner change to Velo owner
   	*Opp10: Not Run Rate, Strong Upside, Enterprise team retained despite account owner change to Velo owner
   	*Opp11: Not Run Rate, Strong Upside, Enterprise owned opp
   	*Opp12: Not Run Rate, Upside, Enterprise owned opp
   	Opp13:
   		Split 1: Enterprise Owned, Run Rate, Upside
   		Split 2: Velocity Owned, Run Rate, Upside
   	Opp14:
   		Split 1: Enterprise Owned, Not Run Rate, Commit
   		Split 2: Velocity Owned, Not Run Rate, Commit
   	Opp15:
   		Split 1: Enterprise Owned, Run Rate, Upside
   		Split 2: Velocity Owned, Run Rate, Upside
   		Split 3: Velocity Owned, Run Rate, Upside
   		Split 4: Enterprise Owned, Run Rate, Upside
 */
@isTest
private class TestOppSplitEJFProjections {

    static testMethod void myUnitTest() {
    	
    	//Query and grab users for different scenarios
        Map<id, User> userList = new Map<id, User>([SELECT id, Team__c, User_Role_Name__c, Full_Name__c, Location__c, Team_Group_Buckets__c FROM User WHERE ((isActive = true) AND ((User_Role_Name__c like '%Account Executive%' OR User_Role_Name__c like '%Enterprise Rep%') AND Team__c != null))]);
        User aeEnt1;
        User aeEnt2;
        User aeEnt3;
        User aeVelo1;
        User aeVelo2;
        User aeEntEmea;
        
        system.assert(userList.size() > 0);
        
        for (User u: userList.values()) {
        	if (u.Team__c.contains('Enterprise')) {
        		if (u.Team__c.contains('EMEA')) {
        			if (aeEntEmea == null) {
		    			aeEntEmea = u;
		    			//system.debug('aeEntEmea is ' + aeEntEmea.Full_Name__c + ' (' + aeEntEmea.Team__c + ')');
		    		}
        		}
        		else {
		    		if (aeEnt1 == null) {
		    			aeEnt1 = u;
		    		}
		    		else if (aeEnt2 == null) {
		    			aeEnt2 = u;
		    			//system.debug('aeEnt2 is ' + aeEnt2.Full_Name__c + ' (' + aeEnt2.Team__c + ')');
		    		}
		    		else if (aeEnt3 == null) {
		    			aeEnt3 = u;
		    		}
        		}
        	}
        	else if (u.Location__c == 'United States' && u.Team_Group_Buckets__c == 'US Velocity') {
        		if (aeVelo1 == null) {
		    		aeVelo1 = u;
		    		//system.debug('aeVelo1 is ' + aeVelo1.Full_Name__c + ' (' + aeVelo1.Team__c + ')');
		    	}
		    	else if (aeVelo2 == null) {
		    		aeVelo2 = u;
		    	}
        	}
        }
        
        List<Account> acctInsert = new List<Account>();
        
        Account acct1 = new Account(name = 'acct1');
        Account acct2 = new Account(name = 'acct2', OwnerId = aeEntEmea.id);
        Account acct3 = new Account(name = 'acct3');
              
        acctInsert.add(acct1); acctInsert.add(acct2); acctInsert.add(acct3);
        insert acctInsert;
        
        
        List<Opportunity> oppInsert = new List<Opportunity>();
		
		//Acct 1 Opps
        Opportunity opp1 = new Opportunity(Type='New',amount=100000,closedate=date.Today().addDays(30),stageName='Identify',name='opp1', Opportunity_Name_Override__c = 'opp1',accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=800,of_CPU_Sockets__c=80);
        Opportunity opp2 = new Opportunity(Type='New',amount=90000,closedate=date.Today().addDays(30),stageName='Identify',name='opp2',Opportunity_Name_Override__c = 'opp2', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=1000,of_CPU_Sockets__c=70);
        Opportunity opp3 = new Opportunity(Type='New',amount=80000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp3',Opportunity_Name_Override__c = 'opp3', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Term',of_Virtual_Machines__c=600,of_CPU_Sockets__c=900);
        Opportunity opp4 = new Opportunity(Type='New',amount=70000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp4',Opportunity_Name_Override__c = 'opp4', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=750,of_CPU_Sockets__c=30);
        Opportunity opp5 = new Opportunity(Type='New',amount=60000,closedate=date.Today().addDays(30),stageName='Strong Upside',name='opp5',Opportunity_Name_Override__c = 'opp5', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=500);
        Opportunity opp6 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Commit',name='opp6',Opportunity_Name_Override__c = 'opp6', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=75);
        Opportunity opp7 = new Opportunity(Type='New',amount=60000,closedate=date.Today().addDays(30),stageName='Identify',name='opp7',Opportunity_Name_Override__c = 'opp7', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=700,of_CPU_Sockets__c=45);
        Opportunity opp8 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Identify',name='opp8',Opportunity_Name_Override__c = 'opp8', accountId=acct1.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=50);        
        
        //Acct 2 Opps - Account owner change - Teams retained as functionality to update split team static upon Account ownership change could not be implemented
        Opportunity opp9 = new Opportunity(Type='New',amount=50000,closedate=date.Today().addDays(30),stageName='Upside',name='opp9',Opportunity_Name_Override__c = 'opp9', accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=50, ownerid = aeEntEmea.id);
        Opportunity opp10 = new Opportunity(Type='New',amount=330000,closedate=date.Today().addDays(30),stageName='Upside',name='opp10',Opportunity_Name_Override__c = 'opp10', accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=250, ownerid = aeEntEmea.id);
        Opportunity opp11 = new Opportunity(Type='New',amount=480000,closedate=date.Today().addDays(30),stageName='Upside',name='opp11',Opportunity_Name_Override__c = 'opp11', accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=250, ownerid = aeEnt1.id);
        Opportunity opp12 = new Opportunity(Type='New',amount=590000,closedate=date.Today().addDays(30),stageName='Pipeline',name='opp12',Opportunity_Name_Override__c = 'opp12', accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=590, ownerid = aeEnt1.id);
        
		//Acct 3 Opps - Opps will have multiple splits
		Opportunity opp13 = new Opportunity(Type='New',amount=90000,closedate=date.Today().addDays(30),stageName='Upside',name='opp13',Opportunity_Name_Override__c = 'opp13',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=250, ownerid = aeEnt1.id);
        Opportunity opp14 = new Opportunity(Type='New',amount=300000,closedate=date.Today().addDays(30),stageName='Strong Upside',name='opp14',Opportunity_Name_Override__c = 'opp14',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=250, ownerid = aeEnt1.id);
        Opportunity opp15 = new Opportunity(Type='New',amount=80000,closedate=date.Today().addDays(30),stageName='Upside',name='opp15',Opportunity_Name_Override__c = 'opp15',accountId=acct2.Id,leadsource='Prospecting-Other',Expected_Revenue_Type__c='Perm',of_Virtual_Machines__c=900,of_CPU_Sockets__c=250, ownerid = aeEnt1.id);
        
        OpportunityMethods.oppSetStageHelper(opp1,'Identify'); OpportunityMethods.oppSetStageHelper(opp2,'Identify'); OpportunityMethods.oppSetStageHelper(opp3,'Pipeline'); OpportunityMethods.oppSetStageHelper(opp4,'Pipeline'); OpportunityMethods.oppSetStageHelper(opp5,'Strong Upside');
        OpportunityMethods.oppSetStageHelper(opp6,'Commit'); OpportunityMethods.oppSetStageHelper(opp7,'Identify'); OpportunityMethods.oppSetStageHelper(opp8,'Identify'); OpportunityMethods.oppSetStageHelper(opp9,'Upside'); OpportunityMethods.oppSetStageHelper(opp10,'Upside');
        OpportunityMethods.oppSetStageHelper(opp11,'Upside'); OpportunityMethods.oppSetStageHelper(opp12,'Pipeline'); OpportunityMethods.oppSetStageHelper(opp13,'Upside'); OpportunityMethods.oppSetStageHelper(opp14,'Strong Upside'); OpportunityMethods.oppSetStageHelper(opp15,'Upside');
        
        oppInsert.add(opp1); oppInsert.add(opp2); oppInsert.add(opp3); oppInsert.add(opp4); oppInsert.add(opp5);
        oppInsert.add(opp6); oppInsert.add(opp7); oppInsert.add(opp8); oppInsert.add(opp9); oppInsert.add(opp10);
        oppInsert.add(opp11); oppInsert.add(opp12); oppInsert.add(opp13); oppInsert.add(opp14); oppInsert.add(opp15);
        
        insert oppInsert;
        
        List<OpportunityTeamMember> memberInsert = new List<OpportunityTeamMember>();
       
        OpportunityTeamMember member1 = new OpportunityTeamMember(OpportunityId = opp13.id, UserId = aeVelo1.id);
        OpportunityTeamMember member2 = new OpportunityTeamMember(OpportunityId = opp14.id, UserId = aeVelo1.id);
        OpportunityTeamMember member3 = new OpportunityTeamMember(OpportunityId = opp15.id, UserId = aeVelo1.id);
        OpportunityTeamMember member4 = new OpportunityTeamMember(OpportunityId = opp15.id, UserId = aeVelo2.id);
        OpportunityTeamMember member5 = new OpportunityTeamMember(OpportunityId = opp15.id, UserId = aeEnt2.id);
                
        memberInsert.add(member1); memberInsert.add(member2); memberInsert.add(member3); memberInsert.add(member4); memberInsert.add(member5);
        insert memberInsert;
        
        List<OpportunitySplit> splitInsert = new List<OpportunitySplit>();
        
   		OpportunitySplit split1 = new OpportunitySplit(OpportunityId = opp13.id, SplitOwnerId = aeVelo1.id, SplitPercentage = 40);
   		OpportunitySplit split2 = new OpportunitySplit(OpportunityId = opp14.id, SplitOwnerId = aeVelo1.id, SplitPercentage = 50);
   		OpportunitySplit split3 = new OpportunitySplit(OpportunityId = opp15.id, SplitOwnerId = aeVelo1.id, SplitPercentage = 25);
   		OpportunitySplit split4 = new OpportunitySplit(OpportunityId = opp15.id, SplitOwnerId = aeVelo2.id, SplitPercentage = 25);
   		OpportunitySplit split5 = new OpportunitySplit(OpportunityId = opp15.id, SplitOwnerId = aeEnt2.id, SplitPercentage = 25);
   		   		
   		splitInsert.add(split1); splitInsert.add(split2); splitInsert.add(split3); splitInsert.add(split4); splitInsert.add(split5);
   		insert splitInsert;
        
        
        //Update Account Ownership for Account 2 which should change ownership on Opp9 and Opp10
        Account newAcct2 = [SELECT ownerid FROM Account WHERE Id =: acct2.id LIMIT 1];
        newAcct2.ownerid = aeVelo1.id;
        update newAcct2;
        
        //Make changes to Opps
        List<Opportunity> OppList = new List<Opportunity>([SELECT id, amount, StageName FROM Opportunity WHERE id =: opp1.id or id =: opp2.id or id =: opp3.id or id =: opp4.id or id =: opp5.id or id =: opp6.id or id =: opp7.id or id =: opp8.id or id =: opp9.id or id =: opp10.id or id =: opp11.id or id =: opp12.id or id =: opp13.id or id =: opp14.id or id =: opp15.id]);
		List<Opportunity> OppUpdate = new List<Opportunity>();       
       
        for (Opportunity opp : OppList) {
        	if (opp.id == opp2.id) {
        		opp.ownerId = aeVelo2.id;
        		opp.StageName = 'Upside'; OpportunityMethods.oppSetStageHelper(opp,'Upside');
        		opp.amount = 300000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp3.id) {
        		opp.ownerID = aeEntEmea.id; //Enterprise Owner
				opp.StageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
				opp.amount = 750000;
				OppUpdate.add(opp);        	
			}
        	else if (opp.id == opp4.id) {
        		opp.StageName = 'Closed Lost';
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp5.id) {
        		opp.amount = 90000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp6.id) {
        		opp.ownerid = aeEnt3.id; //Enterprise Owner
        		opp.amount = 900000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp7.id) {
        		opp.StageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
        		opp.amount = 450000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp8.id) {
        		opp.StageName = 'Closed Won';
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp9.id) {
        		opp.amount = 30000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp10.id) {
        		opp.StageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp11.id) {
        		opp.StageName = 'Strong Upside'; OpportunityMethods.oppSetStageHelper(opp,'Strong Upside');
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp12.id) {
        		opp.StageName = 'Upside'; OpportunityMethods.oppSetStageHelper(opp,'Upside');
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp13.id) {
        		opp.Amount = 100000;
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp14.id) {
        		opp.StageName = 'Commit'; OpportunityMethods.oppSetStageHelper(opp,'Commit');
        		OppUpdate.add(opp);
        	}
        	else if (opp.id == opp15.id) {
        		opp.Amount = 160000;
        		OppUpdate.add(opp);
        	}
        }
        
        update oppUpdate; 
        
        
        
        //Assertions
        List<OpportunitySplit> oppSplits = new List<OpportunitySplit>([SELECT OpportunityId, Split_Risk_Projection_50_EFJ__c, Split_Risk_Projection_75_EFJ__c, Split_Risk_Projection_90_EFJ__c, SplitOwnerId, Forecasted_Split_Bookings_editable__c, Split_Anchor_Realization_EJF__c,Split_Run_Rate_EJF__c, SplitAmount FROM OpportunitySplit WHERE OpportunityId in: oppUpdate]);
        
        for (OpportunitySplit currOppSplit: oppSplits) {
        
	        if (currOppSplit.OpportunityId == opp1.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,0);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,0);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,0);
			}
			
			else if (currOppSplit.OpportunityId == opp2.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,150000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,25000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,25000);
			}
			
			else if (currOppSplit.OpportunityId == opp3.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,375000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,562500);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,187500);
			}
			
			else if (currOppSplit.OpportunityId == opp4.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,0);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,0);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,0);
			}
			
			else if (currOppSplit.OpportunityId == opp5.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,33750);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,50625);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,67500);
			} 
			
			else if (currOppSplit.OpportunityId == opp6.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,900000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,900000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,900000);
			}
			
			else if (currOppSplit.OpportunityId == opp7.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,225000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,337500);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,187500);
			}
			
			else if (currOppSplit.OpportunityId == opp8.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,50000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,50000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,50000);
			}
			else if (currOppSplit.OpportunityId == opp9.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,7500);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,15000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,15000);
			}
			else if (currOppSplit.OpportunityId == opp10.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,165000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,247500);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,187500);
			}
			else if (currOppSplit.OpportunityId == opp11.id) {
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,240000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,360000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,187500);
			}
			else if (currOppSplit.OpportunityId == opp12.id) {
				system.debug('opp stage 12 is ' + currOppSplit.SplitOwnerId);
				System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,295000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,125000);
				System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,125000);
			}
			
			else if (currOppSplit.OpportunityId == opp13.id) {
				if (currOppSplit.SplitOwnerId == opp13.ownerId) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,15000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,30000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,30000);
				}
				else {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,5000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,10000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,10000);
				}
			}
			else if (currOppSplit.OpportunityId == opp14.id) {
				if (currOppSplit.SplitOwnerId == opp14.ownerId) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,135000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,135000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,135000);
				}
				else {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,135000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,135000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,135000);
				}
			}
			else if (currOppSplit.OpportunityId == opp15.id) {
				//Enterprise,Velocity,Velocity,Enterprise
				if (currOppSplit.SplitOwnerId == aeEnt1.id ) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,10000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,20000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,20000);
				}
				else if (currOppSplit.SplitOwnerId == aeVelo1.id ) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,5000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,10000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,10000);
				}
				else if (currOppSplit.SplitOwnerId == aeVelo2.id ) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,5000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,10000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,10000);
				}
				else if (currOppSplit.SplitOwnerId == aeEnt2.id ) {
					System.assertEquals(currOppSplit.Split_Risk_Projection_50_EFJ__c,10000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_75_EFJ__c,20000);
					System.assertEquals(currOppSplit.Split_Risk_Projection_90_EFJ__c,20000);
				}
			}
    	}
	}
}