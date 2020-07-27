//
//  AppDelegate.swift
//  反射机制
//
//  Created by 今代科技 on 2017/9/27.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /**
     1. 知道swift中有命名空间
     - 在同一个命名空间下, 全局共享
     - 第三方框架使用 Swift 如果直接拖到项目中, 从属于一个命名空间, 很有可能冲突
     - 以后净量都用cocoapods
     2. 知道知道 swift中 NSClassFromString(反射机制) 的写法
     - 反射机制的目的是为了解耦
     - 搜索 反射机制和工厂模式
     */
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 1.实例化weindow
        window = UIWindow()
        // 2.设置栈控制器
        // 需要添加命名空间 -> 默认就是项目名称(最好不要有特殊符号和数字)
        let clsName = "反射机制.ViewController"
        // AnyClsaa? -> 视图控制器的类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        let vc = cls?.init()
        //        let vc = ViewController()
        window?.rootViewController = vc
        // 3.让window可见
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

