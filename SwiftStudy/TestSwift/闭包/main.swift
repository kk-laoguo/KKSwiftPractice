//
//  main.swift
//  闭包
//
//  Created by zainguo on 2020/6/19.
//  Copyright © 2020 zainguo. All rights reserve d.
//

import Foundation


func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
    print(fn(v1, v2))
}

exec(v1: 20, v2: 20) {
    $0 + $1
}

