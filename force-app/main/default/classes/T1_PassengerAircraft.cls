public class T1_PassengerAircraft extends T1_Aircraft {

    public T1_PassengerAircraft(){
        this.nameModel = 'Boeing737';
        this.aircrew = 3;
        this.passengerCapacity = 215;
        this.flightRange = 5900;
    }

    public override void fly() {
        System.debug('The T1_Aircraft can fly at a speed of 850 km/h.');
    }

}