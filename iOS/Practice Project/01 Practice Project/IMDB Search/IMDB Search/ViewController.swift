//
//  ViewController.swift
//  IMDB Search
//
//  Created by John Huang on 2016/2/22.
//  Copyright © 2016年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IMDBAPIControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var tomotoLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var apiController: IMDBAPIController = IMDBAPIController(delegate: self)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.apiController.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "userTappedInView:")
        self.view.addGestureRecognizer(tapGesture)
        
        self.formatLabels(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userTappedInView(recognizer: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
    
 
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        apiController.searchIMDB(searchBar.text!)
        
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
    }
    
    func didFinishIMDBSearch(result: Dictionary<String, String>) {
        
        if let foundTitle = result["Title"] {
            parseTitleFromSubTitle(foundTitle)
        }
        
        if let foundReleased = result["Released"] {
            self.releasedLabel.text = "Released: " + foundReleased
        }
        
        if let foundRating = result["Rated"] {
            self.ratingLabel.text = "Rated: " + foundRating
        }
        
//        self.releasedLabel.text = result["Released"]
//        self.ratingLabel.text = result["Rated"]
        self.plotLabel.text = result["Plot"]
        
        if let foundTomato = result["tomatoMeter"] {
            self.tomotoLabel.text = foundTomato + "%"
        }
        
        if let foundPosterUrl = result["Poster"] {
            self.formatImageFromPath(foundPosterUrl)
        }
    }
    
    
    func formatImageFromPath(path: String) {
        let posterUrl = NSURL(string: path)
        let posterImageData = NSData(contentsOfURL: posterUrl!)
        
        self.posterImageView.layer.cornerRadius = 100.0
        self.posterImageView.clipsToBounds = true
        self.posterImageView.image = UIImage(data: posterImageData!)
        
        self.blurBackgroundUsingImage(self.posterImageView.image!)
    }
    
    func blurBackgroundUsingImage(image: UIImage) {
        // 取得屏幕大小
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        
        let imageView = UIImageView(frame: frame)
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
        
        let blurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        
        let transparentWhiteView = UIView(frame: frame)
        transparentWhiteView.backgroundColor = UIColor(white: 1.0, alpha: 0.30)
        
        let viewsArray = [imageView, blurEffectView, transparentWhiteView]
        
        for index in 0 ..< viewsArray.count {
            if let _ = self.view.viewWithTag(index + 1) {
                let oldView = self.view.viewWithTag(index + 1)
                oldView?.removeFromSuperview()
            }
            
            let viewToInsert = viewsArray[index]
            self.view.insertSubview(viewToInsert, atIndex: index + 1)
            viewToInsert.tag = index + 1
            
        }
    }
    
    // 轉換
    func parseTitleFromSubTitle(title: String) {
        let index = title.findIndexOf(":")
        
        if let foundIndex = index {
            let newTitle = title[0 ..< foundIndex]
            let subTitle = title[foundIndex+2 ..< title.characters.count]
            
            self.titleLabel.text = newTitle
            self.subtitleLabel.text = subTitle
        } else {
            self.titleLabel.text = title
            self.subtitleLabel.text = ""
        }
    }
    
    func formatLabels(firstLaunch: Bool) {
        let labelArray = [self.titleLabel, self.subtitleLabel, self.releasedLabel, self.ratingLabel, self.plotLabel, self.tomotoLabel]
        
        if (firstLaunch) {
            for label in labelArray {
                label.text = ""
            }
        }
        
        for label in labelArray  {
            label.textAlignment = .Center
            switch label {
            case self.titleLabel:
                label.font = UIFont(name: "Avenir Next", size: 28)
            case self.subtitleLabel:
                label.font = UIFont(name: "Avenir Next", size: 20)
            case self.releasedLabel, self.ratingLabel:
                label.font = UIFont(name: "Avenir Next", size: 16)
            case self.plotLabel:
                label.font = UIFont(name: "Avenir Next", size: 12)
            case self.tomotoLabel:
                label.font = UIFont(name: "Avenir Next", size: 48)
                label.textColor = UIColor(red: 0.984, green: 0.256, blue: 0.184, alpha: 1.0)
            default:
                label.font = UIFont(name: "Avenir Next", size: 14)
            }
        }
        
    }


}











