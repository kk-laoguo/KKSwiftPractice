//
//  Person.swift
//  008-构造函数
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
/**
 1. 构造函数的目的: 给自己的属性分配空间且设置初始值
 2. 调用父类的 "构造函数",给父类的属性分配空间设置初始值
    NSObject 没有属性, 只有一个成员变量 isa
 3. 如果重载的构造函数, 并且没有实现父类的 init方法, 系统不再提供 init() 构造函数(默认是会有的)
    为什么重载了 init()构造函数就没有了 , 因为 默认的构造函数, 不能给本类的属性分配空间
 */

class Person: NSObject {
    var name: String
    // 重写 父类有这个方法
    override init() {
        print("person init")

        // 问题: 所有的初始值都是 zhang
        name = "zhang"
        super.init()
    }
    // "重载" 函数名相同, 但是参数个数不同
    init(name: String) {
        // 参数name 设置给 属性 name
        self.name = name;
        // 调用父类的构造函数
        super.init()
       
        
    }
    
}
