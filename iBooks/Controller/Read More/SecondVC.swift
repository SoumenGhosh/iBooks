//
//  SecondVC.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 10/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
   
    let pageNO: UILabel = {
        let no = UILabel()
        no.translatesAutoresizingMaskIntoConstraints = false
        no.text = "Page: 2"
        no.font = UIFont(name: "Times New Roman", size: 22)
        return no
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupPageNO()
    }
    func setupPageNO(){
        view.addSubview(pageNO)
        pageNO.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        if #available(iOS 11.0, *) {
            pageNO.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
        } else {
//            pageNO.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        }
    }
}
