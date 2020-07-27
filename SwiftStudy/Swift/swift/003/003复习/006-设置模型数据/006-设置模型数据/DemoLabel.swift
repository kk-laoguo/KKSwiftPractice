//
//  DemoLabel.swift
//  006-设置模型数据
//
//  Created by 今代科技 on 2017/10/15.
//  Copyright © 2017年 GZY. All rights reserved.
//
import UIKit

class DemoLabel: UILabel {
    // 模型 -> 给视图设置模型,由视图自己根据模型的数据显示内容
    var person: Person? {
        // 就是替代 oc中 重写setter方法
        // 区别: 再也不用考虑 _成员变量 = 值!
        // oc中如果是copy 属性, 应该 _成员变量 = 值.copy
        didSet {
            text = person?.name
        }
    }
}
