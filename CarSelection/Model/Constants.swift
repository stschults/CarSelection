//
//  Constants.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import Foundation

enum Constants {
    static let titleLabel: String = "Список Автомобилей"
    static let addCarTitleLabel: String = "Добавить автомобиль"
    static let addButtonLabel: String = "Добавить"
    static let textFontSize: CGFloat = 14.0
    static let titleLabelFontSize: CGFloat = 16.0
    static let headerLabelHeight: CGFloat = 56.0
    static let buttonDiametr: CGFloat = 24.0
    static let addButtonHeight: CGFloat = 40.0
    static let addButtonWidth: CGFloat = 140.0
    static let addButtonCornerRadius: CGFloat = 20.0
    static let positiveOffset: CGFloat = 16.0
    static let negativeOffset: CGFloat = -16.0
    static let cellMinimumLineSpacing: CGFloat = 12.0
    static let headerStackViewHeight: CGFloat = 30.0
    static let stackSpacer: CGFloat = 15.0
    
    static var testCar1 = Car(brand: "BMW",
                              model: "5-series",
                              price: 600000,
                              state: .used,
                              mileage: 250000,
                              condition: .normal,
                              maxPassengers: 5,
                              maxSpeed: 200,
                              gearboxType: .mechanic,
                              yearOfManufacture: 2000)
    
    static var testCar2 = Car(brand: "Toyota",
                              model: "Chaser",
                              price: 750000,
                              state: .used,
                              mileage: 200000,
                              condition: .normal,
                              maxPassengers: 5,
                              maxSpeed: 180,
                              gearboxType: .automatic,
                              yearOfManufacture: 1998)
    
    static var testCar3 = Car(brand: "Audi",
                              model: "A7",
                              price: 1600000,
                              state: .used,
                              mileage: 150000,
                              condition: .normal,
                              maxPassengers: 5,
                              maxSpeed: 250,
                              gearboxType: .robotic,
                              yearOfManufacture: 2014)
    
    static var testCar4 = Car(brand: "BMW",
                              model: "5-series",
                              price: 6000000,
                              state: .new,
                              mileage: 25,
                              condition: .perfect,
                              maxPassengers: 5,
                              maxSpeed: 250,
                              gearboxType: .automatic,
                              yearOfManufacture: 2023)
    
    static var testCarsArray: [Car] = [
        testCar1, testCar2, testCar3, testCar4
        
    ]
}
