//
//  ViewController.swift
//  005-可选项
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        demo()
        demo1()
    }
    func demo() {
        let x: Optional = 10
        let y: Int? = 20
        print(x)
        print(y)
        print(x!+y!)
    }
    func demo1() {
        let y: Int?
        y = 20
        print(y)
        var x: Int?
        x = 100
        x = 200
        print(x)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

