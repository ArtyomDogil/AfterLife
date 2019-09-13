public with sharing class T7_UpdatePhoneOnAccountHandler extends TriggerHandler {

    public override void beforeUpdate() {
        for(Account o : (List<Account>) Trigger.new) {
            if (String.isNotBlank(o.Phone)){
                o.Phone += 'mmm';
            }
        }
    }

}