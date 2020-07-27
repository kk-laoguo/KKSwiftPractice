import UIKit

var str = "Hello, playground"

var bullish = false
var btcPrice = 7800

if bullish == true && btcPrice >= 1_0000 {
    print("牛市真的来了")
} else {
    print("熊市漫漫")
}

/// Comparable: 可以比较的
/// 泛型函数
func bigger<T: Comparable>(a: T, b: T) -> T {
    if a > b {
       return a
    } else {
        return b
    }
}
var i = bigger(a: 3, b: 4)
var j = bigger(a: "a", b: "b")
print(i)
print(j)




