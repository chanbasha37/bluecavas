/*
* An Apex Class used to Schedule ServiceNow Incidents.
* Gets all ServiceNow Incidents whose sftype is equal to true for every scheduled intervals.
*/
global class SchedulingServiceNow implements Schedulable {
    
  global  void execute(SchedulableContext SC){
      
      ServiceNowGet j = new ServiceNowGet(); // get ServiceNow incidents for every scheduled interval
      ServiceNowUpsert.GetIncident('admin','Test@123','https://dev14123.service-now.com');    
     
     
     
      String day = string.valueOf(system.now().day());
      String month = string.valueOf(system.now().month());
      String hour = string.valueOf(system.now().hour());
      String minute = string.valueOf(system.now().minute() + 15);
      String second = string.valueOf(system.now().second());
      String year = string.valueOf(system.now().year());
      
    
        System.schedule('Scheduled Job-0  '+System.now(), '0 0 * * * ?',  new SchedulingServiceNow ());   
        System.schedule('Scheduled Job-1  '+System.now(), '0 15 * * * ?', new SchedulingServiceNow ());
        System.schedule('Scheduled Job-2  '+System.now(), '0 30 * * * ?', new SchedulingServiceNow ());
        System.schedule('Scheduled Job-3  '+System.now(), '0 45 * * * ?', new SchedulingServiceNow ());

      for( CronTrigger c:[Select State,Id,EndTime,CronExpression From CronTrigger where  
                                        NextFireTime = null  AND State='DELETED' Limit 100]){
                                            
                    System.abortJob(c.id);
            }
            
        }
                 
        @future(callout=true)
        public static void testServiveNow(){
            
         ServiceNowUpsert.GetIncident('admin','Test@123','https://dev14123.service-now.com');      
          
        
    }
   }