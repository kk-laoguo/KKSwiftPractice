//
//  main.swift
//  泛型
//
//  Created by zainguo on 2020/6/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

/// 泛型函数
func swapValus<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}
func test<T1, T2>(_ t1: T1, _ t2: T2) {
    
}
var a = 10, b = 20
swapValus(&a, &b)

var fn: (inout Int, inout Int) -> () = swapValus
fn(&a, &b)
print(a, b)

// 泛型类型
class Stack<E> {
    var elements = [E]()
//    init(firstElement: E) {
//        elements.append(firstElement)
//    }
    func push(_ element: E) {
        elements.append(element)
    }
    func pop() -> E {
        elements.removeLast()
    }
    func top() -> E {
        elements.last!
    }
    func size() -> Int {
        elements.count
    }
}
var intStack = Stack<Int>()
var stringStack = Stack<String>()
var anyStack = Stack<Any>()

struct StructStack<E> {
    var elements = [E]()
    mutating func push(_ element: E) {
        elements.append(element)
    }
    mutating func pop() -> E {
        elements.removeLast()
    }
    func top() -> E {
        elements.last!
    }
    func size() -> Int {
        elements.count
    }
}

enum Score<T> {
    case point(T)
    case grade(String)
}
let score = Score<Int>.grade("A")
let score0 = Score<Int>.point(100)
let score1 = Score.point(99)
let score2 = Score.point(99.9)

