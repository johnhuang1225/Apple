
## Sandbox

### HackNTU week5 note Sandbox
  1. **Bundle Container**：所有檔案連自己的App都無法寫入，只能讀取
  2. **Data Container**：可以寫入
    - `Documents`
    - `Library`
    - `Temp`
  3. **iCloud Container**：

---

- iOS File System
  - Root Folder
    - Photo
    - Apps
      - Your App 你的app的根檔案夾 (一個Sandbox)
        - **Documents** 使用者創建的內容。不會被系統清除
        - **Your.app** 二進位檔放置於此
        - **Library**
          - Caches
          - Preferences
        - **tmp** 暫存資料
      - Some other App (一個Sandbox)
    - Some other system folder



```swift
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

// App home directory所在路徑，不以/結尾
let homeDirectory = NSHomeDirectory()
println(homeDirectory)

// App home directory下的tmp目錄所在路徑，以/結尾
let temp = NSTemporaryDirectory()
println(temp)

```








