//
//  ComicCollectionHeaderView.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

typealias ComicCollectionHeaderMoreActionBlock = () -> Void

protocol ComicCollectionHeaderDeleage: class {
    func comicCollectionHeaderView(_ comicHead: ComicCollectionHeaderView, moreAction button: UIButton)
}

class ComicCollectionHeaderView: BaseCollectionReusableView {
    // 代理声明 弱引用
    weak var delegate: ComicCollectionHeaderDeleage?
    // 回调声明 相当于 OC中的Block
    private var moreActionClosure: ComicCollectionHeaderMoreActionBlock?
    lazy var iconView: UIImageView = {
        return UIImageView()
    }()
    lazy var titleLabel: UILabel = {
        let titleLab = UILabel()
        titleLab.font = .systemFont(ofSize: 18)
        titleLab.textColor = .magenta
        return titleLab
    }()
    
    lazy var moreButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "moreBtn"), for: .normal)
        btn.addTarget(self, action: #selector(moreActionClick(button:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func moreActionClick(button: UIButton) {
        delegate?.comicCollectionHeaderView(self, moreAction: button)
        guard let closure = moreActionClosure else { return }
        closure()
    }
    func moreActionClosure(_ closure: ComicCollectionHeaderMoreActionBlock?) {
        moreActionClosure = closure
    }
    // 继承父类方法 布局
    override func setupLayout() {
        
        self.backgroundColor = .white
        addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(23)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(5)
            make.centerY.height.equalTo(iconView)
            make.width.equalTo(200)
        }
        addSubview(moreButton)
        
        moreButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
    }

}
