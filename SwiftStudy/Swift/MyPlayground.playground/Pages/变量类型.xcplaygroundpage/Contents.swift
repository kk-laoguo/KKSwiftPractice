//: [Previous](@previous)

import Foundation


var avenger = ["Iron man", "Thor", "Black widow"]

avenger.append("Eagle eye")

avenger.remove(at: 2)

avenger[0] = "Captian America"

for av in avenger {
    print(av)
}

/// 排序
let avs2 = avenger.sorted()

for av in avs2 {
    print(av)
}
/// 转换
let avs3 = avenger.map {
    return "123" + $0
}
for av in avs3 {
    print(av)
}



