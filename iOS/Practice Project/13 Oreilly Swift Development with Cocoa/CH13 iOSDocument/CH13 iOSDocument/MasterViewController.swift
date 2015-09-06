//
//  MasterViewController.swift
//  CH13 iOSDocument
//
//  Created by John Huang on 2015/9/5.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var documentURLs: [NSURL] = []
    
    func URLForDocuments() -> NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
    }
    
    func updateFileList() {
        documentURLs = NSFileManager.defaultManager().contentsOfDirectoryAtURL(self.URLForDocuments(), includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions(), error: nil) as! [NSURL]
        self.tableView.reloadData()
    }
    

    @IBAction func createDocument(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        
        let dateString = dateFormatter.stringFromDate(NSDate())
        
        let fileName = "Document \(dateString).sampleDocument"
        
        let url = self.URLForDocuments().URLByAppendingPathComponent(fileName)
        
        let documentToCreate = SampleDocument(fileURL: url)
        documentToCreate.saveToURL(url, forSaveOperation: UIDocumentSaveOperation.ForCreating) { (success) -> Void in
            if success == true {
                self.performSegueWithIdentifier("showDetail", sender: documentToCreate)
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.updateFileList()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            let document = sender as? SampleDocument
            detailViewController.detailItem = document
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentURLs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        
        let URL = documentURLs[indexPath.row]
        cell.textLabel?.text = URL.lastPathComponent
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let URL = documentURLs[indexPath.row]
        
        let documentToOpen = SampleDocument(fileURL: URL)
        
        documentToOpen.openWithCompletionHandler { (success) -> Void in
            if success == true {
                self.performSegueWithIdentifier("showDetail", sender: documentToOpen)
            }
        }
        
        
    }
    


}

