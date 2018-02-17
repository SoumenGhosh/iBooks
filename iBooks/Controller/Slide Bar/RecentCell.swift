//
//  RecentCell.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 15/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class RecentCell: UITableViewCell {
    
    
    
    let imageCell: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "sp1")
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
        setupImage()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupImage() {
        addSubview(imageCell)
        imageCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        imageCell.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageCell.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    
}
