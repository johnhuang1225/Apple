

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

