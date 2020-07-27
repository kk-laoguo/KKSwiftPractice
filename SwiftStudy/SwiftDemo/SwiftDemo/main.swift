//
//  main.swift
//  SwiftDemo
//
//  Created by zainguo on 2019/8/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

struct Stack {
    
    var data = [Any]()
    init(data: [Any]) {
        self.data = data
    }
    mutating func pop() {
        data.removeLast()
    }
    mutating func push(element: Any) {
        data.append(element)
    }
}
struct StackT<Element> {
    var data = [Element]()
    init(data: [Element]) {
        self.data = data
    }
    mutating func pop() {
        data.removeLast()
    }
    mutating func push(element: Element) {
        data.append(element)
    }
    
}

var stack = Stack(data: ["Swift", "objective-c"])
stack.push(element: "iOS")

print(stack.data.first ?? "")


var stackT = StackT(data: ["Swift", "objective-c"])

print(stackT.data.first!)

// 通过 泛型 和 Extension 实现通用算法
extension StackT where Element: Numeric {
    func sum() -> Element {
        var total: Element = 0
        for num in data {
            total += num
        }
        return total
    }
    
}
var numStack = StackT(data: [1, 2])
print(numStack.sum())

// 通过泛型 和 Extension 为 Protocol 扩展方法
extension Collection {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        
        result.reserveCapacity(self.count)
        var position = startIndex
        while position != endIndex {
            result.append(transform(self[position]))
            position = index(after: position)
        }
        return result
    }
    
}
// shuffle(系统标准库)
/*
 Fisher–Yates shuffle
 算法是一个用来将一个有限集合生成一个随机排列的算法（数组随机排序）。
 */

//extension RandomAccessCollection where Self: MutableCollection {
//    mutating func shuffled() {
//        let n = count
//        guard n > 1 else {
//            return
//        }
//        for (i, pos) in indices.dropLast().enumerated() {
//            let otherPos = index(startIndex, offsetBy: Int.random(in: i..<n))
//            swapAt(pos, otherPos)
//        }
//    }
//}

var arr = [1, 2, 3]
arr.shuffle()
print(arr)





