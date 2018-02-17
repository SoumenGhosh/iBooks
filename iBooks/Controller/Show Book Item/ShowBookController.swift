//
//  ShowBookController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 6/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class ShowBookController: UIViewController, PayPalPaymentDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
//    var image: UIImageView?
    let cellID = "cellID"
    var books = [Book]()
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    var payPalConfig = PayPalConfiguration()
    
    
    // PayPalPaymentDelegate
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
//        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
//        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
//            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
        })
    }
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "sp1")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    let details: UILabel = {
        let details = UILabel()
        details.translatesAutoresizingMaskIntoConstraints = false
        details.font = UIFont(name: "Times New Roman", size: 18)
//        details.text = "Name: Harry Potter.\nAuthor: Unknown.\nCategory: Magical"
        details.numberOfLines = 3
        details.textAlignment = .center
        return details
    }()
    
    let butt: UIButton = {
        let butt = UIButton()
        butt.setTitle("Read More!", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.layer.cornerRadius = 10
        butt.layer.masksToBounds = true
        butt.backgroundColor = UIColor.blue
        
        butt.addTarget(self, action: #selector(readMore(_:)), for: .touchUpInside)
        return butt
    }()
    
    lazy var bookInfo: UILabel = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.numberOfLines = 3
        info.font = UIFont(name: "Times New Roman", size: 16)
        info.textAlignment = .center
        return info
    }()
    
    let similar: UILabel = {
        let similar = UILabel()
        similar.translatesAutoresizingMaskIntoConstraints = false
        similar.text = "Similar Types!"
        similar.font = UIFont(name: "Times New Roman", size: 22)
        return similar
    }()
    
    
    let booksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    
    
    
    @IBAction func readMore(_ sender: UIButton!){
//        print("button pressed")
        
        let destination = ReadMoreController()
        destination.navigationItem.title = "Trial Varsion"
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupNav()
        setupImage()
        setupDetails()
        setupButt()
        setupBookInfo()
        setupSim()
        
        setupPayPal()
        
        setupBooks()
        
        
        setup()
        
    }
    
    func setup() {
        view.addSubview(booksCollectionView)
        navigationItem.title = "Great Books"
        
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
        
        booksCollectionView.register(ShowBookCell.self, forCellWithReuseIdentifier: cellID)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": booksCollectionView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-560-[v0]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": booksCollectionView]))

    }
    
    func setupBooks() {
        let book1 = Book(bookName: "book1", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknown1", bookDetails: "This book is awesome")
        let book2 = Book(bookName: "Book2", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown2", bookDetails: "This book is awesome")
        let book3 = Book(bookName: "Book3", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "sp1"), bookAuthor: "Unknown3", bookDetails: "This book is awesome")
        let book4 = Book(bookName: "book4", bookPrice: "$3.99", bookImage: #imageLiteral(resourceName: "george_orwell"), bookAuthor: "unknow4", bookDetails: "This book is awesome")
        let book5 = Book(bookName: "Book5", bookPrice: "$4.49", bookImage: #imageLiteral(resourceName: "the_great_gatsby"), bookAuthor: "Unknown5", bookDetails: "This book is awesome")
        
        books = [book1, book2, book3, book4, book5]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PayPalMobile.preconnect(withEnvironment: environment)
    }
    
    func setupPayPal() {
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Sg106 Co."
        
        
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        payPalConfig.payPalShippingAddressOption = .both
    }
    
    
    func setupNav() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Buy Now", style: UIBarButtonItemStyle.done, target: self, action: #selector(payPal))
    }
    
    @objc func payPal() {
//        print(123)
        
        let item1 = PayPalItem(name: "Harry Potter", withQuantity: 2, withPrice: NSDecimalNumber(string: "4.99"), withCurrency: "USD", withSku: "Hip-0037")
        let item2 = PayPalItem(name: "Sharlock Homes", withQuantity: 1, withPrice: NSDecimalNumber(string: "3.99"), withCurrency: "USD", withSku: "Hip-00066")
        let item3 = PayPalItem(name: "Doctor Strange", withQuantity: 1, withPrice: NSDecimalNumber(string: "3.49"), withCurrency: "USD", withSku: "Hip-00291")
        
        let items = [item1, item2, item3]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "5.99")
        let tax = NSDecimalNumber(string: "2.50")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        //this is the name of the seller
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Sg106 Co.", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            // error in payment
            print("Payment not processalbe: \(payment)")
        }
    }
    
    
    func setupImage() {
        view.addSubview(bookImage)
        bookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if #available(iOS 11.0, *) {
            bookImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        } else {
            // Fallback on earlier versions
        }
        bookImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func setupDetails() {
        view.addSubview(details)
        details.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        details.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10).isActive = true
        details.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    func setupButt() {
        view.addSubview(butt)
        butt.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        butt.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 15).isActive = true
        butt.widthAnchor.constraint(equalToConstant: 150).isActive = true
        butt.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupBookInfo() {
        view.addSubview(bookInfo)
        bookInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookInfo.topAnchor.constraint(equalTo: butt.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupSim(){
        view.addSubview(similar)
        similar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        similar.topAnchor.constraint(equalTo: bookInfo.bottomAnchor, constant: 15).isActive = true
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ShowBookCell
//        cell.categoryLabel.text = category[indexPath.item]
        //        cell.booksCollectionView =
        cell.backgroundColor = .white
        cell.book = books[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
    }
    
    
}





