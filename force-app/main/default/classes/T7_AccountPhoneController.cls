public with sharing class T7_AccountPhoneController {

    @AuraEnabled
    public static Account getAccountById(String inputId) {
        Account desiredAccount = new Account();
        List<Account> desiredAccountList = new List<Account>();
        if (String.isNotBlank(inputId)){
            desiredAccountList = [
                SELECT Name, Phone
                FROM Account
                WHERE Id =: inputId
                LIMIT 1
            ];
            if (!desiredAccountList.isEmpty()) {
                desiredAccount = desiredAccountList[0];
            }
        }
        return desiredAccount;
    }

    @AuraEnabled
    public static ResultData savePhoneNumber(Account dataToSave, String dataPhoneOld) {
        ResultData answer = new ResultData('Phone is empty');
        answer.status = 'info';
        if (dataToSave != null){
            if (dataToSave.Phone == dataPhoneOld){
                    answer.message = 'Warning! Input data is same!';
                    answer.status = 'warning';
            } else {
                try {
                    update dataToSave;
                    answer.message = 'SUCCESS update';
                    answer.status = 'success';
                } catch(DmlException e) {
                    answer.message = 'ERROR. The following exception: ' + e.getMessage();
                    answer.status = 'error';
                }
            }
        }
        Account acc = [
            SELECT Id, Phone
            FROM Account
            WHERE Id = :dataToSave.Id
            LIMIT 1
        ].get(0);
        answer.newPhone = acc.Phone;
        return answer;
    }

    public class ResultData {
        @AuraEnabled
        public String message;
        @AuraEnabled
        public String newPhone;
        @AuraEnabled
        public String status;

        public ResultData(String message) {
            this.message = message;
        }
    }

}