//
//  Gloal.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit
import Then


import Reusable

///====================Color====================///

let backgroundColor = UIColor(r: 242, g: 242, b: 242)
let themeColor = UIColor(r: 27, g: 221, b: 142)

///====================Size====================///
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


func kLog<T>(_ message: T,
             file: NSString = #file,
             function: String = #function,
             line: Int = #line) {
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let date = Date()
    let dateString = dateFormatter.string(from: date)
    print("\(fileName):(\(line)) 时间:\(dateString)-\(message)")
    #endif
}

func getDateBytimeStamp(_ timeStamp: Int) -> String {
    // 转换为时间
    let timeInterVal: TimeInterval = TimeInterval(timeStamp)
    let date = NSDate(timeIntervalSince1970: timeInterVal)
    // 格式化输出
    let datefortter = DateFormatter()
    datefortter.dateFormat = "yyyy-MM-dd"
    let dateStr = datefortter.string(from: date as Date)
    return dateStr

}


typealias CCornersRadius = (topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat)



var topController: UIViewController? {
    var res: UIViewController?
    
    res = _getVisibleController(UIApplication.shared.keyWindow?.rootViewController)
    while res?.presentedViewController != nil {
        res = _getVisibleController(res?.presentedViewController)
    }
    return res
}


private func _getVisibleController(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _getVisibleController((vc as? UINavigationController)?.topViewController)
    } else if vc is UITableViewController {
        return _getVisibleController((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

extension UICollectionView {
    
    func reloadData(animation: Bool = true) {
        if animation {
            reloadData()
        } else {
            UIView.performWithoutAnimation {
                reloadData()
            }
        }
    }
}


extension ConstraintView {
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
    
}



var isIphoneX: Bool {
    return UI_USER_INTERFACE_IDIOM() == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
            || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896)
}
