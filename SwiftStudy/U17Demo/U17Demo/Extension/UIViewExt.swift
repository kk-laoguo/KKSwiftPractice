//
//  UIViewExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit


extension UIView {
    
    func createPath(bounds: CGRect, cornersRadius: CCornersRadius) -> CGPath {
        let minX = bounds.minX
        let minY = bounds.minY
        let maxX = bounds.maxX
        let maxY = bounds.maxY
        
        let topLeftCenterX = minX + cornersRadius.topLeft
        let topLeftCenterY = minY + cornersRadius.topLeft
        let topRightCenterX = maxX - cornersRadius.topRight
        let topRightCenterY = minY + cornersRadius.topRight
        let bottomLeftCenterX = minX + cornersRadius.bottomLeft
        let bottomLeftCenterY = maxY - cornersRadius.bottomLeft
        let bottomRightCenterX = maxX - cornersRadius.bottomRight
        let bottomRightCenterY = maxY - cornersRadius.bottomRight
        
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: topLeftCenterX, y: topLeftCenterY), radius: cornersRadius.topLeft, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2.0), clockwise: false)
        path.addArc(center: CGPoint(x: topRightCenterX, y: topRightCenterY), radius: cornersRadius.topRight, startAngle: CGFloat(3 * Double.pi / 2.0), endAngle: 0, clockwise: false)
        path.addArc(center: CGPoint(x: bottomRightCenterX, y: bottomRightCenterY), radius: cornersRadius.bottomRight, startAngle: 0, endAngle: CGFloat(Double.pi / 2.0), clockwise: false)
        path.addArc(center: CGPoint(x: bottomLeftCenterX, y: bottomLeftCenterY), radius: cornersRadius.bottomLeft, startAngle: CGFloat(Double.pi / 2.0), endAngle: CGFloat(Double.pi), clockwise: false)
        path.closeSubpath()
        
        return path
    }
    
    var edgeInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return safeAreaInsets
        } else {
            return .zero
        }
    }
}

