@isTest	
public class SchedulingJiraTest {
       
    @isTest	
    static void testSample() {
        Test.startTest();
        Datetime dt = Datetime.now().addMinutes(1);
        String CRON_EXP = '0 '+ dt.minute() + ' * ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year();
        String jobId = System.schedule('Sample_Heading', CRON_EXP, new SchedulingJIRA() );   
        Test.stopTest();
    }

}