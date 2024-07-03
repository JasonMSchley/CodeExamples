public abstract class Vehicle {

    public enum Medium { LAND, AIR, WATER }

    private Integer speed;
    private String name;
    private Integer occupants;
    protected List<Medium> media;

    public Integer getSpeed() {
        return speed;
    }

    private void setSpeed(Integer speed) {
        if (speed < 0) {
            speed = 0;
        }
        this.speed = speed;
    }

    public String getName() {
        return name;
    }

    private void setName(String name) {
        this.name = name;
    }

    public Integer getOccupants() {
        return occupants;
    }

    private void setOccupants(Integer occupants) {
        if (occupants < 0) {
            occupants = 0;
        }
        this.occupants = occupants;
    }

    public Vehicle() {
        this.speed = 0;
        this.occupants = 1;
        this.name = "DefaultVehicle";
        final Integer capacity = 1;
    }

    public Vehicle(Integer speed, Integer occupants, String name, Integer capacity) {
        this.setSpeed(speed);
        this.setOccupants(occupants);
        this.setName(name);
        if (capacity < 1) {
            capacity = 1;
        }
        final Integer finalCapacity = capacity;
    }

    public virtual void Accelerate(Integer acceleration) {
        this.speed += acceleration;
    }

    public virtual void Turn(Integer rotationAngle) {
    }

    public override String ToString() {
        return 'Speed: ' + speed + ', Media: ' + media + ', Name: ' + name + ', Occupants: ' + occupants;
    }
}
