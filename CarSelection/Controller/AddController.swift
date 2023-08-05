//
//  AddController.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class AddController: UIViewController {
    
    override func loadView() {
        super.viewDidLoad()
        let addView = AddView()
        addView.addButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view = addView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func saveButtonTapped() {
        print("Save button tapped")
        
        self.dismiss(animated: true)
    }
}
