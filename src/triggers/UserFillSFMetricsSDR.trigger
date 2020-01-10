trigger UserFillSFMetricsSDR on User (after update) {
    
    Map<id,User> allUsers = new Map<id,User>();
    Map<id,Map<Integer,Salesforce_Metrics__c>> userToMetricsMap = new Map<id,Map<Integer,Salesforce_Metrics__c>>();
    Map<id,Talent_Management__c> userTMmap = new Map<id,Talent_Management__c>();
    
    
    for (User u: trigger.new) {
        if (u.trigger_workflow_Rules__c != trigger.oldMap.get(u.id).trigger_workflow_rules__c && (u.User_Role_name__c.contains('Sales Development Rep') || u.User_Role_Name__c.contains('Business Development Rep')))// || u.User_role_name__c.contains('Alliance') || u.User_role_name__c.contains('Inside Sales')))
            allUsers.put(u.id,u);
        
    }
    
    //get all metrics
    Map<id,Salesforce_Metrics__c> allMetrics = new Map<id,Salesforce_Metrics__c>([select id, name, Demos_Scheduled__c, Demos_Completed__c, End_Date__c, Pipeline_Added__c, Pipeline_Added_N__c, Salesforce_Metric__c, Start_Date__c, Talent_Management_File__c, User_Safe_Id__c, recordTypeId from Salesforce_Metrics__c where (User_Safe_Id__c in: allUsers.KeySet() and (recordtypeId = '01257000000Beiu' or recordtypeId = '01257000000Beiz' or recordtypeId = '012570000007Qsa') and Talent_Management_File__r.RecordTypeId = '01257000000Bekg')]);
    //system.debug('### found ' + allMetrics.size() + ' salesforce metric records');
    
    //put in a map by user and have metrics mapped by #
    for (Salesforce_Metrics__c sm : allMetrics.values()) {
        
        if(userToMetricsMap.containsKey(sm.User_Safe_Id__c)) {
            Map<Integer,Salesforce_Metrics__c> currMetricsMap = userToMetricsMap.get(sm.User_Safe_Id__c);
            if (sm.recordtypeId == '012570000007Qsa') {
        	    currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
        	    userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
            } else if (sm.recordtypeId == '01257000000Beiu' || sm.recordtypeId == '01257000000Beiz') {
            	currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
            	userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
            }
            
        } else {
            Map<Integer,Salesforce_Metrics__c> currMetricsMap = new Map<Integer,Salesforce_Metrics__c>();
            if (sm.recordtypeId == '012570000007Qsa') {
   	        	currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
   	        	userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
            } else if (sm.recordtypeId == '01257000000Beiu' || sm.recordtypeId == '01257000000Beiz') {
            	currMetricsMap.put((Integer)sm.Salesforce_Metric__c,sm);
            	userToMetricsMap.put(sm.User_Safe_Id__c,currMetricsMap);
            }
            
        }
        
    }
    
    
    Map<id,Talent_Management__c> allFiles = new Map<id,Talent_Management__c>([select id, User_Safe_id__c from Talent_Management__c where User_Safe_Id__c in: allUsers.KeySet() and recordTypeId = '01257000000Bekg']);
    
    for (Talent_Management__c tm : allFiles.values()) {
        userTMmap.put(tm.User_Safe_id__c,tm);
    }
    
    //store all opp info
    Map<id,Opportunity> allOpps = new Map<id,Opportunity>([select id, name, stageName, Identified_By__c, Opportunity_Id_Date__c, amount, closeDate from Opportunity where Identified_By__c in: allUsers.KeySet() and Opportunity_Id_Date__c != null]);
    //system.debug('### Found ' + allOpps.size() + ' opportunities');
    
    Map<id,Task> allTasks = new Map<id,Task>([select id, createdById, first_demo__c, first_demo_Scheduled__c, CreatedDate, ActivityDate from Task where type = 'Demo' and (role_Created_by_static__c like '%Business Development Rep%' or role_created_by_Static__c like '%Sales Development Rep%') and createdById in: allUsers.KeySet()]);
    
    //key is user id, value is list of opps Id'd
    Map<id,List<Opportunity>> userOppMap = new Map<id,List<Opportunity>>();
    Map<id,List<Task>> userTskMap = new Map<id,List<Task>>();
    
    for (Opportunity currOpp : allOpps.Values()) {
        
        if (userOppMap.containsKey(currOpp.Identified_By__c)) {
            List<Opportunity> oppList = userOppMap.get(currOpp.Identified_By__c);
            oppList.add(currOpp);
            userOppMap.put(currOpp.Identified_By__c,oppList);
        } else {
            List<Opportunity> oppList = new List<Opportunity>();
            oppList.add(currOpp);
            userOppMap.put(currOpp.Identified_By__c,oppList);
        }
        
    }
    
    for (Task currTsk : allTasks.values()) {
        
        if (userTskMap.containsKey(currTsk.CreatedById)) {
            List<Task> tskList = userTskMap.get(currTsk.CreatedById);
            tskList.add(currTsk);
            userTskMap.put(currTsk.CreatedById,tskList); 
        } else {
            List<Task> tskList = new List<Task>();
            tskList.add(currTsk);
            userTskMap.put(currTsk.CreatedById,tskList); 
        }
    }
    
    
    
    List<Salesforce_Metrics__c> insertNewMetrics = new List<Salesforce_Metrics__c>();
    List<Salesforce_Metrics__c> updateMetrics = new List<Salesforce_Metrics__c>();
    
    
    for (User u: allUsers.values()) {
        
        system.debug('User info:');
        system.debug(u.full_Name__c);
        system.debug(u.current_salesforce_metric__c);
        
        Talent_Management__c tm = userTMmap.get(u.id);
        system.debug('### current TM is ' + tm);
        
        Integer currMetricNum = (Integer)u.Current_Salesforce_Metric__c;
        
        Map<Integer,Salesforce_Metrics__c> userMetrics = userToMetricsMap.get(u.id);
        
        //set mtd variables
        Integer mtdOppId = 0;       Double mtdOppIdAmt = 0;
        Integer mtdDemoSched = 0;   Integer mtdDemoComp = 0;
        Integer mtdDeals = 0;       Double mtdbookings = 0;
        
        //set qtd variables
        Integer qtdOppId = 0;       Double qtdOppIdAmt = 0;
        Integer qtdDemoSched = 0;   Integer qtdDemoComp = 0;
        Integer qtdDeals = 0;       Double qtdbookings = 0;
        
        //set currMetric variables
        Integer mOppId = 0;       Double mOppIdAmt = 0;
        Integer mDemoSched = 0;   Integer mDemoComp = 0;
        Integer mDeals = 0;       Double mbookings = 0;
        
        //determine month range 
        Date mtdStart = date.today().toStartofMonth();
        Date mtdEnd = date.today().addMonths(1).toStartOfMonth().addDays(-1);
        
        //determine quarter range
        Integer currMonth = date.today().Month();
        Date qtdStart;
        Date qtdEnd;
        if (currMonth == 2 || currMonth == 3 || currMonth == 4) {
            qtdStart = date.newInstance(date.today().year(),2,1); qtdEnd = date.newInstance(date.today().year(),4,30);
        } else if (currMonth == 5 || currMonth == 6 || currMonth == 7) {
            qtdStart = date.newInstance(date.today().year(),5,1); qtdEnd = date.newInstance(date.today().year(),7,31);
        } else if (currMonth == 8 || currMonth == 9 || currMonth == 10) {
            qtdStart = date.newInstance(date.today().year(),8,1); qtdEnd = date.newInstance(date.today().year(),10,31);
        } else {
            if (currMonth == 1) {
            	qtdStart = date.newInstance(date.today().year()-1,11,1); 
            	qtdEnd = date.newInstance(date.today().year(),1,31); 
            } else {
            	qtdStart = date.newInstance(date.today().year(),11,1); 
            	qtdEnd = date.newInstance(date.today().year()+1,1,31); 
            }
        }
        
        
        if (userMetrics != null) {
            
            List<Opportunity> relevantOpps = userOppMap.get(u.id);
            List<Task> relevantTasks = userTskMap.get(u.id);
            //case 1 : current SF Metric exists already     
            if (userMetrics.containsKey(currMetricNum)) {
                
                
                
                Salesforce_Metrics__c currMetric = userMetrics.get(currMetricNum);
                
                system.debug('Current Salesforce Metric: ' + currMetric.name);
                system.debug('Start Date: ' + currMetric.start_date__c);
                system.debug('End Date: ' + currMetric.End_Date__c);
                
                
                
                Boolean updated = false;
                
                if (relevantOpps != null && !relevantOpps.isEmpty()) {
                    for (Opportunity currOpp : relevantOpps) {
                        
                        if (currOpp.Opportunity_Id_Date__c != null) {
                            system.debug('currOpp Opp ID Date is: ' + currOpp.Opportunity_Id_Date__c);
                            if (currOpp.Opportunity_Id_Date__c >= currMetric.Start_Date__c && currOpp.Opportunity_Id_Date__c <= currMetric.End_Date__c) {
                                system.debug('Opp Id Check');
                                mOppIdAmt += currOpp.Amount;
                                mOppId++;
                                updated = true;
                            }
                            
                            if (currOpp.Opportunity_Id_Date__c >= mtdStart && currOpp.Opportunity_Id_Date__c <= mtdEnd) {
                                mtdOppId++;
                                mtdOppIdAmt += currOpp.Amount;
                            }
                            
                            if (currOpp.Opportunity_Id_Date__c >= qtdStart && currOpp.Opportunity_Id_Date__c <= qtdEnd) {
                                qtdOppId++;
                                qtdOppIdAmt += currOpp.Amount;
                            }
                        }
                        
                        if (currOpp.StageName != null && currOpp.closeDate != null) {
                            if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= currMetric.Start_Date__c && currOpp.closeDate <= currMetric.End_Date__c) {
                                mBookings += currOpp.Amount;
                                mDeals++;
                                updated = true;
                            }
                            
                            if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= mtdStart && currOpp.closeDate <= mtdEnd) {
                                mtdDeals++;
                                mtdBookings += currOpp.Amount;
                            }
                            
                            if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= qtdStart && currOpp.closeDate <= qtdEnd) {
                                qtdDeals++;
                                qtdBookings += currOpp.Amount;
                            }
                            
                        }       
                    }
                }
                
                if (relevantTasks != null && !relevantTasks.isEmpty()) {
                    for (Task currTsk : relevantTasks) {
                        if (currTsk.first_demo__c) {
                            
                            if ( currTsk.activityDate >= currMetric.Start_Date__c && currTsk.activityDate <= currMetric.End_Date__c) {
                                mDemoComp++;
                                updated = true;
                            }   
                        
                            if (currTsk.activityDate >= mtdStart && currTsk.activityDate <= mtdEnd) {
                                mtdDemoComp++;
                            }
                        
                            if (currTsk.activityDate >= qtdStart && currTsk.activityDate <= qtdEnd) {
                                qtdDemoComp++;
                            }
                        }
                        
                        if (currTsk.first_demo_Scheduled__c) {
                            if (currTsk.createdDate.date() >= currMetric.Start_Date__c && currTsk.createdDate.date() <= currMetric.End_Date__c) {
                                mDemoSched++;
                                updated = true;
                            }
                            
                            if (currTsk.createdDate.date() >= mtdStart && currTsk.createdDate.date() <= mtdEnd) {
                                mtdDemoSched++;
                            }
                            
                            if (currTsk.createdDate.date() >= qtdStart && currTsk.createdDate.date() <= qtdEnd) {
                                qtdDemoSched++;
                            }
                        }
                    }
                }
                
                if (updated) {
                	currMetric.Pipeline_Added_N__c = mOppId;	currMetric.Pipeline_Added__c = mOppIdAmt;
      				currMetric.Demos_Scheduled__c = mDemoSched;	currMetric.Demos_Completed__c = mDemoComp;
      				currMetric.Deals_Closed__c = mDeals;   		currMetric.total_bookings__c = mbookings;
                	
                	updateMetrics.add(currMetric);
                }
                
            } else {
                //case 2 : curr SF Metric doesn't exist yet
                if (currMetricNum > 0) {
                    Salesforce_Metrics__c newCurrMetric = new Salesforce_Metrics__c(name = (((currMetricNum-1)*30)+1) + '-' + (currMetricNum*30), Salesforce_Metric__c = currMetricNum, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays(((currMetricNum-1)*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays(currMetricNum*30),
                                                                                    pipeline_added__c = 0, pipeline_added_N__c = 0, deals_closed__c = 0, total_bookings__c = 0, demos_Scheduled__c = 0, demos_Completed__c = 0, recordTypeId = '012570000007Qsa');        
                    
                    if (relevantOpps != null) {
                        for (Opportunity currOpp : relevantOpps) {
                        
                            if (currOpp.Opportunity_Id_Date__c != null) {
                                system.debug('currOpp Opp ID Date is: ' + currOpp.Opportunity_Id_Date__c);
                                if (currOpp.Opportunity_Id_Date__c >= newCurrMetric.Start_Date__c && currOpp.Opportunity_Id_Date__c <= newCurrMetric.End_Date__c) {
                                    system.debug('Opp Id Check');
                                   		mOppIdAmt += currOpp.Amount;
                                		mOppId++;
                                }
                            
                                if (currOpp.Opportunity_Id_Date__c >= mtdStart && currOpp.Opportunity_Id_Date__c <= mtdEnd) {
                                    mtdOppId++;
                                    mtdOppIdAmt += currOpp.Amount;
                                }
                                
                                if (currOpp.Opportunity_Id_Date__c >= qtdStart && currOpp.Opportunity_Id_Date__c <= qtdEnd) {
                                    qtdOppId++;
                                    qtdOppIdAmt += currOpp.Amount;
                                }
                            }
                            
                            if (currOpp.StageName != null && currOpp.closeDate != null) {
                                if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= newCurrMetric.Start_Date__c && currOpp.closeDate <= newCurrMetric.End_Date__c) {
                                    mBookings += currOpp.Amount;
                                    mDeals++;
                                }
                                
                                if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= mtdStart && currOpp.closeDate <= mtdEnd) {
                                    mtdDeals++;
                                    mtdBookings += currOpp.Amount;
                                }
                                
                                if (currOpp.StageName == 'Closed Won' && currOpp.closeDate >= qtdStart && currOpp.closeDate <= qtdEnd) {
                                    qtdDeals++;
                                    qtdBookings += currOpp.Amount;
                                }
                                
                            }
                                    
                        }
                        
                        
                    }
                    
                    if (relevantTasks != null && !relevantTasks.isEmpty()) {
                        for (Task currTsk : relevantTasks) {
                            if (currTsk.first_demo__c) {
                                
                                if ( currTsk.activityDate >= newCurrMetric.Start_Date__c && currTsk.activityDate <= newCurrMetric.End_Date__c) {
                                    mDemoComp++;
                                }   
                            
                                if (currTsk.activityDate >= mtdStart && currTsk.activityDate <= mtdEnd) {
                                    mtdDemoComp++;
                                }
                            
                                if (currTsk.activityDate >= qtdStart && currTsk.activityDate <= qtdEnd) {
                                    qtdDemoComp++;
                                }
                            }
                            
                            if (currTsk.first_demo_Scheduled__c) {
                                if (currTsk.createdDate.date() >= newCurrMetric.Start_Date__c && currTsk.createdDate.date() <= newCurrMetric.End_Date__c) {
                                    mDemoSched++;
                                }
                                
                                if (currTsk.createdDate.date() >= mtdStart && currTsk.createdDate.date() <= mtdEnd) {
                                    mtdDemoSched++;
                                }
                                
                                if (currTsk.createdDate.date() >= qtdStart && currTsk.createdDate.date() <= qtdEnd) {
                                    qtdDemoSched++;
                                }
                            }
                        }
                    }
                    
                    newCurrMetric.Pipeline_Added_N__c = mOppId;		newCurrMetric.Pipeline_Added__c = mOppIdAmt;
      				newCurrMetric.Demos_Scheduled__c = mDemoSched;	newCurrMetric.Demos_Completed__c = mDemoComp;
      				newCurrMetric.Deals_Closed__c = mDeals;    		newCurrMetric.total_bookings__c = mbookings;
                    
                    insertNewMetrics.add(newCurrMetric);
                }
            }
        

            // mtd case : no MTD SF metric created yet
            if (!userMetrics.containsKey(1000)) {
                system.debug('Shouldn\'nt happen');
                Salesforce_Metrics__c monthToDate = new Salesforce_Metrics__c(name = 'MTD', Salesforce_Metric__c = 1000, Talent_Management_File__c = tm.id, Start_Date__c = mtdStart, End_Date__c = mtdEnd, recordtypeId = '01257000000Beiu',
                                                        Pipeline_Added__c = mtdOppIdAmt, Pipeline_Added_N__c = mtdOppId, Total_Bookings__c = mtdBookings, Deals_Closed__c = mtdDeals, Demos_scheduled__c = mtdDemoSched, Demos_Completed__c = mtdDemoComp);
                insertNewMetrics.add(monthToDate);
            // mtd case : MTD SF metric exists
            } else {
                system.debug('Should happen MTD');
                Salesforce_Metrics__c monthToDate = userMetrics.get(1000);
                if (monthToDate.Start_Date__c.month() != mtdStart.Month()) {
                    monthToDate.Start_Date__c = mtdStart;
                    monthToDate.End_Date__c = mtdEnd;
                }
                monthToDate.Pipeline_Added__c = mtdOppIdAmt;    monthToDate.Pipeline_Added_N__c = mtdOppId;
                monthToDate.Total_Bookings__c = mtdBookings;    monthToDate.Deals_Closed__c = mtdDeals;
                monthToDate.Demos_Scheduled__c = mtdDemoSched;  monthToDate.Demos_Completed__c = mtdDemoComp;
                
                updateMetrics.add(monthToDate);
            }
        
        
            // qtd case : no QTD SF metric created yet
            if (!userMetrics.containsKey(2000)) {

                Salesforce_Metrics__c quarterToDate = new Salesforce_Metrics__c(name = 'QTD', Salesforce_Metric__c = 2000, Talent_Management_File__c = tm.id, Start_Date__c = qtdStart, End_Date__c = qtdEnd, recordTypeId = '01257000000Beiz',
                                                        Pipeline_Added__c = qtdOppIdAmt, Pipeline_Added_N__c = qtdOppId, Total_Bookings__c = qtdBookings, Deals_Closed__c = qtdDeals, Demos_Scheduled__c = qtdDemoSched, Demos_Completed__c = qtdDemoComp);
                system.debug('@@@ qtd name: ' + quarterToDate.name);
                system.debug('@@@ qtd dates: ' + quarterToDate.start_Date__c + ' - ' + quarterToDate.End_Date__c);
                insertNewMetrics.add(quarterToDate);
            // qtd case : QTD SF metric exists
            } else {
                Salesforce_Metrics__c quarterToDate = userMetrics.get(2000);

                if (quarterToDate.start_Date__c != qtdStart) {
                    quarterToDate.start_Date__c = qtdStart;
                    quarterToDate.end_Date__c = qtdEnd;
                }
                
                quarterToDate.Pipeline_Added__c = qtdOppIdAmt;      quarterToDate.Pipeline_Added_N__c = qtdOppId;
                quarterToDate.Total_Bookings__c = qtdBookings;      quarterToDate.Deals_Closed__c = qtdDeals;
                quarterToDate.Demos_Scheduled__c = qtdDemoSched;    quarterToDate.Demos_Completed__c = qtdDemoComp;
                
                updateMetrics.add(quarterToDate);
                
            }
            
            // case : next metric doesn't exist yet
            if (!userMetrics.containsKey(currMetricNum + 1)) {
                Salesforce_Metrics__c newMetric = new Salesforce_Metrics__c(name = (currMetricNum*30+1) + '-' + ((currMetricNum+1)*30), recordTypeId = '012570000007Qsa', Salesforce_Metric__c = currMetricNum + 1, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum+1)*30));
                system.debug('@@@ metric Name is: ' + newMetric.name);
                insertNewMetrics.add(newMetric);
            }
        // case : no metrics exist yet  
        } else {
            // create current metric
            if (currMetricNum > 0) {
                Salesforce_Metrics__c newCurrMetric = new Salesforce_Metrics__c(name = (((currMetricNum-1)*30)+1) + '-' + (currMetricNum*30), recordTypeId = '012570000007Qsa', Salesforce_Metric__c = currMetricNum, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays(((currMetricNum-1)*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays(currMetricNum*30));
                insertNewMetrics.add(newCurrMetric);
            }
            
            // create next metric
            Salesforce_Metrics__c newMetric = new Salesforce_Metrics__c(name = (currMetricNum*30+1) + '-' + ((currMetricNum+1)*30), recordTypeId = '012570000007Qsa', Salesforce_Metric__c = currMetricNum + 1, Talent_Management_File__c = tm.id, Start_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum*30)+1), End_Date__c = u.Most_Recent_Movement_Date__c.addDays((currMetricNum+1)*30));
            system.debug('@@@ metric Name is: ' + newMetric.name);
            insertNewMetrics.add(newMetric);
            
            // create mtd metric
            Salesforce_Metrics__c monthToDate = new Salesforce_Metrics__c(name = 'MTD', Salesforce_Metric__c = 1000, Talent_Management_File__c = tm.id, Start_Date__c = mtdStart, End_Date__c = mtdEnd, recordTypeId = '01257000000Beiu');
            insertNewMetrics.add(monthToDate);
            
            // create qtd metric
            Salesforce_Metrics__c quarterToDate = new Salesforce_Metrics__c(name = 'QTD', Salesforce_Metric__c = 2000, Talent_Management_File__c = tm.id, Start_Date__c = qtdStart, End_Date__c = qtdEnd, recordTypeId = '01257000000Beiz');
            insertNewMetrics.add(quarterToDate);
        }
    }
    
    //insert and update metrics
    if(!insertNewMetrics.isEmpty()) insert insertNewMetrics;
    if(!updateMetrics.isEmpty()) update updateMetrics;
    
    
    

}