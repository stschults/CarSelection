//
//  ViewController.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class MainController: UIViewController {

    override func loadView() {
        super.viewDidLoad()
        let carListView = CarsListView()
        carListView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        carListView.filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        carListView.sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        view = carListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func filterButtonTapped() {
        print("Filter button tapped")
    }
    
    @objc func sortButtonTapped() {
        print("Sort button tapped")
    }
    
    @objc func addButtonTapped() {
        print("Add button tapped")
        
        let vc = AddController()
        present(vc, animated: true)
    }
    
}


