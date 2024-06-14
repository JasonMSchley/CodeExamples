/*Challenge I
Create a class called Vehicle. The Vehicle class should have the following:*/
public abstract class Vehicle {
    
    // An enum publicly available called Medium with the values LAND, AIR, WATER
    public enum Medium { LAND, AIR, WATER }  
    //A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
    public Integer Speed{
        get;
        private set{
            if (value <0){value = 0;}
            this.Speed = value;
        }
    }
        
    //A property called Name. This should be read-only outside of the class
    public String Name{get;private set;}

    //A property called Occupants. This is not allowed to be negative
    public Integer Occupants{
        get;
        private set{
            if (value <0){value = 0;}
            this.Occupants = value;
        } 
         
    }

    //A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children
    protected List<Medium> Media;
    

    /*Challenge II
    Add the following methods to Vehicle:*/

    // A constructor that sets Speed, Occupants, Name, and Capacity to default values
    public Vehicle() {
        this.Speed = 0;
        this.Occupants = 1;
        this.Name = 'DefaultVehicle';
        final Integer Capacity = 1;  //A constant called Capacity. This must be at least 1
    }

    // A method called Accelerate which changes Speed by the specified amount
    public virtual void Accelerate(Integer acceleration) {
        this.Speed += acceleration;
    }

    // Abstract method for turning
    public virtual void Turn(Integer rotationAngle) {
    }

    // A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants
    public override String ToString() {
        return 'Speed: ' + Speed + ', Media: ' + ', Media: ' + media + ', Name: ' + Name + ', Occupants: ' + Occupants;
    }

    //Challenge IV
    //Make the following modifications to Vehicle:
    //Implement constructor chaining to allow for values set by the constructor to be input instead

    public Vehicle(Integer S, Integer O, string N, Integer C) {
        this.Speed = S;
        this.Occupants = O;
        this.Name = N;
        if (C<1){C=1;}              //A constant called Capacity. This must be at least 1
        final Integer Capacity = C;  
    }
}