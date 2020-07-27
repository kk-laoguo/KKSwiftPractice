//
//  Student.swift
//  008-构造函数
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class Student: Person {

    var num: String
    // 重写 person的 构造函数
    init(name: String, num: String) {
        self.num = num;
        super.init(name: name)
    }
  
//    override init() {
//        print("student init")
//        num = "001"
//        super.init()
//    }
    
}
