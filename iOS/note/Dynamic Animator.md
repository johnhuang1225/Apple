

- UIDynamicAnimator
  - 初始時指定最上層的 View
  - `var animator = UIDynamicAnimator(referenceView: UIView)`
- UIDynamicItemBehavior 
  - 所有動畫的行為的父類
  - code
```swift
let gravity = UIGravityBehavior()
animator.addBehavior(gravity)
let collider = UICollisionBehavior() 
animator.addBehavior(collider)
```

- UIDynamicItems
  - Protocol，UIView implements it
  - Add UIDynamicItems to a UIDynamicBehavior
  - code
```swift
let item1: UIDynamicItem = ... // usually a UIView
let item2: UIDynamicItem = ... // usually a UIView gravity.addItem(item1)
collider.addItem(item1)
gravity.addItem(item2)
```
  - three property
    - var bounds:CGRect{get} //note that the size can not be animated 
    - var center:CGPoint{getset} //but the position can 
    - var transform:CGAffineTransform{getset} //and so can the rotation













