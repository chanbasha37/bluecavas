/* 
* An Apex Class used to Get Incidents from ServiceNow whose Sftype is equal to true.
* Use Http request and response methods for communication.
* The method GetIncident takes input as Username, Password, and endpointurl from trigger.
* we are giving this class to schedule to get records for specfic time interval
*/
 
 global with sharing class ServiceNowGet {     
   
    @TestVisible static HttpResponse res;
    
    @future(callout=true)        
    global static void getfieldsFuture(String username1, String password1, String endpointUrl1) {
        
        GetIncident(username1, password1, endpointUrl1);
    }
    
   
   
    public static HttpResponse GetIncident(String username1, String password1, String endpointUrl1){  
        
        //return type HttpResponse
        //Construct HTTP request and response           
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
        //HttpResponse res = new HttpResponse();
        
         /*                
         System.debug('Username  ::: '+username1);
         System.debug('pwd  ::: '+password1);
         System.debug('URL  ::: '+endpointURL1);  */
            
        //Construct Authorization and Content headers
        Blob headerValue = Blob.valueOf(username1 + ':' + password1);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');  //displays data in JSON format
        
        // req.setEndpoint('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=short_description%2Csys_id%2Cimpact%2Cincident_state%2Cactive%2Ccontact_type%2Cnumber&u_sftype%3Dtrue%26active%3Dtrue%5Esys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)&sysparm_fields=sys_updated_on%2Csys_created_on&sysparm_limit=10');        
        req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true');        
        req.setMethod('GET');
        
      /*//A response object is generated as a result of the request   
        res = http.send(req);
        System.debug('MyResult == :'+res.getBody());  */ 
        
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