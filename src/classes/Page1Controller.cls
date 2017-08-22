public with sharing class Page1Controller {
    
    Integration__c ic = new Integration__c();
    
    public Integration__c getic(){
        return ic;
    }
    
     
    public PageReference Save() {     // used in page1                     
        
       insert ic;
    
       PageReference Page = new PageReference('https://c.na40.visual.force.com/apex/Page2');

       Page.setRedirect(true);
       
       return Page;       
   
       }
        
}