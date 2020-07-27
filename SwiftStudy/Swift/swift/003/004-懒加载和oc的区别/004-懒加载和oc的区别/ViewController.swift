//
//  ViewController.swift
//  004-懒加载和oc的区别
//
//  Created by 今代科技 on 2017/9/27.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var label: UILabel? = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = "hellow"
        label?.sizeToFit()
        print(label!)
        label = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

