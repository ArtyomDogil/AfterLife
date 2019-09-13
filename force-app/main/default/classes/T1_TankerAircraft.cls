public class T1_TankerAircraft extends T1_Aircraft {

    public T1_TankerAircraft(){
        this.nameModel = 'IL78';
        this.aircrew = 6;
        this.passengerCapacity = 0;
        this.flightRange = 4000;
    }

    public override void fly() {
        System.debug('The T1_Aircraft can fly at a speed of 750 km/h.');
    }

    public void refuelingOtherAircraft() {
        System.debug('The T1_Aircraft can refueling other aircraft.');
    }

}