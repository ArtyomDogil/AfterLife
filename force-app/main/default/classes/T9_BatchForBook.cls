public class T9_BatchForBook implements Database.Batchable<sObject>, Database.Stateful{

    public Id idNewAuthor;
    public List<Book__c> goodBooksList = new List<Book__c>();
    public List<Id> authorIdList = new List<Id>();

    public Database.QueryLocator start(Database.BatchableContext BC) {
        List<Author__c> authorList = [
            SELECT Id
            FROM Author__c
            LIMIT 50000
        ];
        if (authorList != null && !authorList.isEmpty()){
            for (Author__c item : authorList) {
                authorIdList.add(item.Id);
            }
        }

        List<Author__c> idNewAuthorList = [
            SELECT Id
            FROM Author__c
            WHERE AuthorName__c = 'AuthorForBadBooks'
            LIMIT 1
        ];
        idNewAuthor = idNewAuthorList.get(0).Id;

        String query = 'SELECT Id, MainAuthorID__c, BookName__c FROM Book__c';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Book__c> allBooks){
        String chars = 'AEIOUYaeiouy';
        List<Id> badBooksIdList = new List<Id>();
        List<Book__c> badBooksWithNewAuthorList = new List<Book__c>();

        if (allBooks != null && !allBooks.isEmpty()){
            for (Book__c item : allBooks){
                if (authorIdList.contains(item.MainAuthorID__c)){
                    goodBooksList.add(item);
                } else if (chars.contains(item.BookName__c.left(1))){
                    badBooksIdList.add(item.Id);
                } else {
                    badBooksWithNewAuthorList.add(item);
                }
            }
        }

        if (badBooksWithNewAuthorList != null && !badBooksWithNewAuthorList.isEmpty() && idNewAuthor != null){
            List<Book__c> updateList = new List<Book__c>();
            for (Book__c item : badBooksWithNewAuthorList){
                item.MainAuthorID__c = idNewAuthor;
                updateList.add(item);
            }
            update updateList;
            System.debug('updateList.size()= ' + updateList.size());
        }

        System.enqueueJob(new T9_QueueForBook(badBooksIdList));
    }

    public void finish(Database.BatchableContext BC){
        System.debug('goodBooksList.size() = ' + goodBooksList.size());
        System.debug('goodBooksList = ' + goodBooksList);
    }

}