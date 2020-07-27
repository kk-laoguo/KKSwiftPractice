
//
//  AuthorComicListVC.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class AuthorComicListVC: BaseViewController {

    
    private var author: Author?
    private var otherWorks: [OtherWorks]?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         navigationController?.navigationBar.isHidden = true
    }
    convenience init(author: Author?,
                     otherWorks: [OtherWorks]?) {
        self.init()
        self.author = author
        self.otherWorks = otherWorks
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.white)
        navigationItem.title = "作者其他作品"
    }
    override func setupLayout() {
        
        view.addSubview(authorName)
        view.addSubview(authorHead)
        view.addSubview(collectionView)
        
        authorHead.kf.setImage(author?.avatar, UIImage(named: "sortPlace"))
        authorName.text = author?.name
        
        authorHead.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.width.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        authorName.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(authorHead.snp_bottomMargin).offset(10)
            make.centerX.equalToSuperview()
        }
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(authorName.snp_bottomMargin).offset(20)
        }
        
    }
    
    lazy var authorHead: UIImageView = {
        let head = UIImageView()
        return head
    }()
    
    lazy var authorName: UILabel = {
        let lab = UILabel()
        lab.font = .boldSystemFont(ofSize: 20)
        lab.textAlignment = .center
        return lab
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: floor((screenWidth - 40) / 3), height: 200)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(cellType: OtherWorksCollectionViewCell.self)
        return collectionView
    }()

}


extension AuthorComicListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherWorks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: OtherWorksCollectionViewCell.self)
        cell.model = otherWorks?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let comicId = otherWorks?[indexPath.item].comicId else { return }
        let storyboard = UIStoryboard(name: "ComicIntroVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ComicIntroVC") as! ComicIntroVC
        vc.comicId = Int(comicId) ?? 0
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
