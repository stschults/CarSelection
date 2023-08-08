//
//  EditVIew.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit


class EditView: AddView {
    
    let editViewModel = AddViewViewModel()
    var car = Constants.emptyCar
    
    private let canvas: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.editCarTitleLabel
        label.font = .boldSystemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Марка"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        super.setCar(item: car)
        super.deleteButton.isHidden = false
        super.addButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        super.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(canvas)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: view.topAnchor),
                canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
    
    func saveCar(car: Car) {
        self.car = car
    }
    
    @objc override func saveButtonTapped() {
        print("Save in edit button tapped")
        let car = car
        try! editViewModel.updateCarInCollection(car: car)
        self.dismiss(animated: true)
    }
    
    @objc override func deleteButtonTapped() {
        print("Delete from edit button tapped")
        let car = car
        editViewModel.deleteAllCollection()
        self.navigationController?.popViewController(animated: true)
        
    }
}
