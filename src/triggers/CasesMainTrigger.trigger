/* Apex Case Trigger to fire when a Case is created, 
and checks the Case AccountId with the integration AccountId and assign with specific Integration type. */

trigger CasesMainTrigger on Case (after insert) {
    
    CasesMain.CasesFunctionalities(Trigger.new);
    
}