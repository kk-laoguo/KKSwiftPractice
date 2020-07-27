//
//  HomeController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import LLCycleScrollView

class HomeController: BaseViewController {
    
    private var galleryItems = [GalleryItems]()
    private var textItems = [TextItems]()
    private var modules = [Modules]()
    private var defaultSrarch: String?
    
    private lazy var navView: FindNavView = {
        FindNavView()
    }()
    var style: UIStatusBarStyle = .lightContent
    
    // 重写statusBar相关方法
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    
    lazy var bannerView: LLCycleScrollView = {
        let banner = LLCycleScrollView()
        banner.backgroundColor = backgroundColor
        banner.autoScrollTimeInterval = 6
        banner.placeHolderImage = UIImage(named: "normal_placeholder_h")
        banner.coverImage = UIImage(named: "normal_placeholder_h")
        banner.pageControlBottom = 20
        banner.titleBackgroundColor = .clear
        banner.customPageControlStyle = .image
        banner.pageControlPosition = .left
        banner.pageControlActiveImage = UIImage(named: "finishobj")
        // 点击item回调
        banner.lldidSelectItemAtIndex = didSelectBanner(index:)
        return banner
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UCollectionViewSectionBackgroundLayout()
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: screenHeight/2.0, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        collectionView.register(cellType: ComicCollectionViewCell.self)
        collectionView.register(cellType: BoardCollectionViewCell.self)
        collectionView.register(supplementaryViewType: ComicCollectionHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(supplementaryViewType: ComicCollectionFooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
        // 刷新控件
        collectionView.uHead = URefreshHeader { [weak self] in
            self?.setupLoadData()
        }
        
        collectionView.uFood = URefreshDiscoverFooter()
        collectionView.uempty = UEmptyView(verticalOffset: -(collectionView.contentInset.top)) {
            self.setupLoadData()
        }
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(collectionView.contentInset.top)
        }
        view.addSubview(navView)
        navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
    }
}


extension HomeController {
    private func didSelectBanner(index: NSInteger) {
        print("轮播图被点击了...")
        if galleryItems.count <= 0 { return }
        let item = galleryItems[index]
        if item.linkType == 3 {
            guard let comicId = item.ext?.first?.val else { return }
            //            let vc = ComicIntroController()
            //            vc.comicId = comicId
            let storyboard = UIStoryboard(name: "ComicIntroVC", bundle: nil)
            let cimicIntroVC = storyboard.instantiateViewController(withIdentifier: "ComicIntroVC") as! ComicIntroVC
            cimicIntroVC.comicId = Int(comicId)
            navigationController?.pushViewController(cimicIntroVC, animated: true)
        }
    }
    private func setupLoadData() {
        ApiLoadingProvider.request(Api.findHome, model: HomeDatasModel.self) {
            [weak self] (returnData) in
            
            self?.galleryItems = returnData?.galleryItems ?? []
            self?.textItems = returnData?.textItems ?? []
            self?.modules = returnData?.modules ?? []
            
            self?.collectionView.uHead.endRefreshing()
            self?.collectionView.uempty?.allowShow = true
            self?.collectionView.reloadData()
            
            self?.bannerView.imagePaths = self?.galleryItems.filter { $0.cover != nil}.map {$0.cover!} ?? []
            self?.defaultSrarch = returnData?.defaultSearch
            self?.navView.defaultSearch = self?.defaultSrarch
        }
    }
}

extension HomeController: UICollectionViewDataSource,
    UICollectionViewDelegate,
UCollectionViewSectionBackgroundLayoutDelegateLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model = modules[section]
        return model.items?.count ?? 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = modules[indexPath.section]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ComicCollectionViewCell.self)
        cell.model = model.items?[indexPath.item].first
        cell.cellStyle = .withTitleAndDesc
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = modules[indexPath.section]
        let comicModel = model.items?[indexPath.item].first
        let storyboard = UIStoryboard(name: "ComicIntroVC", bundle: nil)
        let cimicIntroVC = storyboard.instantiateViewController(withIdentifier: "ComicIntroVC") as! ComicIntroVC
        cimicIntroVC.comicId = comicModel?.comicId ?? 0
        navigationController?.pushViewController(cimicIntroVC, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modules.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        backgroundColorForSectionAt section: Int) -> UIColor {
        .white
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    // 头尾视图
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath, viewType: ComicCollectionHeaderView.self)
            let model = modules[indexPath.section]
            header.iconView.yx_setImage(model.moduleInfo?.icon)
            header.titleLabel.text = model.moduleInfo?.title
            header.moreActionClosure { [weak self] in
                kLog("222222")
            }
            return header
        } else {
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: indexPath, viewType: ComicCollectionFooterView.self)
            footer.backgroundColor = backgroundColor
            
            return footer
        }
    }
    // 头部高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: screenWidth, height: 50)
    }
    // 尾部高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return modules.count - 1 != section ? CGSize(width: screenWidth, height: 10) : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let model = modules[indexPath.section]
        switch model.items?.count {
        case 4:
            let width = floor(Double(screenWidth - 30.0) / 2.0)
            return CGSize(width: width, height: width * 0.85)
        case 5:
            if indexPath.row == 0 {
                let width = floor(Double(screenWidth - 30.0) / 3.0)
                return CGSize(width: width * 2, height: width * 1.75)
            }
            let width = floor(Double(screenWidth - 30.0) / 3.0)
            return CGSize(width: width, height: width * 1.75)
        case 3, 6:
            let width = floor(Double(screenWidth - 30.0) / 3.0)
            return CGSize(width: width, height: width * 1.75)
            
        default:
            let width = floor(Double(screenWidth - 30.0) / 3.0)
            return CGSize(width: width, height: width * 1.75)
        }
    }
    
    
    
}

extension HomeController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navView.value = scrollView.contentOffset.y
        if scrollView.contentOffset.y >= -200 {
            self.style = .default
        } else {
            self.style = .lightContent
        }
        setNeedsStatusBarAppearanceUpdate()
        
        if scrollView == collectionView {
            bannerView.snp.updateConstraints { (make) in
                make.top.equalToSuperview().offset(min(0, -(scrollView.contentOffset.y + scrollView.contentInset.top)))
            }
        }
    }
}



