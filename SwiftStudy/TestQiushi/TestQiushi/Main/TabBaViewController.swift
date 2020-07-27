//
//  TabBaViewController.swift
//  TestQiushi
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class TabBaViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(TabBar(), forKeyPath: "tabBar")
        tabBar.barTintColor = .white
        
        addChild("糗事", "", "", HomeViewController.self)
        addChild("动态", "", "", TrendViewController.self)
        addChild("直播", "", "", LiveViewController.self)

    }
    func addChild(_ title: String,
                  _ image: String,
                  _ selectedImage: String,
                  _ type: UIViewController.Type) {
        
        let child = UINavigationController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.selectedImage = UIImage(named: selectedImage)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        
        child.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        
        addChild(child)
    }
    

}
