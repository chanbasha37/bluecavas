@isTest
public with sharing class Page1ControllerTest {
	
	 public static testMethod void  MyController() {

        PageReference pageRef = Page.Page1;
        Test.setCurrentPage(pageRef);
        
        CasesMainTestDataGenerator cData = new CasesMainTestDataGenerator();
		 
		Account a = CasesMainTestDataGenerator.setupAccount(1, true);
	           	              
        
        Integration__C intg = new Integration__C(name='IntegrationSF1', IntegrationAccount__c = a.Id, username__c = 'admin',password__c = '$Test1234', In__c=true,
    	                                       URL__c='https://dev24994.service-now.com/', integrationwith__c = 'ServiceNow2Salesforce');
       	     
        insert intg; 
        
        
        Page1Controller pg = new Page1Controller();
        Integration__c i = pg.getic();
        
	    //System.assertEquals(i.size(), 1);
	    
	    pg.Save();
        
        Integration__C inc = [select name, IntegrationAccount__c, username__c, password__c , URL__c , integrationwith__c from Integration__C where id =: intg.id];  
        System.assertEquals(inc.IntegrationAccount__c, a.Id);
        System.assertEquals(inc.username__c, 'admin');
        System.assertEquals(inc.password__c, '$Test1234');
        System.assertEquals(inc.URL__c, 'https://dev24994.service-now.com/');
        System.assertEquals(inc.integrationwith__c, 'ServiceNow2Salesforce');
        
        
 
    }
 
}