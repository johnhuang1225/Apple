

# View
Objective-C
---
- `UIView`的指定初始化方法為`initWithFrame`
- Just use `alloc` and `initWithFrame:` (UIView’s designated initializer).Can also use init (frame will be CGRectZero).
```
CGRect labelRect = CGRectMake(20, 20, 50, 30);
UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
label.text = @”Hello!”;
[self.view addSubview:label]; // Note self.view
```

Swfit
---
- `init(frame: CGRect)`:由程式碼建立。參數frame為父視圖中的frame
- `init(coder: NSCoder)`:由storyboard建立時呼叫
```
let labelRect = CGRect(x: 20, y: 20, width: 100, height: 50)
let label = UILabel(frame: labelRect) // UILabel is a subclass of UIView
label.text = "Hello"
view.addSubView(label)
```

- `UIView`屬性
 * `frame`：`CGRect`結構體。`CGRect`包含兩個結構體:`orgin:CGPoint` `size:CGSize`。**定義在父視圖的座標系統**
 * `bounds`：**定義在視圖自己的座標系統裡**
 * 對大部分視圖來說，bounds的大小通常就是視圖的範圍，也就是frame的size屬性。但對某些類別來說就不成立了，譬如UIScrollView，它的範圍超出實際可見的螢幕大小。
 * [frame and bounds參考](http://sourcecodemania.com/views-and-drawing-iphone-development/)

![Image](http://sourcecodemania.com/wp-content/uploads/2012/08/frame-and-bounds.jpg)

- [UIKit Function Reference](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKitFunctionReference/)


# UIViewController
- `UIViewController`的指定初始化方法為`initWithNibName:bundle:`
- 屬性
 * navigationItem：嵌入UINavigationController後，會顯示在導航列的item，如右邊的按鈕為：navigationItem.rightBarButtonItems
 * toobarItems：嵌入UINavigationController後，會顯示在下方的工具列
 * navigationController
 * tabBarController
 * tabBarItem


# 多個MVC
 * 一個MVC作為另一個MVC的View
 * View要向Controller發送消息只能通過不可視結構化通信
   * target-action
   * delegate
 
   
# UINavigationController
 * 

# UITabBarController
 - 屬性
  * viewControllers
 * 下方文字和圖標
   * 文字 UIViewController的title
   * 圖標 UIViewController的tabBarItem內的

# Segue
 * 當執行`prepareForSegue:`時，目標MVC的outlet並沒有設置好
 * `prepareForSegue:`是在`awakeFromNib`與`viewDidLoad`之間被調用的
 * 可用`shouldPerformSegueWithIdentifieer`阻止segue。例如無權限時
 * 判別當前viewcontroller是否在屏幕上`if [self.view.window]`
