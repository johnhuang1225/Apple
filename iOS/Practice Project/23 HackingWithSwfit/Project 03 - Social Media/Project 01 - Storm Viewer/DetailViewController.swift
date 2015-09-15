//
//  DetailViewController.swift
//  Project 01 - Storm Viewer
//
//  Created by John Huang on 2015/9/11.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import Social
import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let image = self.imageView {
                image.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        // add 
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "shareTapped")
        
        
        
    }
    
    func shareTapped() {
        // 顯示系統內建activity
//        let activity = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//        presentViewController(activity, animated: true, completion: nil)
        
        // Social Framework
        let social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        social.setInitialText("Hello world, buy my app")
        social.addImage(imageView.image!)
        
        presentViewController(social, animated: true, completion: nil)
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }


}

