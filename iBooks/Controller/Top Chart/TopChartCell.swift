//
//  TopChartCell.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 5/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class TopChartCell: UITableViewCell {
    
    
    var book: Book?{
        didSet{
            self.bookImage.image = book?.bookImage
            self.bookAuthor.text = book?.bookAuthor
            self.bookPrice.text = book?.bookPrice
            self.bookName.text = book?.bookName
            self.bookDetails.text = book?.bookDetails
        }
    }
    
    
    
    let bookImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    let bookName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Times New Roman", size: 20)
        return name
    }()
    
    let bookAuthor: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont(name: "Times New Roman", size: 18)
        return author
    }()
    
    let bookPrice: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "Times New Roman", size: 16)
        price.textColor = UIColor.darkGray
        return price
    }()
    
    let nextImage: UIImageView = {
        let next = UIImageView()
        next.translatesAutoresizingMaskIntoConstraints = false
        next.contentMode = .scaleAspectFill
        next.image = #imageLiteral(resourceName: "back")  // image is here
        return next
    }()
    
    let bookDetails: UILabel = {
        let details = UILabel()
        details.translatesAutoresizingMaskIntoConstraints = false
        details.numberOfLines = 3
        details.font = UIFont(name: "Times New Roman", size: 16)
        return details
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
        setupBookImage()
        setupBookName()
        setupBookAuthor()
        setupPrice()
        setupNextImage()
        setupBookDetails()
        
    }
    
    func setupBookImage() {
        addSubview(bookImage)
        bookImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bookImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupBookName() {
        addSubview(bookName)
        bookName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        bookName.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 10).isActive = true
    }
    
    
    func setupBookAuthor() {
        addSubview(bookAuthor)
        bookAuthor.topAnchor.constraint(equalTo: bookName.bottomAnchor, constant: 5).isActive = true
        bookAuthor.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 10).isActive = true
    }
    
    func setupPrice() {
        addSubview(bookPrice)
        bookPrice.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        bookPrice.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
    }
    
    func setupNextImage() {
        addSubview(nextImage)
        nextImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nextImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
    }
    
    func setupBookDetails() {
        addSubview(bookDetails)
        bookDetails.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor, constant: 5).isActive = true
        bookDetails.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 10).isActive = true
        bookDetails.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
    }
    
    
    
    
    func setup() {
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








