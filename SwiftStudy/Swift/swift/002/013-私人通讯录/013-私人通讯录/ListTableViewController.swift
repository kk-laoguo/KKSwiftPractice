//
//  ListTableViewController.swift
//  013-私人通讯录
//
//  Created by 今代科技 on 2017/9/24.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    //联系人数组
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData { (list) in
            print(list)
            //拼接数组
            //刷新表格
            //闭包中定义好的代码在需要的时候执行,  需要self,
            self.personList += list
            self.tableView.reloadData()
        }
    }
    @IBAction func newPerson(_ sender: Any) {
        //
        performSegue(withIdentifier: "listDetail", sender: nil)
    }
    private func loadData(completion:@escaping (_ list: [Person])->()) -> () {
        DispatchQueue.global().async {
            print("正在努力加载中....")
            Thread.sleep(forTimeInterval: 1)
            var arrayM = [Person]()
            for i in 0..<20 {
                let p = Person()
                p.name = "张三 - \(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(100000))
                p.title = "boss"
                arrayM.append(p)
            }
            DispatchQueue.main.async(execute: {
                //回调执行闭包
                completion(arrayM)
            })
        }
    }
    // MARK: - 到控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailViewController
        if let indexPath = sender as? IndexPath {
            vc.person = personList[indexPath.row]
            vc.callBack = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }else {
            // 新建个人
            vc.callBack = { [weak vc] in
                //这里面注意循环引用
                guard let p = vc?.person else {
                    return
                }
                self.personList.insert(p, at: 0)
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - 代理方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "listDetail", sender: indexPath)
    }
    // MARK: - 数据源
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
