//
//  ViewController.swift
//  007-加法计算器
//
//  Created by 今代科技 on 2017/9/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var numText1: UITextField?
    var numText2: UITextField?
    var resultLab: UILabel?
//
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func click() -> () {
        print(#function )
         //将内容转换为数值
        // Int? 如果文本框内容不是数字 inth之后是nil
        guard let num1 = Int(numText1?.text ?? ""),
        let num2 = Int(numText2?.text ?? "") else {
            print("必须输入数字才能计算")
            return
        }
        resultLab?.text = "\(num1 + num2)"
    }
    func setupUI() -> () {
//        let tf1 = UITextField(frame: CGRect(x: 20, y: 64, width: 100, height: 30))
//        tf1.borderStyle = .roundedRect
//        tf1.text = "0"
//        tf1.textAlignment = .center
//        view.addSubview(tf1)
        let tf1 = UITextField(frame: CGRect(x: 20, y: 64, width: 100, height: 30), placeholder: "0", fontSize: 14)
        view.addSubview(tf1)
        
        let l1 = UILabel(frame: CGRect(x: 120, y: 64, width: 20, height: 30))
        
        l1.text = "+"
        l1.textAlignment = .center
        view.addSubview(l1)
        
        let tf2 = UITextField(frame: CGRect(x: 140, y: 64, width: 100, height: 30))
        tf2.borderStyle = .roundedRect
        tf2.text = "0"
        tf2.textAlignment = .center
        view.addSubview(tf2)
        
        let l2 = UILabel(frame: CGRect(x: 240, y: 64, width: 20, height: 30))
        
        l2.text = "="
        l2.textAlignment = .right
        view.addSubview(l2)
        
        let l3 = UILabel(frame: CGRect(x: 260, y: 64, width: 60, height: 30))
        
        l3.text = "0"
        l3.textAlignment = .right
        view.addSubview(l3)
        
        let btn = UIButton(title: "计算")
        btn.center = view.center;
//        btn.addTarget(self, action:#selector(click), for: .touchUpInside)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(btn)
        
        numText1 = tf1
        numText2 = tf2
        resultLab = l3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

