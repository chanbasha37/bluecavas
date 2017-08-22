@isTest  
global with sharing class  JiraSfCaseGetMockGenerator implements HttpCalloutMock {
	
	     // Implement this interface method  
         global HTTPResponse respond(HTTPRequest req) {
         	        	   
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.                
              System.assertEquals('https://mysfjira1.atlassian.net/rest/api/2/search?jql=updated>-1h&project=SfCases1&fields=issuetype=SFType,summary,status,priority&maxResults=1', req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"expand":"names,schema","startAt":0,"maxResults":1,"total":1,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10000","self":"https://mysfjira1.atlassian.net/rest/api/2/issue/10000","key":"SFCAS-1","fields":{"summary":"Issue1","priority":{"self":"https://mysfjira1.atlassian.net/rest/api/2/priority/2","iconUrl":"https://mysfjira1.atlassian.net/images/icons/priorities/high.svg","name":"High","id":"2"},"status":{"self":"https://mysfjira1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}');
              res.setStatusCode(200);
              return res;
         }    
    
}