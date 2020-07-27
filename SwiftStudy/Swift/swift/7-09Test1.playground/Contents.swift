//: Playground - noun: a place where people can play

import UIKit

func welcome(name: String,  message: String) -> String {
    return message + " " + name
}

welcome(name: "ssss", message : "Hellow")
func gcd(_ a:Int, _ b:Int) -> Int{
    return 0
}
gcd( 4,  12)

func add(_ a:Int,  and  b:Int) -> Int{
    return a+b
}
add(4, and: 2)

//
func swapTwoInts(_ a: inout Int,_ b: inout Int){
    (a,b) = (b,a)
}
var a = 2
var b = 4
swapTwoInts(&a,&b)
a
b


func zywelcome(title: String = "111  ",
               message: String = "hellow",
               name:String = "gzy") -> String{
    return title + "!" + message + "" + name + "!"
}
zywelcome()






