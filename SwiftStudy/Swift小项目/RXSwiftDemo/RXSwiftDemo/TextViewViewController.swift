//
//  TextViewViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/9.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TextViewViewController: UIViewController {

    let disposeBag = DisposeBag()
    deinit {
        print("----------->\(self.classForCoder)释放了")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        setupTextView()
    }


}

extension TextViewViewController {
    func setupTextView() {
        let textView = UITextView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        view.addSubview(textView)

        textView.rx.didBeginEditing
            .subscribe(onNext: {
                print("开始编辑")
            }).disposed(by: disposeBag)

        textView.rx.didEndEditing
            .subscribe(onNext: {
                print("结束编辑")
            }).disposed(by: disposeBag)

        textView.rx.didChange
            .subscribe(onNext: {
                print("内容变了")
            }).disposed(by: disposeBag)

        textView.rx.didChangeSelection
            .subscribe(onNext: {
                print("选择内容发生变化")
            }).disposed(by: disposeBag)

    }
}
