public with sharing class SNowFieldsController {
    
    public Incident__c incident {get;set;}
    
    List<Incident__c> incidents = new List<Incident__c>();
    
    public PageReference Submit() {
        
        //Incident__c  inc = new Incident__c(); 
        insert incident;    
        incidents.add(incident); 
                
        PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/SNowFields');
            Page.setRedirect(true);   
            return Page;
         
     }
    
    
    
     public PageReference Next() {
        
        Incident__c  inc = new Incident__c(); 
        insert inc;    
        incidents.add(inc);         
        PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/SNowMapping');
        Page.setRedirect(true);   
        return Page;
        
     }
    
      
         
    public String[] getincidentFields(){
            
       Incident__c inc = [Select Incident_Fields__c From Incident__c Where Account__r.Name='ABC Heights' Limit 1];
        
       String[]  incFields = inc.Incident_Fields__c.split(';');
       
       System.debug('Incident fields ::' + incFields);
   
       return incFields;       
    }  
  
  
    
    public String[] getCaseFields(){
            
       Map<String, Schema.SObjectField> schemaFieldMap = Case.sObjectType.getDescribe().fields.getMap();
       for (String field : schemaFieldMap.keySet())
       System.debug(field);
       
       Set<String> s = schemaFieldMap.keySet();
        
       String[] cFields = new List<String>();       
 
       cFields.addAll(s);
       
       System.debug('Incident fields ::' + cFields);
   
       return cFields;       
    }  
    
      
}