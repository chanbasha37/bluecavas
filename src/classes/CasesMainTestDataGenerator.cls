/*
* An Apex Class used to Generate Test data for CasesMainTest class
*/

public with sharing class CasesMainTestDataGenerator {
	
	  // Setup Account
	  public static Account setupAccount(Integer identifier, Boolean insertToDatabase){
		
		   Account testAccount = new Account(name = 'Test Account'+ identifier,   Phone='324234234' );                                         
          
            if (insertToDatabase) {
            	
                     insert testAccount;
                     
            }return testAccount;
      }

     
      
      // Setup Contact 
      public static Contact setupContact(Integer identifier, Id testAccountId, Boolean insertToDatabase) {

            Contact testContact = new Contact(AccountId = testAccountId, FirstName = 'First' + identifier,LastName = 'Last' + identifier,Email = 'test'+identifier+'@Mss.com', Phone='234234234');
           
            if (insertToDatabase) {
                        
                  insert testContact;
            }
                  return testContact;
      }
      
      
      
      // setup Case
      public static Case setupCase(Integer identifier, Id testContactId, Boolean insertToDatabase) {
   	
   	        Case testcase = new Case(Status ='New', Priority ='High', Origin = 'Web',CaseRelatedTo__c='Product Support',
   	                       ContactId = testContactId, IntegrationTo__c='ServiceNow2Salesforce', Subject= 'Testxxx for Salesforce');
    
            if (insertToDatabase) {
                 
                  insert testcase;
            }
                  return testcase;
      }
      
         	 	                        
        // setup user
        public static User setupUser(String lastname, Boolean insertToDatabase){

          //  Id profileId = [select Id FROM Profile where name='[Custom] Book Fair Consultant'].get(0).id;

            User user = new User(LastName=lastname, Alias='tu1', Email= lastname+'@scholastictest.com',languagelocalekey= 'en_US', 
                              localesidkey= 'en_GB', emailencodingkey= 'UTF-8', timezonesidkey= 'Europe/London',
                              Username=lastname+'@scholastictest.com.username', CommunityNickname=lastname+'nic', IsActive=true);
                              //ProfileId=profileId, IsActive=true);
 
            if(insertToDatabase){ 
 
                insert user; 
            }
                return user; 
        }
     
	
    
}