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
    @Persisted var gearBoxType: Gearbox
    @Persisted var yearOfManufacture: Int
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
