/*Challenge I
Create a class called Vehicle. The Vehicle class should have the following:
An enum publicly available called Medium with the values LAND, AIR, WATER
A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
A property called Name. This should be read-only outside of the class
A property called Occupants. This is not allowed to be negative
A constant called Capacity. This must be at least 1
A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children*/
public abstract class Vehicle {
    
    // An enum publicly available called Medium with the values LAND, AIR, WATER
    public enum Medium { LAND, AIR, WATER }
    
    //A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
    public Decimal Speed {
        get { return speed; }
        private set {
            if (value >= 0) {
                speed = value;
            } else {
                throw new IllegalArgumentException('Speed cannot be negative');
            }
        }
    }
    //A property called Name. This should be read-only outside of the class
    public String Name {
        get { return name; }
        private set { name = value; }
    }

    //A property called Occupants. This is not allowed to be negative
    public Integer Occupants {
        get { return occupants; }
        private set {
            if (value >= 0) {
                occupants = value;
            } else {
                throw new IllegalArgumentException('Occupants cannot be negative');
            }
        }
    }
    //A constant called Capacity. This must be at least 1
    private static final Integer Capacity {
        get { return Capacity; }
        private set {
            if (value >= 0) {
                Capacity = value;
            } else {
                throw new IllegalArgumentException('Capacity must be greater then zero');
            }
        }
    }

    //A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children
    protected List<Medium> media;
    

    /*Challenge II
    Add the following methods to Vehicle:
    A constructor that sets Speed, Occupants, Name, and Capacity to default values
    A method called Accelerate which changes Speed by the specified amount
    An abstract method called Turn
    A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants*/

    // A constructor that sets Speed, Occupants, Name, and Capacity to default values
    public Vehicle() {
        Name = 'DefaultVehicle';
        Speed = 0;
        Occupants = 1;
        Media = new List<Medium>{ Medium.LAND };
    }

    // A method called Accelerate which changes Speed by the specified amount
    public void Accelerate(Decimal acceleration) {
        Speed += acceleration;
    }

    // Abstract method for turning
    public virtual void Turn(Decimal rotationAngle) {
        // Implementation will be provided by child classes
    }

    // A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants
    public override String ToString() {
        List<String> mediaStrings = new List<String>();
        for (Medium medium : media) {
            mediaStrings.add(String.valueOf(medium));
        }
        return 'Name: ' + Name + ', Speed: ' + Speed + ', Media: ' + String.join(mediaStrings, ', ') + ', Occupants: ' + Occupants;
    }
}