//
//  ReadCollectionViewCell.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class ReadCollectionViewCell: BaseCollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var placeholder: UIImageView = {
        let placeholder = UIImageView(image: UIImage(named: "yaofan"))
        placeholder.contentMode = .scaleAspectFit
        return placeholder
    }()
    override func setupLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    var model: Image_list? {
        didSet {
           guard let model = model else { return }
            imageView.image = nil
            imageView.kf.setImage(model.location, placeholder.image)
        }
    }
}
