@isTest
private class T9_BatchForBookTest {

    @testTest static void setup(){
        List<Author__c> authorsToInsert = new List <Author__c>();
        List<Book__c> booksToInsert = new List <Book__c>();
        Id author1Id;
        Id author2Id;

        for (Integer i=1; i<3; i++){
            authorsToInsert.add(new Author__c(AuthorName__c = 'Author' + i));
        }
        insert authorsToInsert;

        List<Author__c> authorsId = [
            SELECT id, AuthorName__c
            FROM Author__c
        ];

        for (Author__c item : authorsId){
            if (item.AuthorName__c = 'Author1'){
                author1Id = item.Id;
            }
            if (item.AuthorName__c = 'Author2'){
                author2Id = item.Id;
            }
        }

        for (Integer i=0; i<2000; i++){
            if (i < 500){
                booksToInsert.add(new Book__c(BookName__c = 'a' + i, MainAuthorID__c = author1Id));
            } else if(i>=500 && i < 1000){
                booksToInsert.add(new Book__c(BookName__c = 'b' + i, MainAuthorID__c = author2Id));
            } else if(i>=1000 && i < 1500){
                booksToInsert.add(new Book__c(BookName__c = 'c' + i, MainAuthorID__c = 'badId'));
            } else if(i>=1500 && i < 2000){
                booksToInsert.add(new Book__c(BookName__c = 'e' + i, MainAuthorID__c = 'badId'));
            }
            // booksToInsert.add(
            //     i < 500 ?
            //         new Book__c(BookName__c = 'a' + i, MainAuthorID__c = author1Id) :
            //         i>=500 && i < 1000 ?
            //             new Book__c(BookName__c = 'b' + i, MainAuthorID__c = author2Id) :
            //             i>=1000 && i < 1500 ?
            //                 new Book__c(BookName__c = 'c' + i, MainAuthorID__c = 'badId') :
            //                 i>=1500 && i < 2000 ?
            //                     new Book__c(BookName__c = 'e' + i, MainAuthorID__c = 'badId') : null
            // );
        }
        insert booksToInsert;
    }

}
