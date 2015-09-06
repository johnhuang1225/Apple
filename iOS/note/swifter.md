## Tip06 Optional Chaining
- 在Optional Chaining中，出現任一個?的時候都可能會遇到nil而提前返回
- 定義的時候，並沒有寫`play()`的返回，就表示這個方法返回`Void`，也可以寫成一對小括號`()`
- 經過Optional Chaining以後，得到的是一個Optional的結果，所以`playClosure`中的返回值會是`()?`
```swift
class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

var john: Child = Child()
if let toyName = john.pet?.toy?.name {
    println("yes")
} else {
    println("no")
}

extension Toy {
    func play() {
        println("extension Toy play func ...")
    }
}

// 注意closure中的返回值()?
let playClosure = { (child: Child) -> ()? in child.pet?.toy?.play() }

if let result:() = playClosure(john) {
    println("開心")
} else {
    println("不開心...")
}
```

## Tip14 Any & AnyObject
- `AnyObject`可以代表任何class類型的實例。而在Swfit中所有類型，包括Array和Dictionary全部都是struct，
並不能由AnyObject來表示，所以Apple提出了更特殊的Any
- `Any`可以表示任意類型，甚至包括方法(func)類型
- 以下代碼，系統自動轉換Int->NSNumber,String->NSString。否則正常來說是不能在[AnyObject]內放入基本類型，必須是[Any]才可以放基本類型
```swift
import UIKit

let swiftInt: Int = 1
let swiftString: String = "test"

var array: [AnyObject] = []
array.append(swiftInt)
array.append(swiftString)

println(array[0].dynamicType) // __NSCFNumber
println(array[1].dynamicType) // Swift._NSContiguousString
```
