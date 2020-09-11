//
//  Grid.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 9/4/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item : Identifiable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
        
    }
    
    fileprivate func body(for layout: GridLayout)-> some View {
        ForEach(items) { item in
            self.body(for :item , in: layout)
        }
    }
    
    fileprivate func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item) ?? 0
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(x: layout.locatoin(ofItemAt: index).x, y: layout.locatoin(ofItemAt: index).y)
    }

    
}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
