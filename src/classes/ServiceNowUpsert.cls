/* 
* An Apex Class used to Insert or Update cases into Salesforce, when related incidents are getting from ServiceNow whose Sftype is equal to true.
* Use Http request and response methods for communication.
* The method GetIncident takes input as Username, Password, and endpointurl from trigger.
* we are giving this class to schedule to get records for specfic time interval
*/

global with sharing class ServiceNowUpsert {
    
    @TestVisible static HttpResponse res;
    
    
    
    @future(callout=true)        
    global static void getfieldsFuture(String username1, String password1, String endpointUrl1) {
    	
    	GetIncident(username1, password1, endpointUrl1 );
    }
    
   
    public static HttpResponse GetIncident(String username1, String password1, String endpointUrl1){  
        
        //returntype=HttpResponse
        //Construct HTTP request and response	     	
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
       // HttpResponse res = new HttpResponse();        
            
        //Construct Authorization and Content headers
        Blob headerValue = Blob.valueOf(username1 + ':' + password1);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');  //displays data in JSON format
        //req.setHeader('Accept','application/json');
        
        
        //post salesforce case to servicenow endpoint url
   /*
        //This query should be dynamic
        Incident__c inc = [Select Incident_Fields__c From Incident__c Where Account__r.Name='ABC Heights' Limit 1];
        
        String buildEndPoint = '';
        system.debug('incfields:::'+inc.Incident_Fields__c);
        
        String[] incFields = inc.Incident_Fields__c.split(';');
        
        for(String incField : incFields){
        	
        	buildEndPoint+=incField;
        	buildEndPoint+='%2C';
        }
       
        buildEndPoint+='&u_sftype=true&sysparm_limit=5';
		//buildEndPoint+='u_sftype==true';
		
		
	*/	
		//add for time stamp in endpoint sys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)&
		//System.debug('buildEndPoint :::' + buildEndPoint);
        //req.setMethod('GET'); 
        // req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields='+buildEndPoint);
        // res = http.send(req);
        // System.debug('MyResult == :'+res.getBody());
         
        //req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=caller_id%2Cimpact%2Curgency%2Cstate%2Csys_created_by%2Cu_sf_id%2Csys_id%2Cshort_description&u_sftype=true&sysparm_limit=2');       
        //req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true');
        //req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields='+buildEndPoint);
       
       req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=caller_id%2Cimpact%2Curgency%2Cstate%2Csys_created_by%2Cu_sf_id%2Csys_id%2Cshort_description&u_sftype=true&sys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)&u_sftype=true&sysparm_limit=2');              
     //A response object is generated as a result of the request  in Json format
               
        req.setMethod('GET'); 
        //req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields='+buildEndPoint);
        res = http.send(req);
        String json1 = res.getBody();
        
        System.debug('The Json Response is :::'+json1);
        
       // Map<String,Object> m = (Map<String,Object>)System.JSON.deserializeUntyped(json1);
       // System.debug('Deserializaed Response :::'+m);
        
             
      

        //convert the JSON response into deserialized format to map with Case fields
        Deserialization.ResponseResult theresult1 = (Deserialization.ResponseResult)JSON.deserialize(res.getBody(),  Deserialization.ResponseResult.class);
        System.debug('MyResult == :' + theresult1 ); 
        
        //map the deserialization response fields with Salesforce Case fields     
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
     
        
        return res;
             
    }
    
}