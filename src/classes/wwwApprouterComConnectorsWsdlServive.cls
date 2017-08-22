global class wwwApprouterComConnectorsWsdlServive {

    global class Input {
        Public String id;       
       // private String[] id_type_info = new String[]{'id','http://www.w3.org/2001/XMLSchema',null,'1','1','false'};;
       private String[] apex_schema_type_info = new String[]{'http://www.w3.org/2001/XMLSchema','true','true'};
       private String[] field_order_type_info = new String[]{'id'};
    }
    global class Provide_ServicePort {
        
        public String endpoint_x = 'https://provide.castiron.ibmcloud.com/env/Production/sapdata?username=skbasha467@gmail.com&password=7842543784C';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://www.approuter.com/connectors/request/7/', 'wwwApprouterComConnectorsWsdlServive'};
       
        global wwwApprouterComConnectorsWsdlServive.Output Run(wwwApprouterComConnectorsWsdlServive.Input RunParameter) {
                   
        wwwApprouterComConnectorsWsdlServive.Product_element request_x = new wwwApprouterComConnectorsWsdlServive.Product_element();
       
            wwwApprouterComConnectorsWsdlServive.RunResponse_element response_x;
            request_x.RunParameter = RunParameter;
           
            Map<String, wwwApprouterComConnectorsWsdlServive.RunResponse_element> response_map_x = new Map<String, wwwApprouterComConnectorsWsdlServive.RunResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://www.approuter.com/connectors/request/7/',
              'Product',
              'http://www.approuter.com/connectors/request/7/',
              'Product',
              'wwwApprouterComConnectorsWsdlServive.Product_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.RunResult;
        }
        global wwwApprouterComConnectorsWsdlServive.Output RunWithSAPCreds(wwwApprouterComConnectorsWsdlServive.Input RunParameter,wwwApprouterComConnectorsWsdlServive.SAPCreds SAPCredentials) {
           
            wwwApprouterComConnectorsWsdlServive.RunWithSAPCreds_element request_x = new wwwApprouterComConnectorsWsdlServive.RunWithSAPCreds_element();
            wwwApprouterComConnectorsWsdlServive.RunWithSAPCredsResponse_element response_x;
            request_x.RunParameter = RunParameter;
            request_x.SAPCredentials = SAPCredentials;
            
            Map<String, wwwApprouterComConnectorsWsdlServive.RunWithSAPCredsResponse_element> response_map_x = new Map<String, wwwApprouterComConnectorsWsdlServive.RunWithSAPCredsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://www.approuter.com/connectors/request/7/',
              'http://www.approuter.com/connectors/request/7/',
              'RunWithSAPCreds',
              'http://www.approuter.com/connectors/request/7/',
              'RunWithSAPCredsResponse',
              'wwwApprouterComConnectorsWsdlServive.RunWithSAPCredsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.RunResult;
        }
    }
    global class Product_element{
        public wwwApprouterComConnectorsWsdlServive.Input RunParameter;
        
        private String[] RunParameter_type_info = new String[]{'RunParameter','http://www.approuter.com/connectors/request/7/','Input','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.approuter.com/connectors/request/7/','true','false'};
        private String[] field_order_type_info = new String[]{'RunParameter'};
    }
    global class RunWithSAPCredsResponse_element {
        public wwwApprouterComConnectorsWsdlServive.Output RunResult;
        private String[] RunResult_type_info = new String[]{'RunResult','http://www.approuter.com/connectors/request/7/','Output','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.approuter.com/connectors/request/7/','true','false'};
        private String[] field_order_type_info = new String[]{'RunResult'};
    }
    global class RunWithSAPCreds_element {
        public wwwApprouterComConnectorsWsdlServive.Input RunParameter;
        public wwwApprouterComConnectorsWsdlServive.SAPCreds SAPCredentials;
        
        private String[] RunParameter_type_info = new String[]{'RunParameter','http://www.approuter.com/connectors/request/7/','Input','1','1','false'};
        private String[] SAPCredentials_type_info = new String[]{'SAPCredentials','http://www.approuter.com/connectors/request/7/','SAPCreds','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.approuter.com/connectors/request/7/','true','false'};
        private String[] field_order_type_info = new String[]{'RunParameter','SAPCredentials'};
    }
    global class Output {
       public String Material;
        public String Plant;
        public String stge_loc;
        public String Maint_stat;
        public String fisc_year;
        public String Curr_period;
        public String Repl_qty;
        public String Inc_corr_fac;
       
    }
    global class SAPCreds {
        public String SAPUser;
        public String SAPPassword;
        private String[] SAPUser_type_info = new String[]{'SAPUser','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] SAPPassword_type_info = new String[]{'SAPPassword','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.approuter.com/connectors/request/7/','true','false'};
        private String[] field_order_type_info = new String[]{'SAPUser','SAPPassword'};
    }
    global class RunResponse_element {
        public wwwApprouterComConnectorsWsdlServive.Output RunResult;
        private String[] RunResult_type_info = new String[]{'RunResult','http://www.approuter.com/connectors/request/7/','Output','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.approuter.com/connectors/request/7/','true','false'};
        private String[] field_order_type_info = new String[]{'RunResult'};
    }
}