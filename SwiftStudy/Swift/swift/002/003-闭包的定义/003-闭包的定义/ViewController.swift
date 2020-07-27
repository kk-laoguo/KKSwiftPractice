//
//  ViewController.swift
//  003-闭包的定义
//
//  Created by 今代科技 on 2017/9/13.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 1>闭包
        // () -> () 没有参数, 没有返回值
        let b1 = {
            print("hello")
        }
        //执行闭包
        b1()
        // 2>带参数闭包
        //需要一个关键字 in 分割定义和实现
        // 闭包中参数返回值都是写在 {} 中的
        // {形参列表 -> 返回值类型 // 实现代码 }
        
        let b2 = { (x: Int) -> () in
            print(x)
        }
        b2(100)
        // 2>带参数 / 返回值的闭包
        let b3 = { (x: Int) -> Int in
            return x + 250
        }
        print(b3(11))
    }
    
    //使用常量记录函数的演练
    func demo() {
        print(sum(x: 10, y: 10))
        let f = sum
        print(f(20, 40))
    }
    func sum(x: Int, y: Int) -> Int {
        return x + y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

