//
//  AddView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class AddView: UIView {
    
    private let canvas: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.addCarTitleLabel
        label.font = .boldSystemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(canvas)
        canvas.addSubview(headerLabel)
        canvas.addSubview(addButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: topAnchor),
                canvas.bottomAnchor.constraint(equalTo: bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                headerLabel.topAnchor.constraint(equalTo: canvas.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
                
                addButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),
                addButton.widthAnchor.constraint(equalToConstant: Constants.addButtonWidth),
                addButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
}
