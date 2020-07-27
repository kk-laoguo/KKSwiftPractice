//
//  ChapterCell.swift
//  U17
//
//  Created by lyw on 2020/5/22.
//  Copyright © 2020 胡智钦. All rights reserved.
//

import UIKit
import Reusable


class ChapterCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var chapterIndex: UILabel!
    @IBOutlet weak var publish_time: UILabel!
    
    var model: ChapterModel? {
        didSet {
            guard let model = model else { return }
            
            cover.kf.setImage(model.smallPlaceCover, UIImage(named: "normal_placeholder_h"))
            chapterIndex.text = model.name
            let dateStr = getDateBytimeStamp(model.publish_time)
            publish_time.text = "第 \(model.chapterIndex + 1) 话 \(dateStr)"
            cover.layer.cornerRadius = 4.0
            cover.layer.masksToBounds = true
            if model.buy_price != "0" && model.buy_price != nil {
                // buy_price 妖气币购买
                topImg.isHidden = false
                topImg.layer.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.3).cgColor
                topImg.image = UIImage(named: "onlyYao")
            } else if Int(model.type ?? "0") == 3 {
                //  type = 3 仅限VIP阅读
                topImg.isHidden = false
                topImg.layer.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.3).cgColor
                topImg.image = UIImage(named: "onlyVip")
            } else {
                topImg.isHidden = true
            }
        }
    }
    
}
