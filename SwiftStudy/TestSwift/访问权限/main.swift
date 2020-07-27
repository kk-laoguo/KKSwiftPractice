//
//  main.swift
//  访问权限
//
//  Created by zainguo on 2020/7/10.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


class Person {
    deinit {
        print("deinit")
    }
    
    var fn: (() -> ())?
    private(set) var age = 0
    fileprivate(set) public var weight: Int {
        set {}
        get {10}
    }
    internal(set) public subscript(index: Int) -> Int {
        set {}
        get { index }
    }
    func run(_ v: Int) {
        print("func run \(v)")
    }
}


autoreleasepool {
//    () -> Result in
    let p = Person()
    p.run(10)
}

// 指针

func test1(_ ptr: UnsafeMutablePointer<Int>) {
    ptr.pointee += 10
}
func test2(_ ptr: UnsafePointer<Int>) {
    print(ptr.pointee)
}
func test3(_ ptr: UnsafeRawPointer) {
    ptr.load(as: Int.self)
    print("test3", ptr.load(as: Int.self))
    
}
func test4(_ ptr: UnsafeMutableRawPointer) {
    ptr.storeBytes(of: 30, as: Int.self)
}

var arr = NSArray(objects: 1, 2, 3, 4)
arr.enumerateObjects { (element, idx, stop) in
    print(idx, element)
    if idx == 2 {
        stop.pointee = true
    }
}
    

var age = 10
   
var ptr = withUnsafePointer(to: &age) {
    $0
}
print(ptr.pointee)

var ptr2 = withUnsafeMutablePointer(to: &age) { $0
}

ptr2.pointee = 30
print(age)
  
