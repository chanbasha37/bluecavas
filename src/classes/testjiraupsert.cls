@isTest
global with sharing class testjiraupsert {
     
     @isTest static void testCallout() {
        
         Test.setMock(HttpCalloutMock.class, new JiraSfCaseUpsertMockGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = JiraSfCaseUpsert.Upsertfields('ng.mounica@gmail.com','$Test12345', 'https://mysfjira.atlassian.net');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"expand":"schema,names","startAt":0,"maxResults":2,"total":18,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10305","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10305","key":"SFCAS-18","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10304","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10304","key":"SFCAS-17","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
        	        	
         
      }
      
      static testMethod void testCreateCase() {
		       
		  String json = '{"expand":"schema,names","startAt":0,"maxResults":2,"total":18,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10305","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10305","key":"SFCAS-18","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10304","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10304","key":"SFCAS-17","fields":{"summary":"test xxx 4/11","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/3","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
		
		/*  ServiceNowUpsert obj = parse(json);
		  System.assert(obj != null);
		  
		  System.debug('MyResult == :' + obj ); */
		  
		 deserializejirajson.ResponseIssues d = new deserializejirajson.ResponseIssues();
		 
		 deserializejirajson.issues[] i = d.issues == null ? New deserializejirajson.issues[]{} : d.issues;
		  
		  //deserializejirajson.issues[] i =  New deserializejirajson.issues[]{}; 
		  for(deserializejirajson.issues dd : i){
		  	
		    deserializejirajson.Field tmp = dd.Fields;
		  	
			  	tmp.Priority.Name = 'To Do';
			  	//tmp.Priority.Name = 'To Do';
			  	//tmp.Priority.Name = 'To Do';
			  	//tmp.Priority.Name = 'To Do';
			  	//tmp.Priority.Name = 'To Do';
		  
      }  
		/*  
		  
		  //deserializejirajson.ResponseIssues.issues.Priority.Name = 'To Do';
		  
		  	 
 d.Issues    c.Priority = tmp.Priority.Name; 
		              c.Status = tmp.status.Name; 
		         c.Subject = tmp.summary;
		         c.Origin = tmp.issue_type; 
		   
		  		  
		  Case c1 = new case(Priority = d1.impact,  Status = d1.incident_state,
                            Subject = d1.short_description, ServiceNowId__c = d1.sys_id,
                            Origin = d1.impact);
                            
           
          insert c1;   
          
          
          Case cs1 = [Select Priority, Subject, Status, Origin, ServiceNowId__c From Case where Id =: c1.id];   
          
          System.assertEquals(cs1.Subject, 'When can we get off Remedy? UI is killing us');
          System.assertEquals(cs1.ServiceNowId__c, '47064b68a9fe19810186793eefffc9b7');
       */  
	  }   
                      
}