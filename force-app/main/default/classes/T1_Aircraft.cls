public virtual class T1_Aircraft {

    public String nameModel;
    public Integer passengerCapacity;
    public Integer flightRange;
    public Integer aircrew;

    public T1_Aircraft(){
    }

    public virtual void fly() {
        System.debug('The T1_Aircraft can fly.');
    }

    protected void methot() {
        System.debug('ddf');
    }
}