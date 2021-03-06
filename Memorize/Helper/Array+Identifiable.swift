//
//  Array+Identifierable.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 9/4/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element)-> Int? {
        for index in 0...self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
