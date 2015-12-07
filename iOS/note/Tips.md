- CustomStringConvertible: swift2.0後，Printable改為CustomStringConvertible

- 初始化3條規則
  - 指定初始化方法必須調用其直接父類的指定初始化方法
  - 便利初始化方法必須調用同一類定義的其他初始化方法
  - 便利初始化方法必須最終以調用一個指定初始化方法結束

- Enum
  - 值類型
  - 存取Enum關聯值須使用switch語句
