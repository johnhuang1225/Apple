
/**
 * 泛型的sort方法
 */
func reverseSort<T:Comparable>(item1: T, item2 : T) -> Bool {
    return item1 > item2
}



/**
 * 泛型的filter方法
 */
func myFilter<T>(source:[T], predicate:(T)->Bool ) -> [T] {
	var result = [T]()
	for i in source {
		if predicate(i) {
			result.append(i)
		}
	}
	return result
}

var afterFilter = myFilter(Array(1...10),{ item -> Bool in
	return item > 5
})

println(afterFilter)


/**
 * 去除重複的泛型方法
 */
func distinct<T: Equatable>(source: [T]) -> [T] {
	var result = [T]()
	for item in source {
		if !contains(result,item) {
			result.append(item)
		}
	}
	return result
}



let words = ["cat","chichen","fish","dog","mouse","guinea pig","monkey"]
let result = words.map({ (str: String) -> Character in
	return Character( str.substringToIndex(advance(str.startIndex,1)) )
})

let unique = distinct(result).sorted{$0<$1}
println(unique)


// =====================
// parse JSON generic 方法

override func viewDidLoad() {
    super.viewDidLoad()

    let session = NSURLSession.sharedSession()
    let url = NSURL(string: "https://itunes.apple.com/search?term=apple&media=software")!  
    let dataTask = session.dataTaskWithURL(url) { (data,response, error) -> Void in  
    		do {
            let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
            let results = jsonData.objectForKey("results") as! NSArray
            for item in results {
                let trackName: String = self.getVaule(item as! NSDictionary, fieldName: "trackName")!
                print(trackName)
            }
        } catch {
            print("Error: \(error)")
        }
    }
        
    dataTask.resume()
}

func getVaule<T>(jsonData: NSDictionary, fieldName: String) -> T? {
    if let value: T? = jsonData.objectForKey(fieldName) as? T? {
        return value
    } else {
        return nil
    }
}

// =====================
