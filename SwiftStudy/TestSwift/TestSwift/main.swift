//
//  main.swift
//  TestSwift
//
//  Created by zainguo on 2020/6/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

var a = 10
var b = 20
var c = a + b

print("Hello, World!")

//enum TestEnum: Int {
//    case test1 = 1, test2, test3
//}

//var t = TestEnum.test1
//t = .test2
//t = .test3

enum TestEnum {
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
}
var e = TestEnum.test1(1, 2, 3)
e = .test2(4, 5)
e = .test3(6)
e = .test4(true)
e = .test5

   
// 实际使用的内存
print(MemoryLayout<TestEnum>.size)
// 分配的内存
print(MemoryLayout<TestEnum>.stride)
// 对其
print(MemoryLayout<TestEnum>.alignment)

