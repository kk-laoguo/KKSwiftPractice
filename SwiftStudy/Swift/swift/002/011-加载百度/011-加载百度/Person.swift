//
//  Person.swift
//  011-加载百度
//
//  Created by 今代科技 on 2017/9/24.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class Person: NSObject {

    var age: Int = 0
    var name: String?
    // 重载构造函数
    /**
     1. 遍历构造函数允许范围 nil
     - 正常构造函数一定会创建对象
     - 判断给定的参数是否符合条件, 如果不符合条件 直接返回nil, 不会创建对象减少内存开销
     2. 遍历构造函数中使用 self.init 构造当前函数
     - 没有 convenience 关键字的构造函数时负责创建对象的, 反之用来检查条件的,本身是不负责对象的创建
     3. 如果在遍历构造函数中使用 当前对象的属性, 一定要在 self.init 之前
     */
    convenience init?(name: String, age: Int ) {
        if age > 100 {
            return nil
        }
        self.init()
        self.name = name;
    }
    override init() {
        super.init()
    }
}
