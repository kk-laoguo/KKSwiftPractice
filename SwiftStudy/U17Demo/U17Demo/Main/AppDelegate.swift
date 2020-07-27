//
//  AppDelegate.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // 申明手机屏幕旋转方向
    var orientation: UIInterfaceOrientationMask = .portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()

        
        return true
    }
    func setupBaseConfig() {
        // 1.键盘处理
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        orientation
    }


}

extension UIApplication {
    // 4. 强制旋转屏幕
    class func changeOrientationTo(landscapeRight: Bool) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        if landscapeRight == true {
            delegate.orientation = .landscapeRight
            UIApplication.shared.supportedInterfaceOrientations(for: delegate.window)
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        } else {
            delegate.orientation = .portrait
            UIApplication.shared.supportedInterfaceOrientations(for: delegate.window)
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}
