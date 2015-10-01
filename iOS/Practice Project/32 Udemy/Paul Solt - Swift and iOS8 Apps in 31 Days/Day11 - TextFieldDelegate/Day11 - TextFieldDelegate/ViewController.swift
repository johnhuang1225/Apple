//
//  ViewController.swift
//  Day11 - TextFieldDelegate
//
//  Created by John Huang on 2015/10/1.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textField.delegate = self
        textField.addTarget(self, action: Selector("textFieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        saveLogic()
        dimissKeyboard()
    }
    
    @IBAction func textFieldDidChange(sender: AnyObject) {
        saveLogic()
    }
    
    func saveLogic() {
        data = textField.text
        print("Data:\(data)")
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        saveLogic()
        dimissKeyboard()
        return true
    }
    
    func dimissKeyboard() {
        view.endEditing(false)
    }

}

