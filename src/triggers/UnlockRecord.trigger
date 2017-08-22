trigger UnlockRecord on Opportunity (after insert, after update) {

        for(Opportunity newOpp :trigger.New){
        
        if(Approval.isLocked(newOpp.Id)){
        
        Approval.unlock(newOpp.Id);
   }
 }
}