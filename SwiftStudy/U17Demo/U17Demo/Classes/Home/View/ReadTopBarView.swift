//
//  ReadTopBarView.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/25.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class ReadTopBarView: UIView {
    
    
    lazy var backButton: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "nav_back_white"), for: .normal)
        return backBtn
    }()
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
//        lab.backgroundColor = .red
        lab.textAlignment = .left
        lab.textColor = .white
        lab.font = .systemFont(ofSize: 18)
        return lab
    }()
    lazy var downButton: UIButton = {
        let downButton = UIButton(type: .system)
        downButton.setImage(UIImage(named: "readerMenu_download")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return downButton
    }()
    
    lazy var screenshotButton: UIButton = {
        let screenshotButton = UIButton(type: .system)
        screenshotButton.setImage(UIImage(named: "readerMenu_clip")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return screenshotButton
    }()
    
    lazy var shareButton: UIButton = {
        let shareButton = UIButton(type: .system)
        shareButton.setImage(UIImage(named: "readerMenu_more")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return shareButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

extension ReadTopBarView {
    func setupUI() {
        let blurEffect = UIBlurEffect(style: .dark)
        // 创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurView)
        
        blurView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        blurView.contentView.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.left.centerY.equalToSuperview()
        }
        
        blurView.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
        }
        
        let stackV = UIStackView()
        stackV.spacing = 0
        stackV.alignment = .fill
        stackV.distribution = .fillEqually
        blurView.contentView.addSubview(stackV)
        
        stackV.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: screenWidth - 140, bottom: 0, right: 0))
        }
        stackV.addArrangedSubview(downButton)
        stackV.addArrangedSubview(screenshotButton)
        stackV.addArrangedSubview(shareButton)
        
    }
}
