//
//  ViewController.swift
//  011-字典
//
//  Created by 今代科技 on 2017/9/11.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        demo1()
//        demo2()
//        demo3()
        demo4()
    }
    //MARK:定义
    func demo1() {
        //key:value
        let dic = ["name":"张三","age":"18"]
        print(dic)
        let arr = [["name":"张三","age":"18"],
                   ["name":"张三","age":"18"]]
        print(arr)
    }
    //MARK:增删改
    func demo2() {
        var dic = ["name":"张三","age":"18"]
        //新增
        dic["title"] = "大哥"
        //修改
        dic["name"] = "大西瓜"
        //删除
        dic.removeValue(forKey: "age")
        //
        print(dic)
        
    }
    //MARK:遍历

    func demo3() {
        let dic = ["name":"张三","age":"18","title":"boss"]
        for e in dic {
            print("\(e.key)  \(e.value)")
        }
        //key value
        for (key, value) in dic {
            print("\(key)  \(value)")
        }
    }
    
    //MARK:合并
    func demo4() {
        var dic1 = ["name":"张三","age":"18","title":"boss"]
        let dic2 = ["name":"李四","height":"1.8"]
        for e in dic2 {
            dic1[e.key] = dic2[e.key]
        }
        print(dic1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

