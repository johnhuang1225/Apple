//
//  Person.swift
//  Project 10 - Names to Faces
//
//  Created by John Huang on 2015/11/28.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
