//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mohamed Ibrahim on 8/14/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            /// array of cards that is faced up == 1 get first index else nil
            cards.indices.filter{ cards[$0].isFacedUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = index == newValue
            }
        }
    }
    
    init(numberOfPairOfCards: Int,cardContenFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContenFactory(pairIndex)
            cards.append(Card(content: content,id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),!cards[chosenIndex].isFacedUp, !cards[chosenIndex].isMatched {
            if let potentionMatchingIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentionMatchingIndex].content == cards[chosenIndex].content {
                    cards[potentionMatchingIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                self.cards[chosenIndex].isFacedUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    
    struct Card: Identifiable {
        var isFacedUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id: Int
    }
    
    
}





