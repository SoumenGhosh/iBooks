//
//  SlideController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 15/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class SlideController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "baal"
        cell.backgroundColor = .yellow
        
        return cell
    }
    
}
