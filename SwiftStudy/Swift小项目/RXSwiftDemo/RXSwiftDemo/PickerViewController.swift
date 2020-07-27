//
//  PickerViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/11.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
class PickerViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    
    private let adapter1 = RxPickerViewStringAdapter<[String]>(
        components: [],
        numberOfComponents: { _, _, _ in 1},
        numberOfRowsInComponent: { (_, _, items, _) -> Int in
        return items.count
    }) { (_, _, items, row, _) -> String? in
        return items[row]
    }
    private let adapter2 = RxPickerViewStringAdapter<[[String]]>(
        components: [],
        numberOfComponents: { (dataSource, pickerView, components) -> Int in
            return components.count
    }, numberOfRowsInComponent: { (_, _, components, component) -> Int in
        return components[component].count
    }) { (_, _, components, row, component) -> String? in
        return components[component][row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.just(["1", "2", "3"])
        .bind(to: pickerView.rx.items(adapter: adapter1))
        .disposed(by: disposeBag)
        
        Observable.just([["1", "2", "3"], ["A", "B", "C"]])
        .bind(to: pickerView2.rx.items(adapter: adapter2))
        .disposed(by: disposeBag)

    }


}
