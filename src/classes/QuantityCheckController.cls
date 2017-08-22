public with sharing class QuantityCheckController{
    private ApexPages.StandardController sc;
    public QuantityCheckController(ApexPages.StandardController sc) {
        this.sc = sc;
    }
    public PageReference quantityCheck() {
        PageReference detailPage = sc.save();
        if (detailPage != null) {
            // Construct URL of edit page or whatever other page you want
            PageReference editPage = new PageReference(detailPage.getUrl() + '/Quantity_Check');
            return editPage;
        } else {
            return detailPage;
        }
    }
}