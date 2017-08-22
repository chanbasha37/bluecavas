@isTest  
global with sharing class ServiceNowUpsertMockTestGenerator implements HttpCalloutMock { 
		
	      // Implement this interface method  
          global HTTPResponse respond(HTTPRequest req) {
         	
         	  //ServiceNowGet.GetIncident('admin','$Test12345','https://dev24994.service-now.com');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.        
              System.assertEquals('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true', req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"result":[{"short_description":"When can we get off Remedy? UI is killing us","sys_id":"47064b68a9fe19810186793eefffc9b7","contact_type":"self service","incident_state":"2","impact":"1"},{"short_description":"Request for a new service","sys_id":"4715ab62a9fe1981018c3efb96143495","contact_type":"phone","incident_state":"2","impact":"1"}]}');
             
              res.setStatusCode(200);
              return res;
		
         }
         
         
                
    
}