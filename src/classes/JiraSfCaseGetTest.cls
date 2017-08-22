@isTest
global with sharing class JiraSfCaseGetTest {
    
     @isTest static void testCallout() {
        
         Test.setMock(HttpCalloutMock.class, new JiraSfCaseGetMockGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = JiraSfCaseGet.Getfields('ng.mounica@gmail.com','$Test12345', 'https://mysfjira1.atlassian.net');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"expand":"names,schema","startAt":0,"maxResults":1,"total":1,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10000","self":"https://mysfjira1.atlassian.net/rest/api/2/issue/10000","key":"SFCAS-1","fields":{"summary":"Issue1","priority":{"self":"https://mysfjira1.atlassian.net/rest/api/2/priority/2","iconUrl":"https://mysfjira1.atlassian.net/images/icons/priorities/high.svg","name":"High","id":"2"},"status":{"self":"https://mysfjira1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
        	                
     }
     
     
     
     static testMethod void testCreateCase(){
                    
        String req = '{"expand":"names,schema","startAt":0,"maxResults":1,"total":1,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10000","self":"https://mysfjira1.atlassian.net/rest/api/2/issue/10000","key":"SFCAS-1","fields":{"summary":"Issue1","priority":{"self":"https://mysfjira1.atlassian.net/rest/api/2/priority/2","iconUrl":"https://mysfjira1.atlassian.net/images/icons/priorities/high.svg","name":"High","id":"2"},"status":{"self":"https://mysfjira1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
                 
        deserializejirajson.ResponseIssues theresult1 = (deserializejirajson.ResponseIssues)JSON.deserialize(req, deserializejirajson.ResponseIssues.class);
        System.debug('Results == :' + theresult1 ); 
       	     	      
	     deserializejirajson.issues[] issues = theresult1.issues == null ? New deserializejirajson.issues[]{} : theresult1.issues;
	     
	     for(deserializejirajson.issues d : issues){

            Case c = new Case(); 
           
            deserializejirajson.Field tmp = d.Fields;
				   		    	
		         tmp.Priority.Name ='High'; 
		         tmp.status.Name='To Do'; 
		         tmp.summary='Issue1';
		         //tmp.issue_type=;
		         
		         		  
		  Case c1 = new case(Priority =  tmp.Priority.Name,  Status = tmp.status.Name,Subject = tmp.summary);
		 // Case c2 = new case(Priority =  tmp.Priority.Name,  Status = tmp.status.Name,Subject = tmp.summary);
		  insert c1;
		  
		  Case cs1 = [Select Priority, Subject, Status From Case where Id =: c1.id];   
          System.assertEquals(cs1.Subject, 'Issue1');
          System.assertEquals(cs1.Priority, 'High');
          		  		  
		  		         
		    }
	     }
      
}