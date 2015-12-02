//
//  ViewController.swift
//  NoStoryboards
//
//  Created by John Huang on 2015/12/2.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//


// example: https://www.weheartswift.com/remove-storyboard-from-project/

import UIKit

class ViewController: UIViewController {
    
    @IBAction func didTapModal() {
        let modalViewController = ModalController(nibName: "ModalController", bundle: nil)
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func didTapNext() {
        let secondaryViewController = SecondaryController(nibName: "SecondaryController", bundle: nil)
        self.navigationController?.pushViewController(secondaryViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Main"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

