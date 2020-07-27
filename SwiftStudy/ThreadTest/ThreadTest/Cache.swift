//
//  Cache.swift
//  ThreadTest
//
//  Created by zainguo on 2020/7/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

public struct Cache {
    
     
    private static var data = [String: Any]()
    private static var lock = DispatchSemaphore(value: 1)
    
    private static var lock2 = NSLock()
    private static var lock3 = NSRecursiveLock()

    
    public static func get(_ key: String) -> Any? {
        data[key]
    }
    public static func set(_ key: String, _ value: Any) {
//        lock.wait()
//        defer {
//            lock.signal()
//        }
        
//        lock2.lock()
//        defer {
//            lock2.unlock()
//        }
        
        // 递归锁
        lock3.lock()
        defer {
            lock3.unlock()
        }
        data[key] = value
    }
}
