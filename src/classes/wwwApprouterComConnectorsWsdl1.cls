public with sharing class wwwApprouterComConnectorsWsdl1{

    public wwwApprouterComConnectorsWsdl1(ApexPages.StandardSetController stdController) { }

    public PageReference doSomething()
    {
        
        insert new Product2();

        // Invoke the list action to return back to the ListView
        return new ApexPages.Action('{!list}').invoke();
    }
}