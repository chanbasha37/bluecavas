public class UnlockRecordDuringApprovalCon {

    Opportunity objOpportunity;
    
    String currentuserId = UserInfo.getUserId();
    
    public UnlockRecordDuringApprovalCon(ApexPages.StandardController controller) {
    
        objOpportunity = (Opportunity)controller.getRecord();
    }
    
    public void processRecord() {
    
        Approval.UnlockResult unlockedRersult = Approval.unlock(objOpportunity);
       
        if (unlockedRersult.isSuccess()) {
            
            System.debug('Successfully unlocked opportunity with ID: ' + unlockedRersult.getId());
        }
        else {
                          
            for(Database.Error err : unlockedRersult.getErrors()) {
                System.debug('The following error has occurred.');                    
                System.debug(err.getStatusCode() + ': ' + err.getMessage());
                System.debug('opportunity fields that affected this error: ' + err.getFields());
            }
        }
        System.debug('currentuserId ' + currentuserId);
        
    }   
}