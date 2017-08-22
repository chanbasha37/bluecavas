/*
* An Apex Class used to Check Case AccountId with the integration AccountId and assign with specific Integration type.
* The class after assigning integration type fecthes the Username, Password, Url for the integrationType selected from the Integration Custom Object.
* The Intgration details are given to respective callout methods and authenticats, to call the service.
* Here we are making callouts to ServiceNow and Jira from Salesforce.
  and we are fetching data and inserting data from and within Salesforce to ServiceNow and Jira. 
*/
        
public with sharing class CasesMain {
    
     public static void CasesFunctionalities(List<Case> cases) {
        
         Map<String, Integration__C> intsByAccandType = new Map<String, Integration__C>();
            
         List<Integration__c> listAll = [SELECT id,name,username__c,password__c,URL__c,IntegrationAccount__c,integrationwith__c FROM Integration__c Where In__c=true AND IntegrationAccount__c <> NULL AND integrationwith__c <> NULL];
    
         for(Integration__c ing : listAll){
        
               intsByAccandType.put(ing.IntegrationAccount__c+ing.integrationwith__c, ing);
         }
    
         System.debug('all active integrations ::: ' +intsByAccandType);
    
         if(intsByAccandType.size()>0){        
           
              for(Case c : cases){
                             
                     System.debug('c.Account.Name ::'+c.AccountId);
                     System.debug('c.IntegrationTo__c :::'+c.IntegrationTo__c);
                     System.debug('intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c) ::: '+intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c));          
        
                    if(!String.isBlank(c.IntegrationTo__c) && !String.isBlank(c.AccountId) && intsByAccandType.containsKey(c.AccountId+c.IntegrationTo__c)){
                
                        Integration__c intgr = intsByAccandType.get(c.AccountId+c.IntegrationTo__c);
                        System.debug('intgr :: '+intgr);
                
                        String SubjectText = c.Subject;
                        String name = intgr.username__c;
                        String pwd = intgr.password__c;
                        String url = intgr.URL__c;
                        String jirakey= c.JIRA_Key__c;
                        String DescriptionText = c.Description;
               
                                                   
                        System.debug('Username ::: '+name);
                        System.debug('Password ::: '+pwd);
                        System.debug('URL ::: '+url);  
                        
                        
                    
                        
                                
                         ServiceNowPost.postfieldsFuture(name,pwd,url,SubjectText);
                        
                         ServiceNowGet.getfieldsFuture(name,pwd,url);
                        
                         ServiceNowUpsert.getfieldsFuture(name,pwd,url);
                        
                         JiraSfCasePost.PostfieldsFuture(name,pwd,url,SubjectText,DescriptionText);
                        
                         JiraSfCaseGet.getfieldsFuture(name,pwd,url);
                        
                         JiraSfCasePut.putfieldsFuture(name,pwd,url,jirakey);
                        
                               
        
                     }
    
               }
         }
     }
}