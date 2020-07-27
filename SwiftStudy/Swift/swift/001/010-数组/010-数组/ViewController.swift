//
//  ViewController.swift
//  010-数组
//
//  Created by 今代科技 on 2017/9/11.
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
    //MARK:数组的容量
    func demo() {
        //定义一个数组, 指定类型 存放int类型 但是没有初始化
//        var arr: [Int]
        //给数组初始化
//        arr = [Int]()
//        arr .append(1)
        //==上面2句
        var arr = [Int]()
        print("初始容量\(arr.capacity)")

        for i in 0..<8 {
            arr.append(i)
            print("\(arr)|容量\(arr.capacity)")
        }
        
        
    }
    //MARK:数组的定义
    func demo1() ->() {
        let arr = ["周三","李四"]
        print(arr)
        let point = CGPoint(x: 10, y: 10)
        let arr1 = [point]
        print(arr1)
        //混合数组
        let arr2 = ["张三", 1,point] as [Any]
        print(arr2)
    }
    //MARK:数组的遍历
    func demo2() {
        let arr = ["周三","李四"]
        //1:下标遍历
        for i in 0..<arr.count {
            print(arr[i])
        }
        //2:for in 遍历元素
        for s in arr {
            print(s)
        }
        //3: enum block 遍历:同时遍历下标和内容
        //元祖
        for e in arr.enumerated() {
            print("\(e.offset)\(e.element)")
        }
        //4: 遍历:同时遍历下标和内容 2
        //n: 索引下标 s: 数组里面的元素
        for (n, s) in arr.enumerated() {
            print("\(n)\(s)")
        }
        //5: 反序遍历
        for s in arr.reversed() {
            print(s)
        }
        //6: 反序遍历索引&内容 
        //索引&内容不一致
        for (n, s) in arr.reversed().enumerated() {
            print("\(n)\(s)")
        }
        //先遍历在反序
        //正确的反序列
        for (n, s) in arr.enumerated().reversed() {
            print("\(n)\(s)")
        }
        
    }
    //MARK: -- 数组的增删改
    func demo3() -> () {
        var arr = ["张三","小敏","小孩"]
        //追加元素
        arr.append("老王")
        print(arr)
        //修改
        arr[0] = "小王"
        print(arr)
        //删除
        arr.remove(at: 0)
        print(arr)
        //删除全部, 并且保留空间
        arr.removeAll(keepingCapacity: true)
        print("\(arr)\(arr.capacity)")
        
        
    }
    //MARK: -- 数组的合并, 合并的数组类型必须一样
    func demo4() -> () {
        var arr1 = ["张三","小敏","小孩"]
        let arr2 = ["1","2"]
        arr1 += arr2
        print(arr1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

