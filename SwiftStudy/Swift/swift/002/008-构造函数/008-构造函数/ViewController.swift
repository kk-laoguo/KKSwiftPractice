//
//  ViewController.swift
//  008-构造函数
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
/**
 在Swift中, 默认同一个项目中(同一个命名空间), 所有的类都是共享的, 可以直接访问, 不需要import
 所有对象的属性, var 定义的也可以直接访问到
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 实例化person
        // () -> [alloc init]
//        let p = Person()
        // 在Swift中所有类都有一个命名空间
        // oc定义类的时候会有前缀
        // 同一个person类, 从属于不同的命名空间
        // Swift 中对应一个函数 init() 构造函数: 
        // 作用: 给成员变量分配空间初始化成员变量
        
//        print(p)
        let s = Student()
        print(s.name + "----" + (s.num))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

