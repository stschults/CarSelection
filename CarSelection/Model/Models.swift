//
//  Models.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import Foundation
import RealmSwift

struct Car {
    var brand: String
    var model: String
    var price: Int
    var state: State
    var mileage: Int
    var condition: Condition
    var maxPassengers: Int
    var maxSpeed: Int
    var gearboxType: Gearbox
    var yearOfManufacture: Int
}

class CarObject: Object {
    @Persisted var brand: String
    @Persisted var model: String
    @Persisted var price: Int
    @Persisted var state: State
    @Persisted var mileage: Int
    @Persisted var condition: Condition
    @Persisted var maxPassengers: Int
    @Persisted var maxSpeed: Int
    @Persisted var gearboxType: Gearbox
    @Persisted var yearOfManufacture: Int
    
    convenience init(brand: String,
                     model: String,
                     price: Int,
                     state: State,
                     mileage: Int,
                     condition: Condition,
                     maxPassengers: Int,
                     maxSpeed: Int,
                     gearboxType: Gearbox,
                     yearOfManufacture: Int) {
        self.init()
        self.brand = brand
        self.model = model
        self.price = price
        self.state = state
        self.mileage = mileage
        self.condition = condition
        self.maxPassengers = maxPassengers
        self.maxSpeed = maxSpeed
        self.gearboxType = gearboxType
        self.yearOfManufacture = yearOfManufacture
    }
}

extension CarObject {
    convenience init(_ dataTO: Car) {
        self.init()
        brand = dataTO.brand
        model = dataTO.model
        price = dataTO.price
        state = dataTO.state
        mileage = dataTO.mileage
        condition = dataTO.condition
        maxSpeed = dataTO.maxSpeed
        maxPassengers = dataTO.maxPassengers
        gearboxType = dataTO.gearboxType
        yearOfManufacture = dataTO.yearOfManufacture
    }
}

extension Car {
    init(object: CarObject) {
        brand = object.brand
        model = object.model
        price = object.price
        state = object.state
        mileage = object.mileage
        condition = object.condition
        maxSpeed = object.maxSpeed
        maxPassengers = object.maxPassengers
        gearboxType = object.gearboxType
        yearOfManufacture = object.yearOfManufacture
    }
}

enum State: String, PersistableEnum {
    case new
    case used
}

enum Condition: String, PersistableEnum {
    case perfect
    case normal
    case damaged
}

enum Gearbox: String, PersistableEnum {
    case automatic
    case mechanic
    case robotic
    case variatic
}
