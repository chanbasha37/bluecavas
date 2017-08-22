trigger updateCaseUser on Case (before insert,after update){

   
    List<ID> cIds = new List<ID>();
       
    List<Case_User__c> cuser = New  List<Case_User__c>();
    Map<ID, Case_User__c> cusermap = new Map<ID, Case_User__c>();

   
    //case creation
    for(Case c : Trigger.new) {
    
        if(c.Status == 'New') {
            cIds.add(c.Id); //add case ids.
        }     
         
     }   
 
  
     //available users               
     List<Case> cases = Trigger.new;
     List<Case_User__c> availableCaseUsers = [SELECT AvailableUsers__c, Timings__c FROM Case_User__c where Availability__c = TRUE ORDER BY Last_Case_Allocated_Time__c ASC];
     integer i=0;
     for(Case c: cases){
         for(; i<=availableCaseUsers.size();i++){
            c.OwnerId = availableCaseUsers.get(i).AvailableUsers__c;
            availableCaseUsers.get(i).Last_Case_Allocated_Time__c = DateTime.now();
            cusermap.put(availableCaseUsers.get(i).id, availableCaseUsers.get(i));
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