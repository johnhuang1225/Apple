## 參考
- [kkbox](https://zonble.gitbooks.io/kkbox-ios-dev/content/core_animation/calayer.html)

-----
## note
- CALayer 內有個 delegate。每個 UIView，都是屬於自己專屬的 CALayer 物件的 delegate
- UIView 有實作 CALayerDelegate 內的 `drawLayer(_:inContext:)`
- 要重繪某個 view 的內容時，其實是叫 CALayer 重繪
- 重繪 CALayer 時會呼叫到 CALayer 的 `-drawInContext:` ，在這個 method 中，CALayer 可以自己決定怎麼繪製內容，
或是去問 delegate 該怎麼畫，若是問 delegate 該怎麼畫，則會呼叫 CALayer delegate 的 `-drawLayer:inContext:`。
- CALayer.drawInContext: -> delegate.drawLayer:inContext: (通常是 UIView.drawLayer:inContext:) -> UIView.drawRect:
