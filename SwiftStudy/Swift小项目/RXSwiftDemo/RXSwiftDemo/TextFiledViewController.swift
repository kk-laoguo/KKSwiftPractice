//
//  TextFiledViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/6.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TextFiledViewController: UIViewController {

    @IBOutlet weak var accountTf: UITextField!
    @IBOutlet weak var passdwordTf: UITextField!
    @IBOutlet weak var statusLab: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switchBar: UISwitch!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentBar: UISegmentedControl!
    
    @IBOutlet weak var stepBar: UIStepper!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bottomLab: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // textFiled输入状态监听
        accountTf.rx.controlEvent(.editingDidBegin)
        .asObservable()
            .subscribe(onNext: { _ in
                print("开始输入账号")
            }).disposed(by: disposeBag)
        accountTf.rx.controlEvent(.editingDidEnd)
        .asObservable()
            .subscribe(onNext: {
                print("结束")
            }).disposed(by: disposeBag)
        
        // 账号响应结束--->密码响应
        accountTf.rx.controlEvent(.editingDidEnd)
        .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.passdwordTf.becomeFirstResponder()
                
            }).disposed(by: disposeBag)
        
        // 组合
        Observable.combineLatest(accountTf.rx.text.orEmpty, passdwordTf.rx.text.orEmpty) { (account, password) -> String in
            return "你的账号: \(account) 密码: \(password)"
        }
        .map{$0}
        .bind(to: statusLab.rx.text)
        .disposed(by: disposeBag)
        
        
        // UIStepper
        stepBar.rx.value.asObservable()
            .subscribe(onNext: {
                print("UIStepper当前的值：\($0)")
            }).disposed(by: disposeBag)
        
        // 开关响应
        switchBar.rx.isOn.asObservable()
            .subscribe(onNext: { (isOn) in
                print("当前开关的状态:\(isOn)")

            }).disposed(by: disposeBag)
        
        // segmentedControl 响应
        segmentBar.rx.selectedSegmentIndex.asObservable()
            .subscribe(onNext: {
                print("当前选择了\($0)")
            }).disposed(by: disposeBag)
        
        // 绑定菊花和开关
//        switchBar.rx.value.asObservable()
//        .bind(to: activityIndicator.rx.isAnimating)
//        .disposed(by: disposeBag)
        
        switchBar.rx.isOn.asDriver()
        .drive(activityIndicator.rx.isAnimating)
        .disposed(by: disposeBag)
        
        // 滑杆的监控
        slider.rx.value.asObservable()
            .subscribe(onNext: {
                print("当前进度\($0 * 100)")
            }).disposed(by: disposeBag)
        
        
        accountTf.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
        //文本框的变化序列
        let tfInput = accountTf.rx.text.orEmpty.asDriver()
        .throttle(RxTimeInterval.seconds(1))
        
        //将内容绑定到bottomLab
        tfInput.map {
            return "当前输入了+\($0)"
        }.drive(bottomLab.rx.text)
        .disposed(by: disposeBag)
        //将内容绑定到button 但输入超过5个才可以点击
        tfInput.map({
            return $0.count > 5
        }).drive(button.rx.isEnabled)
        .disposed(by: disposeBag)
        
        button.rx.tap.subscribe(onNext: {
            print("button被点击了")
        }).disposed(by: disposeBag)

    }

}
