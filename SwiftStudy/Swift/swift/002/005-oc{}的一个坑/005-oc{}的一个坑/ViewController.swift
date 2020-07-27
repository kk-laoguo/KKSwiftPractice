//
//  ViewController.swift
//  005-oc{}的一个坑
//
//  Created by 今代科技 on 2017/9/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        view.addSubview(label);
        //(label)参数结束 {尾随闭包}
//        {
//            let label = UILabel()
//            view.addSubview(label)
//        }
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

