//This class is for assigining new cases to the support CaseUsers 
global class CaseUserHelper {

    global static void updateCaseStage(List<Case> cases) {
    
             //collect the newly created casesIds    
             List<ID> cIds = new List<ID>();
        
             //list of CaseUsers 
             List<Case_User__c> cuser = New  List<Case_User__c>();
             Map<ID, Case_User__c> cusermap = new Map<ID, Case_User__c>();

             //collecting the unique skillset users 
             Set<String> skillSet = new Set<String>();
             
             //collection the multiple skillset users
             List<String> skillSetList = new List<String>();
    
    
             //newly created cases status is'NEW' adding to the CaseUsers 
             for(Case c: cases){
        
                   if(c.Status == 'New') {
                   cIds.add(c.Id); //add case ids.
                   }//adding case to the any single matched skillset CaseUser     
                   skillSet.add(c.CaseRelatedTo__c);
             }   
             skillSetList.addAll(skillSet);    
        
             //available CaseUsers               
            try{
           	       
           	       //getting all the available CaseUsers in soql query
                   List<Case_User__c> availableCaseUsers = [SELECT AvailableUsers__c, Timings__c, SkillSet__c  FROM Case_User__c where Availability__c = TRUE ORDER BY Last_Case_Allocated_Time__c ASC];
                    integer i=0;
                    integer nomatchingSkillset = availableCaseUsers.size();
                    for(Case c: cases){
                        for(; i<=availableCaseUsers.size();i++){
	                       
	                        //checking the available users with specific skillset 	
	                        if(availableCaseUsers.get(i).SkillSet__c.contains(c.CaseRelatedTo__c)){
	                          
	                          	
	                          c.OwnerId = availableCaseUsers.get(i).AvailableUsers__c;
	                          //based on the last allocated case time checking the available users for assigining
	                          availableCaseUsers.get(i).Last_Case_Allocated_Time__c = DateTime.now();
	                          
	                          //collecting all the available CaseUsers assign Ids in Map
	                          cusermap.put(availableCaseUsers.get(i).id, availableCaseUsers.get(i));
	                          //if no skillset matched CaseUsers are available then assign the cases to the queue members and send emails to the queue members
	                         } else {
                              nomatchingSkillset--;
                              if(nomatchingSkillset == 0){
                              	                                 
                                    //getting the queue membersand their email from the queue
                                     List<User> u =[SELECT Email FROM User WHERE Id IN (SELECT UserOrGroupId FROM GroupMember WHERE Group.DeveloperName ='CaseQueue')];
                                     
                                     for(User useremails : u){
                                                                                                                                                                                                                       
		                                      String us = useremails.Email;
		                                      //sending the emails to the Queue members                    
		                                      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		                                      String[] toAddresses = new String[] {us};
		                                      mail.setToAddresses(toAddresses );
		                                      mail.setSubject('No Users available to handle this case');
		                                      mail.plainTextBody='Please assign this case to any other user to handle this case';
		                                      Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});		                                                                                         
                                
                              }
                            }
                              continue;
                              
                        }//(i)cases is greaterthan available users set cases to zero again loop iterates loop with i value = 0
                        if(i>=availableCaseUsers.size()){
                            i=0;
                        }
                        break;
                     }      
                }//if the CaseUsers is not empty then update the existing CaseUsers records
                 if(!cusermap.isEmpty()) {
                    update cusermap.values();
                 }//if DML operations are fails then handled by this Exception   
            }catch(System.DmlException e){
            
                 System.debug('Missing the required field in record');
             //generic Exception to handled all Exceptions    
            }catch(Exception e){
            
                 System.debug('An Error Occured at:' +e.getMessage());
                 
            }finally{
            
                 System.debug('This is block just for closing the class');
            }      
                
     }
}