//
//  DetailViewController.swift
//  CH13 iOSDocument
//
//  Created by John Huang on 2015/9/5.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {


    @IBOutlet weak var textView: UITextView!
    
    @IBAction func done(sender: AnyObject) {
        if let document: SampleDocument = self.detailItem {
            document.saveToURL(document.fileURL, forSaveOperation: UIDocumentSaveOperation.ForOverwriting, completionHandler: { (success) -> Void in
                self.navigationController?.popViewControllerAnimated(true)
                return
            })
        }
    }
    

    var detailItem: SampleDocument? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        if let document: SampleDocument = self.detailItem {
            self.textView?.text = document.text
        }
    }
    
    func textViewDidChange(textView: UITextView) {
        if let document: SampleDocument = self.detailItem {
            document.text = self.textView.text
            document.updateChangeCount(UIDocumentChangeKind.Done)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
//        self.navigationItem.hidesBackButton = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

