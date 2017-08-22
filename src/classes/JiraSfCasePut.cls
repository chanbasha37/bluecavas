/* 
* An Apex Class used to Update Issues in Jira from Salesforce. Whose Issue type in jira is equal to J SFType.
* Use Http request and response methods for communication.
* The method syncfields takes input as JiraKey which is there in Salesforce.
*/

global with sharing class JiraSfCasePut {
	 
	 @TestVisible static HttpResponse res;   
	 
	@future(callout=true)        
    global static void putfieldsFuture(String username1, String password1, String endpointUrl1,String JIRA_Key) {
    	
    	syncfields(username1, password1, endpointUrl1,JIRA_Key);
    }
	 
	  	
      public static HttpResponse  syncfields(String username,String password,String jiraURL, String JIRA_Key) {
         
        //return type HttpResponse        
        //Get jira key from Salesforce Case   
        sObject s = [SELECT Subject, Priority FROM Case WHERE JIRA_Key__c = :JIRA_key LIMIT 1];
        String c_summary = (String) s.get('Subject');         
        String c_priority = (String) s.get('Priority');
        
 
         String priorityId;
        //Map Salesforce Prority to JIRA Prority
        if (c_priority  == 'Blocker'){                 // Salesforce.com Priority
            priorityId = '1';                           // JIRA Priority ID
        } else if (c_priority  == 'High'){
            priorityId = '2';
        } else if (c_priority  == 'Major') {
            priorityId = '3';
        } else if (c_priority == 'Minor') {
            priorityId = '4';
        } else if (c_priority == 'Trivial') {
            priorityId = '5';
        }
                          
        //Construct HTTP request and response
        Http http = new Http();        
        HttpRequest req = new HttpRequest();
        //HttpResponse res = new HttpResponse();
      
       // String username = 'ng.mounica@gmail.com';
      //  String password = '$Test12345';
  
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username+':'+password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json');
    
        //Construct Endpoint
        //String jiraURL = 'https://mysfjira1.atlassian.net/';
        String endpoint = jiraURL+'/rest/api/2/issue';
          
        //Set Method and Endpoint and Body
        req.setMethod('PUT');
        req.setEndpoint(endpoint);
        req.setBody('{ \"fields\":{\"project\":{\"key\":\"'+JIRA_key +'\"},\"summary\": \"'+c_summary+'\" ,\"description\": \"testing from sf\", \"issuetype\":{\"name\":\"SFType\"}}}');
  
        try {
            //Send endpoint to JIRA
            res = http.send(req);
             
        System.debug('MyResult == :' + res.getBody());  //A response object is generated as a result of the request          
        } catch(System.CalloutException e){
            System.debug('ERROR:' + e);
            System.debug(res.toString());
        }
        
         return res; 
    }
}