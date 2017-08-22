@isTest  
global with sharing class ServiceNowPostMockTestGenerator implements HttpCalloutMock {
	  
	    
         // Implement this interface method for ServiceNowPost
         global HTTPResponse respond(HTTPRequest req) {
         	
         	  //ServiceNowPost.PostIncident('admin','$Test12345','https://dev24994.service-now.com','Test cases for ABCheights on 4/11');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.        
              System.assertEquals('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=caller_id%2Cimpact%2Curgency%2Cstate%2Csys_created_by%2Cu_sf_id%2Cu_sftype%2Csys_id%2Cshort_description', req.getEndpoint());
              System.assertEquals('POST', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{\"short_description\": \"Test cases for ABCheights on 4/11\", \"caller_id\":\"Mounika Ng\" , \"state\":\"1\" ,  \"impact\":\"1\", \"u_sftype\":\"true\"}');
             
              res.setStatusCode(200);
              return res;
         }
        
}