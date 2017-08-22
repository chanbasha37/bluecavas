/* 
* An Apex Class used to Post Issues from Salesforce. Whose Issue type in jira is equal to SFType.
* Use Http request and response methods for communication.
* The method Postfields take input as Username, Password, endpointurl,Subject,Description from trigger.
*/

//global with sharing class JiraSfCasePost 
public with sharing class JiraSfCasePost {
	
	@TestVisible static HttpResponse res;   
	
	@future(callout=true)      
    public static void PostfieldsFuture(String username1, String password1, String endpointUrl1, String Subject1, String Description1) {
    	Postfields(username1, password1, endpointUrl1, Subject1, Description1);
    }
	        
    public static HttpResponse Postfields(String username1, String password1, String endpointUrl1, String Subject1, String Description1) {
    //global static void Postfields(String username1, String password1, String endpointUrl1, String Subject1, String Description1) {
        
                 
        //Construct HTTP request and response
        Http http = new Http();    
        HttpRequest req = new HttpRequest();
        //HttpResponse res = new HttpResponse();
        
                   
        //Authentication to JIRA instance
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username1+':'+password1);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json');
        
        //Construct Endpoint
        String endpoint;
        if(Test.isRunningTest()){
        	endpoint = 'https://mysfjira1.atlassian.net/rest/api/2/issue';
        } else {
        	  endpoint =endpointUrl1+'/rest/api/2/issue';
        }          
    
                  
        //Set Method and Endpoint and Body
        req.setMethod('POST');
        req.setEndpoint(endpoint);      
        req.setBody('{ \"fields\":{\"project\":{\"key\":\"SFCAS\"},\"summary\": \"'+ Subject1 +'\" ,\"description\": \"'+ Description1 +'\", \"issuetype\":{\"name\":\"SFType\"}}}'); 
  
        try {
            //Send endpoint to JIRA
            res = http.send(req);
             
        System.debug('MyResult == :' + res.getBody());  //A response object is generated as a result of the request      
        } catch(System.CalloutException e) {
            System.debug('ERROR:' + e);
            System.debug(res.toString());
        }
        
         return res; 
    }
}