//
//  ViewController.swift
//  Todo
//
//  Created by John Huang on 2015/11/17.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // 加入通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData", name: NSManagedObjectContextDidSaveNotification, object: nil)

    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "TodoItem")
        
        do {
            data = try context.executeFetchRequest(request)
            tableView.reloadData()
        } catch let error as NSError {
            print(error.description)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print("prepareForSegue:sender:")
        if segue.identifier == "toEdit" {
            if let editViewController = segue.destinationViewController as? EditViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    editViewController.todoItem = data[index] as! TodoItem
                }
                
            }
            
        }
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell")
        let todoItem = data[indexPath.row] as! TodoItem
        cell?.textLabel?.text = todoItem.name
        return cell!
    }
    
    
    // MARK: - UITableViewDelegate
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("tableView:didSelectRowAtIndexPath:")
//        let todoItem = data[indexPath.row]
//        performSegueWithIdentifier("toEdit", sender: todoItem)
//    }
//    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            guard let todoItem = data[indexPath.row] as? TodoItem else {
                return
            }
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            
            context.deleteObject(todoItem)
            
            appDelegate.saveContext()
            
        }
    }
    
    


}

