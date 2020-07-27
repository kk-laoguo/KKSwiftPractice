//
//  KingfisherExt.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation
import Kingfisher

extension KingfisherWrapper where Base: KFCrossPlatformImageView {
    
    func setImage(_ urlStr: String?,
                  _ placeholder: Placeholder? = UIImage(named: "normal_placeholder_h")) -> Void {
        
        setImage(with: URL(string: urlStr ?? "" ),
                 placeholder: placeholder,
                 options:[.transition(.fade(0.5))])

    }
}
extension KingfisherWrapper where Base: KFCrossPlatformButton {
    
    func setImage(_ urlStr: String?,
                  for state: UIControl.State,
                  _ placeholder: UIImage? = UIImage(named: "normal_placeholder_h")) -> () {
        
        setImage(with: URL(string: urlStr ?? ""),
                 for: state,
                 placeholder: placeholder,
                 options: [.transition(.fade(0.5))])
        
    }
}


