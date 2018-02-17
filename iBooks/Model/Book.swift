//
//  Book.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 3/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

struct Book {
    
    var bookName: String
    var bookPrice: String
    var bookImage: UIImage
    var bookAuthor: String
    var bookDetails: String
    
    
    init(bookName: String, bookPrice: String, bookImage: UIImage, bookAuthor: String, bookDetails: String) {
        self.bookName = bookName
        self.bookPrice = bookPrice
        self.bookImage = bookImage
        self.bookAuthor = bookAuthor
        self.bookDetails = bookDetails
    }
}



