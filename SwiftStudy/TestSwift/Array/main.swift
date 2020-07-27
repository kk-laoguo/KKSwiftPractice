//
//  main.swift
//  Array
//
//  Created by zainguo on 2020/7/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation



var arr = [1, 2, 3, 4, 5]

var arr2 = arr.map {
    return $0 * 10
}
print(arr2)


var arr3 = arr.filter {
//    (i) -> Bool in
//    return i % 2 == 0
    $0 % 2 == 0
    
}
print(arr3)

var arr4 = arr.reduce(0) { (result, element) -> Int in
    print(element)
    return result + element
}

// $0上一次遍历的初始值
// $1每次遍历的数组元素的值
var res = arr.reduce(0) {
    $0 + $1
}
var res1 = arr.reduce(0, +)
print(arr4)
print(res)
print(res1)


var a = [1, 2, 3]
// [[1], [2, 2], [3, 3, 3]]
var a1 = a.map { Array(repeating: $0, count: $0) }
// [1, 2, 2, 3, 3, 3]
var a2 = a.flatMap { Array(repeating: $0, count: $0) }
print(a1, a2)


let a3 = a.lazy.map { (i: Int) -> Int in
    print("mapping \(i)")
    return i * 10
}
print("mapping =====")
print(a3[1])

// 利用reduce实现filter和map的功能

print(a.map { $0 * 2})
print(a.reduce([]) { $0 + [$1 * 2] })
print(a.filter { $0 % 2 == 0 })
print(a.reduce([]) { $1 % 2 == 0 ? $0 + [$1] : $0 })
 

var b = ["123", "test", "jack", "-30"]
var b1 = b.map{ Int($0) }
var b2 = b.compactMap{ Int($0) }
print(b1, b2)




var fmt = DateFormatter()
fmt.dateFormat = "yyyy-MM-dd"
var str: String? = "2020-02-20"
var date = str == nil ? nil : fmt.date(from: str!)

var date1 = str.flatMap { fmt.date(from: $0) }
var date2 = str.flatMap(fmt.date)

print(date!, date1!)
