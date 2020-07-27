//
//  Log.swift
//  字面量
//
//  Created by zainguo on 2020/7/11.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
func log<T>(_ msg: T,
            file: NSString = #file,
            line: Int = #line,
            fn: String = #function) {
    #warning("TODO")
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
    print(prefix, msg)
    #endif
}

//func tet() {
//    print(#file, #line, #function)
//}


