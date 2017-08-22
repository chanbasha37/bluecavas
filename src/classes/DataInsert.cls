public class DataInsert {
    
     public Boolean impact {get;set;} 
     public Boolean incident_state {get;set;} 
     public Boolean short_description {get;set;} 
     public Boolean sys_id {get;set;} 
     public Boolean contact_type {get;set;} 
     public Boolean u_sftype {get;set;} 
     public Boolean sys_updated_onONLast {get;set;}
   
     public Set<String> incidents {get; set;}      
     public  Set<String> fields {get;set;} 
 
 
    public List<selectoption> supportedObject {get; set;}     
    public String SelectedObject {get; set;}
        
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
    Set<String> objectKeys = gd.keySet();
      
    public List<SelectOption> fieldLableAPI {get; set;}    
    public List<String> SelectedFields {get; set;}  
    public List<sObject> ObjectList {get; set;}
     
     
     public PageReference doInsert() {
     	
        Incident__c objdlt = new Incident__c();   
     
       if(impact){ 
          objdlt.impact__c=impact ;
        }		
		if(incident_state){
		   objdlt.incident_state__c=incident_state;
		}
		if(short_description){
		   objdlt.short_description__c=short_description;
		}
		if(sys_id){
		   objdlt.sys_id__c=sys_id;
		}
		if(contact_type){
		   objdlt.contact_type__c=contact_type;
		}
		if(u_sftype){
		   objdlt.u_sftype__c=u_sftype;
		}
		if(sys_updated_onONLast){
		   objdlt.sys_updated_onONLast__c=sys_updated_onONLast;
		}           
		insert objdlt;         
       
       
        Schema.DescribeSObjectResult objSchema = Incident__c.sObjectType.getDescribe();    
           
		Map<String, Schema.SObjectField> fieldMap = objSchema.fields.getMap();
				
		fields = new Set<String>();
		incidents = new Set<String>();
		for (String fieldName : fieldMap.keySet()){
			
		    SObjectField sfield = fieldMap.get(fieldName);
		    
		    schema.describefieldresult dfield = sfield.getDescribe();
		    
		    if(objdlt.get(fieldName) == true) {
		    	
		        if(dfield.isCustom() && String.valueOf(dfield.getSoapType()) == 'Boolean') {
		        	
		            system.debug(objdlt.get(fieldName));
		            fields.add(fieldName);
		            incidents.addAll(fields);
		            System.debug('All Fields are selected ::::'+fields);
		         		               
		        }  
		    }
		}              
      
                 
	    PageReference myVFPage = new PageReference('/apex/Dynamic_Case_Page');
	    myVFPage.setRedirect(false);   
	    return myVFPage;
	   
     }    
      
     
        public DataInsert(){
          
        supportedObject = new List<selectoption>() ;
        SelectedObject = '' ;
        fieldLableAPI = new List<SelectOption>() ;             
        ObjectList = new List<sObject>() ;
        incidents = new Set<String>();
        
        SelectedFields = new List<String>() ;
        incidents = new Set<String>();
        
       
        for(Schema.SObjectType item : ProcessInstance.TargetObjectId.getDescribe().getReferenceTo()){
           
            if(!item.getDescribe().CustomSetting){               
                supportedObject.add(new SelectOption(item.getDescribe().getLocalName().toLowerCase() , item.getDescribe().getLabel() ));
            }
        }
        
    }
    
      public PageReference ObjectFields(){  	
    	
        if(SelectedObject != '--None--'){
            
            Schema.SObjectType systemObjectType = gd.get(SelectedObject);        
            Schema.DescribeSObjectResult r = systemObjectType.getDescribe();               
            Map<String, Schema.SObjectField> M = r.fields.getMap();
            
            for(Schema.SObjectField fieldAPI : M.values()){
            	
                fieldLableAPI.add(new SelectOption(fieldAPI.getDescribe().getName() , fieldAPI.getDescribe().getLabel())) ;                                
                              
            }
        }
        
         PageReference myVFPage = new PageReference('/apex/Dynamic_Case_Page');
	    myVFPage.setRedirect(false);   
	    return myVFPage;
    }
    
     public void mappingFields(){
     	
     	
     }    	
}