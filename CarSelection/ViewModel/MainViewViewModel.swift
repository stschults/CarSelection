//
//  CarListViewViewModel.swift
//  CarSelection
//
//  Created by Станислав Шульц on 08.08.2023.
//

import Foundation

class MainViewViewModel {
    
    func filterArray(cars: [Car]) -> [Car] {
        let inputCars = cars
        var filteredCars = [Car]()
        
        //фильтр марке
        
        return filteredCars
    }
    
    func sortArray(cars: [Car]) -> [Car] {
        let inputCars = cars
        var sortedCars = [Car]()
        
        //сортировка по цене
        
        return sortedCars
    }
    
    func fetchFromDB() -> [Car] {
        let dbService = StorageService()
        let carsObjects = dbService.fetch(by: CarObject.self)
        var cars = [Car]()
        for item in carsObjects {
            cars.append(Car(object: item))
        }
        return cars
    }
    
    func deleteCarFromCollection(car: Car) {
        let car = car
        let dbService = StorageService()
        let carObject = CarObject(car)
        try? dbService.delete(object: carObject)
    }
}
