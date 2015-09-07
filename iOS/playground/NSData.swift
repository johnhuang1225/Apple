

// string轉換為NSData
let str = "write the code, change the world"
println(str.dynamicType)
let data = (str as NSString).dataUsingEncoding(NSUTF8StringEncoding)
println(data!)


// 從URL中加載
if let fileURL = NSBundle.mainBundle()
        .URLForResource("SomeFile",withExtension: "txt") {
            let loadDataFromURL = NSData(contentsOfURL: fileURL)
}

// 從文件中加載
if let filePath = NSBundle.mainBundle()
        .pathForResource("SomeFile",ofType: "txt") {
            let loadDataFromPath = NSData(contentsOfFile: filePath)
}



