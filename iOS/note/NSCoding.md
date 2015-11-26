
- NSCoding example
 - [example](http://swiftcafe.io/2015/11/13/cafe-time-nscoding/)
```swift
class Person: NSObject, NSCoding {
    
    var name: String?
    var image: UIImage?
    
    override init() {
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        if let name = self.name {
            aCoder.encodeObject(name, forKey: "name")
        }
        
        if let imageData = self.image {
            aCoder.encodeObject(UIImagePNGRepresentation(imageData), forKey: "image")
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        if let imageData = aDecoder.decodeObjectForKey("image") as? NSData {
            self.image = UIImage(data: imageData)
        }
    }
}
```
