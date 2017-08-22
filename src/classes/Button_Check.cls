public class Button_Check {

    public String quantitycheck {get;set;}
    public Order c {get;set;}

    public Button_Check(ApexPages.StandardController controller) {
        this.c = (Order)controller.getRecord();
    }

    public PageReference processMarketoMergeField() {
        
        String quantitycheck = String.ValueOf(Order.Quantity__c);
        system.debug('Quantity: '+quantitycheck);
        return null;
        
    }   
}