//
//  ViewController.swift
//  Today
//
//  Created by 張書涵 on 2017/12/27.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import CoreData
import UIKit

class TodoListViewController: UITableViewController{
    var itemArray = [Item]()
    
    var selectedCategory : Category? {
        didSet{
            loadItem()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   


    
    override func viewDidLoad() {
    super.viewDidLoad()
    //  print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    

//
//        if var item = defaults.array(forKey: "TodoListArray") as? [Item]{
//           itemArray = item
//        }
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
        
       // context.delete(itemArray[indexPath.row])
       // itemArray.remove(at: indexPath.row)
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItem()
        
//        上面那行代替下面這五行程式碼 酷酷酷～
//        if itemArray[indexPath.row].done == true {
//            itemArray[indexPath.row].done = false
//        }else{
//            itemArray[indexPath.row].done = true
//        }
        
       // print(itemArray[indexPath.row])//print出itemArray的字
      
        
        tableView.deselectRow(at: indexPath, animated: true) //讓原先被選到的那列變深色的效果消失
    }
    
    //MARK - Add New Item
    
    @IBAction func addButtonPressend(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()//先開一個textField在最上面才能在action時讀取到addTextField.text
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add New Item", style: .default) { (action) in
            //what wll happen once the user clicks the Add Item button on our UIAlert
            
            //要用Application不能直接用AppDelegate.persistentContainer.viewContext因為AppDelegate是class要跨檔案使用要delegate
            let newItem = Item(context: self.context)
            newItem.done = false
            newItem.title = textField.text!
            newItem.parentCategory = self.selectedCategory
            self.itemArray.append(newItem)
            self.saveItem()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"
            textField = alertTextField
            //讓最上面的textField=alertTextField才能讓action讀取到self.itemArray.append(textField.text!)存在array
        }
        
        alert.addAction(action)//記得addAction跟present
        present(alert, animated: true, completion: nil)
        
    }

    func saveItem(){
        
        do{
            try context.save()
        }catch{
            print("error saving context\(error.localizedDescription)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItem(with request:NSFetchRequest<Item> = Item.fetchRequest(), predicate:NSPredicate? = nil){
        
        let categorypredicate = NSPredicate(format: "parentCategory.name MATCHES %@",selectedCategory!.name!)

        if let addtionPredicate = predicate{
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates:[categorypredicate,addtionPredicate])
        }else{
            request.predicate = categorypredicate
        }
        
        do{
           itemArray = try context.fetch(request)
        }catch{
            print("Error fetching data from context\(error.localizedDescription)")
        }
        tableView.reloadData()
    }
}

//MARK: - Search Bar methods

extension TodoListViewController:UISearchBarDelegate{

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItem()
            DispatchQueue.main.async {//當收起searchBar.text?.count == 0的時候會把鍵盤收起來
                searchBar.resignFirstResponder()
            }
            
        }else{//當textDidChange時會立刻搜尋，不用按按鈕
            let request : NSFetchRequest<Item> = Item.fetchRequest()
            
            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
            
            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]

            loadItem(with: request, predicate: predicate)
            }
        }
    }
    
    
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0{
//            loadItem()
//            tableView.reloadData()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }else{
//            searchBarSearchButtonClicked(searchBar)
//        }
//    }

































