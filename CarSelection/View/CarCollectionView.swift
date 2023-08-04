//
//  AutoCollectionView.swift
//  CarSelection
//
//  Created by Станислав Шульц on 04.08.2023.
//

import UIKit

class CarCollectionView: UICollectionView {
    
    private let carColectionLayout = UICollectionViewFlowLayout()
    private var carsNames = [Car]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: carColectionLayout)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        carColectionLayout.minimumLineSpacing = Constants.cellMinimumLineSpacing
        carColectionLayout.scrollDirection = .vertical
        carColectionLayout.minimumInteritemSpacing = .leastNormalMagnitude
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setChipsLabelTextArray(textOfChipsArray: [Car]) {
        carsNames = textOfChipsArray
    }
    
    func editCollection() {
        print("Edit state changed to true collection")
    }
}

extension  CarCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CarCollectionViewCell
        else { return UICollectionViewCell() }
        cell.brandLabel.text = carsNames[indexPath.item].brand
        return cell
    }
}

extension CarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // откроется на отдельном вьюконтроллере
    }
}

extension CarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width,
                      height: bounds.height)
    }
}

