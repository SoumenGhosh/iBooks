//
//  SlideBarController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 15/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class SlideBarController: UIViewController{
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 60
        image.layer.masksToBounds = true
        image.image = #imageLiteral(resourceName: "myDP")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.75
        return image
    }()
    
    
    let user: UILabel = {
        let user = UILabel()
        user.translatesAutoresizingMaskIntoConstraints = false
        user.text = "Name: Soumen Ghosh\nSex: Male\nDOB: 19 Jan, 1994"
        user.numberOfLines = 3
        user.font = UIFont(name: "Tiems New Roman", size: 22)
//        user.backgroundColor = UIColor.darkGray
        user.textColor = UIColor.white
        user.textAlignment = .center
        return user
    }()
    
    let home: UIButton = {
        let recent = UIButton()
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.setTitle("Home", for: .normal)
        recent.backgroundColor = UIColor.darkGray
        recent.layer.cornerRadius = 5
        recent.layer.masksToBounds = true
        return recent
    }()
    
    let newsFeed: UIButton = {
        let recent = UIButton()
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.setTitle("News Feed", for: .normal)
        recent.backgroundColor = UIColor.darkGray
        recent.layer.cornerRadius = 5
        recent.layer.masksToBounds = true
        return recent
    }()
    
    let favorite: UIButton = {
        let recent = UIButton()
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.setTitle("Favorite", for: .normal)
        recent.backgroundColor = UIColor.darkGray
        recent.layer.cornerRadius = 5
        recent.layer.masksToBounds = true
        return recent
    }()
    
    let about: UIButton = {
        let recent = UIButton()
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.setTitle("About", for: .normal)
        recent.backgroundColor = UIColor.darkGray
        recent.layer.cornerRadius = 5
        recent.layer.masksToBounds = true
        return recent
    }()
    
    let help: UIButton = {
        let recent = UIButton()
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.setTitle("Help", for: .normal)
        recent.backgroundColor = UIColor.darkGray
        recent.layer.cornerRadius = 5
        recent.layer.masksToBounds = true
        return recent
    }()
    
    let aboutUs: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This app is for book lovers. If you are a book lover, then you are at right place."
        label.numberOfLines = 5
        label.font = UIFont(name: "Times New Roman", size: 22)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupImage()
        setupUser()
        setupHome()
        setupNewsFeed()
        setupFavorite()
        setupAbout()
        setupHelp()
        setupAboutUs()
    }
    
    
    
    func setupImage() {
        view.addSubview(image)
        if #available(iOS 11.0, *) {
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        } else {
            // Fallback on earlier versions
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        }
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupUser() {
        view.addSubview(user)
        user.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15).isActive = true
        user.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        user.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
    }
    
    func setupHome() {
        view.addSubview(home)
        home.topAnchor.constraint(equalTo: user.bottomAnchor, constant: 20).isActive = true
        home.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        home.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        home.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupNewsFeed() {
        view.addSubview(newsFeed)
        newsFeed.topAnchor.constraint(equalTo: home.bottomAnchor, constant: 5).isActive = true
        newsFeed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        newsFeed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        newsFeed.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
   
    func setupFavorite() {
        view.addSubview(favorite)
        favorite.topAnchor.constraint(equalTo: newsFeed.bottomAnchor, constant: 5).isActive = true
        favorite.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        favorite.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        favorite.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupAbout() {
        view.addSubview(about)
        about.topAnchor.constraint(equalTo: favorite.bottomAnchor, constant: 5).isActive = true
        about.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        about.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        about.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupHelp() {
        view.addSubview(help)
        help.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 5).isActive = true
        help.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        help.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        help.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupAboutUs() {
        view.addSubview(aboutUs)
        aboutUs.topAnchor.constraint(equalTo: help.bottomAnchor, constant: 20).isActive = true
        aboutUs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        aboutUs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
    }
}








