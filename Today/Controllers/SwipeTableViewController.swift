//
//  SwipeTableViewController.swift
//  Today
//
//  Created by 張書涵 on 2018/1/29.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import SwipeCellKit //1

class SwipeTableViewController: UITableViewController,SwipeTableViewCellDelegate {//2

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
        
     
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            print("delete")
            
            self.updateModel(at: indexPath)

        }
        
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    
    func updateModel(at indexpath:IndexPath){
        
    }
}
