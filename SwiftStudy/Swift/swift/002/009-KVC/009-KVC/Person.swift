//
//  Person.swift
//  009-KVC
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
/**
 1. 定义模型属性的时候, 如果是对象, 通常都是可选的
    - 在需要的时候创建
    - 避免写构造函数
    - 简化代码
 2. 如果是基本数据类型, 不能设置成可选的, 需要设置初始值, 否咋 kvc会崩溃
 3. 在使用kvc之前, 应该调用super.init()保证实例化完成
 4. 使用 kvc 设置数值, 属性不能是private的
 */
class Person: NSObject {
    // name属性是可选的, 在oc中 很多的属性都是在需要的时候创建的
    // 因为在手机开发, 内存很宝贵, 有些属性并不是一定需要分配空间的
    var name: String?
    // 如果是 private 属性, 使用KVC 设置值的时候, 同样无法设置
    // 如果设置成 private 属性/方法 是禁止外部访问的
//    private var title: String?
      var title: String?

    // 给基本数据类型初始化
    // - 使用 kvc 会提示无法找到 age的 KEY
    // - 原因: Int 是一个基本数据类型的结构体, oc中没有, oc中只有基本数据类型
//    var age: Int?
    var age: Int = 0
    init(dic:[String: AnyObject]) {
        // 保证对象已经完全初始化完成
        super.init()
        // kvc 的方法, 是oc的方法, 在运行时给对象发送消息
        // 要求对象已经实例化
        setValuesForKeys(dic)
    }
    // 重写父类方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        // 没有调用super, 将父类大代码实现完全覆盖
    }
    
    
}
