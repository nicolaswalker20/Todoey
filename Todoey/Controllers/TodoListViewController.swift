//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Nicolas Walker on 6/25/19.
//  Copyright © 2019 Nicolas Walker. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Buy eggs"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "Call Ryan"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem.title = "Call Cal"
        itemArray.append(newItem3)
        

//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
        
          
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            
            itemArray = items
        }
        }
        
        // Do any additional setup after loading the view.
    
    
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        
        //        Turnary Operator: super good for simplification. its: Value = condition ? ValueIfTrue : ValueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(itemArray[indexPath.row])
        
         let item = itemArray[indexPath.row]
        
        item.done = !item.done
    
       
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
   

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add to To-do List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            print("success")
        
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter to-do item"
            
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
