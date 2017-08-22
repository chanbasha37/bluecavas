@isTest  
global with sharing class JiraSfCasePostMockGenerator implements HttpCalloutMock {
	    
	     // Implement this interface method  
         global HTTPResponse respond(HTTPRequest req) {
         	         	   
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.                
              System.assertEquals('https://mysfjira1.atlassian.net/rest/api/2/issue', req.getEndpoint());
              System.assertEquals('POST', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{ \"fields\":{\"project\":{\"key\":\"SFCAS\"},\"summary\": \"test xxx 5/1\" ,\"description\": \"Test Description\", \"issuetype\":{\"name\":\"SFType\"}}}');                 
              res.setStatusCode(200);
              return res;
         }    
    
}