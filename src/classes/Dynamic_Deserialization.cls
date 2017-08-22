public with sharing class Dynamic_Deserialization {
    
    //passing the sObject and json string
    public static void InsertSOjects(String sObjectApiName, String jSONSObject){
    	
    	    //deserializing json response 
    	    Map<String, Object> fieldMap = (Map<String, Object>)JSON.deserializeUntyped(jSONSObject);
    	    
		    Schema.SObjectType targetType = Schema.getGlobalDescribe().get(sObjectApiName);
		    SObject newSobject = targetType.newSObject();
		    Map<String, Schema.sObjectField> targetFields = targetType.getDescribe().fields.getMap();
		    for (String key : fieldMap.keySet()){
		    	
        Object value = fieldMap.get(key);
        Schema.DisplayType valueType = targetFields.get(key).getDescribe().getType();
        if (value instanceof String && valueType != Schema.DisplayType.String)
        {
            String svalue = (String)value;
            if (valueType == Schema.DisplayType.Date)
                newSobject.put(key, Date.valueOf(svalue));
            else if(valueType == Schema.DisplayType.DateTime)
                newSobject.put(key, DateTime.valueOfGmt(svalue));
            else if (valueType == Schema.DisplayType.Percent || valueType == Schema.DisplayType.Currency)
                newSobject.put(key, svalue == '' ? null : Decimal.valueOf(svalue));
            else if (valueType == Schema.DisplayType.Double)
                newSobject.put(key, svalue == '' ? null : Double.valueOf(svalue));
            else if (valueType == Schema.DisplayType.Integer)
                newSobject.put(key, Integer.valueOf(svalue));
            else if (valueType == Schema.DisplayType.Base64)
                newSobject.put(key, Blob.valueOf(svalue));
            else
                newSobject.put(key, svalue);
        }
        else
            newSobject.put(key, value);
    }
    insert newSobject;
}

    
}