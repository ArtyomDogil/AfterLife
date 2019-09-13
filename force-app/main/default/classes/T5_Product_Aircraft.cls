public class T5_Product_Aircraft extends T5_Product {
    public String nameOfModel;
    public Integer matSteel;
    public Integer matCarbon;
    public Integer matPaint;
    public Integer count;

    public T5_Product_Aircraft(String nameOfModel) {
        super('Aircraft');
        this.nameOfModel = nameOfModel;
        this.matSteel = 0;
        this.matCarbon = 0;
        this.matPaint = 0;
        this.count = 0;
    }

    public T5_Product_Aircraft(String nameOfModel, Integer weightOfSteel, Integer weightOfCarbon, Integer weightOfPaint, Integer count) {
        super('Aircraft');
        this.nameOfModel = nameOfModel;
        this.matSteel = weightOfSteel;
        this.matCarbon = weightOfCarbon;
        this.matPaint = weightOfPaint;
        this.count = count;
    }
}