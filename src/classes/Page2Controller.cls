global with sharing class Page2Controller {
    
    global Integration__c ic {get;set;}
    
    global String selectedVal{get;set;} 
    
    
    Map<ID, Integration__c> existingIntegrations = new Map<ID, Integration__c>();
    List<SelectOption> options = new List<SelectOption>(); 
    
    public Page2Controller(){
		     
		     //getting all the records from Integer__c custom object  
		     for(Integration__c intgr : [Select Id,Name, IntegrationAccount__c, In__c, password__c, URL__c, username__c FROM Integration__c]){ 
		        
		        //added to Map Object
		         existingIntegrations.put(intgr.id, intgr);
		         
		         //added to List Object a new selct option value
		         options.add(new SelectOption(intgr.Id, intgr.Name));
		     }
		        selectedVal = options.get(0).getValue();
		        
		        System.debug('Initially selected value:::: ' + selectedVal);
		        
		        updateSelection();
		        
		        System.debug('current IC:::: ' +ic);
  }
  
  
    public List<SelectOption> getExistingIntegrations(){
    	
        return options;
    }
    
    public void updateSelection(){
    	
        System.debug('Selection Changed to::: ' +selectedVal);
        
        ic = existingIntegrations.get(selectedVal);
    }
    
    
     public PageReference Move1() {                          
        
       update ic;
    
       PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/Page2');

       Page.setRedirect(true);
       
       return Page;       
   
       }   
       
     
       public PageReference Move2() {     // Used to create new record
    
       PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/Page1');

       Page.setRedirect(true);
       
       return Page;       
   
       }
         
       
       
     
}