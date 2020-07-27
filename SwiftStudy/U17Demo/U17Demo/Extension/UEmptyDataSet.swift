//
//  UEmptyDataSet.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

import EmptyDataSet_Swift


extension UIScrollView {
    private struct AssociatedKeys {
        static var uemptyKey: Void?
    }
    var uempty: UEmptyView? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.uemptyKey) as? UEmptyView
        }
        set {
            self.emptyDataSetDelegate = newValue
            self.emptyDataSetSource = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.uemptyKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class UEmptyView: EmptyDataSetSource, EmptyDataSetDelegate {
    var image: UIImage?
    var allowShow: Bool = false
    var verticalOffset: CGFloat = 0
    
    private var tapClosure: (() -> Void)?
    
    init(image: UIImage? = UIImage(named: "nodata"),
         verticalOffset: CGFloat = 0,
         tapClosure: (() -> Void)?) {

        self.image = image
        self.verticalOffset = verticalOffset + (self.image?.size.width ?? 0)/3.0
        self.tapClosure = tapClosure
    }
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        verticalOffset
    }
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        image
    }
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        allowShow
    }
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        guard let tapClosure = tapClosure else { return }
        tapClosure()
    }
    
    
}
