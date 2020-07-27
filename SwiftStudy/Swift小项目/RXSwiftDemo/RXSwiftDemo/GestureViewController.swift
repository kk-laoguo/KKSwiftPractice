//
//  GestureViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class GestureViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        
        swipeGesture.rx.event
            .subscribe(onNext: { [weak self] recognizer in
            let point = recognizer.location(in: recognizer.view)
            self?.showMessage(text: "点击了",message: "x:\(point.x) y: \(point.y)")
        })
        .disposed(by: disposeBag)
        
        //另一种写法
//        gesture.rx.event
//            .bind { [weak self] recognizer in
//                //这个点是滑动的起点
//                let point = recognizer.location(in: recognizer.view)
//                self?.showMessage(text: "向上划动", message: "\(point.x) \(point.y)")
//        }
//        .disposed(by: disposeBag)
        
        
    }
    func showMessage(text : String,message:String){
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "😀", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    

  
}
