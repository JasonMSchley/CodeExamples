/*Challenge III
Create a class called Car that extends Vehicle. Car should have the following:
A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
A property called TireRotation. This should be read-only outside of the class. It must be between -90 and 90, inclusive
A property called Gear. This should be read-only outside of the class
A constructor that calls the base constructor of Vehicle and then sets the two rotation values to 0 and adds the LAND Medium to Media
Implement Turn to rotate the SteeringRotation by the specified amount, in degrees, and the TireRotate by 1/16th the specified amount, in degrees.*/

public class Car extends Vehicle {
    
    // Properties
    private Integer SteeringRotation { get; set; }
    public Integer TireRotation { get; private set; }
    public Integer Gear { get; private set; }

    // Create a class called Car that extends Vehicle. Car should have the following:
    public Car(String name, Decimal speed, Integer occupants) {
        super();
        this.Name = name;
        this.Speed = speed;
        this.Occupants = occupants;
        this.steeringRotation = 0;
        this.tireRotation = 0;
        media.add(Medium.LAND);
    }

    //A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
    public void setSteeringRotation(Integer rotation) {
        if (rotation >= -1440 && rotation <= 1440) {
           steeringRotation = rotation;
        } else {
            // Handle out of range input
            throw new IllegalArgumentException('Steering rotation must be between -1440 and 1440.');
        }
    }

    // OImplement Turn to rotate the SteeringRotation by the specified amount, in degrees, and the TireRotate by 1/16th the specified amount, in degrees
    public override void Turn(Decimal rotationAngle) {
        SteeringRotation += (Integer)rotationAngle;
        TireRotation += (Integer)(rotationAngle / 16);
    }
}