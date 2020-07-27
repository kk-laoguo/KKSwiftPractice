//
//  TodosController.swift
//  Todos
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//


import UIKit
import CoreData


class TodosController: UITableViewController {

//    var todos: [Todo] = []
    var todos: [TodoData] = []

    var row = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.title = "编辑"
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        do {
            todos = try context.fetch(TodoData.fetchRequest())

        } catch {
            print(error)
        }
        
        
        /// UserDefaults
        
//        do {
//            if let data = UserDefaults.standard.data(forKey: "todos") {
//                todos = try JSONDecoder().decode([Todo].self, from: data)
//
//            }
//        } catch {
//            print(error)
//        }

    }
    @IBAction func batchDelete(_ sender: Any) {
        
        if let indexPaths = tableView.indexPathsForSelectedRows {
            for indexPath in indexPaths {
                todos.remove(at: indexPath.row)
                
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: indexPaths, with: .middle)
            tableView.endUpdates()
            saveData()

        }
       
        
        
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        editButtonItem.title = isEditing ? "完成":"编辑"
    }
 
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! TodoCell
        cell.checkLab.text = todos[indexPath.row].checked ? "√" : ""
        cell.todoLab.text = todos[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !isEditing {
            todos[indexPath.row].checked = !todos[indexPath.row].checked
            let cell = tableView.cellForRow(at: indexPath) as! TodoCell
            cell.checkLab.text = todos[indexPath.row].checked ? "√" : ""
            tableView.deselectRow(at: indexPath, animated: true)
            saveData()
        }

    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            context.delete(todos[indexPath.row])
            todos.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let todo = todos.remove(at: fromIndexPath.row)
        todos.insert(todo, at: to.row)
        tableView.moveRow(at: fromIndexPath, to: to)
        tableView.reloadData()
        
     }
    
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! TodoController
        
        if segue.identifier == "addTodo" {
            vc.delegate = self

            
        } else if segue.identifier == "editTodo" {
            let cell = sender as! TodoCell
            row = tableView.indexPath(for: cell)!.row
            vc.name = todos[row].name
            vc.delegate = self

        }
    }
    
    func saveData() {
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
        /// UserDefault存储
//        do {
//           let data = try JSONEncoder().encode(todos)
//            UserDefaults.standard.set(data, forKey: "todos")
//        } catch {
//            print(error.localizedDescription)
//        }
        
    }
    


}


extension TodosController: TodoDelegate {
    
    func didAdd(name: String) {
        
//        todos.append(Todo(name: name, checked: false))
        
        let todo = TodoData(context: context)
        todo.name = name
        todo.checked = false
        todos.append(todo)
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .fade)
        saveData()

    }
    func didEdit(name: String) {
        
        todos[row].name = name;
        let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! TodoCell
        cell.todoLab.text = todos[row].name
        
        saveData()
        
    }
    
    
}
