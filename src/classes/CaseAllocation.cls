public class CaseAllocation{

   public static void caseAssign(Case[] cas){
   List<ID> cIds = new List<ID>();
       
    List<Case_User__c> cuser = New  List<Case_User__c>();
    Map<ID, Case_User__c> cusermap = new Map<ID, Case_User__c>();

    Set<String> skillSet = new Set<String>();
    List<String> skillSetList = new List<String>();
    
    for(Case c : cas){
        
        if(c.Status == 'New') {
            cIds.add(c.Id); //add case ids.
        }     
        skillSet.add(c.CaseRelatedTo__c); 
     }   
     skillSetList.addAll(skillSet);    
   
     try{
     
         //available users               
         List<Case> cases = new List<Case>();
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
                          //TODO assign to case queue
                          
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
        }catch(System.DmlException e){
        
             System.debug('Missing the required field in record');
             
        }catch(Exception e){
        
             System.debug('An Error Occured at:' +e.getMessage());
             
        }finally{
        
             System.debug('This is block just for closing the class');
        }
      
  
     if(!cusermap.isEmpty()) {
      update cusermap.values();
     }
        
   
   }

}