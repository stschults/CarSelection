//
//  AddViewViewModel.swift
//  CarSelection
//
//  Created by Станислав Шульц on 08.08.2023.
//

import Foundation

class AddViewViewModel {
    
    func addNewCarToCollection(car: Car) {
        let car = car
        let dbService = StorageService()
        let carObject = CarObject(car)
        try? dbService.saveObject(object: carObject)
    }
    
    func updateCarInCollection(car: Car) {
        let car = car
        let dbService = StorageService()
        let carObject = CarObject(car)
        try? dbService.updateObject(object: carObject)
    }
    
    func deleteCarFromCollection(car: Car) {
        let car = car
        let dbService = StorageService()
        let carObject = CarObject(car)
        try? dbService.delete(object: carObject)
    }
    
    func deleteAllCollection() {
        let dbService = StorageService()
        try? dbService.deleteAll()
    }
    
}
