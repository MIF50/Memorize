//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by BeInMedia on 8/7/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(self.viewModel.cards){ card in
            CardView(card: card )
                .aspectRatio(2 / 3, contentMode: .fit)
                .onTapGesture {
                    self.viewModel.choose(card: card)
            }
            .padding(5)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
