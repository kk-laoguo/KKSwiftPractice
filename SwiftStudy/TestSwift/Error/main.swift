//
//  main.swift
//  Error
//
//  Created by zainguo on 2020/6/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

struct MyError: Error {
    var msg: String
}

enum SomeError: Error {
    case illegalArg(String)
    case outOfBounds(Int, Int)
    case outOfMemory
}

func divide(_ num1: Int, _ num2: Int) throws -> Int {
    if num2 == 0 {
//        throw MyError(msg: "0不能作为除数")
        
        throw SomeError.illegalArg("0不能作为除数")

    }
    return num1 / num2
}

print(try? divide(20, 10))
 
func test() {
    do {
        print(try divide(20, 0))
    } catch let SomeError.illegalArg(msg) {
        print("参数异常:", msg)
    } catch {
        print("其他错误")
    }
}
test()
