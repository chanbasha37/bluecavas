trigger OppSubmitForApproval on Opportunity (after update) {

    for (Opportunity  opp : Trigger.new) {

                     
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            
            req.setComments('Submitted for approval. Please approve.');
            
            req.setObjectId(opp.id);
            
            Approval.ProcessResult result = Approval.process(req);
            
            
             if(Approval.isLocked(opp.Id)){
        
             Approval.unlock(opp.Id);
            
          }                 
           
        }

    }