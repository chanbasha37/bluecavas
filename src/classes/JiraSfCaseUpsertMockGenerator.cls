@isTest  
global with sharing class JiraSfCaseUpsertMockGenerator implements HttpCalloutMock  {
        
         // Implement this interface method  
         global HTTPResponse respond(HTTPRequest req) {
         	
         	  // ('ng.mounica@gmail.com','$Test12345', 'https://mysfjira.atlassian.net');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.                
              System.assertEquals('https://mysfjira.atlassian.net/rest/api/2/search?jql=project=SfCases&fields=issuetype=J_SFType,summary,status,priority&maxResults=2' , req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"expand":"schema,names","startAt":0,"maxResults":2,"total":18,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10305","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10305","key":"SFCAS-18","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10304","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10304","key":"SFCAS-17","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}');
              res.setStatusCode(200);
              return res;
         }    
    
}