//
//  BookRackController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit

class BookRackController: SegmentMainController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    


}
