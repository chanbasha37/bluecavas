trigger PreventDuplicates on Case (before insert,before update) {

  Map<String, Case> sftypeCases = new Map<String, Case>();

   
    List<Case> listAll = [SELECT id,Case.AccountId,integrationTo__c FROM Case Where SFType__c=true AND Case.Account.Id <> NULL AND integrationTo__c <> NULL];
    
    for(Case sfty : listAll){
        
        sftypeCases .put(sfty.AccountId+sfty.integrationTo__c, sfty);
    }
   
    System.debug('all active Cases::: ' +sftypeCases );
    
    if(sftypeCases .size()>0){ 
    
        for(Case c : Trigger.new ){
            System.debug('c.Account.Name :::'+c.AccountId);
            
            System.debug('c.IntegrationTo__c :::'+c.IntegrationTo__c);
            
        
            //filtering the matched record from Case object record 
            if(!String.isBlank(c.integrationTo__c) && !String.isBlank(c.AccountId) && sftypeCases.containsKey(c.AccountId+c.IntegrationTo__c)){
                
                if(c.SFType__c){
                
                     c.addError('Record already exist with the same Service ');
                
                }
          } 
       }
     }
   }