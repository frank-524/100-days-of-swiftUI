/*
    Day 5 of 100 days of SwiftUI
 
    Functions let us re-use code, which means we can write a function to do something interesting then run that function from lots of places. Repeating code is generally a bad idea, and functions help us avoid doing that.
 */

// Writing functions
// Swift functions start with the func keyword, then function name, then open and close parentheses
func printHelp() {
    let message = """
    Welcom to MyApp!
    
    Run this app inside a directory of images and MyApp will resize them all into thumbnails
    """
        print(message)
    
}

// Call aka running a function
printHelp()

/*
    One advance reason function are used is because Swift let us build new functions out of existing functions, which is a technique called function composition.
 
    Function composition. By splitting your work into multiple small functions, function composition lets us build big functions by combining those small functions in various ways, a bit like Lego bricks
 */

// 2. Accepting parameters

/*
    To make your own functions accept parameters, give each parameter a name, then a colon, then tell Swift the type of data it must be. All this goes inside the parentheses
 
    NOTE: Labeling parameter names is actually a good thing and improves readability
 
    How many parameters should a function accept?
 
 A function could take no parameters or take 20
 
 When a function takes many parameters - perhaps six or more, you need to ask whethere that function is doing too much work (This is subjective)
 
 
 */
func square(number: Int){
    print(number * number)
}

square(number: 8)


// 4. Parameter labels

/*
    Swift allows us to provide two names for each parameter
    one to be used externally when calling the function
    second to be used internally inside the function
 
    To do this, you write two names, separated by a space
 
 NOTE: Labeling parameter names is actually a good thing and improves readability

 */

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Frank")

// 5. Omitting parameter labels

/*
    You can ommit parameter labels by using an underscore _
 
    When should you omit a parameter label?
    
    The main reason for skipping a parameter name is when your function name is a verb and the first parameter is a noun the verb is acting on. For example:
 
 - Buying a product would be buy(toothbrush) rather than buy(item: toothbrush)
 - Finding a customer would be find(customer) rather than find(user: customer)
 
    This is particularly important when the parameter label is likely to be the same as the name of whatever you're passing in
 
 In objective-c the first parameter to a function was always left unnamed.
 
 */

func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("Jerry")

// 6. Default Parameters
func greet(_ person: String, nicely: Bool = true)
{
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again…")
    }

}

// Greet can be called in two ways
greet("Taylor")
greet("Taylor", nicely: false)


// 7. Varadic Functions
//For example a square() function that can square many numbers:
func square2(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

// Now we can run that with lots of numbers just by passing them in separated by commas:

square2(numbers: 1, 2, 3, 4, 5)

// 8. Throw functions
/*
1. First we need to define an enum that describes the errors we can throw. Enum must be Error type
2. Write function
3. Use throws keyword before the function's return value
4. Use the enum and throw keyword inside the function

Example
*/

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
}

    return true
}

// 9. Calling throw functions

/*
To call an error-throwing functions you need to use the following 3 keywords
    - Do: starts a section of code that might cause problems
    - Try: is used before every function that might thrown an error
    - Catch: lets you handle errors gracefully

If any errors are thrown inside the do block, execution immediately jumps to the catch block. Let's try calling checkPassword() with a parameter that throws an error:
 
 NOTE: Example uses previous code in section 8 above
*/

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


// 10. Inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

/*
    - To use the function, you first need to make a variable integer - you CANNOT use a constant with inout.
    - You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you're aware it is being used as inout.

In code, you'd write this:
 
 NOTICE: How the number is changed on the right
*/

var myNum = 10
doubleInPlace(number: &myNum)
