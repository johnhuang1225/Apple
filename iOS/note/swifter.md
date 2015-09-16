## Tip01 柯里化(Currying)
 - example
  - [Ole Begemann](http://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/?utm_campaign=iOS_Dev_Weekly_Issue_157&utm_medium=email&utm_source=iOS%2BDev%2BWeekly)
  - [Curried Functions in Swift](http://ijoshsmith.com/2014/06/09/curried-functions-in-swift/)
```swift
// currying func
func appendSeparator(seperator: String)(string: String) -> String{
    return string + seperator
}

let sentences = [
    "wirte the code",
    "change the world"
]
// 換行
let appendNewlineToString = appendSeparator("\n")
var text = ""
for s in sentences {
    text += appendNewlineToString(string: s)
}
println(text)

// 加入分號
let appendSemicolonToString = appendSeparator(";")
text = ""
for s in sentences {
    text += appendSemicolonToString(string: s)
}
println(text)
```


## Tip04 多元組(Tuple)
- **在Swfit中，任何東西都是放在多元組裡的**

```swift
// 在Swfit中，任何東西都是放在多元組裡的
var num = 42
println(num) //42
println(num.0.0.0.0) //42


func swapMe<T>(inout a: T, inout b: T) {
    (a,b) = (b,a)
}

var one = 11
var two = 22
println("Before swapMe() one:\(one), two:\(two)") // Before swapMe() one:11, two:22

swapMe(&one,&two)
println("After swapMe() one:\(one), two:\(two)") // After swapMe() one:22, two:11
```

## Tip05 @autoclosure和??操作符
- @autoclosure做的事情就是把一句表達式自動封裝成一個閉包(closure)

```swift
func logIfTrue(predicate: ()->Bool) {
    if predicate() {
        println("true")
    }
}

logIfTrue({ ()->Bool in
    return 2 > 1
})

logIfTrue({ 2 > 1 })

logIfTrue(){ 2 > 1 }

logIfTrue{ 2 > 1 }

// 改為@autoclosure寫法
func logIfTrue(@autoclosure predicate: ()->Bool) {
    if predicate() {
        println("true")
    }
}

logIfTrue(2 > 1)

```
- swift會把2>1這個表達式自動轉換為( )->Bool


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

## Tip09 方法參數名稱省略
- 普通方法:"匿名"第一個參數，並強制要求其他的參數名稱

- class的init方法:每個參數標籤都不可省略
```swift
class Car {
  init(color: UIColor, weight: Int) {
    //...
  }
}
let car = Car(color: UIColor.redColor(), weight: 10)

```
- 實例方法以及類方法:忽略略第一個參數的標籤
```swift
extension Car {
  func moveTo(x: Int, y: Int) {
    //...
  }
}
car.moveTo(10, y:20)

extension Car {
  class func findACar(name: String, color: UIColor) -> Car? {
    var result: Car?
    //...
    return result
  }
}
let myPorsche = Car.findACar("Porsche", color: UIColor.yellowColor())
```

- 全局方法:參數名稱默認是省略的
```swift
func findACar(name: String, color: UIColor) -> Car? {
  var result: Car?
  //...
  return result
}
let myFerrari = findACar("Ferrari", UIColor.redColor())
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

