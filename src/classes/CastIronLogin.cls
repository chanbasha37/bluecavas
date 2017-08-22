global class CastIronLogin {
    
    webservice static void loginAccess(){
        
        wwwApprouterComConnectorsWsdl.Provide_ServicePort req = new wwwApprouterComConnectorsWsdl.Provide_ServicePort();
        wwwApprouterComConnectorsResponse7.Product_element res = req.Provide_Service('F-110');
        //req.inputHttpHeaders_x = new Map<String,String>();
        //req.inputHttpHeaders_x.put('Authorization', 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==');
        
    }

}