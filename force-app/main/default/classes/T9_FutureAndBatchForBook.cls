public class T9_FutureAndBatchForBook {

    @future
    public static void deleteBadBooks(List<Id> badBooksIdList){
        if (badBooksIdList != null && !badBooksIdList.isEmpty()){
            List<Book__c> badBooksList = [
                SELECT Id
                FROM Book__c
                WHERE Id IN :badBooksIdList
                LIMIT 50000
            ];
            delete badBooksList;
        System.debug('badBooksList.size()= ' + badBooksList.size());
        }
    }

}