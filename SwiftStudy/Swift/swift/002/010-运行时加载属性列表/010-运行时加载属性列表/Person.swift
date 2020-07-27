
//
//  Person.swift
//  010-运行时加载属性列表
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class Person: NSObject {
    // 基本数据类型, 在 oc 中没有可选, 如果定义可选, 运行时同样获取不到, 使用kvc就会崩溃
//    var age: Int?
    var age: Int = 0
    
    // private申明的属性, 使用运行时, 同样获取不到属性(可以获取到ivar), 同样会让kvc崩溃
    
//    private var name: String?

    var name: String?
    var title: String?
    // 类方法
    // 使用运行时获取当前类 所有属性的数组
    // 获取 ivar 列表是所有第三方字典转模型的基础
    class func propertyList() -> [String] {
        var count: UInt32 = 0
        // 1.获取 "类'的属性列表, 返回属性列表的数组
        let list = class_copyPropertyList(self, &count)
        print("属性的数量 \(count)")
        // 2.遍历数组
//        for i in 0..<Int(count) {
//            // 3.根据下标获取属性
//            let pty = list?[i]
//            // 4.获取属性的名称 c 语言字符串
//            // Int8 -> byte -> char -> c语言字符串
//            let cName = property_getName(pty!)
//            // 5. 转换成oc字符串
//            let name = String(utf8String: cName!)
//            print(name ?? "")
//        }
        
        for i in 0..<Int(count) {
            // 3.根据下标获取属性
            // 使用 guard 语法, 依次判断每一项是否有值, 只要有一项为nil, 都不执行后续的代码 
            guard let pty = list?[i],
                  let cName = property_getName(pty),
                  let name = String(utf8String: cName) else {
                    // 继续遍历下一个
                    continue
            }
            // 4.获取属性的名称 c 语言字符串
            // Int8 -> byte -> char -> c语言字符串
            // 5. 转换成oc字符串
            // name是一定有值的
            print(name)
        }
        // 3. 释放c 语言对象
        free(list)
        return []
    }
    
}
