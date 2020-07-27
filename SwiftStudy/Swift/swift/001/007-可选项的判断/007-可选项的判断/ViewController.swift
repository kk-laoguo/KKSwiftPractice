//
//  ViewController.swift
//  007-可选项的判断
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        demo(x: 10, y: 40)
        demo1(x: 10, y: nil)
//        demo2()
//        demo3()
        demo4(name: "老王", age: 18)
        
        
    }
    func demo(x: Int?, y:Int?) {
       
        if x != nil && y != nil {
            print(x! + y!)
        }else {
            print("x或者y为nil")
        }
     }

    //MARK: - ??
    func demo1(x: Int?, y:Int?) {
        
        print((x ?? 0) + (y ?? 0))
        let name: String? = "老郭"
        print((name ?? "") + "你好")
        print(name ?? "" + "你好")
    }
    //MARK: - if let /var 连用语法
    func demo2() {
        let oName: String? = "老王"
        let oAge: Int? = nil
        if oName != nil && oAge != nil {
            print(oName! + String(oAge!))
        }
        if let name = oName,let age = oAge {
            //进入分支之后, name和age一定有值, 不需要解包
            print(name + String(age))
        } else {
            print("name 或者 age为 nil")
        }
        if var name = oName,let age = oAge {
            name = "老李"
            //进入分支之后, name和age一定有值, 不需要解包
            print(name + String(age))
        }
    }
    //MARK: - guard
    func demo3() {
        let oName: String? = "老王"
        let oAge: Int? = 10
        guard let name = oName, let age = oAge
            else {
                print("姓名或者年龄为nil")
                return
        }
        print(name + String(age))
    }
    func demo4(name: String?, age: Int?) {
        if let name = name , let age = age {
            //非空的name和age仅在{}内有效
            print(name + String(age))
            print("------------")
         }else {
            print("姓名或者年龄为nil")
 
        }
        guard let name = name, let age = age
            else {
                print("-------->姓名或者年龄为nil")

                return
        }
        print(name + String(age))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

