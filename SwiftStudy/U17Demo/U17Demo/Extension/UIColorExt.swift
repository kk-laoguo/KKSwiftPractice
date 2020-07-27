//
//  UIColorExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/17.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:UInt32 ,
                     g:UInt32 ,
                     b:UInt32 ,
                     a:CGFloat = 1.0) {
        
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: a)
    }
    static var random: UIColor {
        
        UIColor(r: arc4random_uniform(256),
                g: arc4random_uniform(256),
                b: arc4random_uniform(256))
    }
    
    static func hex(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 { return UIColor.clear }
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") { cString = String(subString) }
        if cString.hasPrefix("#") { cString = String(subString) }
        
        if cString.count != 6 { return UIColor.clear }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(r: r, g: g, b: b, a: alpha)
    }
}
