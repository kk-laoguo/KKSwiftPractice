//
//  UIButton+extension.swift
//  007-加法计算器
//
//  Created by 今代科技 on 2017/9/24.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
extension UIButton {
    
    convenience init(title: String, color: UIColor = UIColor.darkGray) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.sizeToFit()
    }
}
