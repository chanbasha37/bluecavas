trigger AccountSubmitForApproval on Account (after update) {

    for (Account acc : Trigger.new) {

                     
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            
            req.setComments('Submitted for approval. Please approve.');
            
            req.setObjectId(acc.id);
            
            Approval.ProcessResult result = Approval.process(req);
            
            
             if(Approval.isLocked(acc .Id)){
        
             Approval.unlock(acc.Id);
            
          }                 
           
        }

    }