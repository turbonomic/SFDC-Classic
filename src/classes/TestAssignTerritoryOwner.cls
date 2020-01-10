/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestAssignTerritoryOwner {
/*
    static testMethod void myUnitTest() {
        
        
        User ae = [select id, name, user_role_name__c from User where user_role_name__c like '%Commercial Account Executive%' and isActive = true limit 1];
//      User alignedBDR = [select id, name, user_role_name__c, Aligned_Account_Executive__c from User where (user_role_name__c like '%Sales Development Rep%' and Aligned_Account_Executive__c != null and team__c = 'The Pack Commercial') and isActive = true limit 1];
        User unalignedBDR = [select id, name, user_role_name__c, Aligned_Account_Executive__c from User where (user_role_name__c like '%Business Development Rep%' and Aligned_Account_Executive__c = null) and isActive = true limit 1];
        
        Map<Id,User> westUsers = new Map<Id,User>([select id, name from User where Team__c =: 'The Hunchbacks' and userRole.name like '%Account Executive%']);
        
        
        Map<Id,Account> acctList = new Map<Id,Account>();
        List<Account> acctList2 = new List<Account>();
        Map<id,Lead> leadMap = new Map<id,Lead>();
        
        system.runAs(ae){
            List<Account> acctList3 = new List<Account>();
            List<Lead> leadList1 = new List<Lead>();
            
            Account acct1 = new Account(name = 'Acct1', billingCountry = 'United States', billingState = 'Massachusetts');
            Account acct4 = new Account(name = 'Acct4', billingCountry = 'United States', billingState = 'Massachusetts', SMB_Territory_Owner__c = '005D0000004KUK5IAO');
            Lead lead1 = new Lead(name = 'Lead1' , LastName='Test1', Account = 'Acct1', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            Lead lead2 = new Lead(name = 'Lead2' , LastName='Test2', Account = 'Acct4', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            acctList3.add(acct1);
            acctList3.add(acct4);
            leadList1.add(lead1);
            leadList1.add(lead2);
            
            insert acctList3;
            insert leadList1;
            
            List<Account> afterAcctList = [select id, name, AE_Rep__c, Ready_To_Assign_Territory_Owner__c from Account where id =: acct1.id or id =: acct4.id];
            List<List> afterLeadList = [select id,name, LeadSource from Lead where id =: lead1.id];
            
            for (Account afterAcct : afterAcctList){
                if(afterAcct.id == acct1.id){
                    system.assertEquals(afterAcct.AE_Rep__c,ae.id);
                    system.assertEquals(afterAcct.Ready_To_Assign_Territory_Owner__c,false);    
                } else {
                    system.assertEquals(afterAcct.AE_Rep__c,'005D0000004KUK5IAO');
                    system.assertEquals(afterAcct.Ready_To_Assign_Territory_Owner__c,false);    
                }
            }
        }

/*      
        system.runAs(alignedBDR) {
            
            List<Account> acctList4 = new List<Account>();
            List<Lead> leadList1 = new List<Lead>();
            
            Account acct2 = new Account(name = 'Acct2', billingCountry = 'United States', billingState = 'California');
            Account acct3 = new Account(name = 'Acct3', billingCountry = 'United States', billingState = 'California', SMB_Territory_Owner__c = '005D0000004KUK5IAO');
            Lead lead1 = new Lead(name = 'Lead1' , LastName='Test1', Account = 'Acct1', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            Lead lead2 = new Lead(name = 'Lead2' , LastName='Test2', Account = 'Acct4', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            acctList4.add(acct2);
            acctList4.add(acct3);
            leadList1.add(lead1);
            leadList1.add(lead2);
            
            insert acctList4;
            insert leadList1;
            
            List<Account> afterAcctList2 = [select id, name, AE_Rep__c, Ready_To_Assign_Territory_Owner__c from Account where id =: acct2.id or id =: acct3.id];
            
            for (Account afterAcct : afterAcctList2){
                if (afterAcct.id == acct2.id){
                    system.assertEquals(afterAcct.AE_Rep__c,alignedBDR.Aligned_Account_Executive__c);
                    system.assertEquals(afterAcct.Ready_To_Assign_Territory_Owner__c,false);    
                } else {
                    system.assertEquals(afterAcct.AE_Rep__c,'005D0000004KUK5IAO');
                    system.assertEquals(afterAcct.Ready_To_Assign_Territory_Owner__c,false);    
                }
                
            }       

        }
    
        
        system.runAs(unalignedBDR) {
            Account acct3 = new Account(name = 'Acct3', billingCountry = 'United States', billingState = 'California');
            Account acct4 = new Account(name = 'Acct4', billingCountry = 'United States', billingState = 'Texas');
            Account acct5 = new Account(name = 'Acct5', billingCountry = 'United States', billingState = 'Florida');
            Account acct6 = new Account(name = 'Acct6', billingCountry = 'United States', billingState = 'Georgia');
            Account acct7 = new Account(name = 'Acct7', billingCountry = 'United States', billingState = 'Ohio');
            Account acct8 = new Account(name = 'Acct8', billingCountry = 'United States', billingState = 'New York');
            Account acct9 = new Account(name = 'Acct9', billingCountry = 'United States', billingState = 'Pennsylvania');
            Account acct10 = new Account(name = 'Acct10', billingCountry = 'Peru');
            Lead lead1 = new Lead(name = 'Lead1' , LastName='Test1', Account = 'Acct1', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            Lead lead2 = new Lead(name = 'Lead2' , LastName='Test2', Account = 'Acct4', Company='TestCompany', LeadSource='Prospecting - Direct Sales');
            
            acctList.put(acct3.id,acct3);
            acctList.put(acct4.id,acct4);
            acctList.put(acct5.id,acct5);
            acctList.put(acct6.id,acct6);
            acctList.put(acct7.id,acct7);
            acctList.put(acct8.id,acct8);
            acctList.put(acct9.id,acct9);
            acctList.put(acct10.id,acct10);
            
            acctList2.add(acctList.values());
            leadList1.add(lead1);
            leadList1.add(lead2);
            
            insert acctList2;
            insert leadList1;
            
            
            
            List<Account> accts = [select id, name, ae_rep__c, Ready_To_Assign_Territory_Owner__c from Account where id IN :acctList.keySet()];
            for (Account acct : accts){
                if (acct.id == acct3.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assert(westUsers.containsKey(acct.ae_rep__c) == true);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct4.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct5.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct6.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct7.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct8.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct9.id){
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false); 
                } else if (acct.id == acct10.id) {
                    system.assert(acct.ae_rep__c != null);
                    system.assertEquals(acct.Ready_To_Assign_Territory_Owner__c,false);
                }
            }
            
            
                
        }
*//*        
    }
*/    
}