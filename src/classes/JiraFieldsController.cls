public with sharing class JiraFieldsController {

    public String fields { get; set; }
    
     public Boolean issuetype {get;set;} 
     public Boolean priority {get;set;} 
     public Boolean status {get;set;}      
     public Boolean summary {get;set;} 
     public Boolean updated {get;set;}     

     //List<JiraIssues__c>  jiList = new List<JiraIssues__c>();
     
     public PageReference doInsert() {
        
           JiraIssues__c jIssue = new JiraIssues__c();   
               
           jIssue.issuetype__c = issuetype ;       
           jIssue.priority__c = priority ;      
           jIssue.status__c = status;        
           jIssue.summary__c = summary;       
           jIssue.updated__c = updated;
                     
           insert jIssue;         
      
                    
           Schema.DescribeSObjectResult objSchema = JiraIssues__c.sObjectType.getDescribe();       
           Map<String, Schema.SObjectField> fieldMap = objSchema.fields.getMap();
        
           //Set<String> fields = new Set<String>(); 
           String [] fields = new List<String>();
        
           for (String fieldName : fieldMap.keySet()){
            
               SObjectField sfield = fieldMap.get(fieldName);
            
               schema.describefieldresult dfield = sfield.getDescribe();
               if(jIssue.get(fieldName) == true) {
                   if(dfield.isCustom() && String.valueOf(dfield.getSoapType()) == 'Boolean') {
                      system.debug(jIssue.get(fieldName));
                      fields.add(fieldName);
                      System.debug('All Fields are selected ::::'+fieldName);
                   }  
               }
           }                                       
       
           PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/JiraSelectedFields');
           Page.setRedirect(true);   
           return Page;
        
     }      
             
}