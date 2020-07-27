//
//  ViewController.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/7.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    var tableView:UITableView?
    var model:StoreModel?
    var page:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableView = UITableView.creatTableView(self)
        self.tableView?.xz_registerCell(cell: StoreListTableViewCell.self)
        self.view.addSubview(self.tableView!)
        self.tableView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.loadData()
        })
        
        self.loadData()
    }
    func loadData() -> Void {
        
        XZNetwork().request(ShopAPI.storeList("成都市"), progress: nil, success: { (data) in
            self.model = data.toModel(modelType: StoreModel.self)
            DispatchQueue.main.async {
                self.tableView?.mj_header.endRefreshing()
                self.tableView?.reloadData()
            }
        }) { (error) in
            self.tableView?.mj_header.endRefreshing()
        }
    }
    
    //返回表格分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list =  model?.data  {
            return list.count
        }
        return 0;
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTableViewCell.identifier, for: indexPath)
           if   let storeCell = cell as? StoreListTableViewCell
            {
                if let list =  model?.data  {
                    let infoModel:DataInfoModel = list[indexPath.row]
                    storeCell.titleLabel?.text = infoModel.name
                    let url = URL(string:kImageHost+infoModel.pic)
                    
                    storeCell.contentImageView?.kf.setImage(with:url)
                }
            }
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
    func showAlert(title:String, message:String)  {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

