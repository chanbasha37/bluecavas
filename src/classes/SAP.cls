global class SAP
{
    webService static void runWithSAPCredentials(String id,String sapUser, String sapPassword)
    {
      wwwApprouterComConnectorsWsdlServive.Provide_ServicePort svcSoap = new wwwApprouterComConnectorsWsdlServive.Provide_ServicePort();
      wwwApprouterComConnectorsWsdlServive.Input input = new wwwApprouterComConnectorsWsdlServive.Input();
      wwwApprouterComConnectorsWsdlServive.SAPCreds sapCreds = new wwwApprouterComConnectorsWsdlServive.SAPCreds();

      input.id = id;
      sapCreds.SAPUser = sapUser;
      sapCreds.sapPassword = sapPassword;

      wwwApprouterComConnectorsWsdlServive.Output output = svcSoap.RunWithSAPCreds(input, sapCreds);
    }
}