public class DynamicTableController{
	
    public List<selectoption> supportedObject {get; set;}     
    public String SelectedObject {get; set;}
        
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
    Set<String> objectKeys = gd.keySet();
      
    public List<SelectOption> fieldLableAPI {get; set;}    
    public List<String> SelectedFields {get; set;}  
    public List<sObject> ObjectList {get; set;}
    
 //public DynamicTableController(ApexPages.StandardController controller){}
       
    public DynamicTableController(){
          
        supportedObject = new List<selectoption>() ;
        SelectedObject = '' ;
        fieldLableAPI = new List<SelectOption>() ;
        SelectedFields = new List<String>() ;
        ObjectList = new List<sObject>() ;
        
        
       
        for(Schema.SObjectType item : ProcessInstance.TargetObjectId.getDescribe().getReferenceTo()){
           
            if(!item.getDescribe().CustomSetting){               
                supportedObject.add(new SelectOption(item.getDescribe().getLocalName().toLowerCase() , item.getDescribe().getLabel() ));
            }
        }
        
    }
    
   
    public void ObjectFields(){  	
    	
        if(SelectedObject != '--None--'){
            
            Schema.SObjectType systemObjectType = gd.get(SelectedObject);        
            Schema.DescribeSObjectResult r = systemObjectType.getDescribe();               
            Map<String, Schema.SObjectField> M = r.fields.getMap();
            
            for(Schema.SObjectField fieldAPI : M.values()){
            	
                fieldLableAPI.add(new SelectOption(fieldAPI.getDescribe().getName() , fieldAPI.getDescribe().getLabel())) ;
                System.debug('SELECTED FIELDS '+SelectedFields);
                
            }
        }
    }
    

    public void ShowTable()
    {
        //Creating dynamic query with selected field
        String myQuery = 'Select Id ' ;
        
        for(String field : SelectedFields)
        {
            if(field.toLowerCase() != 'id' && field.toLowerCase() != '--none--')
            myQuery += ','+ field + ' ' ;
        }
        
        //Limit is 100 for now you can change it according to need
        myQuery += ' from ' + SelectedObject + ' LIMIT 100' ;
        
        //Executing the query and fetching results
        ObjectList = Database.query(myQuery) ;
    }
    
}