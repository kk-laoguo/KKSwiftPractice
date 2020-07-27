//
//  ViewController.swift
//  009-KVC
//
//  Created by 今代科技 on 2017/9/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = Person(dic: ["name": "老王" as AnyObject,"age":"18" as AnyObject,"title":"Boss" as AnyObject])
        print("\(p.name ?? "11") \(p.age) \(p.title ?? "")")
        
        // 如果子类没有重写父类的方法,
        let s = Student(dic: ["name": "老王" as AnyObject,"age":"18" as AnyObject,"title":"Boss" as AnyObject, "num":"0001" as AnyObject,"xxx":"ss" as AnyObject])
        print("\(s.name ?? "11") \(s.age) \(s.title ?? "") \(s.num ?? "000")")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

