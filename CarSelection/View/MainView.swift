//
//  MainView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 08.08.2023.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func updateUI()
}

class MainView: UIViewController, CollectionViewTapDelegate, MainViewControllerDelegate {

    let mainViewModel = MainViewViewModel()
    public var carsCollectionContent = [Car]()
    
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
    
    var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var updateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "update"), for: .normal)
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sort"), for: .normal)
        button.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settingsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let carsCollection = CarCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        view.addSubview(canvas)
        canvas.addSubview(headerLabel)
        settingsStackView.addArrangedSubview(filterButton)
        settingsStackView.addArrangedSubview(updateButton)
        settingsStackView.addArrangedSubview(sortButton)
        canvas.addSubview(settingsStackView)
        carsCollectionContent = mainViewModel.fetchFromDB()
        carsCollection.setCarsLabelTextArray(textOfCarsArray: carsCollectionContent)
        canvas.addSubview(carsCollection)
        canvas.addSubview(addButton)
        carsCollection.delegateVC = self
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: view.topAnchor),
                canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                headerLabel.topAnchor.constraint(equalTo: canvas.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
                
                filterButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                filterButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                filterButton.leadingAnchor.constraint(equalTo: settingsStackView.leadingAnchor),
                updateButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                updateButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                updateButton.centerXAnchor.constraint(equalTo: settingsStackView.centerXAnchor),
                sortButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                sortButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                sortButton.trailingAnchor.constraint(equalTo: settingsStackView.trailingAnchor),
                
                settingsStackView.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                settingsStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
                settingsStackView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.positiveOffset),
                settingsStackView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: Constants.negativeOffset),
                
                carsCollection.topAnchor.constraint(equalTo: settingsStackView.bottomAnchor, constant: Constants.positiveOffset),
                carsCollection.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: Constants.negativeOffset),
                carsCollection.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.positiveOffset),
                carsCollection.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: Constants.negativeOffset),
                
                addButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),
                addButton.widthAnchor.constraint(equalToConstant: Constants.addButtonWidth),
                addButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }

    @objc func addButtonTapped() {
        let vc = AddView()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func filterButtonTapped() {
        print("Filter button tapped")
        let cars = carsCollectionContent
        var filteredCars = mainViewModel.filterArray(cars: cars)
        print(filteredCars)
    }
    
    @objc func updateButtonTapped() {
        print("Update button tapped")
        updateUI()
    }
    
    @objc func sortButtonTapped() {
        print("Sort button tapped")
        let cars = carsCollectionContent
        var sortedCars = mainViewModel.sortArray(cars: cars)
        print(sortedCars)
    }
    
    func cellTapped(item: Car) {
        let vc = EditView()
        vc.saveCar(car: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateUI() {
        carsCollectionContent = mainViewModel.fetchFromDB()
        carsCollection.setCarsLabelTextArray(textOfCarsArray: carsCollectionContent)
        carsCollection.reloadData()
        view.updateConstraints()
    }
    
}
