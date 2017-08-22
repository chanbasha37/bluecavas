global class Login {
    
    public static string id = 'AM2-400';
    public static string UserName='skbasha467@gmail.com';
    public static string Password='7842543784C';
    
    webservice static void loginAccess(){
        
       wwwApprouterComConnectorsWsdl.Provide_ServicePort request = new  wwwApprouterComConnectorsWsdl.Provide_ServicePort();
       wwwApprouterComConnectorsResponse7.Product_element response = request.Provide_Service('AM2-400');
        
        
    }

}