@isTest  
global with sharing class  ServiceNowGetMockTestGenerator implements HttpCalloutMock { 
	
	                  
        // Implement this interface method for ServiceNowGet 
         global HTTPResponse respond(HTTPRequest req) {
         	
         	  //ServiceNowGet.GetIncident('admin','$Test12345','https://dev24994.service-now.com');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.        
              System.assertEquals('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true', req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"result":[{"short_description":"Unable to get to network file shares","sys_id":"9d385017c611228701d22104cc95c371","number":"INC0000002","contact_type":"","incident_state":"3","impact":"1","active":"true"},{"short_description":"Wireless access is down in my area","sys_id":"e8caedcbc0a80164017df472f39eaed1","number":"INC0000003","contact_type":"","incident_state":"2","impact":"1","active":"true"},{"short_description":"Forgot email password","sys_id":"9d3c1197c611228701cd1d94bc32d76d","number":"INC0000004","contact_type":"","incident_state":"7","impact":"1","active":"false"},{"short_description":"CPU load high for over 10 minutes","sys_id":"e8e875b0c0a80164009dc852b4d677d5","number":"INC0000005","contact_type":"email","incident_state":"7","impact":"1","active":"false"},{"short_description":"Hang when trying to print VISIO document\n\t\t","sys_id":"8d6246c7c0a80164012fb063cecd4ace","number":"INC0000006","contact_type":"","incident_state":"7","impact":"1","active":"false"},{"short_description":"Need access to sales DB for the West","sys_id":"8d6353eac0a8016400d8a125ca14fc1f","number":"INC0000007","contact_type":"","incident_state":"4","impact":"1","active":"true"},{"short_description":"Printer in my office is out of toner","sys_id":"8d641046c0a80164000bc7c0d3ed46a0","number":"INC0000008","contact_type":"","incident_state":"7","impact":"1","active":"false"},{"short_description":"Reset my password","sys_id":"46b66a40a9fe198101f243dfbc79033d","number":"INC0000009","contact_type":"phone","incident_state":"7","impact":"1","active":"false"},{"short_description":"Need Oracle 10GR2 installed","sys_id":"46b9490da9fe1981003c938dab89bda3","number":"INC0000010","contact_type":"phone","incident_state":"7","impact":"2","active":"false"},{"short_description":"Need new Blackberry setup","sys_id":"46c03489a9fe19810148cd5b8cbf501e","number":"INC0000011","contact_type":"phone","incident_state":"7","impact":"2","active":"false"}]}');
              
              res.setStatusCode(200);
              return res;
         }    
         
            
    
}