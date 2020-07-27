//
//  Person.swift
//  008-构造函数
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
/**
 1. 给自己的属性分配空间且设置初始值
 2. 调用父类的 "构造函数",给父类的属性分配空间设置初始值
    NSObject 没有属性, 只有一个成员变量 isa
 */

class Person: NSObject {
    var name: String
    override init() {
        print("person init")

        name = "zhang"
        super.init()
    }
    
}
