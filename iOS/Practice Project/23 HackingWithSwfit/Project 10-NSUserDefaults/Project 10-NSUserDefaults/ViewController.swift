//
//  ViewController.swift
//  Project 10-NSUserDefaults
//
//  Created by John Huang on 2015/9/10.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var people = [Person]()
    
    func save() {
        let savedData = NSKeyedArchiver.archivedDataWithRootObject(people)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(savedData, forKey: "people")
    }
    
    func loadPeople() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let savedPeople = defaults.objectForKey("people") as? NSData {
            people = NSKeyedUnarchiver.unarchiveObjectWithData(savedPeople) as! [Person]
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(25, forKey: "Age")
        defaults.setBool(true, forKey: "UseTouchID")
        defaults.setDouble(M_PI, forKey: "Pi")
        
        defaults.setObject("John Huang", forKey: "iOS Developer")
        defaults.setObject(NSDate(), forKey: "LastRun")
        
        let array = ["hello","world"]
        defaults.setObject(array, forKey: "SavedArray")
        
        let dict = ["Name":"John", "Country":"Taiwan"]
        defaults.setObject(dict, forKey: "SavedDict")
        
//        let loadedArray = defaults.objectForKey("SavedArray") as? [String] ?? [String]()
//
//        let loadedDict = defaults.objectForKey("SavedDict") as? [String:String] ?? [String:String]()
 
        println(defaults.boolForKey("UseTouchID"))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










