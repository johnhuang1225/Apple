- Reference
  - [Swift中序列的實現方式](http://www.futantan.com/2015/09/06/Sequence-Conformance/)
  - [SequenceType 與 GeneratorType](http://swiftcafe.io/2015/11/21/sequence/)

- SequenceType
  - 遵循 SequenceType protocol 的類型，可以使用 for...in 語法
  - 遵循 SequenceType protocol ，需實現 generate() 方法
  
- GeneratorType
  - Generator 是代表循環的有狀態的對象。
  - Generator 必須提供一個next() 方法——該方法返回一個可選值
  - 這個可選值在序列遍歷完之前應該能夠正確返回序列中的連續元素，直到序列遍歷完，最後返回nil
  

- sample code
```swift
class Book {
    var name:String = ""
    var price:Float = 0.0
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}

class BookList: SequenceType {
    private var bookList:[Book]?
    init() {
        self.bookList = [Book]()
    }
    func addBook(book:Book){
        self.bookList?.append(book)
    }

    typealias Generator = BookListGenerator

    func generate() -> Generator {
        return BookListGenerator(bookList: self.bookList!)
    }
}

class BookListGenerator : GeneratorType {
    typealias Element = Book
    var currentIndex:Int = 0
    var bookList:[Book]?
    init(bookList: [Book]) {
        self.bookList = bookList
    }

    func next() -> Element? {
        guard let list = bookList else { return  nil }
        if currentIndex < list.count {
            let element = list[currentIndex]
            currentIndex++
            return element
        }else {
            return nil
        }
    }
}

let bookList = BookList()

bookList.addBook(Book(name: "Swift", price: 12.5))
bookList.addBook(Book(name: "iOS" , price: 10.5))
bookList.addBook(Book(name: "Objc", price: 20.0))


for book in bookList {
    print("\(book.name) 價格 $\(book.price)")
}
```
