//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/4.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct SectionModel {
    let title: String
    var items: [String]
    
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}

extension SectionModel: AnimatableSectionModelType {
    init(original: SectionModel, items: [String]) {
        self = original
        self.items = items
    }
    
    typealias Identity = String
    var identity: String {
        return title
    }
    
}
    


class MyTableViewCell: UITableViewCell {
    var titleLab: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLab = UILabel(frame: CGRect(x: 15, y: 0, width: contentView.frame.size.width - 30, height: contentView.frame.size.height))
        contentView.addSubview(titleLab!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    let cellHeight = 50
    let texts = ["Objective-C", "Swift", "RXSwift"]
    let controllers = [
        ["LabelViewController",
        "TextFiledViewController",
        "ButtonViewController",
        "TextViewViewController",
        "GestureViewController",
        "DatePickerViewController",
        "PickerViewController"],
        ["CollectionViewController",
        "CollectionViewController"]
    ]
    let dataArray = Observable.just(
        [SectionModel(title: "基本控件", items:
            ["UILable的用法", "UITextField的用法", "UIButton的用法", "UIText的用法", "手势用法","DatePicker用法", "PickerView用法"]),
         SectionModel(title: "高级控件", items:
            ["UITableView的用法", "UICollectionView的用法"])]
    )
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSubviews()
        setupTableViewDataSource()
    }

}
extension ViewController {
    func setupSubviews() {
        
        tableView.rowHeight = CGFloat(cellHeight)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.description())
        //1.创建可观察数据源
        let textObservable = Observable.of(texts)
        //2. 将数据源与 tableView 绑定
        textObservable.bind(to: tableView.rx
            .items(cellIdentifier: MyTableViewCell.description(),
                    cellType: MyTableViewCell.self)) {(row, text, cell) in
                        cell.titleLab?.text = "\(text)"
        }.disposed(by: disposeBag)
        //3. 绑定 tableView 的事件

        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self](index) in
                print(index)
                self?.tableView.isEditing = true
            })
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(String.self)
            .subscribe(onNext: { (text) in
                print("点击了\(text)")
            }).disposed(by: disposeBag);
        
        tableView.rx.itemDeleted
            .subscribe(onNext: { (indexPath) in
                print("删除 \(indexPath)")
            }).disposed(by: disposeBag)
        
        tableView.rx.itemMoved
            .subscribe(onNext: { (sourceIndex, destinationIndex) in
                print("从 \(sourceIndex)移动到 \(destinationIndex)")
            }).disposed(by: disposeBag)
        tableView.rx.itemInserted
            .subscribe(onNext: { (indexPath) in
                print("从 \(indexPath) 插入")

            }).disposed(by: disposeBag)
    }
}

extension ViewController {
    // RxDataSources用法
    func setupTableViewDataSource() {
        
        tableView.delegate = self
        tableView.rowHeight = CGFloat(cellHeight)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.description())
     
        // 创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel>(configureCell: {
            (dataSource, tableView, indexPath, element) -> MyTableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.description()) as? MyTableViewCell
            cell?.textLabel?.text = "\(indexPath.row): \(element)"
            return cell!
        })
        // 设置分区头标题
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].title
        }
        // 数据绑定
//        dataArray.bind(to: tableView.rx.items(                        dataSource: dataSource))
//        .disposed(by: disposeBag)
        dataArray.asDriver(onErrorJustReturn: [])
        .drive(tableView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self](indexPath) in
                
                let controllerStr = self?.controllers[indexPath.section][indexPath.row]
                guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
                    print("命名空间不存在")
                    return
                }
                guard let controllerClass = NSClassFromString(nameSpace + "." + controllerStr!) else {
                    return;
                }
                guard let controllerType = controllerClass as? UIViewController.Type else {
                    return
                }
                let controller = controllerType.init()
                self?.navigationController?.pushViewController(controller, animated: true)
                
            }).disposed(by: disposeBag)
             

    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

