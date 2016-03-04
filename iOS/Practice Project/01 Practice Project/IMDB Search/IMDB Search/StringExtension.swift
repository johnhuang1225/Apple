//
//  StringExtension.swift
//  IMDB Search
//
//  Created by John Huang on 2016/3/3.
//  Copyright © 2016年 JohnHuang. All rights reserved.
//

import Foundation

extension String {
    subscript(r: Range<Int>) -> String? {
        if !self.isEmpty {
            let start = self.startIndex.advancedBy(r.startIndex)
            let end = self.startIndex.advancedBy(r.endIndex)
            return substringWithRange(Range(start: start, end: end))
        }
        return nil
    }
    
    func findIndexOf(letter: String) -> Int? {
        let tempString = self
        var index = 0
        
        for character in tempString.characters {
            if Character(letter) == character {
                return index
            }
            index++
        }
        return nil
    }
}
