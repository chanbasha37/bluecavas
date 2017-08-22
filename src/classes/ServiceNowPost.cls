/* 
* An Apex Class used to Post Incidents from Salesforce Whose Sftype in ServiceNow is equal to true.
* Use Http request and response methods for communication.
* The method postIncident takes input as Username, Password, endpointurl and subject from trigger when a case is created.
*/

global with sharing class ServiceNowPost {
	
	@TestVisible static HttpResponse res;
	
    @future(callout=true)        
    global static void postfieldsFuture(String username1, String password1, String endpointUrl1,String subject1) {
    	
    	PostIncident(username1, password1, endpointUrl1,subject1 );
    }
	
	  
    public static HttpResponse PostIncident(String username1, String password1, String endpointUrl1, String subject1){ 
     	
     	//Construct HTTP request and response	     	
		Http http = new Http();
        HttpRequest req =  new HttpRequest();
       // HttpResponse res = new HttpResponse();
                     
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username1 + ':' + password1);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');  //displays data in JSON format
      
        //servicenow incident fields 
        String data = '{\"short_description\": \" ' + subject1 + '\", \"caller_id\":\"Mounika Ng\" , \"state\":\"1\" ,  \"impact\":\"1\", \"u_sftype\":\"true\"}';
        req.setBody(data);
        
        //post incident from Salesforce to servicenow  
        req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=caller_id%2Cimpact%2Curgency%2Cstate%2Csys_created_by%2Cu_sf_id%2Cu_sftype%2Csys_id%2Cshort_description');
        req.setMethod('POST');
                                               
        
        try {
        	
            res = http.send(req);
            System.debug('MyResult == :'+res.getBody());
            
        } catch(System.CalloutException e) {
        	
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
          return res;
        
	}
    
}