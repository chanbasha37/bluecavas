public with sharing class CastIron_Invoke {
	
	public void invokeService(){
		
		wwwApprouterComConnectorsWsdl.Provide_ServicePort stub = new wwwApprouterComConnectorsWsdl.Provide_ServicePort();
	    wwwApprouterComConnectorsResponse4.Product_element input = stub.Provide_Service('OAOM-PUMP','Sample','100-200','HALB','M');
	   
   }  
}