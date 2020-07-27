//
//  CollectionViewController.swift
//  RXSwiftDemo
//
//  Created by zainguo on 2019/9/12.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class CollectionViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 70)
        flowLayout.headerReferenceSize = CGSize(width: self.view.bounds.width, height: 40)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.description())
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.description())
        return collectionView
    }()
    
    
    

    override func viewDidLoad() {
        
        let items = Observable.just([
            SectionModel(title: "武警队", items: ["那吾克热", "王八", "八嘎"]),
            SectionModel(title: "热狗队", items: ["功夫胖", "派克特", "刘柏辛"]),
            SectionModel(title: "潘玮柏战队", items: ["ICE", "艾热"])
        ])
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel>(configureCell: {(dataSource, collectionView, indexPath, element)  -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.description(), for: indexPath) as? CollectionCell
            cell?.label.text = element
            return cell!
        })
        dataSource.configureSupplementaryView = {
             (dataSource, collectionView, kind, indexPath) in
            let section = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                          withReuseIdentifier: SectionHeader.description(), for: indexPath) as! SectionHeader
            section.backgroundColor = .magenta
            section.label.text = "\(dataSource[indexPath.section].title)"
            return section

        }
        
        items.asDriver(onErrorJustReturn: [])
        .drive(collectionView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(String.self)
            .subscribe(onNext: { (item) in
                print("为\(item)投上一票")
            }).disposed(by: disposeBag)
        
    }



}


class CollectionCell: UICollectionViewCell {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        label = UILabel(frame: frame)
        label.textColor = .black
        label.textAlignment = .center
        self.contentView.addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SectionHeader: UICollectionReusableView {
    
    
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
        label = UILabel(frame: self.bounds)
        label.textColor = .white
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
}
