//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by zainguo on 2019/11/15.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let error = NSError(domain: "", code: 900, userInfo: nil)
    var count = 1 // 外界变量控制流程

    
    @objc dynamic var nameStr: String = "kvo_test"
    

    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupButton()
        setupTextFiled()
        setupScrollView()
        setupKVO()
        setupNotification()
        setupGestureRecognizer()
//        setupTimer()
        setupMap()
        setupFilter()
        
        // 1: 创建序列
        _ = Observable<String>.create({ (observer) -> Disposable in
            // 3:发送信号
            observer.onNext("发送信号xxx")
            return Disposables.create()
            // 2: 订阅序列
        }).subscribe(onNext: { (text) in
            print("订阅到: \(text)")
        })
        
        
        print("********emty********")
        _ = Observable<Int>.empty()
            .subscribe(onNext: { (number) in
                print("订阅:",number)

            }, onError: { (error) in
                print("error:",error)

            }, onCompleted: {
                print("完成回调")
            }) {
                print("释放回调")
        }
        
        
        print("*****combineLatest*****")
        // 监听的最新的元素, 覆盖之前的
        let stringSub = PublishSubject<String>()
        let intSub = PublishSubject<Int>()
        
        Observable.combineLatest(stringSub, intSub) { strElement, intElement in
            "\(strElement) + \(intElement)"
        }.subscribe(onNext: {
            print($0)
            }).disposed(by: disposeBag)
        
        stringSub.onNext("Zain")
        stringSub.onNext("Guo")
        
        intSub.onNext(1)
        intSub.onNext(2)
        stringSub.onNext("NB")
        
        print("*****switchLatest*****")
        
        let switchLatestSub1 = BehaviorSubject(value: "Z")
        let switchLatestSub2 = BehaviorSubject(value: "A")
        let switchLatestSub = BehaviorSubject(value: switchLatestSub1)
        switchLatestSub.asObserver()
            .switchLatest()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        switchLatestSub1.onNext("1")
        switchLatestSub1.onNext("11")
        switchLatestSub2.onNext("22")
        switchLatestSub2.onNext("33")
        switchLatestSub.onNext(switchLatestSub2)
        switchLatestSub1.onNext("111111")
        switchLatestSub1.onNext("GGGGG")
        switchLatestSub2.onNext("KKKKK")
        
        print("*****map*****")
        let ofOb = Observable.of(1,2,3,4)
        ofOb.map { (number) -> Int in
            return number + 2
        }.subscribe(onNext: { (num) in
            print(num)
        }).disposed(by: disposeBag)

        
        print("*****scan*****")
        
        Observable.of(10, 100, 1000)
            .scan(2) { (aggregateValue, newValue)  in
                aggregateValue + newValue
        }.subscribe(onNext: {
            print($0)
            }).disposed(by: disposeBag)
        
        print("*****filter*****")
        Observable.of(1,2,3,4,5,6,7,8,9,0)
            .filter { $0 % 2 == 0 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("*****elementAt*****")

        Observable.of("Zain", "guo", "aa")
        .elementAt(2)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
        print("*****single*****")
        
        // 只发出可观察序列发出的第一个元素(或满足条件的第一个元素)。如果可观察序列发出多个元素，将抛出一个错误。
        Observable.of("Zain", "Guo", "ssss")
            .single { $0 == "Guo" }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        print("*****take*****")
        
        Observable.of("Zain", "Kody", "CC")
        .take(1)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
        print("*****takeLast*****")
        
        Observable.of("Z", "x", "C", "v", "b")
        .takeLast(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
        print("*****takeWhile*****")
        Observable.of(1, 2, 3, 4, 5, 6)
            .takeWhile { $0 < 3 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        print("*****takeUntil*****")

        let sourceSequence = PublishSubject<String>()
        let referenceSequence = PublishSubject<String>()
        sourceSequence.takeUntil(referenceSequence)
            .subscribe{ print($0) }
            .disposed(by: disposeBag)
        
        sourceSequence.onNext("Zain")
        sourceSequence.onNext("Guo")
        referenceSequence.onNext("XXX")// 条件一出来,下面就走不了
        sourceSequence.onNext("111")
        sourceSequence.onNext("222")
        
        print("*****skip*****")
        Observable.of(1,2,3,4,5,6)
        .skip(2)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        print("*****skipWhile*****")
        Observable.of(1,2,3,4,5,6)
            .skipWhile { $0 < 4 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)

        print("*****skipUntil*****")
        let sourceSeq = PublishSubject<Int>()
        let referenceSeq = PublishSubject<Int>()
        
        sourceSeq.skipUntil(referenceSeq)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        // 没有条件命令 下面走不了
        sourceSeq.onNext(1)
        sourceSeq.onNext(2)
        sourceSeq.onNext(3)
        referenceSeq.onNext(10) // 条件一出来,下面就可以走了
        sourceSeq.onNext(4)
        sourceSeq.onNext(5)
        
        
        // 集合控制操作符
        
        print("*****toArray*****")
        
        Observable.range(start: 1, count: 10)
            .toArray()
            .subscribe { print($0) }
            .disposed(by: disposeBag)

        print("*****reduce*****")
        
        Observable.of(10, 100, 1000)
        .reduce(2, accumulator: + )
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        
        print("*****concat*****")
        let sub1 = BehaviorSubject(value: 1)
        let sub2 = BehaviorSubject(value: 2)
        
        let resSub = BehaviorSubject(value: sub1)
        
        resSub.asObserver()
            .concat()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        sub1.onNext(10)
        sub1.onNext(100)
        
        resSub.onNext(sub2)
        // 打印不出来
        sub2.onNext(20)
        
        sub2.onNext(200)
        sub1.onCompleted()// 必须要等subject1 完成了才能订阅到! 用来控制顺序 网络数据的异步
        sub2.onNext(30)
        
        print("*****catchErrorJustReturn*****")
        
        let sequenceThatFails = PublishSubject<String>()
        sequenceThatFails.catchErrorJustReturn("zain guo")
            .subscribe { print($0) }
        .disposed(by: disposeBag)
        
        sequenceThatFails.onNext("oooo")
        sequenceThatFails.onNext("事实上")
        
        
        sequenceThatFails.onError(error)
        
        print("*****catchError*****")
        let recoverySequence = PublishSubject<String>()
        sequenceThatFails.catchError {
            print($0)
            return recoverySequence
            
        }.subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
        sequenceThatFails.onNext("Zain")
        sequenceThatFails.onNext("Guo")
        sequenceThatFails.onError(error)
        
        recoverySequence.onNext("hello Error")
        
        print("*****retry*****")
        
        let sequenceRetryErrors = Observable<String>.create { [weak self](observer) -> Disposable in
            observer.onNext("Zain")
            observer.onNext("Guo")
            observer.onCompleted()

            if self!.count == 1 {
                observer.onError(self!.error)
                print("错误序列来了")
                self!.count += 1
            }
            return Disposables.create()
        }
        
        sequenceRetryErrors.retry()
            .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
        print("*****retry(_:)*****")

        let sequenceRetryErrors2 = Observable<String>.create { [weak self](observer) -> Disposable in
            observer.onNext("Zain")
            observer.onNext("Guo")
            
            if self!.count < 5 {
                observer.onError(self!.error)
                print("错误序列来了")
                self!.count += 1
            }
            observer.onNext("La")
            observer.onNext("小雁子")
            observer.onNext("婷婷")
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        sequenceRetryErrors2.retry(3)
        .debug()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
        print("*****RxSwift.Resources.total*****")

        
        

        
        

        
        
        

        


        


        

        
    }
    @objc func buttonClick() {
        print("buttonClick")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameStr = "张三"
    }
}


extension ViewController {
    
   
    
    func setupButton() {
        // button点击事件
        // 传统方式:
        // self.button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.button.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.view.backgroundColor = UIColor.magenta
            }).disposed(by: disposeBag)
    }
    
    func setupTextFiled() {
//        self.textField.rx.text.subscribe(onNext: { (text) in
//            print(text ?? "")
//        }).disposed(by: disposeBag)
        textField.rx.text.orEmpty
            .subscribe(onNext: { (text) in
                print("监听到了 - \(text)")
            }).disposed(by: disposeBag)
        
        textField.rx.text.asDriver()
            .filter{ $0!.count > 0 }
            .drive(button.rx.title())
            .disposed(by: disposeBag)
    }
    
    func setupScrollView() {
        self.tableView.rx.contentOffset.subscribe(onNext: { [weak self](content) in
            self?.view.backgroundColor = UIColor(red: content.y/255.0 * 0.8, green: content.y/255.0 * 0.3, blue: content.y/255.0 * 0.6, alpha: 1)
            print(content)
            }).disposed(by: disposeBag)
        
    }
    func setupKVO() {
//        self.addObserver(self, forKeyPath: "nameStr", options: [.new, .old], context: nil)
        rx.observeWeakly(String.self, "nameStr").subscribe(onNext: { (change) in
            
            print(change ?? "")
            
            }).disposed(by: disposeBag)
        
    }
    func setupNotification() {
        
        NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillHideNotification)
            .subscribe { (event) in
                print(event)
        }.disposed(by: disposeBag)
    }
    
    func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer()
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        tap.rx.event.subscribe(onNext: { (gesture) in
            print("点了label")
        }).disposed(by: disposeBag)
        
    }
    func setupTimer() {
        let timer = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        timer.subscribe(onNext: { (num) in
            print("timer:  \(num)")

            }).disposed(by: disposeBag)
    }
    
    func setupMap() {
        _ = textField.rx.text
            .map({ (value) -> UIColor in
            if let value = value, value.count > 5 {
                return UIColor.cyan
            } else {
                return UIColor.green
            }
        }).subscribe(onNext: { [weak self] in
            self?.textField.textColor = $0
            }).disposed(by: disposeBag)
        
    }
    
    func setupFilter() {
          _ = textField.rx.text.filter({ (value) -> Bool in
            if let value = value, value.count > 3 {
                return true
            }
            return false
          }).subscribe(onNext: { print("filter + \($0!)") } ).disposed(by: disposeBag)
    }
    
}

