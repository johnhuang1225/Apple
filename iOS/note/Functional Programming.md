- flapMap
  - flapMap的參數為Array
  - 若要針對flap後的結果操作，需再另外使用map
  - sample code
  
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
```

- map

- reduce

- filter
