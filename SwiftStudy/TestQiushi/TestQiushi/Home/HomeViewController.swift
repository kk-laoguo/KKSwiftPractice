//
//  HomeViewController.swift
//  TestQiushi
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KakaJSON

class HomeViewController: UIViewController {
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        
        AF.request(API.imgrank, parameters: ["page": 1, "count": 20]).responseJSON { response in
            
            print(response.result)
            print(response.value)

        }
    
       
        
    }
  
}
