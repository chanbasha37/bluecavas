@isTest
global with sharing class JiraSfCasePutTest {
      
       @isTest static void testCallout() {
       	
       	   
            /*  Case c = new Case(Subject='testing case from sf',Description='test my case',Priority='High',Status='New', JIRA_Key__c='SFCAS-9');
              insert c; 
              	          
	          Case c1 = [SELECT Subject,Priority,Description,JIRA_Key__c FROM Case WHERE Id = : c.Id]; */     
	          
           Test.setMock(HttpCalloutMock.class, new JiraSfCasePutMockGenerator());
 
           // Call method to test.
           // This causes a fake response to be sent
           // from the class that implements HttpCalloutMock. 
           HttpResponse res = JiraSfCasePut.syncfields('SFCAS-9');
           // Verify response received contains fake values
           String contentType = res.getHeader('Content-Type');
           System.assert(contentType == 'application/json');
           String actualValue = res.getBody();
           
           System.assertEquals(200, res.getStatusCode()); 
        	        	
         
       }
    
}