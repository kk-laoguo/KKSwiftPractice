//
//  NextViewController.swift
//  ThreadTest
//
//  Created by zainguo on 2020/7/14.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UIControl {
    var hidden: Binder<Bool> {
        Binder<Bool>(base) { button, value in
            button.isHidden = value
        }
    }
    var enabled: Binder<Bool> {
        Binder<Bool>(base) { button, value in
            button.isEnabled = value
        }
    }
}


class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let binder = Binder<String>(label) { label, value in
            label.text = value
        }
        let observable = Observable.just(1).map { "赋值:\($0)" }.bind(to: binder)
        

    }

    func test() {
        let observable = Observable<Int>.create { obsever -> Disposable in
            obsever.onNext(11)
            obsever.onNext(12)
            
            return Disposables.create()
        }
        
        observable.subscribe { event in
            switch event {
            case .next(let element):
                print("next", element)
            case .error(let error):
                print("error", error)
            case .completed:
                print("completed")
            }
            
        }.disposed(by: bag)
        observable.subscribe(onNext: { element in
            print("next", element)
            
        }, onError: { error in
            print("error", error)
            
        }, onCompleted: {
            print("completed")
            
        }).disposed(by: bag)
        
        
        //        let observable = Observable<Int>.timer(.seconds(2), period: .seconds(1), scheduler: MainScheduler.instance)
        //        observable.map { "赋值是: \($0)" }.bind(to: label.rx.text)
        
    }
    func test2() {
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: {
            print("button点击了")
            }).disposed(by: bag)
        
    }
    
    
}
