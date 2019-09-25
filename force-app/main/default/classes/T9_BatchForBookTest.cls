@isTest
private class T9_BatchForBookTest {

    @testSetup static void setup(){
        List<Author__c> authorsToInsert = new List <Author__c>();
        List<Book__c> booksToInsert = new List <Book__c>();
        Id author1Id;
        Id author2Id;

        for (Integer i=1; i<3; i++){
            if (i == 1) {
                authorsToInsert.add(new Author__c(AuthorName__c = 'AuthorForBadBooks'));
            }
            authorsToInsert.add(new Author__c(AuthorName__c = 'Author' + i));
        }

        insert authorsToInsert;

        List<Author__c> authorsId = [
            SELECT id, AuthorName__c
            FROM Author__c
        ];

        for (Author__c item : authorsId){
            if (item.AuthorName__c == 'Author1'){
                author1Id = item.Id;
            }
            if (item.AuthorName__c == 'Author2'){
                author2Id = item.Id;
            }
        }

        for (Integer i=0; i<8; i++){
            if (i < 2){
                booksToInsert.add(new Book__c(BookName__c = 'a' + i, MainAuthorID__c = author1Id));
            } else if(i>=2 && i < 4){
                booksToInsert.add(new Book__c(BookName__c = 'b' + i, MainAuthorID__c = author2Id));
            } else if(i>=4 && i < 6){
                booksToInsert.add(new Book__c(BookName__c = 'c' + i, MainAuthorID__c = 'badId0000000000AAA'));
            } else if(i>=6 && i < 8){
                booksToInsert.add(new Book__c(BookName__c = 'e' + i, MainAuthorID__c = 'badId0000000000AAA'));
            }
        }
        insert booksToInsert;
    }

    @isTest static void test1() {
        Id author1Id;
        Id author2Id;
        Id author3Id;

        List<Author__c> authorsId = [
            SELECT id, AuthorName__c
            FROM Author__c
        ];

        for (Author__c item : authorsId){
            if (item.AuthorName__c == 'Author1'){
                author1Id = item.Id;
            }
            if (item.AuthorName__c == 'Author2'){
                author2Id = item.Id;
            }
            if (item.AuthorName__c == 'AuthorForBadBooks'){
                author3Id = item.Id;
            }
        }

        Test.startTest();
        T9_BatchForBook newClass = new T9_BatchForBook();
        Database.executeBatch(newClass);
        Test.stopTest();

        List<Book__c> allBooksList = [SELECT BookName__c,  MainAuthorID__c FROM Book__c];

        List<Book__c> goodBooks1List = [SELECT BookName__c,  MainAuthorID__c FROM Book__c WHERE MainAuthorID__c = :author1Id];
        System.assertEquals(2, goodBooks1List.size());

        List<Book__c> goodBooks2List = [SELECT BookName__c,  MainAuthorID__c FROM Book__c WHERE MainAuthorID__c = :author2Id];
        System.assertEquals(2, goodBooks2List.size());

        List<Book__c> badBooksCons1List = [SELECT BookName__c,  MainAuthorID__c FROM Book__c WHERE BookName__c LIKE 'c%'];
        System.assertEquals(2, badBooksCons1List.size());

        List<Book__c> badBooksCons2List = [SELECT BookName__c,  MainAuthorID__c FROM Book__c WHERE MainAuthorID__c = :author3Id];
        System.assertEquals(2, badBooksCons2List.size());

        List<Book__c> badBooksDeleteList = [SELECT BookName__c,  MainAuthorID__c FROM Book__c WHERE BookName__c LIKE 'e%'];
        System.assertEquals(2, badBooksDeleteList.size());
    }
}