@isTest
global with sharing class JiraSfCasePostTest {
	
	  @isTest static void testCallout() {
         
         Test.startTest();   // Start test      
            
         Test.setMock(HttpCalloutMock.class, new JiraSfCasePostMockGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = JiraSfCasePost.Postfields('ng.mounica@gmail.com','$Test12345', 'https://mysfjira1.atlassian.net','test xxx 5/1','Test Description');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();          
         
          Test.stopTest();  // Stop test
           
           System.assertEquals(200, res.getStatusCode()); 
        	        	
          }
    
}