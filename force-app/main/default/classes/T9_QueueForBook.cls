public class T9_QueueForBook implements Queueable {

    List<Id> badBooksIdList = new List<Id>();

    public T9_QueueForBook(List<Id> badBooksIdList) {
        this.badBooksIdList = badBooksIdList;
    }

    public void execute(QueueableContext context) {
        T9_FutureAndBatchForBook.deleteBadBooks(badBooksIdList);
    }

}