//
//  main.swift
//  GuardProject
//
//  Created by Boris Zitserman on 20.09.2022.
//

import Foundation

// Guard
// Варианты решения без Guarda

var name = ""
var surname = ""
var email = ""
var age = 0

func createNewUserV1(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
    } else {
        print("Enter your name")
    }
    
    if surname != "" {
        print(surname)
    } else {
        print("Enter your surname")
    }
    
    if email != "" {
        print(email)
    } else {
        print("Enter your email")
    }
    
    if age >= 18 {
        print(age)
    } else {
        print("Enter for adult only")
    }
    print("\(name) \(surname), Welcome!")
}

name = "Boris"

print(createNewUserV1(name: name, surname: surname, email: email, age: age))

// Так делать можно но нельзя!!! Провал
func createNewUserV2(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
        if surname != "" {
            print(surname)
            if email != "" {
                print(email)
                if age >= 18 {
                    print("\(name) \(surname), Welcome!")
                } else {
                    print("Enter for adult")
                }
            } else {
                print("Enter your email")
            }
        } else {
            print("Enter your surname")
        }
    } else {
        print("Enter your name")
    }
}

surname = "Zitserman"
email = "b@mac.com"
age = 18

createNewUserV2(name: name, surname: surname, email: email, age: age)

func createNewUserV3(name: String, surname: String, email: String, age: Int) {
    if name == "" {
        print("Enter your name")
        return
    }
    if surname == "" {
        print("Enter your surname")
        return
    }
    if email == "" {
        print("Enter your email")
        return
    }
    if age < 18 {
        print("Enter for adult only")
        return
    }
    print("\(name) \(surname), Welcome!")
}
age = 18

createNewUserV3(name: name, surname: surname, email: email, age: age)


// проблема принудительного извлечения....
func createNewUserV4(name: String?, surname: String?, email: String?, age: Int?) {
    if name == nil, name?.count == 0 {
        print("Enter your name")
        return
    }
    print(name!)
    
    if surname == nil, surname?.count == 0 {
        print("Enter your surname")
        return
    }
    print(surname!)
    if email == nil, email?.count == 0 {
        print("Enter your email")
        return
    }
    print(email!)
    if age == nil, age! < 18 {
        print("Enter   for adult only")
        return
    }
    print("\(name!) \(surname!), Welcome!")
}


// Example
// guard condition else { return }

func createNewUserV5(name: String?, surname: String?, email: String?, age: Int?) {
    guard let name = name, !name.isEmpty else { return }
    guard let surname =  surname, !surname.isEmpty else { return }
    guard let email =  email, !email.isEmpty else { return }
    guard let age =  age, age  >= 18 else {
        print("Entry for adult")
        return
    }
    
    print("\(name) \(surname), Welcome")
}



func forTestGuard(numOne: Int?, numTwo: Int?) {
    guard let num1 = numOne else { return print("Бля первое число уже нил") }
    guard let num2 = numTwo else { return print("Бля второе число уже нил") }
    print(num1 + num2)
}
forTestGuard(numOne: 3, numTwo: 5)
forTestGuard(numOne: nil, numTwo: 5)
forTestGuard(numOne: 3, numTwo: nil)


func forTestGuard2(numOne: Int, numTwo: Int) {
    guard numOne > 0 else { return print("Бля первое число уже нил") }
    guard numTwo > 0 else { return print("Бля второе число уже нил") }
    print(numOne + numTwo)
}
forTestGuard(numOne: 3, numTwo: 5)
forTestGuard(numOne: nil, numTwo: 5)
forTestGuard(numOne: 3, numTwo: nil)


// Использование с JSON  и т. д.

class Person {
    var id: String?
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buikdingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
    
}

var person: Person?


if let residence = person?.residence {
    if let address = residence.address {
        if let apartmentNumber = address.apartmentNumber {
            print("The apartment number: \(apartmentNumber)")
        }
    }
}

// Опциональная последовательность

if let apartmentNumber = person?.residence?.address?.apartmentNumber {
    print("The apartment number: \(apartmentNumber)")
}


// 
