//
//  MyUIView.swift
//  Delegate
//
//  Created by John Huang on 2015/11/13.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

protocol MyUIViewDataSource: class { // 加上:class -> 只能被class實現，不能被enum或struct實現
    func scaleForMyView(myView: MyUIView) -> CGFloat?
}

//enum Test: MyUIViewDataSource {
//    func scaleForMyView(myView: MyUIView) -> CGFloat? {
//        return 0.7
//    }
//}
//
//struct Test2: MyUIViewDataSource {
//    func scaleForMyView(myView: MyUIView) -> CGFloat? {
//        return 0.8
//    }
//}

class Test3: MyUIViewDataSource {
    func scaleForMyView(myView: MyUIView) -> CGFloat? {
        return 0.9
    }
}

@IBDesignable
class MyUIView: UIView {
    
    // 需指定為weak
    weak var dataSource: MyUIViewDataSource?
    
    @IBInspectable
    // 此值一經變更，就需重繪
    var lineWidth: CGFloat = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var color: UIColor = UIColor.blueColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var scale: CGFloat = 0.90 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    var faceCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }
    
    var faceRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        scale = dataSource?.scaleForMyView(self) ?? 0.1
        
        print("MyUIView scale:\(scale)")
        
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        facePath.lineWidth = lineWidth
        
        color.set()
        
        facePath.stroke()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
