//
//  ReadBottomBarView.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class ReadBottomBarView: UIView {
    // MARK: - 懒加载
    lazy var menuSlider: UISlider = {
        let slider = UISlider()
        slider.thumbTintColor = themeColor
        slider.minimumTrackTintColor = themeColor
        slider.setThumbImage(UIImage(named: "readerMenu_scrollPageThumb"), for: .normal)
        slider.isContinuous = false
        return slider
    }()
    
    lazy var deviceDirectionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "readerMenu_changeScreen_horizontal")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    lazy var chapterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "readerMenu_catalog")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    lazy var settignButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "readerMenu_setting")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    lazy var tucaoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "readerMenu_tucao")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    // MARK: - 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        let blurEffect = UIBlurEffect(style: .dark)
        //创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurView)
        blurView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        blurView.contentView.addSubview(menuSlider)
        menuSlider.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40))
            make.height.equalTo(30)
        }
        
        blurView.contentView.addSubview(deviceDirectionButton)
        blurView.contentView.addSubview(chapterButton)
        blurView.contentView.addSubview(settignButton)
        blurView.contentView.addSubview(tucaoButton)
        
        let buttonArray = [deviceDirectionButton, chapterButton, settignButton, tucaoButton]

        buttonArray.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 60, leadSpacing: 20, tailSpacing: 20)
        buttonArray.snp.makeConstraints { (make) in
            make.top.equalTo(menuSlider.snp_bottomMargin).offset(10)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
}
