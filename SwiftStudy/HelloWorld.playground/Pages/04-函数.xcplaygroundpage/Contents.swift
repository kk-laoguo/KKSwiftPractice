//: [Previous](@previous)

import Foundation


/*
 隐式返回
 */

/// 求和[概述]
///
/// 将2个整数相加[详细的描述]
///
/// - Parameters:
///   - v1: 第一个整数
///   - v2: 第二个整数
/// - Note: 传入2个整数即可[批注]
///
func sum(v1: Int, v2: Int) -> Int {
    v1 + v2
}
print(sum(v1: 10, v2: 10))

/*
 实现多返回值
 */
func calculate(v1: Int, v2: Int) -> (sum: Int, difference: Int, average: Int) {
    let sum = v1 + v2
    return (sum, v1 - v2, sum >> 1)
}
let result = calculate(v1: 20, v2: 20)
result.sum
result.difference
result.average
/*
 函数的文档注释
 */

/*
 参数标签
 */
func goToWork(at time: String) {
    print("this time is \(time)")
}
goToWork(at: "10:00")
/*
 默认参数值
 */

func check(name: String = "lisi", age: Int, job: String = "none") {
    print("name = \(name), age = \(age), job = \(job)")
}
check(age: 10)
/*
 可变参数
 */
func sum2(_ nums: Int...) -> Int {
    var total = 0
    for num in nums {
        total += num
    }
    return total
}
print(sum2(10, 10, 10))
 /*
 函数重载
 函数名相同
 参数个数不同/参数类型不同/参数标签不同
 返回值类型与函数重载无关
 */
// 参数个数不同
func sum(v1: Int, v2: Int, v3: Int) -> Int {
    v1 + v2 + v3
}
print(sum(v1: 10, v2: 10, v3: 10))

// 参数标签不同
func sum(a: Int, b: Int) -> Int {
    a + b
}
print(sum(a: 1, b: 1))

/*
 内联函数
 如果开启了编译器优化(Release模式默认会开启优化), 编译器会自动将某些函数变成内联函数
 将函数调用展开成函数体
 */

@inline(never) func test(_ a: Int) {
    // 永远不会被内联
    print("test = \(a)")
}
@inline(__always) func test(b: Int) {
    // 开启了编译器优化, 即使代码很长, 也会被内联(递归函数/动态派发的函数除外)
    print("test = \(b)")
}

/*
 函数类型
 每一个函数都是有类型的, 函数类型由形式参数类型 返回值类型组成
 */

/*
 类型别名
 */
  
typealias Byte = Int8
typealias Date = (year: Int, month: Int, day: Int)

func test(_ date: Date) {
    print("\(date.year)年\(date.month)月\(date.day)日")
}
test((2020, 10, 10))

/*
 嵌套函数
 */
func forward(_ forward: Bool) -> (Int) -> Int {
    func next(_ input: Int) -> Int {
        input + 1
    }
    func previous(_ input: Int) -> Int {
        input - 1
    }
    return forward ? next : previous
}

print(forward(true)(3))
print(forward(false)(3))


//: [Previous](@previous)

//: [Next](@next)
