public class T5_Factory {
    Integer matSteel;
    Integer matWood;
    Integer matCarbon;
    Integer matRubber;
    Integer matPaint;

    public T5_Factory() {
        matSteel = 0;
        matWood = 0;
        matCarbon = 0;
        matRubber = 0;
        matPaint = 0;
    }

    public T5_Factory(Integer countOfSteel, Integer countOfWood, Integer countOfCarbon, Integer countOfRubber, Integer countOfPaint) {
        matSteel = countOfSteel;
        matWood = countOfWood;
        matCarbon = countOfCarbon;
        matRubber = countOfRubber;
        matPaint = countOfPaint;
    }

    public String quantityOfMaterialsInStock() {
        return ' Steel = ' + matSteel + '; ' +
                +'Wood = ' + matWood + '; ' +
                +'Carbon = ' + matCarbon + '; ' +
                +'Rubber = ' + matRubber + '; ' +
                +'Paint = ' + matPaint + ';';
    }

    public void addMaterial(Integer countOfSteel, Integer countOfWood, Integer countOfCarbon, Integer countOfRubber, Integer countOfPaint) {
        matSteel += countOfSteel;
        matWood += countOfWood;
        matCarbon += countOfCarbon;
        matRubber += countOfRubber;
        matPaint += countOfPaint;
    }

    public String manufactureOfProduct(List<T5_Product> inputData) {
        String answer = '';
        if (inputData != null || !inputData.isEmpty()) {
            for (T5_Product item : inputData) {
                if (item.typeOfProduct == 'Aircraft') {
                    T5_Product_Aircraft newAircraft = (T5_Product_Aircraft) item;
                    if ((newAircraft.matSteel * newAircraft.count) <= matSteel &&
                            (newAircraft.matCarbon * newAircraft.count) <= matCarbon &&
                            (newAircraft.matPaint * newAircraft.count) <= matPaint) {
                        minus(newAircraft.matSteel * newAircraft.count, 0, newAircraft.matCarbon * newAircraft.count, 0, newAircraft.matPaint * newAircraft.count);
//                        matSteel -= newAircraft.matSteel * newAircraft.count;
//                        matCarbon -= newAircraft.matCarbon * newAircraft.count;
//                        matPaint -= newAircraft.matPaint * newAircraft.count;
                        answer += 'Made ' + newAircraft.count + ' ' + newAircraft.nameOfModel + '; ';
                    } else {
                        answer += 'Not enough materials for ' + newAircraft.count + ' ' + newAircraft.nameOfModel + '!!!; ';
                    }
                } else if (item.typeOfProduct == 'Car') {
                    T5_Product_Car newCar = (T5_Product_Car) item;
                    if ((newCar.matSteel * newCar.count) <= matSteel &&
                            (newCar.matRubber * newCar.count) <= matRubber) {
                        matSteel -= newCar.matSteel * newCar.count;
                        matRubber -= newCar.matRubber * newCar.count;
                        answer += 'Made ' + newCar.count + ' ' + newCar.nameOfModel + '; ';
                    } else {
                        answer += 'Not enough materials for ' + newCar.count + ' ' + newCar.nameOfModel + '!!!; ';
                    }
                } else if (item.typeOfProduct == 'Ship') {
                    T5_Product_Ship newShip = (T5_Product_Ship) item;
                    if ((newShip.matSteel * newShip.count) <= matSteel &&
                            (newShip.matWood * newShip.count) <= matWood) {
                        matSteel -= newShip.matSteel * newShip.count;
                        matWood -= newShip.matWood * newShip.count;
                        answer += 'Made ' + newShip.count + ' ' + newShip.nameOfModel + '; ';
                    } else {
                        answer += 'Not enough materials for ' + newShip.count + ' ' + newShip.nameOfModel + '!!!; ';
                    }
                }
            }
        }
        return answer;
    }

    private void minus(Integer steel, Integer wood, Integer carbon, Integer rubber, Integer paint){
        matSteel -= steel;
        matWood -= wood;
        matCarbon -= carbon;
        matRubber -= rubber;
        matPaint -= paint;
    }

}

/*
T5_Factory test = new T5_Factory(6000, 1400, 2000, 1500, 2000);
String newTest = test.quantityOfMaterialsInStock();
System.debug('newTest = ' + newTest);

T5_Product_Aircraft newExAir = new T5_Product_Aircraft('Su35', 100, 150, 200, 3);
System.debug('newExAir = ' + newExAir);
T5_Product_Car newExCar = new T5_Product_Car('AudiA6', 80, 32, 3);
System.debug('newExCar = ' + newExCar);
T5_Product_Ship newExShip = new T5_Product_Ship('Ledokol', 800, 300, 1);
System.debug('newExShip = ' + newExShip);

List<T5_Product> listOfProduct = new List<T5_Product>();
listOfProduct.add(newExAir);
listOfProduct.add(newExCar);
listOfProduct.add(newExShip);

String newProduction = test.manufactureOfProduct(listOfProduct);
System.debug('newProduction = ' + newProduction);

newTest = test.quantityOfMaterialsInStock();
System.debug('newTest = ' + newTest);
 */