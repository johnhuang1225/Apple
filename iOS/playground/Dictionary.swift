

var dict = ["a0801":"john","a0842":"alistar","a0966":"tommy"]
for (index,value) in enumerate(dict) {
	println("\(index):\(value)")
}


class Item {
	var itemName: String = ""
	var brandName: String = ""
	var isBusy: Bool = false
	var imageName: String?

	init(itemName: String, brandName: String, isBusy: Bool, imageName: String) {
		self.itemName = itemName
		self.brandName = brandName
		self.isBusy = isBusy
		self.imageName = imageName
	}

	convenience init(itemName: String) {
		self.init(itemName: itemName, brandName:"", isBusy: false, imageName: "")
	}

	convenience init(itemName: String, brandName: String) {
		self.init(itemName: itemName, brandName: brandName, isBusy: false, imageName: "")
	}

	convenience init(itemName: String, imageName: String) {
		self.init(itemName: itemName, brandName: "", isBusy: false, imageName: imageName)
	}

	func description() -> String {
		return "itemName:\(itemName)"
	}

}

var categoryItems = ["食品": [Item(itemName:"西梅"),Item(itemName:"好多魚")]
,"手機": [Item(itemName:"iPhone5s"),Item(itemName:"ASUS"),Item(itemName:"Lenovo")]
]

var key:String
var item = [Item]()
for (index,value) in enumerate(categoryItems) {
	if index == 1 {
		(key,item) = value
		println("\(value)   key:\(key),item:\(item.count)")
	}
}
