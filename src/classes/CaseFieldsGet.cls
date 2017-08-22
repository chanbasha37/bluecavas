public with sharing class CaseFieldsGet {
	
	//global Incident__c ic {get;set;}
    
    public void IncidentFields(){
    Map<ID, Incident__c> inMap = new Map<ID, Incident__c>();
      
    Incident__c inc = [Select Incident_Fields__c From Incident__c Where Account__r.Name='ABC Heights' Limit 1];
        
      
        String[] incFields = inc.Incident_Fields__c.split(';');
        
       // for(String s ; s<=incFields.size(); s++)
        
    }  
		 
   // List<SelectOption> options = new List<SelectOption>(); 
	
	public CaseFieldsGet(Apexpages.standardController c){}
	
	 public void caseFields(){
	  	
	  	   Schema.DescribeSObjectResult objSchema =  Case.sObjectType.getDescribe();       
           Map<String, Schema.SObjectField> fieldMap = objSchema.fields.getMap();
                      
           System.debug('casefield::'+ fieldMap);
	 }
    
}