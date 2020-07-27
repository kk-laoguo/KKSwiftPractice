//
//  main.swift
//  协议
//
//  Created by zainguo on 2020/6/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


protocol Runnable {
    func test() -> Self
}
class Person: Runnable {
    required init() {
        
    }
    func test() -> Self {
        // 谁调用就返回哪个对象的实例
        type(of: self).init()
    }

}
class Student: Person {
    
}

// 关联类型 == 协议里面使用泛型
// 类型约束
protocol Stackable {
    associatedtype Element: Equatable
}
class Stack<E: Equatable>: Stackable {
    typealias Element = E
}
func equal<S1: Stackable, S2: Stackable>(_ s1: S1, _ s2: S2) -> Bool where S1.Element == S2.Element, S1.Element: Hashable {
   return false
}

var s1 = Stack<Int>()
var s2 = Stack<Int>()
var s3 = Stack<String>()
equal(s1, s2)


protocol Runnable2 {
    associatedtype Speed
    var speed: Speed {
        get
    }
}
class Person2: Runnable2 {
    var speed: Double {0.0}
}

class Car: Runnable2 {
    var speed: Int { 0 }
    func run() {
        
    }
}

//func get<T: Runnable2>(_ type: Int) -> T {
//    if type == 0 {
//        return Person2() as! T
//    }
//    return Car() as! T
//}
func get(_ type: Int) -> some Runnable2 {
  
    return Car() 
}

