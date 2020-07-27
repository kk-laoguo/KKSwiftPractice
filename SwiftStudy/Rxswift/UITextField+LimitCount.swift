//
//  UITextField+LimitCount.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit
private var kLimitCount: String = ""
extension UITextField {
    var limitCount : Int? {
        get{
            return objc_getAssociatedObject(self, &kLimitCount) as? Int
        }
        set{
            objc_setAssociatedObject(self, &kLimitCount, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            addTarget(self, action: #selector(changeText(textField:)), for: .editingChanged)
        }
    }
    
    @objc func changeText(textField : UITextField) -> Void {
        guard let toBeString = textField.text ,let limitCount = limitCount else {
            return
        }
        // 键盘输入模式
        let lang = textField.textInputMode?.primaryLanguage;
        if lang == "zh-Hans" {
            // 简体中文输入，包括简体拼音，健体五笔，简体手写
            let selectedRange = textField.markedTextRange
            if selectedRange == nil {
                if toBeString.count > limitCount {
                    let stringIndex = toBeString.index(toBeString.startIndex, offsetBy: limitCount)
                    textField.text = String(toBeString[..<stringIndex])
                }
            }
        } else {
            if toBeString.count > limitCount {
                let stringIndex = toBeString.index(toBeString.startIndex, offsetBy: limitCount)
                textField.text = String(toBeString[..<stringIndex])
            }
        }
    }
}
