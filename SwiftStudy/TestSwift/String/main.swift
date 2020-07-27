//
//  main.swift
//  String
//
//  Created by zainguo on 2020/7/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation



var str = "12"
// _12
str.insert("_", at: str.startIndex)
// _12_
str.insert("_", at: str.endIndex)
// _12_3_4
str.insert(contentsOf: "3_4", at: str.endIndex)
// _666_12_3_4
str.insert(contentsOf: "666_", at: str.index(after: str.startIndex))
// _666_12_3_888_4
str.insert(contentsOf: "888_", at: str.index(before: str.endIndex))
// _666_hello_12_3_888_4
str.insert(contentsOf: "_hello", at: str.index(str.startIndex, offsetBy: 4))
print(str)
/// 多行字符串
var duoStr = """
1 \"\"\"
 2
  3
"""

print(duoStr)



class Person {
    
}
extension Person {
    private static var AGE_KEY: Bool  = false
    
    var age: Int {
        get {
            objc_getAssociatedObject(self, &Person.AGE_KEY) as! Int
        }
        set {
            objc_setAssociatedObject(self, &Self.AGE_KEY, newValue, .OBJC_ASSOCIATION_ASSIGN)
            
        }
    }
}


enum R {
   
     
}
