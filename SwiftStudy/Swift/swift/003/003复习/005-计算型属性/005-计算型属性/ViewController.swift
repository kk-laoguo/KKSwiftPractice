//
//  ViewController.swift
//  005-计算型属性
//
//  Created by 今代科技 on 2017/10/15.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var p = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p.title3 = nil
        
//        let p = Person()
        // setter
        p.name = "老王"
        // getter
        print(p.name!)
        // readonly
        print(p.title,p.title2,p.title3)
        
     }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        p.name = "花花"
        print(p.title2)
        print(p.title3)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

