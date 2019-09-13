public class T5_Product_Ship extends T5_Product {
    public String nameOfModel;
    public Integer matSteel;
    public Integer matWood;
    public Integer count;

    public T5_Product_Ship(String nameOfModel) {
        super('Ship');
        this.nameOfModel = nameOfModel;
        this.matSteel = 0;
        this.matWood = 0;
        this.count = 0;
    }

    public T5_Product_Ship(String nameOfModel, Integer weightOfSteel, Integer weightOfWood, Integer count) {
        super('Ship');
        this.nameOfModel = nameOfModel;
        this.matSteel = weightOfSteel;
        this.matWood = weightOfWood;
        this.count = count;
    }
}