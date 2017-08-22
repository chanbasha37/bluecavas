public with sharing class SNowMappingController {
 
   
    public String[] getincidentFields(){
            
       Incident__c inc = [Select Incident_Fields__c From Incident__c Where Account__r.Name='ABC Heights' Limit 1];
        
       String[]  incFields = inc.Incident_Fields__c.split(';');
       
       System.debug('Incident fields ::' + incFields);
   
       return incFields;       
    }  
    
    
     public PageReference Back() {
                
        PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/SNowFields');
        Page.setRedirect(true);   
        return Page;
        
     }
    
    
    List<SelectOption> optionsDisplay = new List<SelectOption>();
    
    Map<String, Schema.SObjectField> schemaFieldMap = Case.sObjectType.getDescribe().fields.getMap();
            
    Set<String> originalvalues = schemaFieldMap.keySet();

    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
     
    public SNowMappingController(){
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftvalues.addAll(originalValues);
    }
     
    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
 
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
    
     public String[] getSelectedCaseFields(){
            
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
       /* for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;  */
        return tempList;
    }  
    
    
     
    public integer i =0;
   
    
     public PageReference MoveUp(){
        system.debug('@@@@@@Up');
        for(String s : rightselected){
           if(i > 0){
              i = i-1;
            }         
        }  return null;      
     }
     
     public PageReference MoveDown()
    {
         system.debug('@@@@@@Down');
        for(String s : rightselected){ 
        if(i < rightvalues.size()-1)
        { 
           i = i + 1;
         }               
        }
        return null;
    }
    
     public PageReference Submit() {
     	
     	//List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList){
            optionsDisplay.add(new SelectOption(s,s));
            System.debug('mappedCaseFields ::' + optionsDisplay);
        }
                
        PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/SNowMapping');
            Page.setRedirect(true);   
            return Page;
        
    }
      
    
    
    
}     
    
    /* 
    
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
    
    
    
     public TestUpDown()
    {
        i=0;
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
        options1.add(new SelectOption(s,s));
    }
    
    
    public PageReference MoveUp()
     {
         system.debug('@@@@@@Up');
        if(i > 0)
        {
            i = i-1;
            Name =slctAccount[i].getlabel();
        }
        return null;
    }
 
    public PageReference MoveDown()
    {
         system.debug('@@@@@@Down');
        if(i < slctAccount.size()-1)
        {
            i = i + 1;
            Name =slctAccount[i].getlabel();
            system.debug('@@@@@@Down'+Name );
        }
        return null;
    }
  
}   */