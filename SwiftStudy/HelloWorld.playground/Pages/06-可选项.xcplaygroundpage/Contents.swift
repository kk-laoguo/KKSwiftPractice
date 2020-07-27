//: [Previous](@previous)

import Foundation


var age: Int?
age = 10
print(age)
print("age is\(String(describing: age))")
age = nil

if let num = Int("123") {
    print(num)
} else {
    print("字符串转换失败")
}
if let a = Int("10"),
    let b = Int("20"),
    a < b && b < 100 {
    print("\(a) < \(b) < 100")
}

let strs = ["10", "20", "abc", "-20", "30"]
var index = 0
var sum = 0
while let num = Int(strs[index]), num > 10 {
    sum += num
    index += 1
}

print(sum)

let a: Int? = 1
let b: Int = 2
let c = a ?? b
print(c)
  
// guard 当语句的条件为false时才会执行大括号里面的代码

func login(_ info: [String: String]) {
    
    guard let userName = info["username"] else {
        print("请输入用户名")
        return
    }
    guard let password = info["password"] else {
        print("请输入密码")
        return
    }
    print("用户名: \(userName)", "密码: \(password)")
}

login(["username": "kk", "password": "asddf"])

//: [Previous](@previous)

//: [Next](@next)
