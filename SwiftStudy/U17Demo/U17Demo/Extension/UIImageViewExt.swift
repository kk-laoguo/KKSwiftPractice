//
//  UIImageViewExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/23.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func yx_setImage(_ urlStr: String?,
                     _ placeholder: UIImage = UIImage(named: "normal_placeholder_h")!) {
        
        guard let urlStr = urlStr else { return }
        guard let url = URL(string: urlStr) else {
            kLog("error============\n\n url:|\(urlStr)|无法解析为URL类型")
            self.image = placeholder
            return
        }
        kf.setImage(with: url,
                    placeholder: placeholder)
    }
}
