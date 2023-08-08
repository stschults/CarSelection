//
//  AutoCollectionView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

protocol CollectionViewTapDelegate {
    func cellTapped(item: Car)
}

class CarCollectionView: UICollectionView {
    
    var delegateVC: CollectionViewTapDelegate?
    
    private let carColectionLayout = UICollectionViewFlowLayout()
    private var carsNames = [Car]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: carColectionLayout)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        carColectionLayout.minimumLineSpacing = Constants.cellMinimumLineSpacing
        carColectionLayout.scrollDirection = .vertical
        carColectionLayout.minimumInteritemSpacing = .leastNormalMagnitude
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setCarsLabelTextArray(textOfCarsArray: [Car]) {
        carsNames = textOfCarsArray
    }
    
    func openEditController(item: Car) {
        delegateVC?.cellTapped(item: item)
    }
}

extension CarCollectionView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CarCollectionViewCell
        else { return UICollectionViewCell() }
        cell.brandLabel.text = carsNames[indexPath.item].brand
        cell.modelLabel.text = carsNames[indexPath.item].model
        cell.maxSpeedLabel.text = "Максимальная скорость: \(String(carsNames[indexPath.item].maxSpeed)) км/ч"
        cell.maxPassengersLabel.text = "Количество пассажиров: \(String(carsNames[indexPath.item].maxPassengers))"
        cell.priceLabel.text = "Цена: \(String(carsNames[indexPath.item].price)) рублей"
        cell.mileageLabel.text = "Пробег: \(String(carsNames[indexPath.item].mileage)) км"
        cell.yearOfManufactureLabel.text = "Произведен в \(String(carsNames[indexPath.item].yearOfManufacture)) году"
        cell.gearboxLabel.text = {
            var gearbox = ""
            switch carsNames[indexPath.item].gearboxType {
            case .automatic:
                gearbox = "АКПП"
            case .mechanic:
                gearbox = "МКПП"
            case .robotic:
                gearbox = "РКПП"
            case .variatic:
                gearbox = "ВКПП"
            }
            return gearbox
        }()
        cell.stateLabel.text = {
            var state = ""
            switch carsNames[indexPath.item].state {
            case .new:
                state = "Новый"
            case .used:
                state = "Б/У"
            }
            return state
        }()
        cell.conditionLabel.text = {
            var condition = ""
            switch carsNames[indexPath.item].condition {
            case .perfect:
                condition = "Состояние: отличное"
            case .normal:
                condition = "Состояние: нормальное"
            case .damaged:
                condition = "Состояние: битый"
            }
            return condition
        }()
        return cell
    }
}

extension CarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = carsNames[indexPath.item]
        print(item)
        openEditController(item: item)
        
    }
}

extension CarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        _ = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CarCollectionViewCell
        let fullHeight = CGFloat(250)
        return CGSize(width: bounds.width,
                      height: fullHeight)
    }
}

