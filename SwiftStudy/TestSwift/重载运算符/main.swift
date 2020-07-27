//
//  main.swift
//  重载运算符
//
//  Created by zainguo on 2020/7/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

infix operator +-: PlusMinusPrecedence

precedencegroup PlusMinusPrecedence {
    associativity: none
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    assignment: true // 在可选链操作中拥有和赋值运算符一样的优先级
}

struct Point {
    var x = 0, y = 0
    static func + (p1: Point, p2: Point) -> Point {
        Point(x: p1.x + p2.x, y: p2.y + p2.y)
    }
    static prefix func - (p: Point) -> Point {
        Point(x: -p.x, y: -p.y)
    }
    static func += (p1: inout Point, p2: Point) {
        p1 = p1 + p2
    }
    static prefix func ++ (p: inout Point) -> Point {
        p += Point(x: 1, y: 1)
        return p
    }
    static func == (p1: Point, p2: Point) -> Bool {
        (p1.x == p2.x) && (p2.y == p2.y)
    }
    static func +- (p1: Point, p2: Point) -> Point {
        Point(x: p1.x + p2.x, y: p1.y - p2.y)
    }
    
}
// 重载
var p1 = Point(x: 10, y: 10)
var p2 = Point(x: 10, y: 10)
print(p1 + p2)
print(-p1)

let p3 = p1 +- p2
print(p3)

// 自定义重载运算符
// 前置运算符
prefix operator +++
prefix func +++ (_ i: inout Int) {
    i += 2
}
var age = 10
+++age
print(age)





class Person {
    var age = 0
    var point: Point = Point()
}

func getAge() -> Int { 10 }
var p: Person? = Person()
p?.age = getAge()

p?.point +- Point(x: 10, y: 10)

extension Double {
    var km: Double { self * 1_000.0 }
    var m: Double { self }
    var dm: Double { self / 10.0 }
}
