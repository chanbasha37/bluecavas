/*
* An Apex Class used to Schedule Jira Issues.
* Gets all Jira Issues of type "J SFType" for every scheduled intervals.
*/

global class SchedulingJIRA implements Schedulable {
    
   global void  execute(SchedulableContext sc) {
    
        JiraSfCaseGet j = new JiraSfCaseGet(); // get Issues from jira for every scheduled interval
        JiraSfCaseUpsert.Upsertfields('basha183755@gmail.com','test@123','https://sfjiranew.atlassian.net'); // creates or updates cases related with Jira into Salesforce         
        
        String day = string.valueOf(system.now().day());
        String month = string.valueOf(system.now().month());
        String hour = string.valueOf(system.now().hour());
        String minute = string.valueOf(system.now().minute() + 15);
        String second = string.valueOf(system.now().second());
        String year = string.valueOf(system.now().year());
           
        System.schedule('Scheduled Job-00  '+System.now(), '0 0 * * * ?',  new SchedulingJIRA ());   
        System.schedule('Scheduled Job-11  '+System.now(), '0 15 * * * ?', new SchedulingJIRA ());
        System.schedule('Scheduled Job-22  '+System.now(), '0 30 * * * ?', new SchedulingJIRA ());
        System.schedule('Scheduled Job-33  '+System.now(), '0 45 * * * ?', new SchedulingJIRA ());  
        
        for( CronTrigger c:[Select State,Id,EndTime,CronExpression From CronTrigger where  
                                        NextFireTime = null  AND State='DELETED' Limit 100]){
                                            
                    System.abortJob(c.id);
            }   
                                
   }
   
        @future(callout=true)
        public static void testJira(){
            
         JiraSfCaseGet.Getfields('basha183755@gmail.com','test@123', 'https://sfjiranew.atlassian.net');      
          
        
    }
    
}