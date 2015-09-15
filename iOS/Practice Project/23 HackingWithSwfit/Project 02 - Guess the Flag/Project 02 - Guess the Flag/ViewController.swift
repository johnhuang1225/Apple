//
//  ViewController.swift
//  Project 02 - Guess the Flag
//
//  Created by John Huang on 2015/9/14.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.redColor().CGColor
        button2.layer.borderColor = UIColor.blueColor().CGColor
        button3.layer.borderColor = UIColor.yellowColor().CGColor
        
        askQuestion(nil)
        
        
    }

    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), forState: UIControlState.Normal)
        button2.setImage(UIImage(named: countries[1]), forState: UIControlState.Normal)
        button3.setImage(UIImage(named: countries[2]), forState: UIControlState.Normal)
        
        correctAnswer = Int(arc4random_uniform(3))
        
        title = countries[correctAnswer].uppercaseString
        
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        let ac = UIAlertController(title: title, message: "Youe score is \(score)", preferredStyle: UIAlertControllerStyle.Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
    }
    


}








