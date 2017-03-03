//
//  Helper.swift
//  Basic Calculator
//
//  Created by Nijat Muzaffarli on 03/03/2017.
//  Copyright © 2017 Nijat Muzaffarli. All rights reserved.
//

import Foundation
import UIKit


extension String {
    var cleaner: String
    {
        var stringCharacters = Array(self.characters)
        var isDoubleDot = false
        for character in stringCharacters {
            if character == "." {
                isDoubleDot = true
                break
            } else {
                isDoubleDot = false
            }
        }
        if isDoubleDot == true {
            while 1 == 1 {
                if  stringCharacters[stringCharacters.count-1] == "0" || stringCharacters[stringCharacters.count-1] == "."  {
                    stringCharacters.remove(at: stringCharacters.count-1)
                } else {
                    break
                }
            }
            return String(stringCharacters)
        } else {
            return self
        }
    }
}
