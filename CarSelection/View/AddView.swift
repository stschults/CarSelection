//
//  AddView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class AddView: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    
    let addViewModel = AddViewViewModel()
    var gearbox: Gearbox = .mechanic
    var state: State = .new
    var condition: Condition = .perfect
    
    
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
    
    private let brandTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Марка"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let modelTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Модель"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let priceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Цена, руб."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let yearTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Год производства"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let mileageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Пробег"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let maxPassangersTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Кол-во мест"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let maxSpeedTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.placeholder = "Макс. скорость"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let newCarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Новый", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setStateToNew), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let usedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Б/У", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setStateToUsed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let automaticButton: UIButton = {
        let button = UIButton()
        button.setTitle("АКПП", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setGearAutomatic), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let mecanicButton: UIButton = {
        let button = UIButton()
        button.setTitle("МКПП", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setGearMecanic), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let roboticButton: UIButton = {
        let button = UIButton()
        button.setTitle("РКПП", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setGearRobotic), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let variaticButton: UIButton = {
        let button = UIButton()
        button.setTitle("ВКПП", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setGearVariatic), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let perfectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отличное", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setConditionToPerfect), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let normalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нормальное", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setConditionToNormal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let damagedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Битый", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(setConditionToDamaged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stateStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = Constants.stackSpacer
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gearboxStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = Constants.stackSpacer
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let conditionStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = Constants.stackSpacer
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить", for: .normal)
        button.layer.cornerRadius = Constants.addButtonCornerRadius
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bodyStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(canvas)
        canvas.addSubview(headerLabel)
        bodyStackView.addArrangedSubview(brandTextField)
        bodyStackView.addArrangedSubview(modelTextField)
        bodyStackView.addArrangedSubview(yearTextField)
        bodyStackView.addArrangedSubview(priceTextField)
        bodyStackView.addArrangedSubview(mileageTextField)
        bodyStackView.addArrangedSubview(maxPassangersTextField)
        bodyStackView.addArrangedSubview(maxSpeedTextField)
        stateStackView.addArrangedSubview(newCarButton)
        stateStackView.addArrangedSubview(usedButton)
        gearboxStackView.addArrangedSubview(automaticButton)
        gearboxStackView.addArrangedSubview(mecanicButton)
        gearboxStackView.addArrangedSubview(roboticButton)
        gearboxStackView.addArrangedSubview(variaticButton)
        conditionStackView.addArrangedSubview(perfectButton)
        conditionStackView.addArrangedSubview(normalButton)
        conditionStackView.addArrangedSubview(damagedButton)
        bodyStackView.addArrangedSubview(stateStackView)
        bodyStackView.addArrangedSubview(gearboxStackView)
        bodyStackView.addArrangedSubview(conditionStackView)
        canvas.addSubview(bodyStackView)
        canvas.addSubview(addButton)
        canvas.addSubview(deleteButton)
        deleteButton.isHidden = true
        setupConstraints()
    }
    
    func setCar(item: Car) {
        headerLabel.text = Constants.editCarTitleLabel
        brandTextField.placeholder = item.brand
        modelTextField.placeholder = item.model
        priceTextField.placeholder = String(item.price)
        yearTextField.placeholder = String(item.yearOfManufacture)
        mileageTextField.placeholder = String(item.mileage)
        maxPassangersTextField.placeholder = String(item.maxPassengers)
        maxSpeedTextField.placeholder = String(item.maxSpeed)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            [
                canvas.topAnchor.constraint(equalTo: view.topAnchor),
                canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                headerLabel.topAnchor.constraint(equalTo: canvas.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight),
                
                bodyStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constants.positiveOffset),
                bodyStackView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: Constants.negativeOffset * 10),
                bodyStackView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.positiveOffset),
                bodyStackView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: Constants.negativeOffset),
                
                addButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),
                addButton.widthAnchor.constraint(equalToConstant: Constants.addButtonWidth),
                addButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                
                deleteButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),
                deleteButton.widthAnchor.constraint(equalToConstant: Constants.addButtonWidth),
                deleteButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor),
                deleteButton.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: Constants.negativeOffset)
            ]
        )
    }
    
    @objc func setGearMecanic() {
        gearbox = .mechanic
    }
    
    @objc func setGearAutomatic() {
        gearbox = .automatic
    }
    
    @objc func setGearRobotic() {
        gearbox = .robotic
    }
    
    @objc func setGearVariatic() {
        gearbox = .variatic
    }
    
    @objc func setStateToNew() {
        state = .new
    }
    
    @objc func setStateToUsed() {
        state = .used
    }
    
    @objc func setConditionToPerfect() {
        condition = .perfect
    }
    
    @objc func setConditionToNormal() {
        condition = .normal
    }
    
    @objc func setConditionToDamaged() {
        condition = .damaged
    }
    
    @objc func saveButtonTapped() {
        print("Save in add button tapped")
        var car = Car(brand: brandTextField.text ?? "Неизвестно",
                                                 model: modelTextField.text ?? "Неизвестно",
                                                 price: Int(String(priceTextField.text ?? "0")) ?? 0,
                                                 state: state,
                                                 mileage: Int(String(mileageTextField.text ?? "0")) ?? 0,
                                                 condition: condition,
                                                 maxPassengers: Int(String(maxPassangersTextField.text ?? "0")) ?? 0,
                                                 maxSpeed: Int(String(maxSpeedTextField.text ?? "0")) ?? 0,
                                                 gearboxType: gearbox,
                                                 yearOfManufacture: Int(String(yearTextField.text ?? "0")) ?? 0)
        addViewModel.addNewCarToCollection(car: car)
        self.navigationController?.popViewController(animated: true)
        delegate?.updateUI()
        }
    
    @objc func deleteButtonTapped() {}
    
}
