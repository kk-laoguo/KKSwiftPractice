//
//  ViewController.swift
//  004-GCD
//
//  Created by 今代科技 on 2017/9/13.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func loadData(completion: @escaping (_ success: [String]) -> ()) -> () {
        //将任务添加都队列, 确定执行的函数
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            //休眠
            Thread.sleep(forTimeInterval: 1.0)
            let json = ["1","2","3"]
            //主队列回调
            DispatchQueue.main.async {
                print("主线程更新UI \(Thread.current)")
                completion(json)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

