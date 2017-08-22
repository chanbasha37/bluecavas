/* Test class for CasesMain apex class */

@isTest
public with sharing class CasesMainTest{

        
	    static testMethod void IntegrationCheckMethod(){
	    	
	    	  CasesMainTestDataGenerator cData = new CasesMainTestDataGenerator();
		  	          
	          Test.startTest();   // Start test    
	          
	          Account a = CasesMainTestDataGenerator.setupAccount(1, true);
	          
	          Contact c = CasesMainTestDataGenerator.setupContact(1, a.Id, true);
	          
	          Case s = CasesMainTestDataGenerator.setupCase(1, c.Id, true);
	          
	         
	          Integration__C intg = new Integration__C(name='IntegrationSF', IntegrationAccount__c = a.Id, username__c = 'admin',password__c = '$Test1234', In__c=true,
    	                                       URL__c='https://dev24994.service-now.com/', integrationwith__c = 'ServiceNow2Salesforce');
       	     
 
              insert intg; 
              
	          Case cs = [SELECT Id,IntegrationTo__c, Status, AccountId, ContactId, CaseRelatedTo__c FROM Case WHERE  Id =: s.id]; 
	           
 
	          Test.stopTest();  // Stop test
	          
	          System.assertEquals(intg.integrationwith__c,cs.IntegrationTo__c);
	          System.assertEquals(intg.IntegrationAccount__c,cs.AccountId);
              System.assertEquals(intg.username__c,'admin');
              System.assertEquals(intg.password__c, '$Test1234');
              System.assertEquals(intg.URL__c, 'https://dev24994.service-now.com/');             

        }
        
        
      
     
    
 }