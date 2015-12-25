- Refreence
  - [NSURLSession網路庫](http://swiftcafe.io/2015/12/20/nsurlsession/)
  

- 區分三種 task，各自對應幾個 method，以 dataTask...,downloadTask...,uploadTask... 開頭
  - Data Task：回傳 `NSURLSessionDataTask`。主要用於讀取服務器端的簡單數據，如 JSON
  - Download Task：回傳`NSURLSessionDownloadTask`。進行文件下載，它針對大文件的網路請求做了更多的處理，比如下載進度、斷點續傳等等
  - Upload Task：回傳`NSURLUploadTask`。和下載任務對應，主要是用於對服務端發送文件類型的數據
  
![Image](http://swiftcafe.io/articleimg/nsurlsession/nsurlsession-1.png)

- NSURLSessionConfiguration：指定 NSURLSession 的設定
  - 初始化 NSURLSession
    - `init(configuration configuration: NSURLSessionConfiguration)`
    - `init(configuration configuration: NSURLSessionConfiguration,
          delegate delegate: NSURLSessionDelegate?,
     delegateQueue queue: NSOperationQueue?)`
  - NSURLSessionConfiguration的三個初始化方法
    - `defaultSessionConfiguration`：這個配置會使用全局的緩存、Cookie等信息，相當於NSURLSessionConfiguration的默認配置行為
    - `ephemeralSessionConfiguration`：這個配置不會對緩存或是Cookie以及認證信息進行存儲，相當於一個私有的Session。如果開發一個瀏覽器
    ，這個配置就等於瀏覽器的隱私模式
    - `backgroundSessionConfigurationWithIdentifier`：這個配置可以讓你的網路操作在應用切換到後台時能繼續工作

- NSURLSession 的代理結構

![Image](http://swiftcafe.io/articleimg/nsurlsession/nsurlsession-2.png)
