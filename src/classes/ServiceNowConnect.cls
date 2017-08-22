global class ServiceNowConnect{

    /*    @Future(callout=true)
        global static void servicenowPost(Id CaseId){  
        
        Case c = [Select Id, CaseNumber,Status,Origin,Priority from Case where Id =: CaseId limit 1];
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
        HttpResponse res = new HttpResponse();
        
        String username = 'admin';
        String password = '$Test12345';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        req.setEndpoint('https://dev23577.service-now.com/api/now/table/Incident');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        
        //you can add as many mappings as you want
       // gen.writeStringField('Number', c.CaseNumber);
        gen.writeStringField('State', c.Status);
        gen.writeStringField('Impact',c.Priority);
        
        gen.writeEndObject();
        
        //you can now use String pretty as your body
        String content = gen.getAsString();
        
        req.setBody(content);
        res = http.send(req);
        
        system.debug(res.getBody());
    }
    */
   global static void getIncident(String subject){  
        
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
        HttpResponse res = new HttpResponse();
         
        string text = subject;
        req.setEndpoint('https://dev23577.service-now.com/api/now/table/incident?sysparm_fields=short_description%2Cactive%2Cimpact%2Csys_id%2Cincident_state%2Curgency&sysparm_limit=1 ');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json'); 
        
        String username = 'admin';
        String password = 'test12345';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
      
        res = http.send(req);
        System.debug(res.getBody());       
        String jsonText =res.getBody();
       
              

                     
   }
   
   
  
    
}