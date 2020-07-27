//
//  main.swift
//  Switch底层分析
//
//  Created by zainguo on 2020/6/18.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

enum TestEnum: CaseIterable {
    case test1, test2, test3
}
var e = TestEnum.test1
switch e {
case .test1:
    print("test1")
case .test2:
    print("test2")
case .test3:
    print("test3")
}
