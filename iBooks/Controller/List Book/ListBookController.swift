//
//  ListBookController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 15/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class ListBookController: UICollectionViewController {
    
    private let cellID = "cellID"
    var category = ["50% off", "Adventures", "Romantic", "Travell"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
        collectionView?.backgroundColor = .white
        navigationItem.title = "List of Books"
        collectionView?.register(BookItemCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BookItemCell
        cell.categoryLabel.text = category[indexPath.item]
        return cell
    }
    
}

