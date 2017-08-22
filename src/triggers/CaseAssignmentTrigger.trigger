/* Apex Case Trigger to fire when a Case is created, and assigns the Case to a CaseUser */

trigger CaseAssignmentTrigger on Case (before insert,before update) {

   CaseAssignment.updateCaseStage(Trigger.new);

}