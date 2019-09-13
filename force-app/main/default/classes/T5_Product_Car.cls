public class T5_Product_Car extends T5_Product{
    public String nameOfModel;
    public Integer matSteel;
    public Integer matRubber;
    public Integer count;

    public T5_Product_Car(String nameOfModel){
        super('Car');
        this.nameOfModel = nameOfModel;
        this.matSteel = 0;
        this.matRubber = 0;
        this.count = 0;
    }

    public T5_Product_Car(String nameOfModel, Integer weightOfSteel, Integer weightOfRubber, Integer count){
        super('Car');
        this.nameOfModel = nameOfModel;
        this.matSteel = weightOfSteel;
        this.matRubber = weightOfRubber;
        this.count = count;
    }
}