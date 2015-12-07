- [參考網址](http://www.codedata.com.tw/mobile/swift-tutorial-class-4-standard-functions/)

- Equatable
  - 判斷是否相等
  - 在全域範圍實作`func == (lhs: Self, rhs: Self) -> Bool`
  - example code
```swift
struct Person {
	var name: String

	init(_ name: String) {
		self.name = name
	}
}

func ==(lhs: Person, rhs: Person) -> Bool {
	return lhs.name == rhs.name
}

var p1 = Person("john")
var p2 = Person("jessica")

```

- Comparable
  - 比較值，讓兩個值可以比較大或小
  - 最少必須實作<與==
  - Comparable 繼承兩個協定 _Comparable、Equatable，Equatable剛剛說明過了，而另外一個 _Comparable，是的就是<，當實作完<與==，您將自動獲得 <=、>=、> 這三個比較運算元！
  - example code
```swift
struct Person: Equatable, Comparable {
	var name: String
	var age: Int

	init(_ name: String, _ age: Int) {
		self.name = name
		self.age = age
	}
}

func ==(lhs: Person, rhs: Person) -> Bool {
	return lhs.name == rhs.name
}

func <(lhs: Person, rhs: Person) -> Bool {
	return lhs.age < rhs.age
}

var p1 = Person("john", 40)
var p2 = Person("jessica", 35)
print(p1 == p2)
print(p1 > p2)

```
