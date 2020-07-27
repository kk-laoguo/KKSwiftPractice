//
//  UIRefreshExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

import MJRefresh

extension UIScrollView {
    var uHead: MJRefreshHeader {
        get { return mj_header! }
        set { mj_header = newValue }
    }
    var uFood: MJRefreshFooter {
        get { return mj_footer! }
        set { mj_footer = newValue }
    }
}


class URefreshHeader: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        setImages([UIImage(named: "refresh_normal")!], for: .idle)
        setImages([UIImage(named: "refresh_will_refresh")!], for: .pulling)
        setImages([UIImage(named: "refresh_loading_1")!,
                   UIImage(named: "refresh_loading_2")!,
                   UIImage(named: "refresh_loading_3")!], for: .refreshing)
        lastUpdatedTimeLabel?.isHidden = true
        stateLabel?.isHidden = true
    }
}

class URefreshAutoHeader: MJRefreshHeader {}
class URefreshFooter: MJRefreshBackNormalFooter {}
class URefreshAutoFooter: MJRefreshAutoFooter {}
class URefreshDiscoverFooter: MJRefreshBackGifFooter {
    override func prepare() {
        super.prepare()
        backgroundColor = backgroundColor
        setImages([UIImage(named: "refresh_discover")!], for: .idle)
        stateLabel?.isHidden = true
        refreshingBlock = {
            self.endRefreshing()
        }
    }
}

class URefreshTipKissFooter: MJRefreshBackFooter {
    lazy var tipLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.textColor = .lightGray
        lab.font = .systemFont(ofSize: 14)
        lab.numberOfLines = 0
        return lab
    }()
    lazy var imageView: UIImageView = {
        let iw = UIImageView()
        iw.image = UIImage(named: "refresh_kiss")
        return iw
    }()
    override func prepare() {
        super.prepare()
        backgroundColor = backgroundColor
        mj_h = 240
        addSubview(tipLabel)
        addSubview(imageView)
    }
    override func placeSubviews() {
        tipLabel.frame = CGRect(x: 0, y: 40, width: bounds.width, height: 60)
        imageView.frame = CGRect(x: (bounds.width - 80) / 2, y: 110, width: 80, height: 80)
    }
    convenience init(with tip: String) {
        self.init()
        refreshingBlock = { self.endRefreshing() }
        tipLabel.text = tip
    }
    
}
