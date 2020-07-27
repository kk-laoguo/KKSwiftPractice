//
//  ViewController.swift
//  ThreadTest
//
//  Created by zainguo on 2020/7/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit


fileprivate var initTask: Void = {
    print("init-------")
}()

class ViewController: UIViewController {

    private var item: DispatchWorkItem?
    // 懒加载
    static var age: Int = {
        print(1000)
        return 0
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gcd_test()
        
        print(Self.age)
        print(Self.age)
        print(Self.age)

        
        Asyncs.async({
            print(1, Thread.current)
        }) {
            print(2, Thread.current)
        }
        let time = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: time) {
            print(111)
        }
        
       item = Asyncs.asyncDelay(3.0, {
            print(222)

        }) {
            print(333)
         }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        item?.cancel()
    }
    
    
    @IBAction func nextController(_ sender: Any) {
    
        navigationController?.pushViewController(NextViewController(), animated: true)
        
    }
    
}


extension ViewController {
    // gcd
    func gcd_test() {
        print(Thread.current)

        DispatchQueue.global().async {
            print(Thread.current)
        }
    }
}

struct MJ<Base>  {
    var base: Base
    init(_ base: Base) {
        self.base = base
    }
    //        var numberCount: Int {
    //            var count = 0
    //            for c in str where ("0"..."9").contains(c) {
    //                count += 1
    //            }
    //            return count
    //        }
    
}
extension String {

    var mj: MJ<String> {
        return MJ(self)
    }
    static var mj: MJ<String>.Type {
        MJ<String>.self
    }
    
}

extension MJ where Base == String {
    var numberCount: Int {
        var count = 0
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
    static func test() {
        
    }
    
}


//String.mj.test()

protocol MJCompatible {
    
}

extension MJCompatible {
    var mj: MJ<Self>  {
       
        set {}
        get { MJ(self) }
    }
    static var mj: MJ<Self>.Type {
        set {}
        get { MJ<Self>.self }
    }
}

class Person {
    
}
extension Person: MJCompatible {
    
}
