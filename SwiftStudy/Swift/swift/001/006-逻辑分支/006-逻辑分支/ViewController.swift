//
//  ViewController.swift
//  006-逻辑分支
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo1()
    }
    func demo() {
        let x = 10
        if x > 5 {
            print("大了")
        }
        else {
            print("小了")
        }
    }
    func demo1() {
        let x = 3
        x > 5 ? print("大了") : print("小了")
        x > 5 ? print("大了") : ()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

