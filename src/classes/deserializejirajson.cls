/* 
* An Apex Class used as Wrapper class for deseralizing responce from JiraSfCaseGet and JiraSfCaseUpsert class
*/

global class deserializejirajson{
			
		public class ResponseIssues
		{
		  
		    public List<Issues> issues;
		    
		}    
		
		public class Issues
		{
		    public string expand;
		    public string id;
		    public string self;
		    public string key;
		    public Field fields;
		}    
		
		public class Field
		{
		    public String summary;
		    public String description;
		    public Priority priority;    
		    public Status status;
		    public String Issue_type;        
		}   
		
		public class Priority
		{
		   
		    public String name;
		    
		}    
		
		public class Status
		{
				 
		    public string name;
		  		    
		}    

  }