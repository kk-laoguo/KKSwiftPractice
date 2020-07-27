//
//  Asyncs.swift
//  ThreadTest
//
//  Created by zainguo on 2020/7/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
public typealias Task = () -> Void

public struct Asyncs {
    public static func async(_ task: @escaping Task) {
        _async(task)
        
    }
    public static func async(_ task: @escaping Task,
                             _ mainTask: Task? = nil) {
        _async(task, mainTask)
        
    }
    private static func _async(_ task: @escaping Task,
                               _ mainTask: Task? = nil) {
        
        let item = DispatchWorkItem(block: task)
        DispatchQueue.global().async(execute: item)
        if let main = mainTask {
            item.notify(queue: DispatchQueue.main, execute: main)
        }
    }
    
    
    @discardableResult
    public static func delay(_ seconds: Double,
                             _ block: @escaping Task) -> DispatchWorkItem {
        
        let item = DispatchWorkItem(block: block)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds,
                                      execute: item)
        
        return item
    }
    
    @discardableResult
    public static func asyncDelay(_ seconds: Double,
                                  _ task: @escaping Task) -> DispatchWorkItem {
        
        
        return _asyncDelay(seconds, task)
    }
    
    @discardableResult
    public static func asyncDelay(_ seconds: Double,
                                  _ task: @escaping Task,
                                  _ mainTask: Task? = nil) -> DispatchWorkItem {

        
        return _asyncDelay(seconds, task, mainTask)
    }
    private static func _asyncDelay(_ seconds: Double,
                                   _ task: @escaping Task,
                                   _ mainTask: Task? = nil) -> DispatchWorkItem {
        
        let item = DispatchWorkItem(block: task)
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + seconds,
                                      execute: item)
        if let main = mainTask {
            item.notify(queue: DispatchQueue.main, execute: main)
        }
        return item
    }
}
