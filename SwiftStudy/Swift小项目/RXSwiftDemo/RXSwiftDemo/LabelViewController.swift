//
//  LabelViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/5.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LabelViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "UILabel用法"
        setupLab()
        testLab()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension LabelViewController {
    func setupLab() {
        
        let label = UILabel()
        label.center = view.center
        label.bounds = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.gray
        view.addSubview(label)
        
        let tf = UITextField(frame: CGRect(x: 50, y: 100, width: view.frame.size.width - 100, height: 50))
        tf.borderStyle = .line
        view.addSubview(tf)
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 50, y: 180, width: 200, height: 30)
        btn.setTitleColor(.magenta, for: .normal)
        btn.setTitle("登录", for:.normal)
        view.addSubview(btn)
        
        let inputOB = tf.rx.text.orEmpty.asDriver().throttle(0.5)
        // 映射一下 ---> 给我们的label
        inputOB.drive(label.rx.text)
        .disposed(by: disposeBag)
        // 还原序列 --> btn的内容
        inputOB.asObservable()
        .bind(to: btn.rx.title())
        .disposed(by: disposeBag)
        
      
        // btn点击事件
        btn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.view.backgroundColor = .lightGray
                print("btn点击了")
            }).disposed(by: disposeBag)

    }
    func testLab() {
        let label = UILabel(frame: CGRect(x: 10, y: 250, width: 200, height: 30))
        view.addSubview(label)
        let timer = Observable<Int>.interval(0.1, scheduler: MainScheduler.instance)
        timer.map {
            String(format: "%0.2d:%0.2d", [($0/60%60),($0%60)])
        }.bind(to: label.rx.text)
        .disposed(by: disposeBag)
        
        
    }
}
