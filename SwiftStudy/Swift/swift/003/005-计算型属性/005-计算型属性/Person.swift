
//
//  Person.swift
//  005-计算型属性
//
//  Created by 今代科技 on 2017/9/27.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class Person: NSObject {

    private var _name: String?
    
    var name: String? {
        get {
            // 返回_成员变量
            return _name
            
        }
        set {
            // 使用_成员变量记录值
            _name = newValue
        }
    }
    
    // 只读属性
    var title: String {
        get {
            return "heollow" + (name ?? "")
        }
    }
    // 只读属性简写
    // 又称为计算型属性 -> 本身不保存内容, 都是通过计算获得结果
    var title2: String {
        print("计算内容")
        return "xxxx" + (name ?? "")
    }
    // 懒加载的 title本质是一个闭包
    
    lazy var title3: String = {
        return "lazy\( (self.name ?? ""))"
    }()
    
}
