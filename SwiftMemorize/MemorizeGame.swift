//
//  MemorizeGame.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 22-08-23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
