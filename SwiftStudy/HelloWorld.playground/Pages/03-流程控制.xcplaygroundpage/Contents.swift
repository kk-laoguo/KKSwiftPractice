//: [Previous](@previous)

import Foundation

var age = 10
for var i in 0...3 {
    i += 5
    print(i)
}

let stringRange = "a"..."z"
stringRange.contains("b")
stringRange.contains("d")

for i in stride(from: 2, through: 10, by: 2) {
    print(i)
}

var num = 1
// switch 默认不需要些break, 并不会贯穿到后面的条件
switch num {
case 1:
    print(1)
    // 可以贯穿到后面
    fallthrough
case 2:
    print(2)
    
default:
//    print(0)
    break
}

enum Answer {case right, wrong}
let answer = Answer.right
switch answer {
case Answer.right:
    print("right")
case Answer.wrong:
    print("wrong")
}
// switch也支持character/string
age = 11
switch age {
case 10, 11:
    print("复合条件")
default:
    break
}
/*
 区间匹配 元组匹配
 */
let count = 60
switch count  {
case 0:
    print("none")
case 1..<5:
    print("a few")
case 5..<12:
    print("several")
case 12..<100:
    print("dozens of")
default:
    print("many")
}

/*
 值绑定
 */
let point = (2, 2)
switch point {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
/*
 where
 */
let point1 = (1, -1)
switch point1 {
case let (x, y) where x == y:
    print("on the line x == y")
case let (x, y) where x == -y:
    print("on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
var numbers = [10, 20, -10, -20, 30, -30]
var sum = 0
for num in numbers where num > 0 { // 使用where来过滤num
    sum += num
}
/*
 标签语句
 */

outer: for i in 1...4 {
    for j in 1...4 {
        if j == 3 {
            continue outer
        }
        if i == 3 {
            break outer
        }
        print("i == \(i), j == \(j)")
    }
}

print(sum)
//: [Previous](@previous)

//: [Next](@next)
