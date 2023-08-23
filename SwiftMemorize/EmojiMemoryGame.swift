//
//  EmojiMemoryGame.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 22-08-23.
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"][index]
}

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❓"
            }
        }
    }
    
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
