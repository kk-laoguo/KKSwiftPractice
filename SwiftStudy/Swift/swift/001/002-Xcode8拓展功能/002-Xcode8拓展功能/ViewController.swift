//
//  ViewController.swift
//  002-Xcode8拓展功能
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -- 视图声明周期
    //MARK: 视图加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView(frame: CGRect(x: 0, y: 64, width: 200, height: 100))
        v.backgroundColor = UIColor.orange //TODO: 设置新的颜色
           view .addSubview(v)//FIXME: 应该修改我
        
        let iv = UIImageView(image: #imageLiteral(resourceName: "10"))
        iv.image = UIImage(named:("10"))
        v.addSubview(iv)
        
        demo()
        demo1()
        demo2()
        
    }
    func demo(){
        var x = 30
        x = 20
    }
    
    func demo1() {
        let x = 10
        let y = 10.5
        print(Double(x)+y)
        
    }
    func demo2() {
        let x: Double = 10
        let y = 10.5
        print(x+y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

