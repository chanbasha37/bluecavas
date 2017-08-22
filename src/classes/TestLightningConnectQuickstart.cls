@isTest
public class TestLightningConnectQuickstart {
    public static testMethod void tester() {
        List<Account> accs = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            accs.add(new Account(name = 'Test '+i));
        }
        insert accs;
        
        LightningConnectQuickstart qs = new LightningConnectQuickstart();
        
        Boolean state1 = qs.getCustomerIDsSet();
        
        System.assertEquals(false, state1, 'IDs should not be set');
        
        qs.setCustomerIDs();

        state1 = qs.getCustomerIDsSet();
        
        System.assertEquals(true, state1, 'IDs should be set');

        // Double check!
        accs = [SELECT Id 
                FROM Account 
                WHERE Customer_Id__c = null];
        
        System.assertEquals(0, accs.size(), 'IDs should be set');
    }
}