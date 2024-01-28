class Car {
    var make: String
    var model: String
    var year: Int
    var rentalRate: Double
    var availabilityStatus: Bool
    
    init(make: String, model: String, year: Int, rentalRate: Double, availabilityStatus: Bool) {
        self.make = make
        self.model = model
        self.year = year
        self.rentalRate = rentalRate
        self.availabilityStatus = availabilityStatus
    }
    
    func rentOut() {
        availabilityStatus = false
    }

    func returnCar() {
        availabilityStatus = true
    }
} 

class Customer {
    var name: String
    var license: String
    var age: Int
    var currentRental: Car?
    
    init(name: String, license: String, age: Int) {
        self.name = name 
        self.license = license
        self.age = age
    }
    
    func rentCar(car: Car) {
        currentRental = car
        car.rentOut()
    }
    
    func returnCar() {
        if let rentedCar = currentRental {
            rentedCar.returnCar()
            currentRental = nil
        }
    }
}

class RentalService {
    var fleet: [Car]
    var registered: [Customer] 
    
    init() {
        self.fleet = []
        self.registered = []
    }
    
    func addCar(car: Car) {
        fleet.append(car)
    }
    
    func removeCar(car: Car) {
        if let index = fleet.firstIndex(where: { $0 === car }) {
            fleet.remove(at: index)
        }
    }
    
    func registerCustomer(customer: Customer) {
        registered.append(customer)
    }
    
    func processRental(customer: Customer, car: Car) {
        if car.availabilityStatus {
            customer.rentCar(car: car)
        } else {
            print("Car is not available for rental.")
        }
    }
    
    func processReturn(customer: Customer) {
        customer.returnCar()
    }
    
    enum CarType {
        case sedan
        case suv
        case convertible
    }

    enum RentalStatus {
        case ongoing
        case completed
    }
}


let car1 = Car(make: "Toyota", model: "Camry", year: 2022, rentalRate: 50.0, availabilityStatus: true)
let car2 = Car(make: "Honda", model: "Sonata", year: 2020, rentalRate: 60.0, availabilityStatus: true)

let customer1 = Customer(name: "Majed Almalki", license: "ABC123", age: 24)
let customer2 = Customer(name: "Saud Almalki", license: "XYZ456", age: 17)

let rentalService = RentalService()

rentalService.addCar(car: car1)
rentalService.addCar(car: car2)

rentalService.registerCustomer(customer: customer1)
rentalService.registerCustomer(customer: customer2)

rentalService.processRental(customer: customer1, car: car1)

print("Car 1 availability: \(car1.availabilityStatus)")

rentalService.processReturn(customer: customer1)

print("Car 1 availability: \(car1.availabilityStatus)")
