
1. 先 cd 至專案路徑下,新增 pod file
  > $ pod init

2. 搜尋要新增的 pod
  > $ pod search firebase

3. 編輯 pod file,拿掉 use_frameworks註解
  > pod 'FireBase', '~> 2.5.0'

4. 安裝
  > $ pod install

5. 改用 workspace 開啟專案
