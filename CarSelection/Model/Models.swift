//
//  Models.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import Foundation
import Realm
import RealmSwift

class Car: Object {
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
    
    init(brand: String, model: String, price: Int, state: State, mileage: Int, condition: Condition, maxPassengers: Int, maxSpeed: Int, gearboxType: Gearbox, yearOfManufacture: Int) {
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
    
    override init() {}
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
