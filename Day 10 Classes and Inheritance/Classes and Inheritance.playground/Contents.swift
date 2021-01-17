/*
    Day 10 of 100 days Classes and Inheritance
 
    When you pass data between layouts, you'll be using classes
 
 */

/*
    5 Important differences that classes have
 - Do not come with synthesized memberwise initializers
 - One class can be built upon ("inherit from") another class, gaining its properties and methods
 - Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
 - Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not
 - Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot
 
 NOTE: Most Swift developers prefer structs rather than classes when possible
 */

// Creating your own classes
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Creating instances (aka objects)
let poppy = Dog(name: "Poppy", breed: "Poodle")

/*
 
Creating your own classses quiz:
 
Is this class valid?
 
 class ThemePark {
     var entryPrice: Int
     var rides: [String]
     init(rides: [String]) {
         self.rides = rides
         self.entryPrice = rides.count * 2
     }
 }
 
 Answer: Yes
 
 */

// Classs Inheritance

// New class inherits from Dog class
class Poodle: Dog {
    // We can create our own initializer or call the super (aka parent) class initializer.
    // For saftey reasons, swift always makes you call super.init() from child classes - just in case the parent class does some important work when it's created
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

/*
    Class inheritance quiz
 
    Is the following code valid class inheritance true or false?
 
 class Vehicle {
     var wheels: Int
     init(wheels: Int) {
         self.wheels = wheels
     }
 }
 class Truck: Vehicle {
     var goodsCapacity: Int
     init(wheels: Int, goodsCapacity: Int) {
         self.goodsCapacity = goodsCapacity
         super.init()
     }
 }
 
 Answer: False
 
 Correct! The Truck class must call the Vehicle initializer at some point
 */

// Overriding Methods

/*
 
    Child classes can replace parent methods with their own implementations - a process known as  overriding.
 
    Swift requires us to use override func rather than just func when overriding a method.
    It stops you from overriding a method by accident, and you'll get an error if you try to overrid something that doesn't exist on the parent class
 
    When would you want to override a method?
 
    Any class that inherits from a parent class can overrride the methods and sometomes the properties of that parent class.
 
    A real world example of overriding methods would be swift developers create subclasssess of Apple's table and override the parts they wanted to change, giving them all the built-in functionality and lots of flexibility and control
    
 */

// Example of overriding methods
class Cat {
    func makeNoise() {
        print("Meow!")
    }
}

class BlackCat: Cat {
    override func makeNoise() {
        print("Yip!")
    }
}

let myCat = BlackCat()
myCat.makeNoise() // Prints Yip! instead of Meow!

// Final Classses

/*
    Although class inheritance is very useful - and in fact large parts of Apple's platforms require you to use it - sometimes you want to disallow other developers from building their own class based on yours
 
    Swift gives us a final keyword for this purpose: when a class is declared as final, no other class can inherit from it. This means you cannot override
 
    Which classes should be declared as final?
 
    Classes should be declared final when something important should not be changed by the user
 */

// Example of a final class
final class Car {
    var name: String
    var year: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }
}

// Copying objects

/*
    The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things -changing one won't change the other.
 
    When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
 
    Why do copies of a class share their data?
 
    The technical term for this distinction is "value types vs reference types". Structs are value types. Which means they hold simple values like the number 5 or the string "hello"
 
    Classes are reference types, which means they refer to a value somewhere else
    
    Real world example:
    Imagine if you had a big app and wanted to share a User object in various places? If you were using a class, all the other places that used your user would have their data changed without realizing it, and you might end up with problems.
 
    But if you were using a struct, ever part of your app has its own copy of the data and it can't be changed by surprise
 
    
 
 */

// Example of copying objects
class Singer {
    var name = "Taylor Swift"
}

// Create an instance of Singer class
var singer = Singer()
print(singer.name) // Prints Taylor Swift

var singerCopy = singer
singerCopy.name = "Justin Bieber"

// Because the way classes work, but singer and singerCopy point to the same object in memory. So when we print the singer name again we will see Justin Bieber
print(singer.name)
print(singerCopy.name)

// On the other hand, if Singer were a struct then we would get Taylor Swift printed a second time

/*
    Copying objects Quiz
 
    This code prints the same output twice - true or false?
 
     class Starship {
         var maxWarp = 9.0
     }
     var voyager = Starship()
     voyager.maxWarp = 9.975
     var enterprise = voyager
     enterprise.maxWarp = 9.6
     print(voyager.maxWarp)
     print(enterprise.maxWarp)
 
    Answer: True (I got this wrong)
 
 */
class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

class Hairdresser {
    var clients = [String]()
}
var tim = Hairdresser()
tim.clients.append("Jess")
var dave = tim
dave.clients.append("Sam")
print(tim.clients.count)
print(dave.clients.count)

// Deinitializers

/*
    The fourth difference between classes and structs is that class can have deinitializers - code that gets run when an instance of a class is destroyed
 
    Why do classes have deinitializers and structs don't?
    
    deinit is a counterpart to init() that gets run when the class instance gets destroyed
 
    Structs does not have deinitializers because struct is destroyed when whatever owns it no longer exists. So, if we create a struct inside a method and the methods ends, the struct is destroyed. Therefore structs does not need them
 
    However, classes have a complex copying behavior which is why it has the deinitializers
 
    Behind the scenes Swift performs automatic reference counting or ARC. ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.
 
    Quote from Anne Cahalan: "Code should read like senteces, which makes me think my classes should read like chapters. So deinitializer goes at the end, it's the ~fin~ of the class!"
 */

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    // And now for the deinitializer. This will be called when the Person instance is being destroyed
    deinit {
        print("\(name) is now more!")
    }
}

// Going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Mutability

/*
    The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can't be changed because the struct itself is constant.
 
    However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don't need the mutating keyword with methods that change properties; that's only need with structs
 
    Optional: Why can variable properties in constant classes be changed?
 
    Classes and structs handle mutability properties differently:
 -  Variable classes can have variable properties changed
 -  Constant classes can have variable properties changed
 -  Variable structs can have variable properties changed
 -  Constant structs cannot have variable properties changed
 
 REMEBER: Changing one part of a struct effectively means destroying and recreating the entire struct. Classes don't work this way
 
 */

/*
    This difference means you can change any variable property on a class even when the class is created as a constant - this is perfectly valid code:
 */
class Actors {
    var name = "Dwanye Johnson"
    // If you want to stop that from happening you need to make the property constant:
    // let name = "Dwanye Johnson"
    
}

let theRock = Actors()
theRock.name = "Arnold"
print(theRock.name) // Prints Arnold
