//
//  TabBarViewController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false

        tabBar.barTintColor = .white
        setupController()
    }
    
    func setupController() {
        addChildController("社区", "tab_today", "tab_today_selected", HomeController.self)
        addChildController("书架", "tab_book", "tab_book_selected", BookRackController.self)
        addChildController("发现", "tab_find", "tab_find_selected", FinderController.self)
        addChildController("我的", "tab_mine", "tab_mine_selected", MineController.self)
    }
    
    func addChildController(_ title: String,
                            _ image: String,
                            _ selectedImage: String,
                            _ type: UIViewController.Type) {
        
        var controller: UIViewController!
        
        if type == BookRackController.self {
            controller = BookRackController(titles: ["收藏", "书单", "历史", "下载"],
                                            vcs: [BookCollectionVC(), BookListVC(), BookListVC(), BookListVC()],
                                            segmentStyle: .navgationBarSegment)
        } else {
            controller = type.init()
            controller.title = title
        }
        
        let nav = NavigationViewController(rootViewController: controller)

        let image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)

        let item = UITabBarItem(title: nil,
                                image: image,
                                selectedImage: selectedImage)

//        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
        
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
        nav.tabBarItem = item
        addChild(nav)
    }
    


}
