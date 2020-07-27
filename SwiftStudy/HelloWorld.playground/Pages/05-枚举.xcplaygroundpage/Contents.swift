//: [Previous](@previous)

import Foundation

enum Direction {
//    case north, south, east, west
    case north
    case south
    case east
    case west
}

var dir = Direction.west
print(dir)

/*
 关联值
 有时将枚举的成员值跟其他类型的值关联存储在一起，会非常有用
 */
enum Score {
    case points(Int)
    case grade(Character)
}
var score = Score.points(100)
score = .grade("A")

switch score {
case let .grade(i):
    print("grade", i)
case let .points(i):
    print(i, "points")
}

enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}
var date = Date.digit(year: 2020, month: 10, day: 10)
//date = .string("2020-09-10")
switch date {
case .digit(let year, let month, let day):
    print(year, month, day)
case let .string(value):
    print(value)
}

enum Password {
    case number(Int, Int, Int, Int)
    case gesture(String)
}

var pwd = Password.number(1, 2, 3, 4)
pwd = .gesture("12345")

switch pwd {
case let .number(n1, n2, n3, n4):
    print("numbers is", n1, n2, n3, n4)
case let .gesture(str):
    print("gesture is", str)
}

/*
 原始值
 枚举成员可以使用相同类型的默认值预先对应，这个默认值叫做:原始值
 */
enum PokerSuit: Character {
    case spade = "♠"
    case heart = "♥"
    case diamond = "♦"
    case club = "♣"
}

var suit = PokerSuit.spade
print(suit)
print(suit.rawValue)
print(PokerSuit.club.rawValue)

enum Grade : String {
    case perfect = "A"
    case great = "B"
    case good = "C"
    case bad = "D"
}
print(Grade.perfect.rawValue)
print(Grade.great.rawValue)
print(Grade.good.rawValue)
print(Grade.bad.rawValue)

/*
 隐式原始值
 */

enum Season: Int {
    case spring = 1, summer, autumn, winter
}
print(Season.spring.rawValue)
print(Season.summer.rawValue)
print(Season.autumn.rawValue)

/*
 递归枚举
 */

//indirect enum AirthExpr {
//    case number(Int)
//    case sum(AirthExpr, AirthExpr)
//    case difference(AirthExpr, AirthExpr)
//}

enum AirthExpr {
    case number(Int)
    indirect case sum(AirthExpr, AirthExpr)
    indirect case difference(AirthExpr, AirthExpr)
}


let five = AirthExpr.number(5)
let four = AirthExpr.number(4)
let two = AirthExpr.number(2)
let sum = AirthExpr.sum(five, four)
let difference = AirthExpr.difference(sum, two)

/*
 MemoryLayout
 */

var age = 10
MemoryLayout<Int>.size // 实际用到的空间大小
MemoryLayout<Int>.stride // 分配占用的空间大小
MemoryLayout<Int>.alignment // 对其参数

MemoryLayout.size(ofValue: age)

MemoryLayout.size(ofValue: pwd)
MemoryLayout<Password>.size // 实际用到的空间大小
MemoryLayout<Password>.stride // 分配占用的空间大小
MemoryLayout<Password>.alignment // 对其参数


//: [Previous](@previous)

//: [Next](@next)
