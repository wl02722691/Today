//
//  ViewController.swift
//  Today
//
//  Created by 張書涵 on 2017/12/27.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard //defaults1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Alice"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Feed Vincent"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "punch Vincent"
        itemArray.append(newItem3)
        
        

        if var item = defaults.array(forKey: "TodoListArray") as? [Item]{
           itemArray = item
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
       let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        //value = condition ? valueIftrue : valueFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//      方法1 cell.accessoryType = item.done == true ? .checkmark : .none
//      方法2  if item.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
//
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        上面那行代替下面這五行程式碼 酷酷酷～
//        if itemArray[indexPath.row].done == true {
//            itemArray[indexPath.row].done = false
//        }else{
//            itemArray[indexPath.row].done = true
//        }
        
        print(itemArray[indexPath.row])//print出itemArray的字
        tableView.reloadData()//記得要reload!!!!
        
        tableView.deselectRow(at: indexPath, animated: true) //讓原先被選到的那列變深色的效果消失
    }
    
    //MARK - Add New Item
    
    @IBAction func addButtonPressend(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()//先開一個textField在最上面才能在action時讀取到addTextField.text
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add New Item", style: .default) { (action) in
            //what wll happen once the user clicks the Add Item button on our UIAlert
          
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray") //defaults2
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"
            textField = alertTextField
            //讓最上面的textField=alertTextField才能讓action讀取到self.itemArray.append(textField.text!)存在array
        }
        
        alert.addAction(action)//記得addAction跟present
        present(alert, animated: true, completion: nil)
        
    }
}


