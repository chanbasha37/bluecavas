public class ProductExtension {

    ApexPages.StandardController stdController;

    public ProductExtension(ApexPages.StandardController controller) {
        stdController = controller;
    }

    public PageReference save() {
        stdController.save();
         PageReference orderPage = new PageReference('https://sf-lightning-dev-18-dev-ed.my.salesforce.com/01t/o');
        return orderPage ; 
    }
    
    public PageReference cancel() {
        stdController.cancel();
        PageReference orderPage = new PageReference('https://sf-lightning-dev-18-dev-ed.my.salesforce.com/01t/o');
        return orderPage ; 
    }
}