//
//  UITextField+extension.swift
//  007-加法计算器
//
//  Created by 今代科技 on 2017/9/24.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

extension UITextField {
    convenience init(frame:CGRect, placeholder: String, fontSize: CGFloat = 14) {
        // 实例化当前对象
        self.init()
        self.frame = frame
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
}


