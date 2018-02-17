//
//  ReadMoreController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 8/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class ReadMoreController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, PayPalPaymentDelegate {
  
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
    
    
    
    lazy var vcArr: [UIViewController] = {
        let dest1 = FirstVC()
        let dest2 = SecondVC()
        let dest3 = ThirdVC()
        
        return [dest1, dest2, dest3]
    }()
    
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let viewControllerIndex = vcArr.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return vcArr.last
        }
        guard vcArr.count > previousIndex else {
            return nil
        }
        
        return vcArr[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = vcArr.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < vcArr.count else {
            return vcArr.first
        }
        guard vcArr.count > nextIndex else {
            return nil
        }
        
        return vcArr[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcArr.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = vcArr.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        
        
        setup()
        setupPayPal()
        
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Buy Now", style: UIBarButtonItemStyle.done, target: self, action: #selector(payPal))
        
        if let firstVC = vcArr.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
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
    func setupPayPal() {
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Sg106 Co."
        
        
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        payPalConfig.payPalShippingAddressOption = .both
    }
    
}












