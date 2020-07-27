//
//  ViewController.swift
//  011-加载百度
//
//  Created by 今代科技 on 2017/9/20.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p = Person(name: "老王", age: 10)
        print(p?.name ?? "")
        
        
        let url = URL(string: "http://www.baidu.com")
        //发起数据请求
        //
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            
//            if (error != nil) {
//                print("网络请求失败")
//                return
//            }
            // 将data转为sting
            //            let html = String(data: data!, encoding: .utf8)
            guard let data = data else {
                print("网络请求失败")
                print(error ?? "")
                return
            }
            // 将data转为sting
            let html = String(data: data, encoding: .utf8)
            
            print(html!)
            
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

