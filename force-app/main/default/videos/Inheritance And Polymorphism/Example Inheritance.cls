public class Animal {
    public void makeSound() {
        System.debug('Animal sound');
    }
}

public class Cat extends Animal {
    public void makeSound() {
        System.debug('Meow');
    }
}

public class Dog extends Animal {
    public void makeSound() {
        System.debug('Woof');
    }
}

// Usage
Animal myAnimal;

myAnimal = new Dog();
myAnimal.makeSound(); // Output: Woof

myAnimal = new Cat();
myAnimal.makeSound(); // Output: Meow
