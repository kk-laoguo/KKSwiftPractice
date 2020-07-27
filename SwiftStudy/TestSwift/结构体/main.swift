//
//  main.swift
//  结构体
//
//  Created by zainguo on 2020/6/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

func testStruct() {
    struct Point {
        var x: Int = 10
        var y: Int = 0
        mutating func moveBy(deleX: Int, deleY: Int) {
            x += deleX
            y += deleY
        }
      
    }
    var p = Point()
    print(MemoryLayout<Point>.size)
    print(MemoryLayout<Point>.stride)
    print(MemoryLayout<Point>.alignment)
}

struct Circle {
    // 存储属性
    var radius: Double
    // 计算属性
    var diameter: Double {
        set {
            radius = newValue / 2
        }
        get {
            radius * 2
        }
    }
    var xx: Double {
        // 属性观察器
        willSet {
            
        }
        didSet {
            
        }
    }
}

testStruct()
