
```swift
func guardTest(first: Int?, second: Int?) {
	guard let a = first where a>=0, let b = second where b>=0 else {
		print("first or second is nil")
		return
	}
	print("first:\(a),second:\(b)")
}
var first: Int? = 1
var second: Int? = 2
guardTest(first, second: second)

//=========

func guardTest(first: Int?, second: Int?) {
	guard let a = first where a>=0 else {
		print("first is nil")
		return
	}
	guard let b = second where b>=0 else {
		print("second is nil")
		return
	}
	print("first:\(a),second:\(b)")
}
var first: Int? = 1
var second: Int? = 2
guardTest(first, second: second)
```
