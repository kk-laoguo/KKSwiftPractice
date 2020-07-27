//
//  BookCollectionVC.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class BookCollectionVC: BaseViewController {

    private var collectList = [favModel]()
    private lazy var collectionView: UICollectionView = {
        let layout = UCollectionViewSectionBackgroundLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let width = floor(Double(screenWidth - 40.0) / 3.0)
        layout.itemSize = CGSize(width: width, height: width * 1.75)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(cellType: ComicCollectionViewCell.self)
        collectionView.uHead = URefreshHeader { [weak self] in
            self?.setupLoadData()
        }
        collectionView.uempty = UEmptyView { [weak self] in self?.setupLoadData() }
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadData()
    }
    override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(80)
        }
        
    }
    private func setupLoadData() {
        ApiLoadingProvider.request(Api.myFav, model: favListModel.self) { (response) in
            
            self.collectionView.uHead.endRefreshing()
            self.collectionView.uempty?.allowShow = true
            self.collectList = response?.favList ?? []
            // 冒泡排序 把最近读过的排前面
            self.bubbleSort()
            // 添加一个默认ITEM，只响应点击
            self.collectList.append(favModel())
            self.collectList.append(favModel())
            self.collectList.append(favModel())
            self.collectList.append(favModel())
            self.collectList.append(favModel())

            self.collectionView.reloadData()
        }
        
    }
    func bubbleSort() {
        // 冒泡排序 把最近读过的排前面
        for i in 0..<self.collectList.count {
            for j in i+1..<self.collectList.count {
                let model_i: favModel? = self.collectList[i]
                let model_j: favModel? = self.collectList[j]
                let sort_i = model_i?.sort ?? 0
                let sort_j = model_j?.sort ?? 0
                if sort_i > sort_j {
                    let temp: favModel? = self.collectList[j]
                    self.collectList[j] = self.collectList[i]
                    self.collectList[i] = temp!
                }

            }
        }

    }
}

extension BookCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ComicCollectionViewCell.self)
        cell.cellStyle = .withTitleAndDesc
        cell.bookModel = collectList[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == collectList.count - 1 {
            // 点击最后一个 添加漫画
            self.tabBarController?.selectedIndex = 0
        }
    }
    
}
