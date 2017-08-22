/*This trigger is for mapping the some of the Case fields with Integration__c Object
  fields because based on the integration type of fields is selected in Case object  the type 
  of the integration__c object record will be filtered and make a integration call to the
  external service.
  
*/    

trigger Type on Case (after Insert) {
    
    Map<String, Integration__C> intsByAccandType = new Map<String, Integration__C>();

   
    List<Integration__c> listAll = [SELECT id,name,username__c,password__c,URL__c,IntegrationAccount__c,integrationwith__c FROM Integration__c Where In__c=true AND IntegrationAccount__c <> NULL AND integrationwith__c <> NULL];
    
    for(Integration__c ing : listAll){
        
        intsByAccandType.put(ing.IntegrationAccount__c+ing.integrationwith__c, ing);
    }
   
    System.debug('all active integrations ::: ' +intsByAccandType);
    
    if(intsByAccandType.size()>0){        
        for(Case c : Trigger.new ){
            System.debug('c.Account.Name ::'+c.AccountId);
            System.debug('c.IntegrationTo__c :::'+c.IntegrationTo__c);
            System.debug('intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c) ::: '+intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c));          
        
            //filtering the matched record from integration__c object record 
            if(!String.isBlank(c.IntegrationTo__c) && !String.isBlank(c.AccountId) && intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c)){
                
                Integration__c intgr = intsByAccandType.get(c.AccountId+c.IntegrationTo__c);
                System.debug('intgr :: '+intgr);
                
                String SubjectText = c.Subject;
                String name = intgr.username__c;
                String pwd = intgr.password__c;
                String url = intgr.URL__c;
                //String jirakey= c.JIRA_Key__c;
                String DescriptionText = c.Description;
               
                                                   
                System.debug('Username ::: '+name);
                System.debug('Password ::: '+pwd);
                System.debug('URL ::: '+url);  
                
                //ServiceNowPost.PostIncident(name,pwd,url,SubjectText);
                
                //ServiceNowGet.GetIncident(name,pwd,url);
                
               ServiceNowUpsert.GetIncident(name,pwd,url);
                    
                //IssuesToCases.Getfields(SubjectText,name,pwd,url);
                
                //JiraSfCasePost.Postfields(name,pwd,url,SubjectText,DescriptionText);
                
                 //JiraSfCaseGet.Getfields(name,pwd,url);
                
               // JiraSfCaseUpsert.Getfields(name,pwd,url);
                
                       
                
            }                                                                                              
        
         }
     }
}