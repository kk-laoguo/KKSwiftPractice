//
//  DatePickerViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class DatePickerViewController: UIViewController {

    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBOutlet weak var startBtn: UIButton!
    
    // 剩余时间
    let leftTime = BehaviorRelay(value: TimeInterval(180))
    // 当前倒计时是否结束
    let countDownStopped = BehaviorRelay(value: true)
    lazy var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy年MM月dd日 HH:mm"
        return formater
    }()
    let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        datePicker.rx.date
        .map{ [weak self] in
            "选中的时间:" + self!.dateFormater.string(from: $0)
        }.bind(to: lab.rx.text)
        .disposed(by: disposeBag)
        
        // 倒计时
        // 双向绑定
        DispatchQueue.main.async {
            self.leftTime.asObservable()
            .bind(to: self.timerPicker.rx.countDownDuration)
            .disposed(by: self.disposeBag)
        }
        Observable.combineLatest(leftTime.asObservable(), countDownStopped.asObservable()) {leftTimeVlaue, countDownStoppedValue -> String in

            if countDownStoppedValue {
                return "开始"
            } else {
                return "倒计时开始，还有 \(Int(leftTimeVlaue)) 秒..."
            }
        }.bind(to: startBtn.rx.title())
        .disposed(by: disposeBag)
        
        // 倒计时开始不能点击按钮和时间选择
        countDownStopped.asDriver()
        .drive(timerPicker.rx.isEnabled)
        .disposed(by: disposeBag)
        
        countDownStopped.asDriver()
        .drive(startBtn.rx.isEnabled)
        .disposed(by: disposeBag)
        
        startBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.startClick()
        }).disposed(by: disposeBag)

        
        

    }
    func startClick() {
        self.countDownStopped.accept(false)
        // 创建一个计时器
        Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .takeUntil(countDownStopped.asObservable().filter({ $0 }))
            .subscribe(onNext: { event in
                self.leftTime.accept(self.leftTime.value - 1)
                if self.leftTime.value == 0 {
                    self.countDownStopped.accept(true)
                    self.leftTime.accept(180)
                }
            }).disposed(by: disposeBag)
        
        
        
    }


   

}
