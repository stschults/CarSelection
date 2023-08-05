//
//  AutoCollectionViewCell.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    
    let brandLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.titleLabelFontSize, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "delete"), for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let modelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let mileageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let maxPassengersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let maxSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let gearboxLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let yearOfManufactureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constants.textFontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let bodyStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fillEqually
        view.spacing = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 15
        headerStackView.addArrangedSubview(brandLabel)
        headerStackView.addArrangedSubview(deleteButton)
        addSubview(headerStackView)
        bodyStackView.addArrangedSubview(modelLabel)
        bodyStackView.addArrangedSubview(priceLabel)
        bodyStackView.addArrangedSubview(stateLabel)
        bodyStackView.addArrangedSubview(yearOfManufactureLabel)
        bodyStackView.addArrangedSubview(gearboxLabel)
        bodyStackView.addArrangedSubview(mileageLabel)
        bodyStackView.addArrangedSubview(conditionLabel)
        bodyStackView.addArrangedSubview(maxPassengersLabel)
        bodyStackView.addArrangedSubview(maxSpeedLabel)
        addSubview(bodyStackView)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                brandLabel.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                brandLabel.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor),
                deleteButton.heightAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                deleteButton.widthAnchor.constraint(equalToConstant: Constants.buttonDiametr),
                deleteButton.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor),
                
                headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.positiveOffset),
                headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.negativeOffset),
                headerStackView.heightAnchor.constraint(equalToConstant: Constants.headerStackViewHeight),
                
                bodyStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
                bodyStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.positiveOffset),
                bodyStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.negativeOffset)
                
            ]
        )
    }
    
    @objc func deleteButtonTapped() {
        print("Delete button tapped")
    }
    
}

