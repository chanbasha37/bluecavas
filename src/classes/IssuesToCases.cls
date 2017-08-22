global with sharing class IssuesToCases {
	
	 @future (callout=true)
     global static void Getfields(String subject1,String username1,String password1,String url1) {
            
        //Construct HTTP request and response
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        /*
        //Modify these variables:
        String username = 'ng.mounica@gmail.com';
        String password = '$Test12345';
        String jiraURL = 'https://mysfjira.atlassian.net/';
  
  */
           String username = username1;
           String password = password1;
           String jiraURL = url1;
  
  
  
  
          
        String text = subject1;
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username+':'+password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json');
  
        //Construct Endpoint
         String endpoint = jiraURL+'/rest/api/2/search?jql=issuetype="J SFType"';
          
        //Set Method and Endpoint and Body
        req.setMethod('GET');
        req.setEndpoint(endpoint);
       
        try {
            //Send endpoint to JIRA
            res = http.send(req);    
                    
            System.debug('jsonResult :' + res.getBody());  
             
        } catch(System.CalloutException e) {
            System.debug('ERROR:' + e);
            System.debug(res.toString());
        }
        System.debug('Response::::'+res.getBody());
        
     /*   
        List<IssueResponceDeserilize>  I = new List<IssueResponceDeserilize>();   
             
        //converting the JSON response into deserialization format for mapping the salesforce fields
        IssueResponceDeserilization IRD = (IssueResponceDeserilization)JSON.deserialize(res.getBody(),  IssueResponceDeserilization.class);
        System.debug('Results == :' +  IRD  );       
        I.add(IRD);
        
        
        //mapping the deserialization of response fields sObject fields     
        List<Case> casesToUpsert = new List<Case>();        
        for(IssueResponceDeserilize d : I ){
                            
                Case c = new Case(); 
             //   c.Priority = d.fields.priority.name;
                c.Status = d.fields.status.statusCategory.key;
                c.Subject = d.fields.summary;
                c.Description = d.fields.issuetype.description; 
                c.Description = d.fields.description;                 
                c.JIRA_Key__c = d.key;
                
                
                casesToUpsert.add(c);
               
        }
        system.debug('Cases to UPsert ::: ' +casesToUpsert);
        
        //performing the UPsert operation on records and committing to database
        if(casesToUpsert.size()>0){
            Database.upsert(casesToUpsert,false) ;
        }
        
        */
    }
    
}