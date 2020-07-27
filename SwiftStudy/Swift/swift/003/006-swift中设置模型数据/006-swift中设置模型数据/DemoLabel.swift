//
//  DemoLabel.swift
//  006-swift中设置模型数据
//
//  Created by 今代科技 on 2017/9/27.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {


    // 模型 -> 给视图设置模型, 由视图自己根据模型的数据, 决定显示内容
    var person: Person? {
        
        // 替代oc中 重写 setter方法
        // 区别: 再也不需要考虑 _成员变量 = 值!
        // OC中 如果是 copy 属性, 应该 _成员变量 = 值.copy
        // {} 不是闭包的{} 是属性的特殊写法
        
        didSet {
            text = person?.name
        }
    }
}
