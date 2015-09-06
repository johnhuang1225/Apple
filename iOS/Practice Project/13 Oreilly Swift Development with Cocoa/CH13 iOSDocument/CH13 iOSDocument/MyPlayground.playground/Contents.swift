//: Playground - noun: a place where people can play

import UIKit



// 找出Documents資料夾
let fileManager = NSFileManager()
let documentURL = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as! [NSURL]

if documentURL.count > 0 {
    let documentFolder = documentURL[0]
    println("\(documentFolder)")
} else {
    println("找不到Documents folder")
}


// 找出Cache資料夾
let cacheURL = fileManager.URLsForDirectory(NSSearchPathDirectory.CachesDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as! [NSURL]

if cacheURL.count > 0 {
    let cacheFolder = cacheURL[0]
    println("\(cacheFolder)")
} else {
    println("找不到Cache folder")
}



let homeDirectory = NSHomeDirectory()
println(homeDirectory)

let userHomeDirectory = NSHomeDirectoryForUser("")
println(userHomeDirectory)

let temp = NSTemporaryDirectory()
println(temp)













