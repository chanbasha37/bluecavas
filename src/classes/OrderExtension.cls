Public class OrderExtension {

    ApexPages.StandardController stdController;

    public OrderExtension(ApexPages.StandardController controller) {
        stdController = controller;
    }

    public PageReference save() {
         stdController.save();
         PageReference orderPage = new PageReference('https://sf-lightning-dev-18-dev-ed.my.salesforce.com/801/o');
        orderPage.setRedirect(true); 
        return orderPage ; 
    }
    
    public PageReference cancel() {
        stdController.cancel();
        PageReference orderPage = new PageReference('https://sf-lightning-dev-18-dev-ed.my.salesforce.com/801/o');
        orderPage.setRedirect(true);
        return orderPage ; 
    }
    
    
}