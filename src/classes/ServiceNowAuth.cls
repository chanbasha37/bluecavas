global with sharing class ServiceNowAuth {
     
    // @future(callout=true) 
    global static void getIncident(String subject){  
        
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
        HttpResponse res = new HttpResponse();
         
        string text = subject;  
       //getting all the newly created incidents since last 20 mins of Type is SfType from serviceNow endpoint 
        req.setEndpoint('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true');
        
        //getting all the incidents in JSON format
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json'); 
        
        //serviceNow authentication credentials
        String username = 'admin';
        String password = '$Test12345';
       
       //passing the authentication details in URL Encoding format in request header
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        //getting the response from serviceNow      
        res = http.send(req);
        System.debug('jsonrResult :' + res.getBody()); 
        
        //converting the JSON response into deserialization format for mapping the salesforce fields
        Deserialization.ResponseResult theresult1 = (Deserialization.ResponseResult)JSON.deserialize(res.getBody(),  Deserialization.ResponseResult.class);
        System.debug('Results == :' + theresult1 ); 
        
        //mapping the deserialization of response fields sObject fields     
        List<Case> casesToUpsert = new List<Case>();        
        for(Deserialization d : theresult1.result ){
                            
                Case c = new Case(); 
                c.Priority = d.impact;
                c.Status = d.incident_state;
                c.Subject = d.short_description;
                c.ServiceNowId__c = d.sys_id;
                c.Origin = d.contact_type;
                
                casesToUpsert.add(c);
               
        }
        system.debug('Cases to UPsert ::: ' +casesToUpsert);
        
        //performing the UPsert operation on records and committing to database
        if(casesToUpsert.size()>0){
            Database.upsert(casesToUpsert,false) ;
        }
             
    }
    
}