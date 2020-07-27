//
//  UIScrollView+ParallaxHeader.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit



extension UIScrollView {
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.parallaxHeader"
    }
    public var parallaxHeader: ParallaxHeader {
        get {
            if let header = objc_getAssociatedObject(self, &AssociatedKeys.descriptiveName) as? ParallaxHeader {
                return header
            }
            let header = ParallaxHeader()
            self.parallaxHeader = header
            return header
        }
        set(parallaxHeader) {
            parallaxHeader.scrollView = self
            objc_setAssociatedObject(self, AssociatedKeys.descriptiveName, parallaxHeader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
