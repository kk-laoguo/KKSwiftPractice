//
//  ViewController.swift
//  012-tableview
//
//  Created by 今代科技 on 2017/9/12.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.dataSource = self
    }
  
    //MARK: -- UITableViewDataSource --
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        //?是自动带的
        cell.textLabel?.text = "hello -- \(indexPath.row)"
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

