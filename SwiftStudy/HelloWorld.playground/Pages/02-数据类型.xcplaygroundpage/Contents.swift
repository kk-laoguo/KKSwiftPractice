//: [Previous](@previous)

import Foundation

/*:
 #### 常量
 - 只能赋值一次
 - 它的值不要求在编译时期确定, 但使用之前必须赋值一次
 */
let age = 10
let a: Int
a = 10

 
var num = 10
num += 10
num += 10
let b = num

//print(Int32.max)

// 元组
let error = (404, "Not Found")
error.0
error.1

let (code, message) = error
print("code: \(code) message: \(message)")


let httpStatue = (code: 404, description: "Not Found")





//: [Previous](@previous)

//: [Next](@next)
