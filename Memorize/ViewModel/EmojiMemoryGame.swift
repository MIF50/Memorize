//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 8/14/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["😸","👻","🍎","🐶","🐴"]
        let randomNumberOfCard = Int.random(in: 2..<6)
         return MemoryGame<String>(numberOfPairOfCards: randomNumberOfCard) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    
    //MARK:- access to model
    var cards: Array<MemoryGame<String>.Card>  {
        model.cards
    }
    
    //MARK:- Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
