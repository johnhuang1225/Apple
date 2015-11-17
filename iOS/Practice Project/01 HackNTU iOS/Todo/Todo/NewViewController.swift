//
//  NewViewController.swift
//  Todo
//
//  Created by John Huang on 2015/11/17.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import CoreData

class NewViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doSave(sender: AnyObject) {
        
        guard let todoName = nameTextField.text where !todoName.isEmpty else {
            
            let alertController = UIAlertController(title: "提醒", message: "請輸入資料", preferredStyle: UIAlertControllerStyle.Alert)

            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        print("todoName:\(todoName)")
        
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // 建立 Entity 物件
        let todoItem = NSEntityDescription.insertNewObjectForEntityForName("TodoItem", inManagedObjectContext: context) as! TodoItem
        todoItem.name = todoName
        
        // 儲存
        appDelegate.saveContext()
        
        // 回到上一頁
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    


}
