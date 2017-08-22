public with sharing class Invoke_Webservice {
	
	public void invokeService(){
	
	     try{    
	     	 
	        String username='cnoorbashasheik@miraclesoft.com';
	        String password='7842543784Ch@n';        
	        HttpRequest req = new HttpRequest();
	        req.setEndpoint('http://172.17.1.62:80/SFSAP'); 
	        //req.setEndpoint('https://castiron.ibmcloud.com/'); 
	        req.setMethod('GET');
	        Blob headerValue = Blob.valueOf(username + ':' + password);
	        String authorizationHeader = 'Basic '+ EncodingUtil.base64Encode(headerValue);
	        req.setHeader('Authorization', authorizationHeader);
	        req.setHeader('Content-Type', 'application/soap+xml');
	        req.setTimeout(80000);	    
			
			Http http = new Http();
	        HttpResponse res = http.send(req);  
	        System.debug(res); 
		  }
	       catch(Exception e){
		   System.debug(e);
		}
	}
    
}