//
//  ViewController.swift
//  Delegate
//
//  Created by John Huang on 2015/11/13.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyUIViewDataSource {
    
    @IBOutlet weak var myView: MyUIView! {
        didSet { // 此property observer會在iOS啟動這個應用並加載這個storyboard時調用
            print("此property observer會在iOS啟動這個應用並加載這個storyboard時調用")
            myView.dataSource = self
        }
    }
    
    // Model層
    var model: Int = 50 { // 只取10位數後除以100
        didSet {
            model = min(max(model,0),100)
            print("\(model)")
            updateUI() // Model值有變更，都須更新UI
        }
    }
    
    private func updateUI() {
        myView.setNeedsDisplay()
    }
    
    // Controller為View解析Model
    func scaleForMyView(myView: MyUIView) -> CGFloat? {
        let result: CGFloat = CGFloat( Double(model%100)/100 )
        print("ViewController scaleForMyView...\(result)")
        return result
    }
    
    override func loadView() {
        super.loadView()
        print(__FUNCTION__)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(__FUNCTION__)
        
//        myView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

