//
//  ComicCollectionViewCell.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/23.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

enum ComicCollectionViewCellStyle {
    case none
    case withTitle
    case withTitleAndDesc
}

class ComicCollectionViewCell: BaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
       let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.layer.masksToBounds = true
        return iconView
    }()
    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .systemFont(ofSize: 14)
        return lab
    }()
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .gray
        descLabel.font = .systemFont(ofSize: 12)
        return descLabel
    }()
    
    override func setupLayout() {
        
        clipsToBounds = true
        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
            make.height.equalTo(25)
            make.bottom.equalToSuperview().offset(-10)
        }
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(titleLab.snp.top)
        }
        iconView.layer.cornerRadius = 5
        iconView.layer.borderColor = backgroundColor?.cgColor
        iconView.layer.borderWidth = 0.5
       
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
            make.height.equalTo(20)
            make.top.equalTo(titleLab.snp.bottom)
        }
    }
    // 属性观察器
    // 设置样式
    var cellStyle: ComicCollectionViewCellStyle = .withTitle {
        didSet {
            switch cellStyle {
            case .none:
                // 布局更新
                titleLab.snp.updateConstraints { (make) in
                    make.bottom.equalToSuperview().offset(25)
                }
                titleLab.isHidden = true
                descLabel.isHidden = true
            case .withTitle:
                titleLab.snp.updateConstraints { (make) in
                    make.bottom.equalToSuperview().offset(-10)
                }
                titleLab.isHidden = false
                descLabel.isHidden = true
            case .withTitleAndDesc:
                titleLab.snp.updateConstraints { (make) in
                    make.bottom.equalToSuperview().offset(-25)
                }
                titleLab.isHidden = false
                descLabel.isHidden = false
            }
        }
    }
    
    var model: ItemModel? {
        didSet {
            guard let model = model else { return }
            if let cover = model.cover {
                iconView.kf.setImage(with: URL(string: cover))
            }
            titleLab.text = model.title
            descLabel.text = model.subTitle
        }
    }
    var bookModel: favModel? {
        didSet {
            guard let bookModel = bookModel else { return }
            if bookModel.cover == nil {
                iconView.image = UIImage(named: "addBookHead")
                titleLab.text = "添加漫画"
                titleLab.textAlignment = .center
                descLabel.text = ""
                
            } else {
                iconView.yx_setImage(bookModel.cover!)
                titleLab.text = bookModel.name
                titleLab.textAlignment = .left
                let leftStr = bookModel.last_read_chapter_name ?? "未读"
                let rightStr = bookModel.last_update_chapter_name ?? ""
                descLabel.text = leftStr + "/" + rightStr
                
            }
        }
    }
}
