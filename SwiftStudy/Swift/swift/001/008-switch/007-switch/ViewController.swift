//
//  ViewController.swift
//  007-switch
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo(num: 8)
        demo1()
    }
    func demo(num: Int) {
        switch num {
        case 10,9:
            print("优秀")
        case 8:
            break
        default:
            print("一般")
        }
    }
    func demo1() {
        let point = CGPoint(x: 10, y: 10)
        switch point {
        case let p where p.x == 0 && p.y == 0:
            print("原点")
        case let p where p.x == 0:
            print("Y轴")
        case let p where p.y == 0:
            print("X轴")
        case let p where abs(p.x) == abs(p.y):
            print("对角线")
        default:
            print("其他")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

