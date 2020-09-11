//
//  GridLayout.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 9/4/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI

struct GridLayout {
    
    var size: CGSize
    var rowCount: Int = 0
    var columnCount: Int = 0
    
    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1 ,in size: CGSize) {
        self.size = size
        // if our size is zero width or height or the itemCount is not > 0
        // then we have no work to do (because our rowCount & columnCount will be zero)
        guard size.width != 0 ,size.height != 0 , itemCount > 0 else { return}
        // find the bestLayout
        // i.e., one which results in cells whose aspectRatio
        // has hte smallestVariance form desiredAspectRatio
        // not nessarily most optimal code to do this, but easy to follow (hopefully)
        var bestLayout: (rowCount: Int, columnCount: Int) = (1,itemCount)
        var smallestVariance: Double?
        let sizeAspectRatio = abs(Double(size.width / size.height))
        for rows in 1...itemCount {
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1:0)
            if (rows - 1) * columns < itemCount {
                let itemAspectRatio = sizeAspectRatio * (Double(rows) / Double(columns))
                let variance = abs(itemAspectRatio - desiredAspectRatio)
                if smallestVariance == nil || variance < smallestVariance! {
                    smallestVariance = variance
                    bestLayout = (rowCount: rows, columnCount: columns)
                }
                
            }
        }
        
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }
    
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return .zero
        } else {
            return CGSize (
                width: size.width / CGFloat(columnCount), height: size.height / CGFloat(rowCount))
        }
    }
    
    func locatoin(ofItemAt index: Int)-> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return .zero
        } else {
            return CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * itemSize.width,
                y: (CGFloat(index / columnCount) + 0.5) * itemSize.height
            )
        }
    }
}
