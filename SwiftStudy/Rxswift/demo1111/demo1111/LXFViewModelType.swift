//
//  LXFViewModelType.swift
//  demo1111
//
//  Created by gzy on 2019/2/19.
//  Copyright © 2019 gzy. All rights reserved.
//

import Foundation

protocol LXFViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

