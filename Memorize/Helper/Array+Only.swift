//
//  Array+Only.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 9/11/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import Foundation

extension Array {
    /// get first element or nil 
    var only : Element? {
        count == 1 ? first : nil
    }
}
