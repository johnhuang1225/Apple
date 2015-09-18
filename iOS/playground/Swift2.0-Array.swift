/**
 * https://www.youtube.com/watch?v=BiXYtzXNLkc
 */


// NEW:you can now append contents from an array passed in
var array = ["1","2","3"]
array.appendContentsOf(["6","7"])
print(array)

//NEW:you can now check the array directly for contents
/*
### in swift1.2 
let boolean = contains(array,"2")
print(boolean)
*/
let boolean = array.contains("2")
print(boolean)

// NEW:you can check to see if the arrays are equal. But this only works if
// the arrays are sorted by name
let array2 = ["1","2","3","6","7"]
let boolean2 = array.elementsEqual(array2)
print(boolean2)

// NEW:you can finally get the index of elements contained within an Array
let index = array.indexOf("1")
print(index)


// NEW:you can insert multiple items at an index
array.insertContentsOf(["4","5"], at:3)
print(array)

// make a copy array and sort
let array3 = array.sort{ (item1, item2) -> Bool in
    return item1 > item2
}
print("array3:\(array3)")

array.sortInPlace{ (item1, item2) -> Bool in
    return item1 > item2
}
print("array:\(array)")


// can be written as its own function and passed back into the sort
func reverseSort<T:Comparable>(item1: T, item2 : T) -> Bool {
    return item1 < item2
}

let array4 = array.sort(reverseSort)
print("array4:\(array4)")

var numberArray = [5,3,7,1,4,9,6]
var numberArray2 = numberArray.sort(reverseSort)
print("numberArray2:\(numberArray2)")





