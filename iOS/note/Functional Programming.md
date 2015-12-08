- flatMap
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

// 忽略空值
let possibles: [Int?] = [1, 2, nil, 3, nil, 5]
let rr = possibles.flatMap() {
    $0
}
print(rr) // [1, 2, 3, 5]


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

- map

- reduce

- filter

