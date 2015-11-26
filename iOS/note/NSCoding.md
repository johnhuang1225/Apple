
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

 - 精通iOS開發ch13.4 p310範例
```swift
class MyObject: NSObject, NSCoding, NSCopying {
    var number = 0
    var string = ""
    var child: MyObject?
    
    override init() {
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
//        super.encodeWithCode(aCoder) // 若父類也遵循NSCoding, 則需要對父類調用encodWithCode
        aCoder.encodeObject(string, forKey: "stringKey")
        aCoder.encodeInt(32, forKey: "intKey")
        if let myChild = child {
            aCoder.encodeObject(myChild, forKey: "childKey")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        string = aDecoder.decodeObjectForKey("stringKey") as? String ?? ""
        number = aDecoder.decodeIntegerForKey("intKey")
        child = aDecoder.decodeObjectForKey("chileKey") as? MyObject
//        super.init(cdoer: aDecoder) // 若父類也遵循NSCoding, 則需要額外增加此行程式來讓父類自身運行初始化操作
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = MyObject()
        copy.number = number
        copy.string = string
        copy.child = child?.copy() as? MyObject
        return copy
    }
}

```
