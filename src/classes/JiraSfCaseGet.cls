/* 
* An Apex Class used to Get Issues from Jira. Whose Issue type in jira is equal to SFType.
* Use Http request and response methods for communication.
* The method Getfields takes input as Username, Password, and endpointurl from trigger.
* we are giving this class to schedule to get records for specfic time interval
* Using IssueResponceDeserilize apex class to deserilize the json response 
*/

//global with sharing class JiraSfCaseGet 
global with sharing class JiraSfCaseGet {
    
    @TestVisible static HttpResponse res;
    
    @future(callout=true)        
    public static void getfieldsFuture(String username1, String password1, String endpointUrl1) {
        
        Getfields(username1, password1, endpointUrl1);
    }
    
         
    public static HttpResponse Getfields(String username1, String password1, String endpointUrl1) {
        
    //return type is HttpResponse   
    //global static void  Getfields(      
       
        //Construct HTTP request and response
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        //HttpResponse res = new HttpResponse(); 
            
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username1+':'+password1);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json'); //displays data in JSON format
  
        //Construct Endpoing    &maxResults=1     
        String endpoint =endpointUrl1+'/rest/api/2/search?jql=updated>-1h&project=SfCases&fields=issuetype=SFType,summary,status,priority';                
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        res = http.send(req);             
        System.debug('MyResult == :' + res.getBody());   //A response object is generated as a result of the request       
                      
        deserializejirajson.ResponseIssues theresult1 = (deserializejirajson.ResponseIssues)JSON.deserialize(res.getBody(),  deserializejirajson.ResponseIssues.class);
   
        System.debug('Results == :' + theresult1 ); 
       
         
         List<Case> casesToUpsert = new List<Case>(); 
         deserializejirajson.issues[] issues = theresult1.issues == null ? New deserializejirajson.issues[]{} : theresult1.issues;
         for(deserializejirajson.issues d : issues){

            Case c = new Case(); 
           
            deserializejirajson.Field tmp = d.Fields;
            //deserializejirajson.Issues iss = d.Issues;
            c.JIRA_Key__c = d.key;
        
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
                
                Database.upsert(casesToUpsert,false);
             }
         }       
         
         return res;                                       
   }
}