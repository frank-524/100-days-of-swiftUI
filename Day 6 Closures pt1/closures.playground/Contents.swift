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
 Also, the IN keyword is super important!
 */

// 3. Returning values from a closure
/*
    Closures can also return values, and they are written after the parameters and use -> arrow before the IN keyword
 */

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Run closure and print it's return value
let message = drivingWithReturn("London")
print(message)

/*
    Optional: How do you return a value from a closure that takes no parameters?
 
    If you want to return a value without accepting any parameters, you should use empty parentheses for your parameter list
 */
let anonymousPayment = { () -> Bool in
    print("Paying an anonymous person..")
    return true
}

// 4. Closures as parameters

/*
    Bc closures can be used just like strings and integers, you can pass them into functions.
    In this example, we specify the parameter as type () -> Void. That means "accepts no parameters, and returns Void" - Swift's way of saying "nothing"

 In this example, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after
 */

func travel2(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

// We can call the function using our driving closure
travel2(action: driving)

/*
 Optional Why would you want to use closures as parameters?
 A real world example is siri. Using a closure to send back data rather than returning a value from the function means Siri doesn't need to wait for the function to complete, so it can keep its user interface interactive - it won't freeze up
*/

// 5. Trailing Closure syntax

/*
    If the last parameter to a funciton is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
 
    TO demostrate this, we will use the same function above
 */

func travel3() {
    print("I'm driving in my car")
    // In fact, because there aren't any other parameters, we can eliminate the parentheses entirely
}

/*
    OPTIONAL READING: Why does Swift have trailing closure syntax
 
    Trailing closure syntax is designed to make Swift code easier to read. It gets rid of the curly brace and parentheses })
 
    Below will show an example of a function that accepts a Double then a closure
 */
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
}

/*
    We can call that function without a trailing closure like this
    animate(duration: 3, animations: {
        print("Fade out the image")
 })
 */

// Trailing closure
animate(duration: 3) {
    print("Fade out the image")
}
