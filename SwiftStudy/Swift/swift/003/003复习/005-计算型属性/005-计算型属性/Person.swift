//
//  Person.swift
//  005-计算型属性
//
//  Created by 今代科技 on 2017/10/15.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class Person: NSObject {

    private var _name: String?
    // getter & setter 仅用演示, 日常开发不用
    // Swift: 中一般不会重写 getter和setter方法
    var name: String? {
        get {
            // 返回_成员变量
            return _name
        }
        set {
            // 使用_成员变量 记录值
            _name = newValue
        }
    }
    // oc中定义属性的时候, 有一个readonly -> 重写 getter方法
    var title: String {
        get {
            return "Mr. " + (name ?? "")
        }
    }
    
    // 只读属性的简写 - 直接retrurn
    // 又称为计算型属性 - > 本身不保存内容, 都是通过计算获得结果
    // 类似于一个函数
    // - 没有参数
    // - 一定有返回值
    var title2: String {
        print("计算name \(name ?? "")")
        return "Mr xxx." + (name ?? "")
    }
    // 懒加载title 本质是一个闭包
    lazy var title3: String? = {
        return "lazy" + (self.name ?? "")
    }()
}
