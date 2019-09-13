public class T1_AmphibiousAircraft extends T1_Aircraft {

    public T1_AmphibiousAircraft(){
        this.nameModel = 'BE200';
        this.aircrew = 2;
        this.passengerCapacity = 43;
        this.flightRange = 3100;
    }

    public override void fly() {
        System.debug('The T1_Aircraft can fly at a speed of 600 km/h.');
    }

    public void floatOnWater() {
        System.debug('The T1_Aircraft can float on the water.');
    }

}