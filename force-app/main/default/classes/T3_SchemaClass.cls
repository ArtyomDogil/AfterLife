public class T3_SchemaClass {
    public String val { get; set; }
    public String result { get; set; }

    public List<SelectOption> getNameOfObjects() {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().values();
        List<SelectOption> options = new List<SelectOption>();

        for (Schema.SObjectType f : gd) {
            options.add(new SelectOption(f.getDescribe().getName(), f.getDescribe().getLabel()));
        }
        return options;
    }

    public void finalAnswer(){
        String result;
        result = getAccessibilityOfObject(val);
        result += getAccessibilityOfFields(getAllFieldsOfObject(val));
        this.result = result;
    }

    public String getAccessibilityOfObject(String sObjectName) {
        String resultAnswer = '\n' + sObjectName;
        if (Schema.getGlobalDescribe().get(sObjectName).getDescribe().isAccessible()) {
            resultAnswer += ': You can Accessible;';
        } else {
            resultAnswer += ': You cannot Accessible;';
        }

        if (Schema.getGlobalDescribe().get(sObjectName).getDescribe().isCreateable()) {
            resultAnswer += ' You can Createable;';
        } else {
            resultAnswer += ' You cannot Createable;';
        }

        if (Schema.getGlobalDescribe().get(sObjectName).getDescribe().isUpdateable()) {
            resultAnswer += ' You can Updateable;';
        } else {
            resultAnswer += ' You cannot Updateable;';
        }

        if (Schema.getGlobalDescribe().get(sObjectName).getDescribe().isDeletable()) {
            resultAnswer += ' You can Deletable.';
        } else {
            resultAnswer += ' You cannot Deletable.';
        }

        return resultAnswer + '\n';
    }

    public Map<String, Schema.SObjectField> getAllFieldsOfObject(String sObjectName) {
        Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(sObjectName).getDescribe().fields.getMap();
        return objectFields;
    }

    public String getAccessibilityOfFields(Map<String, Schema.SObjectField> mapOfFields) {
        String resultAnswer;
        for (Schema.SObjectField item : mapOfFields.values()) {
            resultAnswer += item.getDescribe().getLabel() + ' : ';
            if (item.getDescribe().isAccessible()) {
                resultAnswer += ' You can Accessible;';
            } else {
                resultAnswer += ' You cannot Accessible;';
            }

            if (item.getDescribe().isCreateable()) {
                resultAnswer += ' You can Createable;';
            } else {
                resultAnswer += ' You cannot Createable;';
            }

            if (item.getDescribe().isUpdateable()) {
                resultAnswer += ' You can Updateable \n';
            } else {
                resultAnswer += ' You cannot Updateable \n;';
            }
        }
        return resultAnswer;
    }
}