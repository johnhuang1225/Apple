//
//  EditViewController.swift
//  Todo
//
//  Created by John Huang on 2015/11/17.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UITableViewController {
    
    var todoItem: TodoItem?

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = todoItem?.name
    }


    @IBAction func doSave(sender: AnyObject) {
        
        guard let todoName = nameTextField.text where !todoName.isEmpty else {
            
            let alertController = UIAlertController(title: "提醒", message: "請輸入資料", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        print("todoName:\(todoName)")
        
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDelegate.managedObjectContext
        
        // 建立 Entity 物件
//        let todoItem = NSEntityDescription.insertNewObjectForEntityForName("TodoItem", inManagedObjectContext: context) as! TodoItem
        todoItem!.name = todoName
        
        // 儲存
        appDelegate.saveContext()
        
        // 回到上一頁
        navigationController?.popViewControllerAnimated(true)
    }
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
