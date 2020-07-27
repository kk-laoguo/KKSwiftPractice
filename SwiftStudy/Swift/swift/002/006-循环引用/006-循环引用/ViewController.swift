//
//  ViewController.swift
//  006-循环引用
//
//  Created by 今代科技 on 2017/9/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var completionBack: (()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        //block 中出现self 需要特别小心
        // 循环引用 单方向引用不是产生循环引用
        // - 只是闭包对 self 进行了 copy, 闭包执行完成之后, 会自动销毁, 同时释放对self的引用
        // - 
        // 解除循环引用, 需要打断链条
        // 方法1: oc的方式
//        weak var weakSelf = self
//        loadData {
//            print(weakSelf?.view ?? "111")
//            print(self.view)
//        }
//        方法二: swift推荐方法
//        [weak self] 表示{} 中所有的 self 都是弱引用, 需要注意解包
        
        loadData { [weak self] in
            print(self?.view ?? "222")
        }
        //方法三: swift方法,知道就好
        //[unowned self] 表示{} 中所有的 self 都是assign的, 不会强引用, 但是如果对象释放, 指针地址不会变化, 如果对象被释放, 继续调用, 就会出现野指针
//       相当于 oc的  __unsafe_unretained typeof(self) weakSelf = self;

//        loadData { [unowned self] in
//            print(self.view)
//            
//        }
        
        
    }
    func loadData(completion: @escaping ()->()) -> ()  {
        
        completionBack = completion
        //异步
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3)
            print("耗时操作")
            DispatchQueue.main.async {
                //回调执行闭包
                completion()
            }
        }
    }
    // 类似于oc中的dealloc
    deinit {
        print("我去了")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

