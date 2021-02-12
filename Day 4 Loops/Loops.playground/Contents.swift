/*
    Day 4 Loops
 */

// For loop is the most common loop in Swift
//let count = 1...3
//
//for number in count {
//    print("Number is \(number)")
//}
//
//// For loop works with arrays
//let albums = ["Red", "1989", "Reputation"]
//
//// For loop goes arounnt it will pull out one item and assign to a constant
//for album in albums {
//    print("\(album) is on Apple Music")
//}

// If you don't use the constat that for loops gives you, you should use an underscore instead so that Swift doesn't create needless values:
//print("Players gonna ")
//
//for _ in 1...5 {
//    print("play")
//}
//
//// While Loop
//
//// A second way of writing loops is using while: give it a condition to check, and its loop code will go around and around until the condition fails
//var number = 1
//
//while number <= 20 {
//    print(number)
//    number += 1
//}
//
//print("Ready or not, here I come!")


// Repeat loops

// Repeat loops are no common. It's the same as a while loop except the condition to check comes at the end. (In java the equivalent is Do-while). It will always execute at least once unlike the other loops

//repeat {
//    print("This is false")
//}   while false


// Exiting loops

// You can exit a loop at any time using the break keyword. To try this out, let's start with a regular while loop

//var countDown = 10
//
//while countDown >= 0 {
//    print(countDown)
//
//    if countDown == 4 {
//        print("I'm bored. Let's go")
//        break
//    }
//
//    countDown -= 1
//}
//
//print("Blast off!")

// Exiting multiple loops

/*
    A loop inside a loop is called a nested loop. It is not uncommon to want to break out of both the inner loop and outer loop at the same time.
 
    To do this we need two things:
    1. Give the outside loop a label
    2. Add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time:
 */
outerLoop: for i in 1...10 {
    for k in 1...10 {
        let product = i * k
        print("\(i) * \(k) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}


