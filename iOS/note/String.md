- String最常用的兩個參數
  - Index
  - Range
```swift
var str = "Welcome to Play Swift! Step by Step learn Swift language from now!"
let offset = str.startIndex.advancedBy(2)
let range = Range(start: str.startIndex.advancedBy(2), end: str.endIndex.advancedBy(-2))
let result = str.substringWithRange(range)
print(result)

```
  
  
  
- example  
```swift
//String.Index
str.startIndex
str.endIndex
//Range
let strRange = Range<String.Index>(start: str.startIndex, end: str.endIndex)

//指定範圍搜尋
let startIndex:String.Index = str.startIndex //非整數類型
let endIndex:String.Index = startIndex.advancedBy(10)
let searchRange = Range<String.Index>(start: startIndex, end: endIndex)
str.rangeOfString("Step", options: NSStringCompareOptions.CaseInsensitiveSearch, range: searchRange)

//substring
var toIndex = str.startIndex.advancedBy(4)
str.substringToIndex(toIndex)

var fromIndex = str.startIndex.advancedBy(14)
str.substringFromIndex(fromIndex)

str.substringWithRange(Range<String.Index>(start: toIndex, end: fromIndex))

//insert
var insertIndex = str.startIndex.advancedBy(22)
str.insert("!", atIndex: insertIndex)

//remove
str.removeAtIndex(insertIndex)

str.removeRange(Range<String.Index>(start: str.startIndex, end: insertIndex))

//replace
var replaceEndIndex = str.startIndex.advancedBy(13)
str.stringByReplacingCharactersInRange(Range<String.Index>(start: str.startIndex, end: replaceEndIndex), withString: "Step-by-Step")


var str = "Welcome to Play Swift! Step by Step learn Swift language from now!"

str.rangeOfString("Step")
str.rangeOfString("Step", options: NSStringCompareOptions.BackwardsSearch)
str.rangeOfString("welcome", options: NSStringCompareOptions.CaseInsensitiveSearch)



```

- 
