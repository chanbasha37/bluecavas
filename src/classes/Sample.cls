public class Sample{
public Sample(ApexPages.standardController stdcontroller){}

public List<Selectoption> getCommpref()
    {
        List<SelectOption> Commprefvalue = new List<SelectOption>();
        Schema.DescribeFieldResult CommprefField = Schema.sObjectType.Incident__c.fields.Incident_Fields__c; 
        Schema.PicklistEntry [] Commpref = CommprefField.getPickListValues();
        //Schema.PicklistEntry [] values = vendorField.getPickListValues();
        for(Schema.PicklistEntry val : Commpref)
        {
            Commprefvalue.add(new SelectOption(val.getValue(), val.getLabel()));
        }
        return Commprefvalue;        
    }
    }