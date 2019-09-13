public class T6_DataRecoveryFromJunctionObject {

    private static List<BookAuthor__c> bookAuthorsList = gettingBookAuthors();
    private static Set<String> authorsToInsert = new Set<String>();
    private static Set<String> booksToInsert = new Set<String>();
    private static Map<String, String> mainAuthorsToInsert = new Map<String, String>();
    private static Map<String, Id> idOfAuthor = new Map<String, Id>();
    private static Map<String, Id> idOfBook = new Map<String, Id>();

    private static List<BookAuthor__c> gettingBookAuthors() {
        List<BookAuthor__c> bookAuthorList = [
            SELECT Id, BookAuthorName__c, AuthorID__c, BookID__c
            FROM BookAuthor__c
            ORDER BY BookAuthorName__c ASC
        ];
        return bookAuthorList;
    }

    private static List<Book__c> gettingBooks() {
        List<Book__c> bookList = [
            SELECT Id, BookName__c, MainAuthorID__c
            FROM Book__c
            ORDER BY BookName__c ASC
        ];
        return bookList;
    }

    private static List<Author__c> gettingAuthors() {
        List<Author__c> authorList = [
            SELECT Id, AuthorName__c
            FROM Author__c
            ORDER BY AuthorName__c ASC
        ];
        return authorList;
    }

    private static void gettingIdOfBook(){
        List<Book__c> excistingBooksList = gettingBooks();
        for (Book__c item : excistingBooksList){
            idOfBook.put(item.BookName__c, item.Id);
        }
    }

    private static void gettingIdOfAuthor(){
        List<Author__c> excistingAuthorsList = gettingAuthors();
        for (Author__c item : excistingAuthorsList){
            idOfAuthor.put(item.AuthorName__c, item.Id);
        }
    }

    private static void dataProcessingOfBookAuthor(){
        if (bookAuthorsList != null || !bookAuthorsList.isEmpty()){
            List<String> bookAuthorName;
            for (BookAuthor__c item : bookAuthorsList){
                bookAuthorName = item.BookAuthorName__c.split('--');
                if (bookAuthorName.size() <= 1){
                    System.debug('Junction object \'' + item.Id + '\' has wrong format');
                } else {
                    booksToInsert.add(bookAuthorName[0]);
                    authorsToInsert.add(bookAuthorName[1]);
                    mainAuthorsToInsert.put(bookAuthorName[0], bookAuthorName[1]);

                    if (bookAuthorName.size() > 2){
                        for (Integer i = 2; i < bookAuthorName.size(); i++){
                            authorsToInsert.add(bookAuthorName[i]);
                        }
                    }
                }
            }
        } else {
            System.debug('Input data null or empty');
        }
    }

    private static void insertAuthors(){
        if (authorsToInsert != null || !authorsToInsert.isEmpty()){
            List<Author__c> authorsToInsertList = new List<Author__c>();
            for (String item : authorsToInsert){
                authorsToInsertList.add (
                    new Author__c (
                        AuthorName__c = item
                    )
                );
            }
            upsert authorsToInsertList AuthorName__c;
        } else {
            System.debug('Input data null or empty');
        }
    }

    private static void insertBooks(){
        if (booksToInsert != null || !booksToInsert.isEmpty() || mainAuthorsToInsert != null || !mainAuthorsToInsert.isEmpty() ){
            List<Book__c> booksToInsertList = new List<Book__c>();
            for (String item : booksToInsert){
                booksToInsertList.add (
                    new Book__c (
                        BookName__c = item,
                        MainAuthorID__c = idOfAuthor.get(mainAuthorsToInsert.get(item))
                    )
                );
            }
            upsert booksToInsertList BookName__c;
        } else {
            System.debug('Input data null or empty');
        }
    }

    private static void updateOfBookAuthor(){
        if (bookAuthorsList != null || !bookAuthorsList.isEmpty()){
            List<String> bookAuthorName;
            Map<String, Integer> counter = new Map<String, Integer>();
            for (Integer i = 0; i < bookAuthorsList.size(); i++){
                bookAuthorName = bookAuthorsList[i].BookAuthorName__c.split('--');
                if (bookAuthorName.size() > 1){
                    if (!counter.containsKey(bookAuthorName[0])){
                        counter.put(bookAuthorName[0], 1);
                    } else if (counter.containsKey(bookAuthorName[0])){
                        Integer newInt = counter.get(bookAuthorName[0]) + 1;
                        counter.put(bookAuthorName[0], newInt);
                    }
                    bookAuthorsList[i].AuthorID__c = idOfAuthor.get(bookAuthorName[counter.get(bookAuthorName[0])]);
                    bookAuthorsList[i].BookID__c = idOfBook.get(bookAuthorName[0]);
                }

            }
            update bookAuthorsList;
        } else {
            System.debug('Input data null or empty');
        }
    }

    public static void goAhead(){
        dataProcessingOfBookAuthor();
        insertAuthors();
        gettingIdOfAuthor();
        insertBooks();
        gettingIdOfBook();
        updateOfBookAuthor();
    }
}