//
//  ButtonViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/5.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift



class ButtonViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var switchBar: UISwitch!
    
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupButton()
    }
    
}

extension ButtonViewController {
    func setupButton() {
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.showMessage(text: "按钮被点击啦")
        }).disposed(by: disposeBag)
        button1.rx.tap.subscribe(onNext: { [weak self] in
            self?.showMessage(text: "按钮button1被点击啦")
        }).disposed(by: disposeBag)
        
        button2.rx.tap.subscribe(onNext: { [weak self] in
            self?.showMessage(text: "按钮button2被点击啦")
        }).disposed(by: disposeBag)
        button3.rx.tap.subscribe(onNext: { [weak self] in
            self?.showMessage(text: "按钮button3被点击啦")
        }).disposed(by: disposeBag)
        
        let timer = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            
        timer.map{
            "\($0)"
        }
        .bind(to: button.rx.title(for: .normal))
        .disposed(by: disposeBag)
        
        let timer2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        
        timer2.map{
            let imageName = ($0 % 2 == 0 ? "navBack1":"navBack3")
            return UIImage.init(named: imageName)!
        }.bind(to: button.rx.image())
        .disposed(by: disposeBag)
        
        button1.isSelected = true
        //创建一个可观察序列，它可以发送最后一次点击的按钮（也就是我们需要选中的按钮）
        
        switchBar.rx.isOn.bind(to: button1.rx.isEnabled)
        .disposed(by: disposeBag)
        
        switchBar.rx.isOn.asObservable()
            .subscribe(onNext: { [weak self] in
                print("开关状态:\($0)")
                self?.button2.isEnabled = $0

            }).disposed(by: disposeBag)
        
    }
    func showMessage(text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "😯", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
