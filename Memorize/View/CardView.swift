//
//  CardView.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 8/29/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    //MARK:- Drawing Constants
    fileprivate let cornerRadius: CGFloat = 10.0
    fileprivate let edgeLineWith: CGFloat = 3
    fileprivate let fontScaleFactory: CGFloat = 0.75
    
    fileprivate func fontSize(for size: CGSize)-> CGFloat {
        return min(size.width, size.height) * fontScaleFactory
    }
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize)-> some View {
        ZStack {
            if card.isFacedUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWith)
                Text(card.content).font(.system(size: fontSize(for: size)))
                
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "👻", id: 0))
        
    }
}
