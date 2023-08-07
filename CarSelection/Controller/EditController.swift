//
//  EditController.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class EditController: UIViewController {
    
    var car = Constants.emptyCar
    
    override func loadView() {
        let editView = AddView()
        editView.setCar(item: car)
        editView.addButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func saveCar(car: Car) {
        self.car = car
    }
    
    @objc func saveButtonTapped() {
        print("Save in edit button tapped")
        
        self.dismiss(animated: true)
    }
}
