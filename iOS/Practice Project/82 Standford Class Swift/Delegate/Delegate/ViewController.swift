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
//            print("此property observer會在iOS啟動這個應用並加載這個storyboard時調用")
            myView.dataSource = self
            
            // 增加縮放手勢識別，會改動到Model曾，所以target為Controller自己
            myView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: "changeScale:"))
            
        }
    }
    
    // Model層
    var model: CGFloat = 50.0 { // 0...100
        didSet {
            model = min(max(model,0),100)
            print("\(model)")
            updateUI() // Model值有變更，都須更新UI
        }
    }
    
    private func updateUI() {
        myView.setNeedsDisplay()
    }
    
    //
    func changeScale(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .Changed {
            model *= gesture.scale
            gesture.scale = 1
        }
    }
    
    private struct Constant {
        static let ModelGestureScale: CGFloat = 4.0
    }
    
    @IBAction func changeScaleByGestureOutlet(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = sender.translationInView(myView)
            let modelChange = -(translation.y / Constant.ModelGestureScale)
            if modelChange != 0 {
                model += modelChange
                sender.setTranslation(CGPointZero, inView: myView)
            }
        default:break
            
        }
        
    }

    
    
    
    // Controller為View解析Model
    func scaleForMyView(myView: MyUIView) -> CGFloat? {
        let result = model / 100
        print("ViewController scaleForMyView...\(result)")
        return result
    }
    
    override func loadView() {
        super.loadView()
//        print(__FUNCTION__)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(__FUNCTION__)
        
//        myView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

