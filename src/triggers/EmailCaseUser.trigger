trigger EmailCaseUser  on Case (after insert,after update){

   
    List<ID> cIds = new List<ID>();
       
    List<Case_User__c> cuser = New  List<Case_User__c>();

   
    //case creation
    for(Case c : Trigger.new) {
    
        if(c.Origin == 'email' && c.Status == 'New') {
            cIds.add(c.Id); //add case ids.
        }     
         
     }   
           
   
     
     //cases from email
     for(Case_User__c cu : ([SELECT AvailableUsers__c, Timings__c FROM Case_User__c where Availability__c = true]))
     {     
          if(!cIds.isEmpty()) {
          cuser.add(cu);
          //Remove the Case Id from the List once assigned to the CaseUser
          cIds.remove(0);
          }
     }  
     
   
  
     if(!cuser.isEmpty()) {
      update cuser;
     }
        
        
     
}