//
//  main.swift
//  Equatable
//
//  Created by zainguo on 2020/7/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Person: Equatable {
    var age: Int
//    var name: String
    init(age: Int) {
        self.age = age
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.age == rhs.age
    }
}
var p1 = Person(age: 10)
var p2 = Person(age: 10)
print(p1 == p2)

// === 判断两个对象的地址值是否相同
 print(p1 === p2)


// 比较两个实例的大小
// 重载元素安抚
struct Student: Comparable {
   
    
    var age: Int
    var score: Int
    init(score: Int, age: Int) {
        self.score = score
        self.age = age
    }
    static func < (lhs: Student, rhs: Student) -> Bool {
        (lhs.score < rhs.score) || (lhs.score == rhs.score && lhs.age > rhs.age)
    }
    static func > (lhs: Student, rhs: Student) -> Bool {
        (lhs.score > rhs.score) || (lhs.score == rhs.score && lhs.age < rhs.age)
    }
    static func <= (lhs: Student, rhs: Student) -> Bool {
        !(lhs > rhs)
    }
    static func >= (lhs: Student, rhs: Student) -> Bool {
        !(lhs < rhs)

    }
}


