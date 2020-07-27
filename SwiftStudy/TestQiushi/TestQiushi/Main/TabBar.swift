//
//  TabBar.swift
//  TestQiushi
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        print(subviews)

        for button in subviews where button is UIControl {
            var frame = button.frame
            frame.origin.y = -10
            button.frame = frame
        }

    }
}
