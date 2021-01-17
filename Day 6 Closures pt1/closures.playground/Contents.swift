/*
    Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters
 
    Functions used in this way are called closures, and although they work like functions they are written a little differently.
 */

let driving = {
    print("I'm driving in my car")
}

// Effectively creates a function witho a name, and assigns that function to driving
driving()

/*
    Optional: What the heck are closures and why does Swift love them so much?
 
    Closures are hard to understand. But closures is very important to learn because they are powerful.
 
    Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a functionn, and store the closure somewhere else.
 
 
    TEST: IS this valid swift code
 var paintPicture() {
     print("Where are my watercolors?")
 }
 
 Answer: False. Closures have parameters inside the braces
 */

// Accepting parameters in a closure

/*
    Closures can have parameters. They must be listed inside the open braces. List the parameters in the braces, then write in so that Swift knows the main body of the closure is starting.
 */

let traveling = { (place: String)
    in
    print("I'm going to \(place) for my vacation")
}

// NOTE: One of the differences between functions and closures is that you don't use parameter labels when running closures. So, to call driving() we'd write this:
traveling("London")

/*
 Optional: Why are Swift's closure parameters inside the braces?
 
 Both closures and functions can take parameters, but the way they take parameters is very different.
 
 NOTE: Closures cannot use external parameter labels
 
 Here's a function that accepts a string and an integer:
*/
func pay(user: String, amount: Int) {
    // Code
}

// Same code written as a closure:
let payment = { (user: String, amount: Int) in
    // code
}

/*
    NOTE: Swift makes closures take parameter inside the braces to not get confused with functions.
 Also, the in keyword is super important!
 */

// Returning values from a closure
/*
    Closures can also return values, and they are written after the parameters and use -> arrow
 */

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Run closure and print it's return value
let message = drivingWithReturn("London")
print(message)

/*
    Optional: How do you return a value from a closure that takes no parameters?
 
 */
