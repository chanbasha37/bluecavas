/* 
* An Apex Class used as Wrapper class for deseralizing responce from ServiceNowGet and ServiceNowUpsert class
*/

global class Deserialization{

            //response fields from servicenow records  
            public String short_description {get;set;}  
            public String sys_id  {get;set;}   
            public String incident_state  {get;set;}    
            public String contact_type  {get;set;}   
            public String impact  {get;set;}    
            public String active  {get;set;}   
           
                                 
            public class ResponseResult{
            
                public List<Deserialization> result;
                
                public ResponseResult(){
                
                    result = new List<Deserialization>();
               }
                                        
          }         
  }