//
//  ViewController.swift
//  005-计算型属性
//
//  Created by 今代科技 on 2017/9/27.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var p = Person()

    override func viewDidLoad() {
        super.viewDidLoad()
        //setter
        p.name = "老王"
        //getter
        print(p.name ?? "333")
        //只读属性
        print(p.title)
        print(p.title2)
        print(p.title3)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        p.name = "么么哒😘"
        print(p.title2)
        print(p.title3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

