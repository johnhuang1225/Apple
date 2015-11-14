//
//  ViewController.swift
//  Whats The Weather
//
//  Created by John Huang on 2015/11/14.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func foundWeather(sender: AnyObject) {
        
        let cityName = cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-")
        let allUrlString = "http://www.weather-forecast.com/locations/" + cityName + "/forecasts/latest"
        print(allUrlString)
        
        var wasSuccessful = false
        
        let tempUrl = NSURL(string: allUrlString)
        
        if let url = tempUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if websiteArray?.count > 1 {
                        
                        let weatherArray = websiteArray![1].componentsSeparatedByString("</span></span></span>")
                        
                        if weatherArray.count > 1 {
                            
                            wasSuccessful = true
                            
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.resultLabel.text = weatherSummary
                            })
                        }
                        
                    }
                    
                    if wasSuccessful == false {
                        self.resultLabel.text = "無法取得資料"
                    }
                    
                }
            }
            
            task.resume()
            
        }

        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    


}

