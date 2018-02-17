//
//  BookItem.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 5/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit



class BookItemCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let bookCellID = "bookCellID"
    
    var books = [Book]()
    
    static var count: Int = 0
    
    func countValue(n: Int){
//        print(n)
        BookItemCell.count = n
        
        print("countValue: \(BookItemCell.count)")
    }
    
    func countReceive() -> Int {
        return 2
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupCell()
        print(BookItemCell.count)
        setupBooks(count: BookItemCell.count)

        
    }
    
    
    var bookInformation = ["Name: Harry Potter.\nAuthor: Unknown.\nCategory: Magical.", "Name: Harry Potter Part 2.\nAuthor: Unknown.\nCategory: Magical.", "Name: Titanic.\nAuthor: Unknown.\nCategory: Romance","Name: Act of Valor.\nAuthor: Unknown.\nCategory: War.", "Name: Die Hard.\nAuthor: Unknown.\nCategory: Action."]
    
    func setupBooks(count: Int) {
        
        if count == 0 {
            let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "This book is awesome")
            let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "This book is awesome")
            let book3 = Book(bookName: "Book3", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown3", bookDetails: "This book is awesome")
            let book4 = Book(bookName: "book4", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknow4", bookDetails: "This book is awesome")
            let book5 = Book(bookName: "Book5", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown5", bookDetails: "This book is awesome")
            
            books = [book1, book2, book3, book4, book5]
            
        }
        if count == 1 {
            let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "This book is awesome")
            let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "This book is awesome")
            let book3 = Book(bookName: "Book3", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown3", bookDetails: "This book is awesome")
            
            books = [book1, book2, book3]
            
        }
        if count == 2 {
            let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "This book is awesome")
            let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "This book is awesome")
            let book3 = Book(bookName: "Book3", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown3", bookDetails: "This book is awesome")
            let book4 = Book(bookName: "book4", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknow4", bookDetails: "This book is awesome")
            
//            print("i am hre")
            books = [book1, book2, book3, book4]
//            print(books.count)
        }
        if count == 3 {
            let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "This book is awesome")
            let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "This book is awesome")
            
            books = [book1, book2]
        }
            
        
    }
    
   
    
    let booksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    
    let devideLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let categoryLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Times New Roman", size: 16)
        return name
    }()
    
    func setupCell() {
        backgroundColor = UIColor.clear
        
        
        addSubview(booksCollectionView)
        addSubview(devideLine)
        addSubview(categoryLabel)
        
        
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self

        booksCollectionView.register(BookCell.self, forCellWithReuseIdentifier: bookCellID)
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": devideLine]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": booksCollectionView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": booksCollectionView, "v1": devideLine, "nameLabel": categoryLabel]))
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellID, for: indexPath) as! BookCell
        
        cell.book = books[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(books.count)
        return books.count
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = indexPath.item
        print(item)

        let destination = ShowBookController()

        destination.bookImage.image = books[item].bookImage
        destination.details.text = books[item].bookDetails
        destination.bookInfo.text = bookInformation[item]

//        navigationController?.pushViewController(destination, animated: true)
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}











