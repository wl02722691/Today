//
//  ViewController.swift
//  Today
//
//  Created by 張書涵 on 2017/12/27.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["hello Alice","Vincent is a dog","Today is  12/27","焼肉食べたい！！！！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])//print出itemArray的字
        
        tableView.deselectRow(at: indexPath, animated: true) //讓原先被選到的那列變深色的效果消失
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{ //讓被選到的這列有checkmark or Not
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK - Add New Item
    
    @IBAction func addButtonPressend(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "加入待辦事項", style: .default) { (action) in
            //what wll happen once the user clicks the Add Item button on our UIAlert
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}


