global class ServiveNowBatch implements Database.Batchable<sObject>, Database.AllowsCallouts{

    global Database.QueryLocator start(Database.BatchableContext BC){
       
       //String query = 'SELECT Id, Priority, Status, Subject, ServiceNowId__c, Origin FROM Case WHERE Status=1 LIMIT 15';
       
       Http http = new Http();
       HttpRequest req = new HttpRequest();
       HttpResponse res = new HttpResponse();
       req.setEndpoint('https://dev24994.service-now.com/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true');
       String query = res.getBody();
       
       return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Case> scope){
    
     
                      
    }
      
    global void finish(Database.BatchableContext BC){
    
    }
}