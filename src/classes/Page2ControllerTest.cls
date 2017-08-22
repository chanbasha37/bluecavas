@isTest
public with sharing class Page2ControllerTest {
    
    public static testMethod void  MyController() {

        PageReference pageRef = Page.Page1;
        Test.setCurrentPage(pageRef);
        
        Test.startTest();   // Start test    
         
        CasesMainTestDataGenerator cData = new CasesMainTestDataGenerator();
        
        Account a = CasesMainTestDataGenerator.setupAccount(1, true);
                              
        
        Integration__C intg1 = new Integration__C(name='IntegrationSF1', IntegrationAccount__c = a.Id, username__c = 'admin1',password__c = '$Test1234', In__c=true,
                                               URL__c='https://dev24994.service-now.com/', integrationwith__c = 'ServiceNow2Salesforce');                                                                                          
        
        
        Integration__C intg2 = new Integration__C(name='IntegrationSF2', IntegrationAccount__c = a.Id, username__c = 'admin2',password__c = '$Test1234', In__c=true,
                                               URL__c='https://dev24994.service-now.com/', integrationwith__c = 'SNow2SF');                                                                                        
        
        
        Integration__C intg3 = new Integration__C(name='IntegrationSF3', IntegrationAccount__c = a.Id, username__c = 'admin3',password__c = '$Test1234', In__c=true,
                                               URL__c='https://dev24994.service-now.com/', integrationwith__c = 'Jira2SF');                                                                                        
        
        insert intg1;                      
        insert intg2; 
        insert intg3;
             
        
         
        List<SelectOption> options = new List<SelectOption>(); 
        
        options.add(new SelectOption(intg1.Id, intg1.Name));
        
        System.assertEquals(intg1.Name,'IntegrationSF1');
                                     
        Page2Controller pg = new Page2Controller();
        pg.updateSelection(); 
        pg.Move1();
        pg.Move2();
        
        Test.stopTest();   // Stop test    
              
        
        Integration__c inc = [select name, IntegrationAccount__c, username__c, password__c , URL__c , integrationwith__c from Integration__c where id =: intg1.id];  
       
        System.assertEquals(inc.IntegrationAccount__c, a.Id);        
        System.assertEquals(inc.username__c, 'admin1');        
        System.assertEquals(inc.password__c, '$Test1234');       
        System.assertEquals(inc.URL__c, 'https://dev24994.service-now.com/');      
        System.assertEquals(inc.integrationwith__c, 'ServiceNow2Salesforce');
        
    
        }

}