global with sharing class SampleJira {
	
	 // @future (callout=true)
     global static void Getfields(String JIRA_Key) {
            
        //Construct HTTP request and response
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        
        //Modify these variables:
        String username = 'ng.mounica@gmail.com';
        String password = '$Test12345';
        String jiraURL = 'https://mysfjira.atlassian.net/';
  
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username+':'+password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json');
  
        //Construct Endpoint
        String endpoint = jiraURL+'/rest/api/2/issue/'+JIRA_Key;
          
        //Set Method and Endpoint and Body
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        //Send endpoint to JIRA
        res = http.send(req);
        
        System.debug('Serialization :::' +res.getBody());
        
        String JSONContent = res.getBody();
        //Issue.ResponseResult jiraIssue = (Issue.ResponseResult)JSON.deserialize(JSONContent,Issue.ResponseResult.class);
        
        Map<String, Object> cObjMap = (Map<String,Object>) JSON.deserializeUntyped(JSONContent);
        
        System.debug('Deserialization Result :::'+cObjMap);
        
        
      /*  
        List<Case> cas = new List<Case>();
        for(Object d : cObjMap){
            
                Case c = new Case(); 
                c.Priority = d.Object.get(Priority);
                c.Status = d.Status;
                c.Subject = d.Summary;
                c.JIRA_Key__c = d.Object.get(key);
                c.Origin = d.name;
                
                casesToUpsert.add(c);      
        }
        
      */  
        
        
        
        
        
        
        
        /*
        List<Case> casesToUpsert = new List<Case>();    
            
        for(Issue d : jiraIssue.result ){
                            
                Case c = new Case(); 
                c.Priority = d.Priority;
                c.Status = d.Status;
                c.Subject = d.Summary;
                c.JIRA_Key__c = d.key;
                c.Origin = d.name;
                
                casesToUpsert.add(c);
               
        }
        system.debug('Cases to UPsert ::: ' +casesToUpsert);
        
        //performing the UPsert operation on records and committing to database
        if(casesToUpsert.size()>0){
            Database.upsert(casesToUpsert,false) ;
        }
        
      */  
        
        
    /*    
        
        
       // JSONParser j = new JSONParser();
       // system.debug(jiraGetIssueResponse.parse(JSONContent));
       // JSONParser parserJira = JSON.createParser(JSONContent);
        
        //system.debug('parserJira ='+parserJira);
        while (parserJira.nextToken() != null) {
		 if (parserJira.getCurrentToken() == JSONToken.START_ARRAY) {
		  while (parserJira.nextToken() != null) {
		   Issue.ResponseResult jiraIssue = (Issue.ResponseResult)JSON.deserialize(JSONContent,Issue.ResponseResult.class);
		    
		     List<Case> casesToUpsert = new List<Case>();   
             
         for(Issue d : jiraIssue.result ){
                            
                Case c = new Case(); 
                c.JIRA_Key__c = d.key;
                c.Subject = d.Summary;
                c.Priority= d.Priority;
                c.Status=d.Status;
                
                casesToUpsert.add(c);
               
        }
        system.debug('Cases to UPsert ::: ' +casesToUpsert);
        
        //performing the UPsert operation on records and committing to database
        if(casesToUpsert.size()>0){
            Database.upsert(casesToUpsert,false) ;
        }
  }
 }
}       
        
       // Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
       
     //   System.debug('Deserialization :::' +m);
        
        
        
        //mapping the fields with case object fields  

        //List<Case> casestoUPsert = new List<Case>();
       
       
      /* 
        for(Map<String, Case> c : m){
        	
        	      
               Case cas = new Case();
               cas.Id = c.id;
               cas.JIRA_Key__c = c.key;
               cas.Status = c.Status;
               cas.Origin = c.Priority;
               
               casestoUPsert.add(cas);
        	
                  
        }
        if(casesToUpsert.size()>0){
            Database.upsert(casestoUpsert,false) ;
        }


*/
        
        //String jiraKey = (String) m.get('key');
       // update new Case(JIRA_Key__c = jiraKey);
      
      /*  
        //converting the JSON response into deserialization format for mapping the salesforce fields
        DeserializeJira.ResponseResult theresult1 = (DeserializeJira.ResponseResult)JSON.deserialize(res.getBody(),  DeserializeJira.ResponseResult.class);
        System.debug('Deserialize Results == :' + theresult1 ); 
        
          //mapping the deserialization of response fields sObject fields     
        List<Case> casesToUpsert = new List<Case>();   
             
        for(DeserializeJira	 d : theresult1.result ){
                            
                Case c = new Case(); 
                c.JIRA_Key__c = d.key;
                c.Subject = d.name;
                
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