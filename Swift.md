Constants and Variables : 

Constants and Variables are names commected to a value (of any type), the programer declare the Constants and Variables befor using it, declaring a Constants or Variables means you took a place in memory or in rigesters so you can save a value later on. 

# Type Annotations : 

You can provide a type annotation when you declare a constant or variable. 

- var a : int 

- var red, green, blue: Double

- var b: String

in the first Example i made a an Integers so i cant put any other type in it.

the second Example i declared 3 variables and all of them will take double values and integers (Integers can be turned to Double).

the last Example i declared b as a String so i cant save any other value type in it.

# type inference : 

swift is a Smart Language that can infere th type to a var based on the value that given to it in the declaration.

var c = 5 

Here c will be int 

var c = 3.7 

Here c will be double

var c = "something"

Here c will be a string

# Data Types in Swift: 

- int : this type will only save Rational numbers.

- double : this type will only save Real Numbers. 

- String : this tybe will save char and words or any text.

- bool : this type will save one of two values, eather true of false (1 or 0).


# Operators in Swift: 

- Assignment Operator: this Operator will use (=) to assign a value to a var or const.[a = 1]

- Arithmetic Operators: this operators will do basic math between 2 values (+,-,/,*). [1+1 , 1-1 , 1/1 , 1*1]

- Remainder Operator: this operator will give you the MOD (The remainder of Division between two values). [1%1]

- Compound Assignment Operators: this oprator is arithmetic and assignment combined. [ a += 1 , a -= 1 , a /= 1 , a *= 1 ] 

- Comparison Operators: this oprators will compare between to values and will give you boolian result.

	- (==) this will check if the values are equal to each other.
	- (!=) this will check if the values are not equal to each other.
	- (<) this will check if the value on the left is less then the value on the right.
	- (>) this will check if the value on the left is greater then the value on the right.
	
Ternary Conditional Operator: this oprator will simplify if-else statment


# Collection Types in Swift: 

there is 3 types of Collection in swift

array : 

arrays can store multipal values in one place but all the values must have the same type (all int or all double ...).

this is how you creat an empty array : 

	var name[type] = []

if you want it to have multi int for example :
	
	var a[Int] = [1,2,3,4] 
or
	var a = [1,2,3,4] // this will infer 

if you want it to store multi strings 

	var shoppingList = ["Eggs", "Milk"] 

Sets: 

if the order of your data is not important and it dosen't have same values you should use sets 

	syntax : 
		
		var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] // this set is infered 
			favoriteGenres.count 	to check how many item/s you have.
			favoriteGenres.isEmpty  to check if the set have any item/s in it
			favoriteGenres.insert() to add additional item in the set 
 

Dictionaries: 

Dictionaries will store a keys and a values of the same type, Each value is associated with a unique key,it dosn't have any order 

example : 

	var a = [1: "Majed", 2: "Muhannade", 3:"Osama"]
		
print with for-in loop : 

		var a = [1: "Majed", 2: "Muhannade", 3:"Osama"]
			for (aa, ab) in a {
    			print("\(aa): \(ab)")
			}

adding new item : 

		a[4] = "Ali"

change an item :
		a[2] = "Ahmed"



# Control Flow in Swift: 

if-else statment: 

	- this statment will check the condition and take action based on it. [if true {do this} else {do this}]

Switch Case: 
	
	- this statment is designed to handle multi conditions 

loops: 


    for-in : You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
		example:
				let base = 3
				let power = 10
				var answer = 1
				for _ in 1...power {
				    answer *= base
				}
				print("\(base) to the power of \(power) is \(answer)")
				// Prints "3 to the power of 10 is 59049"

    while: while loop is similar to for loop but it used if you dont know when the loop will stops.

		syntax:
			while <#condition#> {
   			<#statements#>
			}

		example: 
			var a = 0
			while a <= 10 {
				print(a)
				a+=1
			}

    Repeat-While: Repeat-While AKA do-while will make the first loop then checks the condition.

		syntax:
 			repeat {
  			 <#statements#>
			} while <#condition#>

		example: 
			var a = 0
			repeat {
			print(a)
			a+=1
			} while a <= 10

# Functions : 

Function is self-contained block of code that perform a specific task, you call it when you need it and it will return a value back to the main Function. 

	this is a function : 

				func greet(person: String) -> String {
 				   let greeting = "Hello, " + person + "!"
    				return greeting
				}

this function is called greet(person:),it takes a string and it return "Hello, " + string + "!"

	example :
		func hype(person: String) -> String {
    		let greeting = person + " IS THE BEST!"
    		return greeting
		}

		print(hype(person: "Ali "))


Function Parameters and Return Values:Function parameters and return values are extremely flexible in Swift. 

	-Functions Without Parameters: will not take any value [func sayHelloWorld() -> String ]
	-Functions With Multiple Parameters: will have multiple input parameters[func greet(person: String, alreadyGreeted: Bool) -> String ]

	





