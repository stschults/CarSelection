//
//  FilteredSortedView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 09.08.2023.
//

import UIKit

class FilteredSortedView: UIViewController {

    public var carsCollectionContent: [Car] = []
    
    private let canvas: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabel
        label.font = .boldSystemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filteredOrSortedCollection = CarCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(cars: carsCollectionContent)
    }
    
    func setupUI(cars: [Car]) {
        view.backgroundColor = .lightGray
        view.addSubview(canvas)
        canvas.addSubview(headerLabel)
        filteredOrSortedCollection.setCarsLabelTextArray(textOfCarsArray: cars)
        canvas.addSubview(filteredOrSortedCollection)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: view.topAnchor),
                canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                headerLabel.topAnchor.constraint(equalTo: canvas.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
                
                filteredOrSortedCollection.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
                filteredOrSortedCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                filteredOrSortedCollection.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.positiveOffset),
                filteredOrSortedCollection.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: Constants.negativeOffset),
            ]
        )
    }
}
