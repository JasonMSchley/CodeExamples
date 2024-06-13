/*Challenge III
Create a class called Car that extends Vehicle. Car should have the following:
A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
A property called TireRotation. This should be read-only outside of the class. It must be between -90 and 90, inclusive
A property called Gear. This should be read-only outside of the class
A constructor that calls the base constructor of Vehicle and then sets the two rotation values to 0 and adds the LAND Medium to Media
Implement Turn to rotate the SteeringRotation by the specified amount, in degrees, and the TireRotate by 1/16th the specified amount, in degrees.

*/

public class Car extends Vehicle {
    
    //A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
    private Integer SteeringRotation { 
        get;
        private set{
            if (value <= -1440 || value >= 1440) {
                value = 0;
            }           
            steeringRotation = value;
            }
        }

    //A property called TireRotation. This should be read-only outside of the class. It must be between -90 and 90, inclusive
    public Integer TireRotation { 
        get; 
        private set { if (value <= -90 || value >= 90) {
            value = 0;
        }           
        TireRotation = value;
        }
    }
        
    //A property called Gear. This should be read-only outside of the class
    public Integer Gear { get; private set; }
    
    //A constructor that calls the base constructor of Vehicle and then sets the two rotation values to 0 and adds the LAND Medium to Media
    public Car() {
        super();
        this.SteeringRotation = 0;
        this.TireRotation = 0;
        super.Media.add(Medium.LAND);
        }
     

    //Challenge IV
    //Make the following modifications to Car:
    //Implement constructor chaining to allow inputs for values that Vehicle's constructor sets        
    public Car(Integer S, Integer O, string N, Integer C,Integer SR, Integer TR) {
        super(S,O,N,C);
        this.SteeringRotation = SR;
        this.TireRotation = TR;
        super.Media.add(Medium.LAND); 
    }



    //Implement Turn to rotate the SteeringRotation by the specified amount, in degrees, and the TireRotate by 1/16th the specified amount, in degrees
    public override void Turn(integer rotationAngle) {
        this.SteeringRotation += (Integer)rotationAngle;
        this.TireRotation += (Integer)(rotationAngle / 16);
    }
}