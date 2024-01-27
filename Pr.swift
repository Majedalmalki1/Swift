// User struct representing a registered user
struct User {
    let username: String
    let password: String
}

// AuthManager class to manage user authentication
class AuthManager {
    private var users: [User] = []

    func register(username: String, password: String) {
        let newUser = User(username: username, password: password)
        users.append(newUser)
        print("Registration successful!")
    }

    func signIn(username: String, password: String) -> User? {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            print("Welcome, \(user.username)!")
            return user
        } else {
            print("Invalid username or password. Sign in failed.")
            return nil
        }
    }
}

// PCPart struct representing a PC component
struct PCPart {
    let name: String
    let category: String
    let price: Double
}

// ShoppingCart struct to manage the user's shopping cart
struct ShoppingCart {
    var items: [PCPart] = []

    func totalCost() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}

// PCShop class representing the PC shop and its inventory
class PCShop {
    var inventory: [PCPart]

    init(inventory: [PCPart]) {
        self.inventory = inventory
    }

    enum ShopError: Error {
        case invalidInput
    }

    func displayInventory() {
        print("Available PC Parts:")
        for (index, part) in inventory.enumerated() {
            print("\(index + 1). \(part.name) (\(part.category)) - $\(part.price)")
        }
    }

    func orderPart(partIndex: Int, quantity: Int, cart: inout ShoppingCart) throws {
        guard partIndex >= 1 && partIndex <= inventory.count else {
            throw ShopError.invalidInput
        }

        do {
            let selectedPart = try getPart(at: partIndex)
            let orderTotal = selectedPart.price * Double(quantity)

            print("Added \(quantity) \(selectedPart.name) to your cart. Total: $\(orderTotal)")

            for _ in 1...quantity {
                cart.items.append(selectedPart)
            }
        } catch {
            throw error
        }
    }

    func getPart(at index: Int) throws -> PCPart {
        guard index >= 1 && index <= inventory.count else {
            throw ShopError.invalidInput
        }

        return inventory[index - 1]
    }
}

var authManager = AuthManager()
var authenticatedUser: User?

// Main program
while true {
    if let user = authenticatedUser {
        // User is authenticated
        var pcShop = PCShop(inventory: [
          PCPart(name: "CPU", category: "Processor", price: 299.99),
          PCPart(name: "GPU", category: "Graphics Card", price: 499.99),
          PCPart(name: "RAM", category: "Memory", price: 79.99),
          PCPart(name: "SSD", category: "Storage", price: 129.99),
          PCPart(name: "Motherboard", category: "Motherboard", price: 199.99),
            // ... (other PC parts)
        ])

        var userCart = ShoppingCart()

        print("Welcome to the PC Shop!")

           ShoppingLoop: while authenticatedUser != nil {
            pcShop.displayInventory()

            print("\nOptions:")
            print("1. Add item to cart")
            print("2. View cart")
            print("3. Checkout")
            print("4. Logout and go back to the main menu")
           

            print("Enter your choice: ", terminator: "")

            if let shopChoice = readLine(), let intShopChoice = Int(shopChoice) {
                switch intShopChoice {
                case 1:
                    print("Enter the part number you want to order: ", terminator: "")
                    if let partIndex = readLine(), let intPartIndex = Int(partIndex) {
                        print("Enter the quantity: ", terminator: "")
                        if let quantity = readLine(), let intQuantity = Int(quantity) {
                            do {
                                try pcShop.orderPart(partIndex: intPartIndex, quantity: intQuantity, cart: &userCart)
                            } catch {
                                print("Error: \(error)")
                            }
                        } else {
                            print("Invalid quantity.")
                        }
                    } else {
                        print("Invalid part number.")
                    }
                case 2:
                    print("\nYour Shopping Cart:")
                    for (index, item) in userCart.items.enumerated() {
                        print("\(index + 1). \(item.name) (\(item.category)) - $\(item.price)")
                    }
                    print("Total: $\(userCart.totalCost())\n")

                case 3:
                    print("\nThank you for shopping with us! Your total is $\(userCart.totalCost())\n")
                    authenticatedUser = nil  // Logout after checkout
                    break

                case 4:
                    authenticatedUser = nil  // Logout and go back to the main menu
                  break ShoppingLoop 

              
                default:
                    print("Invalid choice. Please enter a valid option.")
                }
            } else {
                print("Invalid input. Please enter a valid number.")
            }
        }
    } else {
        // User is not authenticated
        print("Options:")
        print("1. Register")
        print("2. Sign In")
       

        print("Enter your choice: ", terminator: "")

        if let choice = readLine(), let intChoice = Int(choice) {
            switch intChoice {
            case 1:
                registerUser()

            case 2:
                if let user = signInUser() {
                    print("Welcome, \(user.username)!")
                    authenticatedUser = user
                }

           
            default:
                print("Invalid choice. Please enter a valid option.")
            }
        } else {
            print("Invalid input. Please enter a valid number.")
        }
    }
}

func registerUser() {
    print("Enter your username: ", terminator: "")
    guard let username = readLine(), !username.isEmpty else {
        print("Invalid username. Registration failed.")
        return
    }

    print("Enter your password: ", terminator: "")
    guard let password = readLine(), !password.isEmpty else {
        print("Invalid password. Registration failed.")
        return
    }

    authManager.register(username: username, password: password)
}

func signInUser() -> User? {
    print("Enter your username: ", terminator: "")
    guard let username = readLine(), !username.isEmpty else {
        print("Invalid username. Sign in failed.")
        return nil
    }

    print("Enter your password: ", terminator: "")
    guard let password = readLine(), !password.isEmpty else {
        print("Invalid password. Sign in failed.")
        return nil
    }

    return authManager.signIn(username: username, password: password)
}
