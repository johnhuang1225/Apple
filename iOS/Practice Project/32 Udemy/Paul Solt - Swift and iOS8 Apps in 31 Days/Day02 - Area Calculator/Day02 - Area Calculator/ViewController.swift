//
//  ViewController.swift
//  Day02 - Area Calculator
//
//  Created by John Huang on 2015/9/22.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        if let width = Int(widthTextField.text!) {
            if let height = Int(heightTextField.text!) {
                print("Valid input! \(width) X \(height)")
                let area = width * height
                outputLabel.text = "\(area)"
                
            }
        }
    }

}

