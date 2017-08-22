/*This trigger is calling the CaseUserHelper class after creating the 
  new Case in Salesforce this is automatically execute the logic 
  in CaseUserHelperTrigger class 
*/
trigger CaseUserHelperTrigger on Case(before insert,before update){
    
        CaseUserHelper.updateCaseStage(Trigger.new);
}