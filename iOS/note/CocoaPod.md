
- iOS CocoaPods 安裝
  - 查看版本
    - `>ruby -v`

  - 安裝cocoapods
    - >sudo gem install cocoapods

  - 安裝完成後會多一個指令 pod
    - >pod

  - 更新 pod 相關資訊
    - >pod setup

  - 搜尋 Alamofire
    - >pod search Alamofire

  - 測試某個 pod, 自動下載 sample 檔案
    - >pod try Alamofire

  - 在專案下新增 pod file
    - >touch Podfile

  - 編輯 Podfile
    - >vi Podfile

  - 輸入 Podfile 內容
```txt
platform : ios, '8.0'

pod 'Alamofire', '~> 1.2.0'
pod 'KGFloatingDrawer', '~> 0.1.3'

use_frameworks!
```
  - 存檔Podfile後,安裝套件
    - >pod install


---

1. 先 cd 至專案路徑下,新增 pod file
  > $ pod init

2. 搜尋要新增的 pod
  > $ pod search firebase

3. 編輯 pod file,拿掉 use_frameworks註解
  > pod 'FireBase', '~> 2.5.0'

4. 安裝
  > $ pod install

5. 改用 workspace 開啟專案
