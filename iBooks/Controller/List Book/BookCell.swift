//
//  BookCell.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 5/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    var book: Book?{
        didSet{
            self.image.image = book?.bookImage
            self.author.text = book?.bookAuthor
            self.price.text = book?.bookPrice
            self.name.text = book?.bookName
        }
    }
    
    
    
    
    let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Times New Roman", size: 14)
        return name
    }()
    
    let author: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Times New Roman", size: 12)
        return name
    }()
    
    let price: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "Times New Roman", size: 12)
        return price
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func setupCell() {
        backgroundColor = UIColor.white
        
        setupImage()
        setupName()
        setupAuthor()
        setupPrice()
    }
    
    func setupImage() {
        addSubview(image)
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        image.widthAnchor.constraint(equalToConstant: 90).isActive = true
        image.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func setupName() {
        addSubview(name)
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        name.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 6).isActive = true
    }
    
    func setupAuthor() {
        addSubview(author)
        author.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
        author.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        author.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 6).isActive = true
    }
    
    func setupPrice() {
        addSubview(price)
        price.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 5).isActive = true
        price.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        price.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 6).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







