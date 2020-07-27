//
//  Car.swift
//  字面量
//
//  Created by zainguo on 2020/7/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

@objcMembers class Car: NSObject {
    var price: Double
    var band: String
    init(price: Double, band: String) {
        self.price = price
        self.band = band
    }
    func run() {
        print(price, band, "run")
    }
    static func run() {
        print("Car run")
    }
}

extension Car {
    func test() {
        print(price, band, "test")
    }
}
