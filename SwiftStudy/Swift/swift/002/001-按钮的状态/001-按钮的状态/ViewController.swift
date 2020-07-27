//
//  ViewController.swift
//  001-按钮的状态
//
//  Created by 今代科技 on 2017/9/12.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(type: .custom)
        btn.setTitle("come on", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

