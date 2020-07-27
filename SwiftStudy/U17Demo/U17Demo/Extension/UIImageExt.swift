//
//  UIImageExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/17.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

extension UIImage {
    /// 创建一个纯色image
    static func imageWithColor(_ imageColor: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(imageColor.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    /// 根据颜色以及size生成image
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: size.width, height: size.height), true, UIScreen.main.scale)
        color.set()
        UIRectFill(CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// view转image
    class func imageWithView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 原图
    func originalImage() -> UIImage {
        self.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}

