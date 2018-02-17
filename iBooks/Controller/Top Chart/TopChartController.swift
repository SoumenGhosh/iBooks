//
//  SecondViewController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 3/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class TopChartController: UITableViewController {

    private let cellId = "cellId"
    
    var books = [Book]()
    var bookInformation = ["Name: Harry Potter.\nAuthor: Unknown.\nCategory: Magical.", "Name: Harry Potter Part 2.\nAuthor: Unknown.\nCategory: Magical.", "Name: Titanic.\nAuthor: Unknown.\nCategory: Romance","Name: Act of Valor.\nAuthor: Unknown.\nCategory: War.", "Name: Die Hard.\nAuthor: Unknown.\nCategory: Action.","Name: Sharlock Homes.\nAuthor: Unknown.\nCategory: Detactive."]
    
//    var bookName = ["Name: Harry Potter.", "Name: Act of Valor.", "Name: Pirates.", "Name: Sharlock.", "Name: American Pie.", "Name: Hunt Locker."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TopChartCell.self, forCellReuseIdentifier: cellId)
        setupBook()
    }
    
    func setupBook() {
        let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "Full of ramance")
        let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "Don't know what we have here. You want to find out?")
        let book3 = Book(bookName: "Book3", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown3", bookDetails: "Great king of North China. Loved his queen. Yang Gou was the greatest ruler")
        let book4 = Book(bookName: "book4", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknow4", bookDetails: "Detactive! Now sharlock is in trobble.")
        let book5 = Book(bookName: "Book5", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown5", bookDetails: "This book is awesome")
        let book6 = Book(bookName: "Book6", bookPrice: "$2.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown5", bookDetails: "This book is awesome")
        
        books = [book1, book2, book3, book4, book5, book6]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TopChartCell
        cell.book = books[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row
//        print(row)
        
        let destination = ShowBookController()
        
        destination.bookImage.image = books[row].bookImage
        destination.details.text = books[row].bookDetails
        destination.bookInfo.text = bookInformation[row]
        
        navigationController?.pushViewController(destination, animated: true)
      
    }
  
    

}










