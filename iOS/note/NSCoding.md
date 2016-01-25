
- iOS數據持久化的方式分三種
 - 屬性列表(plist, NSUserDefault)
 - 歸檔(NSKeyedArchiver)
 - 資料庫(SQLite, Core Data, 第三方類庫)


- 歸檔(又名序列化)
 - 自定義的class必須implement NSCoding protocl

```swift
// 自定義class
class Student: NSObject, NSCoding {
    var sno: String!
    var name: String!
    var score: Int!
    
    init(sno: String, name: String, score: Int) {
        self.sno = sno
        self.name = name
        self.score = score
    }
    
    // MARK: - NSCoding
    
    // 編碼時調用此方法
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(sno, forKey: "sno")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeInteger(score, forKey: "score")
    }
    
    // 解碼時調用此方法
    required init?(coder aDecoder: NSCoder) {
        sno = aDecoder.decodeObjectForKey("sno") as! String
        name = aDecoder.decodeObjectForKey("name") as! String
        score = aDecoder.decodeIntegerForKey("score")
    }
}


// In ViewController
import UIKit

class ViewController: UIViewController {
    // Documents目錄
    lazy var documentsPath: String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let student = Student(sno: "1225", name: "johnhuang", score: 100)
        let path = "\(documentsPath)/student.archive"
        // 歸檔對象
        NSKeyedArchiver.archiveRootObject(student, toFile: path)
        // 解檔對象
        let object = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! Student
        print("\(object.sno), \(object.name), \(object.score)")
        // 檢查文件
        print("\(NSHomeDirectory())")
    }
}


```



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
