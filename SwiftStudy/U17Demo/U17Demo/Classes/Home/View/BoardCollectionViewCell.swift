//
//  BoardCollectionViewCell.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/23.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: BaseCollectionViewCell {
    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.layer.masksToBounds = true
        return iconView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    // 继承父类方法 布局
    override func setupLayout() {
        clipsToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(40)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom)
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            make.height.equalTo(20)
        }
    }
    
    var model: ItemModel? {
        didSet {
            guard let model = model else {
                return
            }
            iconView.yx_setImage(model.cover)
            titleLabel.text = model.title
        }
    }

    
}
