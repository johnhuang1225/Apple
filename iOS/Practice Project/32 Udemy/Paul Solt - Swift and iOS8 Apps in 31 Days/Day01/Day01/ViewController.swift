//
//  ViewController.swift
//  Day01
//
//  Created by John Huang on 2015/9/18.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myFirstLabel: UILabel!
    var iPhoneLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFirstLabel = UILabel()
        iPhoneLabel = UILabel()
        
        addLabel()

        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        view.addGestureRecognizer(tapGesture)
    }
    
    func handleTapGesture(tapGesture: UITapGestureRecognizer) {
        print("tap")
        addLabel()
    }
    
    func addLabel() {
        
        myFirstLabel.text = "My First"
        myFirstLabel.font = UIFont.systemFontOfSize(32)
        myFirstLabel.sizeToFit()
        myFirstLabel.center = CGPoint(x: 100, y: 40)
        view.addSubview(myFirstLabel)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            self.myFirstLabel.center = CGPoint(x: 100, y: 40 + 200)
            }, completion: nil)
        
        
        iPhoneLabel.text = "iPhone app"
        iPhoneLabel.font = UIFont.boldSystemFontOfSize(48)
        iPhoneLabel.sizeToFit()
        iPhoneLabel.center = CGPoint(x: 200, y: 90)
        iPhoneLabel.alpha = 0
        view.addSubview(iPhoneLabel)
        
        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            self.iPhoneLabel.center = CGPoint(x: 200, y: 90 + 200)
            self.iPhoneLabel.alpha = 1
            }, completion: nil)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

