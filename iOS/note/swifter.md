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

- Practice
```swift

class BankAccount {
    var balance: Double = 0.0
    func deposit(amount: Double) {
        balance += amount
    }
    
    func getSomething(a: Double, b: Double) -> Double {
        return 0.0
    }
}

let account = BankAccount()
account.deposit(100)

let depositor = BankAccount.deposit
print("depositor type : \(depositor.dynamicType)")

depositor(account)(100) 

let something = BankAccount.getSomething
print("getSomething type : \(something.dynamicType)")



func add(a: Int)(b: Int) -> Int {
    return a + b
}

let aa = add
print(aa.dynamicType)
print(add(3)(b:5))


func add2(a: Int) -> ((Int,Int) -> Int) {
	return { (i ,j) -> Int in
		return a*i + j
	}
}
print(add2.dynamicType)
print(add2(3)(5,32))


// 參考自 https://speakerdeck.com/player/4e742c5c134e40d9920d1cdab6f846e0?#
func contains(substring: String) -> (String -> Bool) {
	return { string -> Bool in
		return string.characters.contains(substring)
	}
}

input.filter(contains("@"))
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



## Tip17 初始化方法順序
- 子類初始化順序
 1. 設置子類自己需要初始化的參數`power = 10`
 2. 調用父類的相應的初始化方法`super.init()`
 3. 對從父類繼承來的屬性設置新值`name = "tiger"
```swift
class Cat {
    var name: String
    init() {
        name = "cat"
    }
}

class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
        super.init()
        name = "tiger"
    }
}
```
- 其中第3點是根據實際情況而定的，若不需對繼承而來的屬性做修改，則不存在第3步。在這種情況下，Swfit會自動對父類對應的init方法進行調用，如下
```swift
class Cat {
    var name: String
    init() {
        name = "cat"
    }
}

class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
        // 不需顯式調用super.init()
        // 不過由於是初始化的最後，Swift自動調用父類對應的init
    }
}
```



## Tip30 屬性觀察
- 儲存屬性:將會在記憶體中分配地址對屬性進行儲存
- 計算屬性:不包括背後的儲存，只是提供set和get兩種方法
- 在同一個類型中，屬性觀察和計算屬性試不能同時存在的。也就是說，想在一個屬性定義中同時出現set和willSet或didSet是辦不到的

```swift
class A {
    var number: Int {
        get {
            print("get")
            return 1
        }
        set { print("set") }
    }
}

class B: A {
    override var number: Int {
        willSet{ print("willSet") }
        didSet{ print("didSet") }
    }
}

var b = B()
b.number = 0
```
輸出結果
get
willSet
set
didSet

- 注意:get首先被調用了一次，這是因為我們實現了didSet，didSet中會用到oldValue，而這個值需在整個set動作之前進行獲取並儲存待用，否則將無法確保正確性
