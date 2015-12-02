//
//  SecondaryController.swift
//  NoStoryboards
//
//  Created by John Huang on 2015/12/3.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class SecondaryController: UIViewController {
    
    var level = 1
    
    
    @IBAction func didTapBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapNext() {
        let secondaryViewController = SecondaryController(nibName: "SecondaryController", bundle: nil)
        
        secondaryViewController.level  = level + 1
        
        self.navigationController?.pushViewController(secondaryViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Secondary \(level)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
