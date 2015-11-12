//
//  SecondViewController.swift
//  To Do List
//
//  Created by John Huang on 2015/11/13.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        if let input = item.text {
            toDoList.append(input)
            
            item.text = ""
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // touch other place to close keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // close keyboard by return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }

}

