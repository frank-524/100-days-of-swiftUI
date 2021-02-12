/*
    Day 7 Closures Pt 2
 
    SwiftUI uses closures alot! So it is worth learning
 */

// 1. Using Closures as parameters when they accept parameters
/*
    A closure you pass into a function can also accept its own parameters.
 
    We have been using () -> Void to mean "accepts no parameters and returns nothing", but you can go ahead and fill the () with the types of any parameters that your closure should accept
 
    To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string:
 
 */
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

// When we call travel() using trailing closure syntax, our closure code is required to accept a string
travel{(place: String) in
    print("I'm going to \(place) in my car")
}

/*
    OPTIONAL: When would closures with parameters be used as parameters?
    
    Closures that accept parameters are a little hard to read, but that problem gets worse when the closures themselves are used as parameters.
 
    To give a practical example, imagine you were building a car.
 */
let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

func buildCar(name: String, engine: (Int) -> Void) {
    
}

// 2. Using closures as parameters when they return values

