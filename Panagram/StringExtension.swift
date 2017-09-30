//
//  StringExtension.swift
//  Panagram
//
//  Created by Panucci, Julian R on 9/30/17.
//  Copyright © 2017 Panucci, Julian R. All rights reserved.
//

import Foundation

extension String {
    
    func isAnagramOf(_ s: String) -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        
        return lowerSelf.characters.sorted() == lowerOther.characters.sorted()
    }
    
    func isPalindrome() -> Bool {
        let s = self.lowercased().replacingOccurrences(of: " ", with: "")
        
        let r = String(s.characters.reversed())
        
        return r == s
    }
}
