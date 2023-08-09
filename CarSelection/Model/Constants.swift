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
    static let editCarTitleLabel: String = "Редактировать автомобиль"
    static let addButtonLabel: String = "Добавить"
    static let textFontSize: CGFloat = 14.0
    static let buttonFontSize: CGFloat = 12.0
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
    static var emptyCar = Car(brand: "",
                              model: "",
                              price: 0,
                              state: .new,
                              mileage: 0,
                              condition: .perfect,
                              maxPassengers: 0,
                              maxSpeed: 0,
                              gearboxType: .mechanic,
                              yearOfManufacture: 0)
}
