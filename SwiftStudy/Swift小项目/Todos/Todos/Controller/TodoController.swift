//
//  TodoController.swift
//  Todos
//
//  Created by zainguo on 2019/5/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

protocol TodoDelegate {
    
    func didAdd(name: String)
    func didEdit(name: String)
    
}

class TodoController: UITableViewController {

    @IBOutlet weak var todoInput: UITextField!
    
    var delegate: TodoDelegate?
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoInput.becomeFirstResponder()
        
        if  name != nil{
            navigationItem.title = "编辑任务"
            todoInput.text = name
        }
    }


    @IBAction func done(_ sender: Any) {
        
        if let text = todoInput.text, !text.isEmpty {
            
            if name != nil {
                
                delegate?.didEdit(name: text)
            } else {
                delegate?.didAdd(name: text)

            }
        }
        navigationController?.popViewController(animated: true)
    }
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


}
