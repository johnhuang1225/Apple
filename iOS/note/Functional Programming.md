# Tips
- map, flatMap, filter：Array進去，Array出來
- map與flatMap的不同處：flatMap可過濾nil，map不行
- reduce是map, flatMap, filter的一種擴展的形式，這三個函數能做什麼，reduce就能以另一種方式實現。reduce的基本思想是將一個序列轉換為一個不同類型的數據，期間透過一個累加器(Accumulator)持續記錄遞增狀態

---

# flatMap
  - flatMap的參數為Array
  - 若要針對flat後的結果操作，需再另外使用map
  - flatMap會忽略nil
  - [example](http://appventure.me/2015/11/30/reduce-all-the-things/)
  
```swift
let nestArray = [["1", "2", "3"], ["4", "5", "6"]]
let flatArray = nestArray.flatMap() { (eachArray: [String]) -> [String] in
    return eachArray
}
print(flatArray)

let flatArray2 = nestArray.flatMap() { (eachArray: [String]) in
    eachArray.map() { (item: String) -> Int in
        return Int(item) ?? 0
    }
}
print(flatArray2)

//精簡寫法
let arr = [["john"],["jessica","henry"]]
var mapArr = arr.flatMap() {
    $0.map() {
        $0.characters.count
    }
}
print(mapArr) // [4, 7, 5]

// flatMap可過濾nil
var array: [Int?] = [1, 3, nil, 5, nil]
let after_map = array.map() {
	$0
}
print(after_map) // [Optional(1), Optional(3), nil, Optional(5), nil]

let after_flatMap = array.flatMap() {
	$0
}
print(after_flatMap) // [1, 3, 5]


// 
let persons: [[String: AnyObject]] = [["name": "Carl Saxon", "city": "New York, NY", "age": 44],
    ["name": "Travis Downing", "city": "El Segundo, CA", "age": 34],
    ["name": "Liz Parker", "city": "San Francisco, CA", "age": 32],
    ["name": "John Newden", "city": "New Jersey, NY", "age": 21],
    ["name": "Hector Simons", "city": "San Diego, CA", "age": 37],
    ["name": "Brian Neo", "age": 27]]


let after = persons.flatMap({ $0["city"]?.componentsSeparatedByString(", ").last })
    .filter({ $0 == "NY" })
    .count

print(after)
```

# map

# reduce
 - recude的回傳值與$0相同
 - [swiftgg](http://swift.gg/2015/12/10/reduce-all-the-things/)
 - [example](http://www.juliusparishy.com/articles/2014/12/14/adopting-map-reduce-in-swift)
```swift
func combinator(accumulator: Int, current: Int) -> Int {
    return accumulator + current
}

let result = [1,2,3].reduce(0, combine: combinator)
print(result) //6


// 
var array = ["john", "jessica", "henry", "fiona"]
let result = array.reduce("") { (all, item) in
    let comma = (item == array.last) ? "" : ", "
    return "\(all)\(item)\(comma)"
}
print(result) //john, jessica, henry, fiona



let result2 = array.reduce("", combine: { (all, item) in
    let comma = (item == array.last) ? "" : " - "
    return "\(all)\(item)\(comma)"
})
print(result2) //john, jessica, henry, fiona

// 使用reduce實作join
func join<T: Equatable>(objs: [T], separator: String) -> String {
	return objs.reduce("") { sum, obj in
		let maybeSeparator = (obj == objs.last) ? "" : separator
		return "\(sum)\(obj)\(maybeSeparator)"
	}
}
let names = ["john", "jessica", "henry", "fiona"]
let result = join(names, separator: " - ")
print(result) //john - jessica - henry - fiona

```





# filter

