//
//  ViewController.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit



class MainController: UIViewController, CollectionViewTapDelegate {
    
    override func loadView() {
        let carListView = CarsListView()
        carListView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        carListView.filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        carListView.sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        carListView.carsCollection.delegateVC = self
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
    
    
    func cellTapped(item: Car) {
        let vc = EditController()
        vc.saveCar(car: item)
        present(vc, animated: true)
    }
    
}


