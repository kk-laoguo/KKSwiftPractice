//
//  NavigationViewController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // 隐藏底部Tabbar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let top = topViewController else { return .lightContent }
        return top.preferredStatusBarStyle
    }

}

enum NavigationBarStyle {
    case theme, clear, white
}

extension UINavigationController {
    struct AssociatedKeys {
        static var DISABLE_KEY: Bool = false
    }
    var disablePopGesture: Bool {
        get {
            (objc_getAssociatedObject(self, &AssociatedKeys.DISABLE_KEY)) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.DISABLE_KEY, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    func barStyle(_ style: NavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        case .white:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        }
    }
}
