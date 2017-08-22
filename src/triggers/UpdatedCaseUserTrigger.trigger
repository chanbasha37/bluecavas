trigger UpdatedCaseUserTrigger on Case (before insert,before update) {

   List<ID> cIds = new List<ID>();
       
    List<Case_User__c> cuser = New  List<Case_User__c>();
    Map<ID, Case_User__c> cusermap = new Map<ID, Case_User__c>();

    Set<String> skillSet = new Set<String>();
    List<String> skillSetList = new List<String>();
    
    for(Case c : Trigger.new){
        
        if(c.Status == 'New') {
            cIds.add(c.Id); //add case ids.
        }     
        skillSet.add(c.CaseRelatedTo__c); 
     }   
     skillSetList.addAll(skillSet);    
        
         //available users               
         List<Case> cases = Trigger.new;
         List<Case_User__c> availableCaseUsers = [SELECT AvailableUsers__c, Timings__c, SkillSet__c FROM Case_User__c where Availability__c = TRUE ORDER BY Last_Case_Allocated_Time__c ASC];
         //List<Case_User__c> availableCaseUsers = Database.query(queryString);
         integer i=0;
         integer nomatchingSkillset = availableCaseUsers.size();
         for(Case c: cases){
             for(; i<=availableCaseUsers.size();i++){
                if(availableCaseUsers.get(i).SkillSet__c.contains(c.CaseRelatedTo__c)){
                  c.OwnerId = availableCaseUsers.get(i).AvailableUsers__c;
                  availableCaseUsers.get(i).Last_Case_Allocated_Time__c = DateTime.now();
                  cusermap.put(availableCaseUsers.get(i).id, availableCaseUsers.get(i));
                } else {
                      nomatchingSkillset--;
                      if(nomatchingSkillset == 0){
                          
                          
                           User u =[SELECT Email FROM User WHERE Id IN (SELECT UserOrGroupId FROM GroupMember WHERE Group.DeveloperName ='CaseQueue')];
                            String us = u.Email;
                                                  
                              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                              String[] toAddresses = new String[] {us};
                              mail.setToAddresses(toAddresses );
                              mail.setSubject('No Users available to handle this case');
                              mail.plainTextBody='handle this case';
                              Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
                                                  
                          break;
                      }
                      continue; 
                }
                if(i>=availableCaseUsers.size()){
                    i=0;
                }
                break;
             }      
         }
        
      
  
     if(!cusermap.isEmpty()) {
      update cusermap.values();
     }
        
   
   }