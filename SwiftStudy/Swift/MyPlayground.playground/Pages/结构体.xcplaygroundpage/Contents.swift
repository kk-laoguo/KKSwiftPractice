//: [Previous](@previous)

import Foundation



protocol flyable {
    func takeOff(speed: Int)
}
protocol armed {
    func attack(auto: Bool)
}

struct Human {
    var name = ""
    var age = 0
    var height = 0
   
    func shuoming() -> Void {
        print("\(name)的年龄是\(age)岁, 身高是\(height)cm")
    }
}
var tonyStark = Human(name: "Iron Man", age: 40, height: 188)

tonyStark.shuoming()


extension Human: flyable, armed {
    func takeOff(speed: Int) {
        print("\(name)将时速\(speed)公里起飞")
    }
    func attack(auto: Bool) {
        if auto == false {
            print("开始激光单点射击")
        } else {
            print("AI自动瞄准")
        }
    }
}

tonyStark.takeOff(speed: 300)
tonyStark.attack(auto: true)


//: [Next](@next)
