//
//  DetailViewController.swift
//  013-私人通讯录
//
//  Created by 今代科技 on 2017/9/24.
//  Copyright © 2017年 GZY. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var person: Person?
    //闭包的返回值是可选的
//    var callBack: ()->()?
    //闭包是可选的
    var callBack: (()->())?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
    }
    @IBAction func savePerson(_ sender: Any) {
        // 新建
        if person == nil {
            person = Person()
        }
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        // ! 强行解包
        // ? 可选解包 -> 如果 闭包为nil 就什么也不做
        callBack?()
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
