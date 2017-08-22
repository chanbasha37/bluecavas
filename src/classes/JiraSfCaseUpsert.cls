/* 
* An Apex Class used to Insert or Update cases into Salesforce, when related issues are getting from Jira Whose Issue type in jira is equal to J SFType.
* Use Http request and response methods for communication.
* The method Getfields takes input as Username, Password, and endpointurl from trigger.
* we are giving this class to schedule to get records for specfic time interval
* Using IssueResponceDeserilize apex class to deserilize the json response 
*/

global with sharing class JiraSfCaseUpsert {
    
     @TestVisible static HttpResponse res;
       
     //@future (callout=true)
     global static HttpResponse Upsertfields(String username1, String password1, String endpointUrl1) {
        
        //return type HttpResponse    
        //Construct HTTP request and response
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        // HttpResponse res = new HttpResponse(); 
            

        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username1+':'+password1);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json'); //displays data in JSON format
  
        //Construct Endpoing 
        //String endpoint =endpointUrl1+'/rest/api/2/search?jql=project=SfCases&issuetype=J_SFType&maxResults=3';
        
        String endpoint = endpointUrl1+'/rest/api/2/search?jql=updated>-1h&project=SfCases2&fields=issuetype=SFType,summary,status,priority';
       
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        // res = http.send(req);             
        // System.debug('MyResult == :' + res.getBody());   //A response object is generated as a result of the request 
       
       
       try {
            res = http.send(req);
            System.debug('MyResult == :'+res.getBody());
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
        
              
        deserializejirajson.ResponseIssues theresult1 = (deserializejirajson.ResponseIssues)JSON.deserialize(res.getBody(),  deserializejirajson.ResponseIssues.class);
        System.debug('Results == :' + theresult1 ); 
       
	     
	     List<Case> casesToUpsert = new List<Case>(); 
	     deserializejirajson.issues[] issues = theresult1.issues == null ? New deserializejirajson.issues[]{} : theresult1.issues;
	     
	     for(deserializejirajson.issues d : issues){

            Case c = new Case(); 
           
            deserializejirajson.Field tmp = d.Fields;
		
		    if(tmp != null){
		    	
		         c.Priority = tmp.Priority.Name; 
		         c.Status = tmp.status.Name; 
		         c.Subject = tmp.summary;
		         c.Origin = tmp.issue_type;
		         
		         casesToUpsert.add(c);
		    }
		    
		    system.debug('Cases to UPsert ::: ' +casesToUpsert);  
		   			     
	        //performing the UPsert operation on records and committing to database
	        if(casesToUpsert.size()>0){
	        	
	            Database.upsert(casesToUpsert,false) ;
	        }   	        
	    }   
	    
	    return res;                                          
   }
}