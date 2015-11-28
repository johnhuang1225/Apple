//
//  ViewController.swift
//  Project 10 - Names to Faces
//
//  Created by John Huang on 2015/11/28.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var people = [Person]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addNewPerson")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let savePeople = defaults.objectForKey("people") as? NSData {
            people = NSKeyedUnarchiver.unarchiveObjectWithData(savePeople) as! [Person]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Custom function
    func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func save() {
        let saveData = NSKeyedArchiver.archivedDataWithRootObject(people)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(saveData, forKey: "people")
    }
    
    
    func getDocumentsDirectory() -> NSString {
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        return path
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: { [unowned self, ac] _ -> Void in
            let name = ac.textFields![0]
            person.name = name.text!
            
            self.collectionView.reloadData()
            self.save()
        }))
        
        presentViewController(ac, animated: true, completion: nil)
        
        
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Person", forIndexPath: indexPath) as! PersonCell
        
        let person = people[indexPath.item]
        let imagePath = getDocumentsDirectory().stringByAppendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: imagePath)
        cell.name.text = person.name
        
        cell.imageView.layer.borderColor = UIColor.blueColor().CGColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        if let possibleImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        let imageName = NSUUID().UUIDString
        let imagePath = getDocumentsDirectory().stringByAppendingPathComponent(imageName)
        
        if let jpegData = UIImageJPEGRepresentation(newImage, 80) {
            jpegData.writeToFile(imagePath, atomically: true)
        }
        
        let person = Person(name: "unknow", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        self.save()
        
        dismissViewControllerAnimated(true, completion: nil)

    }


}

