//
//  ViewController.swift
//  006-设置模型数据
//
//  Created by 今代科技 on 2017/10/15.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = Person()
        p.name = "小米"
        let label = DemoLabel(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        view.addSubview(label)
        label.person = p
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

