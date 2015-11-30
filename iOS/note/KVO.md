
- example 1
```swift

class Car: NSObject {
	dynamic var miles = 0
	dynamic var name = "Turbo"
}

class CarObserver: NSObject {
	private var kvoContext: UInt8 = 1
	private let car: Car
	init(car: Car) {
		self.car = car
		super.init()
		car.addObserver(self, forKeyPath: "miles",
			options: NSKeyValueObservingOptions.New, context: &kvoContext)
	}

	override func observeValueForKeyPath(keyPath: String?,
		ofObject object: AnyObject?, change: [String : AnyObject]?,
		context: UnsafeMutablePointer<Void>) {
		if context == &kvoContext {
			print("Change at keyPath = \(keyPath!) for \(object!)")
		}
	}

	deinit {
		car.removeObserver(self, forKeyPath: "miles")
	}
}



var c = Car()
var cObserver = CarObserver(car: c)
c.miles = 10

```

- example 2
```swift
class MyObjectToObserve: NSObject {
	dynamic var myDate = NSDate()
	func updateDate() {
		myDate = NSDate()
	}
}

private var myContext = 0

class MyObject: NSObject {
	var objectToObserve = MyObjectToObserve()

	override init() {
		super.init()
		objectToObserve.addObserver(self, forKeyPath:"myDate", options:.New, context: &myContext)
	}

	deinit {
		objectToObserve.removeObserver(self, forKeyPath:"myDate", context: &myContext)
	}

	override func observeValueForKeyPath(keyPath: String?,
		ofObject object: AnyObject?,
		change : [String : AnyObject]?,
		context : UnsafeMutablePointer<Void>) {
		if context == &myContext {
			if let newValue = change?[NSKeyValueChangeNewKey] {
				print("Date changed: \(newValue)")
			}
		} else {
			super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
		}
	}
}

var myObject = MyObject()
print(myObject.objectToObserve.updateDate())
```


