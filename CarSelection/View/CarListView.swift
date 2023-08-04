//
//  MainView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class CarsListView: UIView {
    
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
    
    public let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sort"), for: .normal)
        button.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let addButton: UIButton = {
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
    
    let carsCollection: 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .lightGray
        addSubview(canvas)
        canvas.addSubview(headerLabel)
        settingsStackView.addArrangedSubview(filterButton)
        settingsStackView.addArrangedSubview(sortButton)
        canvas.addSubview(settingsStackView)
        
        canvas.addSubview(addButton)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: topAnchor),
                canvas.bottomAnchor.constraint(equalTo: bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                headerLabel.topAnchor.constraint(equalTo: canvas.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
                
                filterButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                filterButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                filterButton.leadingAnchor.constraint(equalTo: settingsStackView.leadingAnchor),
                sortButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                sortButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                sortButton.trailingAnchor.constraint(equalTo: settingsStackView.trailingAnchor),
                
                settingsStackView.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                settingsStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
                settingsStackView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.leadingOffset),
                settingsStackView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: Constants.trailingOffset),
                
                addButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),
                addButton.widthAnchor.constraint(equalToConstant: Constants.addButtonWidth),
                addButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                
            ]
        )
    }
    
    @objc func filterButtonTapped() {
        print("Filter button tapped")
    }
    
    @objc func sortButtonTapped() {
        print("Sort button tapped")
    }
    
    @objc func addButtonTapped() {
        print("Add button tapped")
    }
    
}
