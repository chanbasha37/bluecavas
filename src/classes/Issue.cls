global with sharing class Issue {
	
	  //response fields from servicenow records in ServiceNowAuth Apex class
            public String key {get;set;}  
            public String Status  {get;set;}   
            public String Priority  {get;set;}
            public String Summary  {get;set;}
            public String name  {get;set;}           
                      
            global class ResponseResult{
            
                public List<Issue> result;
                
                public ResponseResult(){
                
                    result = new List<Issue>();
               }
                                        
          }         
    
}