//
//  main.swift
//  类
//
//  Created by zainguo on 2020/6/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
         "Person description"
    }
    var debugDescription: String {
        "debug Person description"
    }
    
}
var p = Person()
let pType = type(of: p)
print(Person.self == pType)

print(p, pType)

class FileManager {
    // 单例模式
    public static let shared = FileManager()
    private init() {
        
    }
}

func testClass() {
    class Point {
        var x = 11
        var test = true
        var y = 22
    }
    var p = Point()
    print(class_getInstanceSize(Point.self))
}

testClass()


class Animal {
    var name: String
    var age: Int
    // 指定初始化器
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    init() {
        self.name = ""
        self.age = 0
    }
    // 便捷初始化器
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
    
    
    func speak() {
        print("Animal speak")
    }
    func eat() {
        print("Animal eat")
    }
    func sleep() {
        print("Animal sleep")
    }
}

class Dog: Animal {
    var height: Int = 0
//    convenience init(name: String) {
//        self.init(name: name, age: 0)
//        self.height = 0
//    }
    //    override init(name: String) {
//        self.height = 0
//        super.init(name: name)
//    }
    
    override func speak() {
        print("Dog speak")
    }
    override func eat() {
        print("Dog eat")
    }
    func run() {
        print("Dog eat")
    }
}

