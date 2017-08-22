@isTest
global with sharing class ServiceNowUpsertTest {
	
	 @isTest static void testCallout() {
        
         Test.setMock(HttpCalloutMock.class, new ServiceNowUpsertMockTestGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = ServiceNowUpsert.GetIncident('admin','$Test12345', 'https://dev24994.service-now.com');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"result":[{"short_description":"When can we get off Remedy? UI is killing us","sys_id":"47064b68a9fe19810186793eefffc9b7","contact_type":"self service","incident_state":"2","impact":"1"},{"short_description":"Request for a new service","sys_id":"4715ab62a9fe1981018c3efb96143495","contact_type":"phone","incident_state":"2","impact":"1"}]}';
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
        	        	
         
         }
         
      
      // Creating new case in Salesforce with the generated json response from ServiceNow. 
      static testMethod void testCreateCase() {
		       
		  String json = '{"result":[{"short_description":"When can we get off Remedy? UI is killing us","sys_id":"47064b68a9fe19810186793eefffc9b7","contact_type":"self service","incident_state":"2","impact":"1"},{"short_description":"Request for a new service","sys_id":"4715ab62a9fe1981018c3efb96143495","contact_type":"phone","incident_state":"2","impact":"1"}]}';  
		  
		   Deserialization d1 = new Deserialization();		 
		   d1.short_description = 'When can we get off Remedy? UI is killing us';
		   d1.sys_id = '47064b68a9fe19810186793eefffc9b7';
		   d1.incident_state = '2';
		   d1.contact_type = 'self service';
		   d1.impact = '1';
		   
		   
		  Deserialization d2 = new Deserialization();
		   d2.short_description = 'Request for a new service';
		   d2.sys_id = '4715ab62a9fe1981018c3efb96143495';
		   d2.incident_state = '2';
		   d2.contact_type = 'phone';
		   d2.impact = '1';
		   
		  		  
		  Case c1 = new case(Priority = d1.impact,  Status = d1.incident_state,
                            Subject = d1.short_description, ServiceNowId__c = d1.sys_id,
                            Origin = d1.impact);
                            
          Case c2 = new case(Priority = d2.impact,  Status = d2.incident_state,
                            Subject = d2.short_description, ServiceNowId__c = d2.sys_id,
                            Origin = d2.impact);                   
                
          insert c1;   
          insert c2;
          
          
          Case cs1 = [Select Priority, Subject, Status, Origin, ServiceNowId__c From Case where Id =: c1.id];   
          Case cs2 = [Select Priority, Subject, Status, Origin, ServiceNowId__c From Case where Id =: c2.id];         
          
          System.assertEquals(cs1.Subject, 'When can we get off Remedy? UI is killing us');
          System.assertEquals(cs1.ServiceNowId__c, '47064b68a9fe19810186793eefffc9b7');
          System.assertEquals(cs2.Subject, 'Request for a new service');
          System.assertEquals(cs2.ServiceNowId__c, '4715ab62a9fe1981018c3efb96143495');
           
		  
	  }   
    
                
                    
}