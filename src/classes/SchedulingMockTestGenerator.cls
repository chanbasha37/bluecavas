@isTest
public with sharing class SchedulingMockTestGenerator implements HttpCalloutMock{
	
	//String theJSONResponse;

   public SchedulingMockTestGenerator(){
   	
       SchedulingServiceNow s = new SchedulingServiceNow();
       s.execute(null);
   }
   // Implement this interface method
   public HTTPResponse respond(HTTPRequest req) 
   {
       HttpResponse res = new HttpResponse();
       res.setHeader('Content-Type', 'application/json');
       res.setBody(res.getBody());
       res.setStatusCode(200);
       return res;
    }
	
    
}