/* Test class for CaseAssignment apex class */

@isTest 
public class CaseAssignmentTest {
    
     
      static testMethod user createTestUser(){
          
            // Salesforce users with Standard profile   
            list<Profile> p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            if(p.size()>0){
           
               // Creat new users with Standard User profile 
               User u = new User(Alias = 'testU', Email='stdusr@test.com',EmailEncodingKey='UTF-8', LastName='Test', LanguageLocaleKey='en_US',LocaleSidKey='en_US', ProfileId = p[0].Id,TimeZoneSidKey='America/Los_Angeles', Username = 'testU@a.com' + System.currentTimeMillis());
               insert u;
               return u;
            }
            else {
            return null; 
            }
      }
           
      
      static testMethod void helperMethod(){

            // Testing with two diffrent users with diffrent times
            Datetime myDate1 = Datetime.newInstance(2017, 24, 4, 10, 50, 0);
            Datetime myDate2 = Datetime.newInstance(2017, 24, 4, 12, 50, 0);
                        
            Test.startTest();   // Start test      
            
            user u1 = createTestUser();
            user u2 = createTestUser();
            // Create CaseUsers with same skillset to test for Case allocation
            Case_User__c cuser1 = new Case_User__c(AvailableUsers__c=u1.id, Timings__c='2:00PM-11:00PM', SkillSet__c ='Product Support', Availability__c = TRUE, Last_Case_Allocated_Time__c = myDate1 );
            Case_User__c cuser2 = new Case_User__c(AvailableUsers__c=u2.id, Timings__c='2:00PM-11:00PM', SkillSet__c ='Product Support', Availability__c = TRUE, Last_Case_Allocated_Time__c = myDate2 );
            insert cuser1;
            insert cuser2;           
            // Create a new Case to test    
            Case c = new Case(Status ='New', Priority = 'High', Origin = 'Email',CaseRelatedTo__c='Product Support');
            insert c;
            
            CaseAssignment a = new CaseAssignment();
            //a.updateCaseStage(c);

            Test.stopTest();  // Stop test
            
            Case cs= [Select OwnerId, CaseRelatedTo__c,Priority From Case where Id =: c.id];        
            System.assertEquals(cs.CaseRelatedTo__c, cuser1.SkillSet__c);   // Checck for allocation    
            //System.assertEquals(cs.OwnerId, u1.id); 
                              
            
      }
  
}