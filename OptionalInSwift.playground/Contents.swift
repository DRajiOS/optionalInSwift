import UIKit

/*:
 ## Swift - What is the Optional Binding? (?/!)
 */

//:Optional Binding. Other than forced unwrapping, optional binding is a simpler and recommended way to unwrap an optional. You use optional binding to check if the optional contains a value or not. If it does contain a value, unwrap it and put it into a temporary constant or variable.


//symbol is “?” to define variables as an Optional. (It means, that can be nil)


var moviesCount : Int?

moviesCount = 5

print(moviesCount)


moviesCount = nil

print(moviesCount)


//We’ve defined moviesCount variable as an Optional. If we needs to check the value of moviesCount, we have to unwrap the variable. You have alternative ways to do this, let me explain them.



//:1 - Forcibly Unwrapping

//:You can unwrap your Optional variable with “!” operator but it’s a less safe wrapping way, you have to be sure of variable contains value or not. If you do not use the forcibly unwrapping method in the right place, your application may be crash.

//print(moviesCount!)

//: Fatal error: Unexpectedly found nil while unwrapping an Optional value

//:Actually “using forcibly unwrapping method” is not the blocking of your compilation process. You should know whether the variable contains a value. So you have to track the development process.

//:2 - Conditional Unwrapping

//:You can unwrap your Optional variable with if let statement. It means the if your variable is not nil, that will be unwrapped into the created constant then you can use this constant in the if let statement block. (It just allows the use the non-optional value in the statement block so it’s totally safe way to unwrap the Optionals.) Bonus: They can have same variable name between each other. It’s available for conditional unwrapping way. Let me explain the conditional unwrapping way with a bunch of codes;

var songName: String?




if let kname = songName {
    print("Director name is \(kname)")
} else {
    print("Director yet to be assigned")
}


if songName != nil {
    // it means, if the unwrapped value is not nil
    /*
     WRITE SOMETHING HERE
     */
    
    print(songName!)
}
else {
    print("songName is nil")
}


//:songName is an optional variable and we didn’t assign to the something to this variable. It will be print. “songName is nil” message on the playground. Because that’s nil. Also, I’ve used the same variable names with if let and optional value. 😛 Did you realize? That’s normal. Swift’s compiler allows it.


var fruits = ["Apple","Orange","Grape","Mango"]

let searchIndex = fruits.index(where : {$0 == "MangoS"})
//for (index , value) in fruits.enumerated() {
//
//    print(index,value)
//}


print(searchIndex)
//:3 - Unwrapping via Type Casting

//:In this way, Sometimes different types of values ​​can be defined in the execution process of the application. Handling that situation is important! If you don’t be careful, your application may be crash.
var userData: Any? = 89

if userData as? String != nil {
    print("userData is defined as a String.")
}
else if userData as? Int != nil {
    print("userData is defined as an Integer.")
}

//:As you can see, we have userData variable and it defined type of Any and that is Optional then we tried to unwrap value with our main symbol, “?”. If that’s not String or Int in these lines. You’ll get nil.
//:I heard you, “you asked to yourself, why we won’t use forcibly unwrapping symbol “!” in this situation?”
//:Of course, you can use but it’s not safe. If your conditional type doesn’t match with your userData type. Your application may be crash. 😓
//:4 - Implicitly Unwrapping
//:It means, when defining the variable with exclamation mark then use in somewhere, your variable will be unwrapped automatically.
//: the differences between Forcibly and Implicitly Unwrapping
// Forcibly Unwrapping Begin
var name: String? = "Batuhan"

name!

// Forcibly Unwrapping End

// Implicitly Unwrapping Begin
let age: Int! = 20

age

// Implicitly Unwrapping End



/*:
 ## Optional Chaining
 */


//:Optional chaining is the way by which we try to retrieve a values from a chain of optional values. Let us take the following example classes.
//:Optional Chaining. Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil . ... Optional chaining in Swift is similar to messaging nil in Objective-C, but in a way that works for any type, and that can be checked for success or failure.

class School {
    var director:Person?
}

class Person {
    var name: String = ""
    init(name: String) {
        self.name = name
    }
}


var school = School()
var person = Person(name: "Jason")
school.director = person
school.director?.name
//:The director property in School class is optional, when you try to access subsequent values from director property becomes optional (? mark after director when accessing name property). You can handle these optionals as shown below.

if let name = school.director?.name {
    print("Director name is \(name)")
} else {
    print("Director yet to be assigned")
}
