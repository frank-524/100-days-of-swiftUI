/*
 1. Initializers

 How do Swift's memberwise initializers work?
 */

/*
    If any of your properties have default values, then they'll be incorporated into the initializer as default parameter values
 */

struct User {
    var name: String
    var yearsActive = 0
}

// Can create it in either one of these two ways:
let frank = User.init(name: "Frank")
let roslin = User(name: "Laura Roslin", yearsActive: 45)

/* Causes error
struct Employee {
    var name: String
    var yearsActive = 0
    
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

let adam = Employee(name: "Adam smith")

*/


// If you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an extension

struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

// Creating a named employee now works
let karen = Employee(name: "Karen Lopez")

// Example taken from the quiz
struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
        
    }
}

let USA = Country.init(countryName: "USA")


/*
 
 This code valid Swift - True or false?
 struct Cabinet {
     var height: Double
     var width: Double
     var area: Double
     init (itemHeight: Double, itemWidth: Double) {
         height = itemHeight
         width = itemWidth
         area = height * width
     }
 }
 let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)
 
 Answer: True
 */

/*
    Referring to the current instance
 */

// The most common reason for using self is inside an initializer, where your likely to want parameter names that match the property names of your type, like this:
struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class with \(bestFriend)")
        self.name = name
        self.bestFriend = bestFriend
    }
}

let jerry = Student.init(name: "Jerry", bestFriend: "Frank")

/*
    This code valid Swift - True or False?
 
 struct Cottage {
     var rooms: Int
     var rating = 5
     init(rooms: Int) {
         self.rooms = rooms
     }
 }
 let bailbrookHouse = Cottage(rooms: 4)
 */

/*
    3. Lazy properties
 
    Swift's lazy properties let us delay the creation of a property until it's actually used,
 which makes them like a computed property.
 
    Unlike a computed property they store the result that gets calculated, so that subsequent accesses to the property don't redo the work
 
 This allows them to provide extra performance when they aren't used (because their code is never run)
 
 However, that doesn't mean we should make every property lazy. Most properites are just standard stored properties.
 
 To lazy initialize a property in Swift you add the lazy keyword
 
 
 */

/*
    4. Static Properties and methods
    
    Static properties and methods are fairly common in Swift code
 
    One common use for static properties and methods is to store common functionality you use across an entire app.
 
    Use the static keyword
 */

/*
    5. Access Control
 
    Swift's access control keywords let us restrict how different part of our code can be accessed, but a lot of time it's just obeying the rules we put into place - we could remove them if we wanted and bypass the restrictions, so what's the point?
 
    One major reason is sometimes access control is used in code you don't own, so you can't remove the restriction. This is common when you're building apps with Apple's apis.
 
 
 This code is valid Swift - True or False?
 
 struct Doctor {
     var name: String
     var location: String
     private var currentPatient = "No one"
 }
 let drJones = Doctor(name: "Esther Jones", location: "Bristol")
 
 Answer: False
 This has a private property, so Swift is unable to generate its memberwise initializer for us
 
 */

/*
    Structs summary
 */
