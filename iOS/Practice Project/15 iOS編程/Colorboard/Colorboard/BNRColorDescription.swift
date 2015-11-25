//
//  BNRColorDescription.swift
//  Colorboard
//
//  Created by John Huang on 2015/11/24.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class BNRColorDescription: NSObject {
    
    var color: UIColor?
    var name: String?
    
    init(color: UIColor, name: String) {
        self.color = color
        self.name = name
    }

}
