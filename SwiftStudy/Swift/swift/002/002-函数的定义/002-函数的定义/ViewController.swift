//
//  ViewController.swift
//  002-函数的定义
//
//  Created by 今代科技 on 2017/9/12.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(sum(x: 10, y: 10))
//        print(sum1(num1: 20, num2: 30))
//        print(sum2(40, 60))
        //测试默认值
        print(sum3())
        print(sum3(x: 10, y: 50))
        print(sum3(x: 10))
        print(sum3(y: 10))
    }
    //MARK: - 函数定义
    /// 函数定义, 格式 函数名(形参列表) -> 返回值类型
    func sum(x: Int, y: Int) -> Int {
        return x + y
    }
    //MARK: - 外部参数
    // - 外部参数就是在 形参前加一个名字
    // - 外部参数不会影响函数内部的细节
    // - 外部参数会让外部调用方 看起来更加的直观
    // - 外部参数如果使用 _ 在外部调用函数时, 会忽略形参的名字
    func sum1(num1 x: Int, num2 y: Int) -> Int {
        return x + y
    }
    
    func sum2(_ x: Int, _ y: Int) -> Int {
        //在swift中 _ 就是忽略任意不感兴趣的内容
        //        for i in 0..<10 {

        for _ in 0..<10 {
            print("hello world")
        }
        return x + y
    }
    //MARK: - 默认值
    func sum3(x: Int = 1, y: Int = 2) -> Int {
        return x + y
    }
    //MARK: - 无返回值 
    /*
     主要用在闭包
     - 直接省略
     - ()
     - void
     
     */
    func demo1() {
        print("哈哈")
    }
    func demo2() -> () {
        print("哈哈")
    }
 
    func demo3() -> Void {
        print("哈哈")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

