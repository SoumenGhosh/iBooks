//
//  TabController.swift
//  iBooks
//
//  Created by SOUMEN GHOSH on 3/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class TabController: UITabBarController, CDRTranslucentSideBarDelegate, UITableViewDelegate {

    var rightSideBar: CDRTranslucentSideBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List of Books"
        
        setupTab()
        setupSlideBar()
        setupNav()
    }
    
    func setupTab() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        
        let firstViewController = ListBookController(collectionViewLayout: layout)
        firstViewController.tabBarItem.image = #imageLiteral(resourceName: "first_1")  // image is here
        firstViewController.tabBarItem.title = "Book Lists"
        
        let secondViewController = TopChartController()
        secondViewController.tabBarItem.image = #imageLiteral(resourceName: "second_2")  // image is here
        secondViewController.tabBarItem.title = "Top Rated"
        
        viewControllers = [firstViewController, secondViewController]
        
    }

    
     func setupSlideBar() {
        rightSideBar = CDRTranslucentSideBar(directionFromRight: true)
        rightSideBar?.delegate = self
        rightSideBar?.translucentTintColor = .gray
        rightSideBar?.tag = 0
        rightSideBar?.translucentAlpha = 0.75
        rightSideBar?.animationDuration = 0.5
        rightSideBar?.sideBarWidth = view.frame.width * 0.6
        rightSideBar?.show(animated: true)
        
        
        let vc = SlideBarController()
//        self.addChildViewController(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        rightSideBar?.setContentViewIn(vc.view)
        vc.didMove(toParentViewController: self)
        
    }
    
     func setupNav() {
        let menu = #imageLiteral(resourceName: "three_3").withRenderingMode(.alwaysOriginal)  // image is here
        let rightBarBut = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.done, target: self, action: #selector(showRightBar))
        rightBarBut.image = menu
        self.navigationItem.rightBarButtonItem = rightBarBut
    }
    
    @objc func showRightBar() {
        self.rightSideBar?.show()
    }
    
   
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let indexOfTab = tabBar.items?.index(of: item) else { return }
        
        if indexOfTab == 0 {
            navigationItem.title = "List of Books"
        } else {
            navigationItem.title = "Top Chart"
        }
    }

}




