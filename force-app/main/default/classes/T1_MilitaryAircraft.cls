public class T1_MilitaryAircraft extends T1_Aircraft {

    public T1_MilitaryAircraft(){
        this.nameModel = 'SU35';
        this.aircrew = 1;
        this.passengerCapacity = 0;
        this.flightRange = 3600;
    }

    public override void fly() {
        System.debug('The T1_Aircraft can fly at a speed of 1400 km/h.');
    }

    public void shoot() {
        System.debug('The T1_Aircraft can shoot.');
    }

}