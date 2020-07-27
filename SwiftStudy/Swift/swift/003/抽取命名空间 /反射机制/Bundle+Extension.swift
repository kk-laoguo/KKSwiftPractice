//
//  Bundle+Extension.swift
//  反射机制
//
//  Created by 今代科技 on 2017/9/28.
//  Copyright © 2017年 GZY. All rights reserved.
//

import Foundation

extension Bundle {
//    func nameSpace() -> String {
////        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//
//    }

    var nameSpace: String {
                return infoDictionary?["CFBundleName"] as? String ?? ""

    }
    
}
