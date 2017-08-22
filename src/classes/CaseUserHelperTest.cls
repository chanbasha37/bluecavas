@isTest
public class CaseUserHelperTest{

        static testMethod user createTestUser(){
        //getting the salesforce users with Standard profile	
           List<Profile> p = [SELECT Id FROM Profile WHERE Name='Standard User'];
           if(p.size()>0){
           
               //creating the new users with standard user profile 
               User u = new User(Alias = 'testU', Email='stdusr@test.com',EmailEncodingKey='UTF-8', LastName='Test', LanguageLocaleKey='en_US',LocaleSidKey='en_US', ProfileId = p[0].Id,TimeZoneSidKey='America/Los_Angeles', Username = 'testU@a.com' + System.currentTimeMillis());
                    insert u;
                    return u;
                }
                else return null;
            }
           
           static testMethod void helperMethod(){
           	
           	//CaseUserHelper.updateCaseStage();

           //creating the two different times for assigining the two different users cuser1 & cuser2 
           Datetime myDate = Datetime.newInstance(2017, 24, 3, 10, 50, 0);
           Datetime myDate1 = Datetime.newInstance(2017, 24, 3, 12, 50, 0);
           
           //startTest() & stopTset() are for providing the additional governer limits 
           Test.startTest();         
           user usr1= createTestUser();
           user usr2= createTestUser();
           //creating the two new users with same skillset for checking the new case allocation 
           Case_User__c cuser1 = new Case_User__c(AvailableUsers__c=usr1.id,Timings__c='2:00PM-11:00PM', SkillSet__c ='Product Support',Availability__c = TRUE,Last_Case_Allocated_Time__c = myDate );
           Case_User__c cuser2 = new Case_User__c(AvailableUsers__c=usr2.id,Timings__c='2:00PM-11:00PM', SkillSet__c ='Product Support',Availability__c = TRUE,Last_Case_Allocated_Time__c = myDate1 );
           insert cuser1;
           insert cuser2;
           
           //creating a new case for user allocation
           Case cas = new Case(Status ='New', Priority = 'Medium', Origin = 'Email',CaseRelatedTo__c='Product Support');
           insert cas;

           Test.stopTest();
           cas = [Select OwnerId From Case where Id=:cas.id];
           //checking condition for allocaiton 
           System.assertEquals(cas.OwnerId, usr1.id);    
                           
            
  }
  
}