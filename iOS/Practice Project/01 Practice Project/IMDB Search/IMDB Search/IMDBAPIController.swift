//
//  IMDBAPIController.swift
//  IMDB Search
//
//  Created by John Huang on 2016/2/24.
//  Copyright © 2016年 JohnHuang. All rights reserved.
//

import Foundation

protocol IMDBAPIControllerDelegate {
    func didFinishIMDBSearch(result: Dictionary<String, String>)
}

class IMDBAPIController {
    
    var delegate: IMDBAPIControllerDelegate?
    
    init(delegate: IMDBAPIControllerDelegate?) {
        self.delegate = delegate 
    }
    
    func searchIMDB(forContent: String) {
        // URL格式化
//        let spacelessString = forContent.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        // http://www.omdbapi.com/?t=mission&y=&plot=short&r=json&tomatoes=true
        
        let spacelessString = forContent.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())
        
        let urlPath = NSURL(string: "http://www.omdbapi.com/?t=\(spacelessString!)&y=&plot=short&r=json&tomatoes=true")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(urlPath!) { (data, response, error) -> Void in
            if(error != nil) {
                print(error?.localizedDescription)
            }
            
            do {
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! Dictionary<String, String>
                
                if let apiDelegate = self.delegate {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        apiDelegate.didFinishIMDBSearch(jsonResult)
                    })
                }
                
                
                
            } catch {
                print("格式化數據失敗!")
            }
            
        }
        
        task.resume()
        
    }
    
    
}