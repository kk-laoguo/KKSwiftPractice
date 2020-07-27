//
//  main.swift
//  字面量
//
//  Created by zainguo on 2020/7/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation


extension Int: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = value ? 1:0
    }
    
}
 
var num: Int = true





func test() {
    let age = 2
    if age >= 0 && age <= 9 {
        print("[0, 9]")
    }

    if case 0...9 = age {
        print("[0, 9]")
    }
    guard case 0...9 = age else {
        return
    }
    print("[0, 9]")      
}
 
test()

let points = [(1, 0), (2, 1), (3, 0)]
for(x, y) in points {
    print(x, y)
}
for (x, _) in points {
    print(x)
}
for case let(x, 0) in points {
    print(x)
}


struct Student {
    var score = 0, name = ""
    
    ///   - pattern: case后面的内容
    ///   - value: switch后面的内容
    static func ~= (pattern: Int, value: Student) ->Bool {
        value.score >= pattern
    }
    static func ~= (pattern: Range<Int>, value: Student) ->Bool {
        pattern.contains(value.score)
    }
    static func ~= (pattern: ClosedRange<Int>, value: Student) ->Bool {
        pattern.contains(value.score)
    }
}

var stu = Student(score: 75, name: "Jack")
switch stu {
case 100:
    print(">=100")
case 90:
    print(">=90")
case 80..<90:
    print("[80, 90]")
case 70...80:
    print("[70, 80]")
case 0:
    print(">=0")
default:
    break
}
var str = "123456"
print(str.hasPrefix("123"))
print(str.hasSuffix("456"))
extension String {
    static func ~= (pattern: (String) -> Bool, value: String) -> Bool {
        pattern(value)
    }
}
func hasPrefix(_ prefix: String) -> ((String) -> Bool) {
    {
        $0.hasPrefix(prefix)
    }
}
func hasSuffix(_ suffix: String) -> ((String) -> Bool) {
    {
        $0.hasSuffix(suffix)
    }
}

switch str {
case hasPrefix("123"):
    print("以123开头")
case hasSuffix("456"):
    print("以456结尾")
default: break
}
func isEven( _ i: Int) -> Bool {
    i % 2 == 0
}

func isOdd( _ i: Int) -> Bool {
    i % 2 != 0
}

prefix operator ~>
prefix operator ~>=
prefix operator ~<
prefix operator ~<=
  
prefix func ~> (_ i: Int) -> ((Int) -> Bool) { { $0 > i } }
prefix func ~>= (_ i: Int) -> ((Int) -> Bool) { { $0 >= i } }
prefix func ~< (_ i: Int) -> ((Int) -> Bool) { { $0 < i } }
prefix func ~<= (_ i: Int) -> ((Int) -> Bool) { { $0 <= i } }


extension Int {
    static func ~= (pattern: (Int) -> Bool, value: Int) -> Bool {
        pattern(value)
    }
//    prefix static func ~>= (value: Int) -> (Int) -> Bool {
//
//    }
}

var age = 0
switch age {
case isEven:
    print("是个偶数")
case isOdd:
    print("是个奇数")
default:
    break
}

// MARK: 类似于OC的 #pragma mark
// MARK: - 类似于OC的 #pragma mark
// TODO: 用于标记未完成的任务
// FIXME: 用于标记待修复的问题

func greaterThan(_ num: Int) -> (Int) -> Bool {
    return { (i: Int) -> Bool in
        return i > num
    }
}


var p = Person(age: 10, name: "Jack")

p.run()

Person.run()

testSwift()
