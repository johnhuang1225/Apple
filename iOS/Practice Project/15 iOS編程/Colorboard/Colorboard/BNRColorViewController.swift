//
//  BNRColorViewController.swift
//  Colorboard
//
//  Created by John Huang on 2015/11/24.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class BNRColorViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    var existingColor: Bool = false
    var colorDescription: BNRColorDescription?
    
    @IBAction func changeColor(sender: UISlider) {
        
        let red = CGFloat(self.redSlider.value)
        let green = CGFloat(self.greenSlider.value)
        let blue = CGFloat(self.blueSlider.value)
        
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        self.view.backgroundColor = newColor
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let color = colorDescription?.color {
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
            
            self.view.backgroundColor = color
            self.textField.text = self.colorDescription?.name
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if existingColor {
            self.navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.colorDescription?.name = self.textField.text
        self.colorDescription?.color = self.view.backgroundColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
