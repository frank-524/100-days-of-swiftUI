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
