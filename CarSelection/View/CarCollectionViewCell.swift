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
        headerStackView.addSubview(brandLabel)
        headerStackView.addSubview(deleteButton)
        addSubview(headerStackView)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingOffset),
                headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.trailingOffset)
                
            ]
        )
    }
    
    @objc func deleteButtonTapped() {
        print("Delete button tapped")
    }
    
}

