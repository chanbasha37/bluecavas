@isTest
public  class SchedulingJIRATests {
	
	   public static testmethod void main(){

            Test.startTest();
            
            SchedulingJIRA  s = new SchedulingJIRA();
           
            String sch = '0 0 * * * ?';
            String sch1 = '0 15 * * * ?';
            String sch2 = '0 30 * * * ?';
            String sch3 = '0 45 * * * ?';
            
            system.schedule('Test Schedule Check'+System.now(), sch, s);
            //system.schedule('Test Territory Check'+System.now(), sch1, s);
            //system.schedule('Test Territory Check'+System.now(), sch2, s);
            //system.schedule('Test Territory Check'+System.now(), sch3, s);
           
             Test.stopTest();
       } 
    
}