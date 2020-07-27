//
//  OtherWorksCollectionViewCell.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class OtherWorksCollectionViewCell: BaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.layer.masksToBounds = true
        return iconView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return titleLabel
    }()
    
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = UIColor.gray
        descLabel.font = UIFont.systemFont(ofSize: 12)
        return descLabel
    }()
    
    override func setupLayout() {
        
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(25)
            make.bottom.equalTo(descLabel.snp.topMargin).offset(-5)
        }

        contentView.addSubview(iconView)
        
        iconView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.topMargin).offset(-10)
            
        }
    }
    var model: OtherWorks? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(model.coverUrl)
            titleLabel.text = model.name
            if model.passChapterNum != nil {
                descLabel.text = "更新至\(model.passChapterNum!)话"
            }
        }
    }
}
