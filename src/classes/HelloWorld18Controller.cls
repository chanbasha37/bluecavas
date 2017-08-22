public with sharing class HelloWorld18Controller {
    
    @AuraEnabled
    public static User getCurrentUser() {
      return [SELECT Id, FirstName, LastName FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
  }


    }