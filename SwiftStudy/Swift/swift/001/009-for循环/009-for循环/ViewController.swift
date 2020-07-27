//
//  ViewController.swift
//  009-for循环
//
//  Created by 今代科技 on 2017/9/10.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        demo()
//        demo1()
//        demo2()
//        demo3()
        demo4()
        
    }
    //MARK: -- 字符转的遍历
    func demo()  {
        let str: String = "gzy"
        for char in str.characters {
            print(char)
        }
        
    }
    func demo1() {
        let str = "hello world你好"
        //返回指定指定编码的字节数量
        // UTF8的编码 (0-4个) 一个汉字三个字节
        print(str.lengthOfBytes(using: .utf8))
        //获取字符串长度
        print(str.characters.count)
        //使用NSString中转
        /**
         str as NSString
         swift 中可以使用  "值" as 类型 转化
         */
        
        let ocStr = str as NSString
        print(ocStr.length)
    }
    //拼接字符串
    func demo2() {
        let name = "老王"
        let age = 10
        let str = "\(name)\(age)"
        print(str)
        
        let title: String? = "boss"
        let str1 = "\(name)\(title ?? "")"
        let point = CGPoint(x: 100, y: 100)
        let str2 = "\(name)\(age)\(title ?? "")\(point))"
        print(str1)
        print(str2)
    }
    //MARK: 格式化
    func demo3() -> () {
        let h = 4
        let m = 20
        let s = 60
        //格式化
        let dateStr = "\(h):\(m):\(s)"
        print(dateStr)
        //使用格式字符串格式化
        let dateStr1 = String(format: "%02d:%02d:%02d" , h,m,s)
        print(dateStr1)
    }
    //MARK: - 字符串的子串
    func demo4() -> () {
        //建议一般使用NSString作为中转, 因为swift取子串的方法一直在优化
        let str = "我们一起区分"
        let ocStr = str as NSString
        let s1 = ocStr.substring(with: NSMakeRange(2, 3))
        print(s1)
        //2. string的方法 3.0方法
        //let r = 0..<5
        //startIndex = position == 0
        print(str.startIndex)
        //endIndex = position == str.length
        print(str.endIndex)
        print(str.characters.count)
        let s2 = str.substring(from: "我们".endIndex)
        print(s2)
        let s3 = str.substring(from: "abc".endIndex)
        print(s3)
        //取字符串的范围
        guard let range = str.range(of: "一起") else {
            print("没有找到")
            return
        }
        //一定找到的范围
        print(range)
        print(str.substring(with: range))
        
//        str.substring(with: <#T##Range<String.Index>#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

