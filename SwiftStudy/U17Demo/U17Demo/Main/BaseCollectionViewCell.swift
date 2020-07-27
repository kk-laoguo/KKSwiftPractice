//
//  BaseCollectionViewCell.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/23.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import Reusable

class BaseCollectionViewCell: UICollectionViewCell, Reusable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout() {}
}
