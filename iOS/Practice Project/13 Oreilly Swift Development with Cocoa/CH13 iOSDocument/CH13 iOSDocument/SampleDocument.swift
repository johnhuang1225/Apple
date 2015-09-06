//
//  SampleDocument.swift
//  CH13 iOSDocument
//
//  Created by John Huang on 2015/9/5.
//  Copyright (c) 2015年 JohnHuang. All rights reserved.
//

import UIKit

class SampleDocument: UIDocument {
    var text = ""
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        self.text = ""
        
        if let data = contents as? NSData {
            if data.length > 0 {
                if let theText = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    self.text = theText as String
                }
            }
        }
        
        return true
    }
    
    
    override func contentsForType(typeName: String, error outError: NSErrorPointer) -> AnyObject? {
        return self.text.dataUsingEncoding(NSUTF8StringEncoding)
    }
    
    
    
    
    
    
    
    
}